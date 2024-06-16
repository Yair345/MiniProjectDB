-- Query 1: Delete all treatments and billings for medical records older than 5 years.
DELETE FROM Billing b
WHERE EXISTS (
    SELECT 1
    FROM Treatment t
    JOIN MedicalRecord mr ON t.Medical_Record_ID = mr.Medical_Record_ID
    WHERE b.Treatment_ID = t.Treatment_ID
    AND mr.Patient_ID IN (
        SELECT Patient_ID
        FROM Patients p
        WHERE ADD_MONTHS(SYSDATE, -60) > p.Date_of_Birth
    )
);

DELETE FROM Treatment t
WHERE EXISTS (
    SELECT 1
    FROM MedicalRecord mr
    WHERE mr.Medical_Record_ID = t.Medical_Record_ID
    AND mr.Patient_ID IN (
        SELECT Patient_ID
        FROM Patients p
        WHERE ADD_MONTHS(SYSDATE, -60) > p.Date_of_Birth
    )
);

-- Query 2: Delete all appointments for patients who have not had any appointments in the last year and have unpaid billing amounts.

DELETE FROM Appointment a
WHERE NOT EXISTS (
    SELECT 1
    FROM Appointment a2
    WHERE a2.Patient_ID = a.Patient_ID
      AND a2.Appointment_Date >= ADD_MONTHS(SYSDATE, -12)
)
  AND EXISTS (
    SELECT 1
    FROM Billing b
    WHERE b.Patient_ID = a.Patient_ID
      AND b.Payment_Status <> 'Paid'
);