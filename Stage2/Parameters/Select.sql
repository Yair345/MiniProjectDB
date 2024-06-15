-- Query 1: Retrieve the patient's name, date of birth, gender, doctor's name, appointment date, and reason for visit for all appointments in the last 6 months.
SELECT p.Name AS Patient_Name, p.Date_of_Birth, p.Gender, d.Name AS Doctor_Name, a.Appointment_Date, a.Reason_for_Visit
FROM Patients p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
JOIN Doctors d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Appointment_Date >= ADD_MONTHS(SYSDATE, -6)
ORDER BY a.Appointment_Date DESC;

-- Query 2: Retrieve the patient's name, gender, age (calculated from date of birth), doctor's name, and the number of appointments they have had with that doctor only if greater than 1, ordered by the number of appointments in descending order.
SELECT
    p.Name AS Patient_Name,
    p.Gender,
    TRUNC(MONTHS_BETWEEN(SYSDATE, p.Date_of_Birth) / 12) AS Age,
    d.Name AS Doctor_Name,
    COUNT(a.Appointment_ID) AS Number_of_Appointments
FROM
    Patients p
    JOIN Appointment a ON p.Patient_ID = a.Patient_ID
    JOIN Doctors d ON a.Doctor_ID = d.Doctor_ID
GROUP BY
    p.Name,
    p.Gender,
    p.Date_of_Birth,
    d.Name
HAVING
    COUNT(a.Appointment_ID) > 1
ORDER BY
    Number_of_Appointments DESC;

-- Query 3: Retrieve the patient's name, diagnosis, prescribed treatments, and the total cost of treatments for patients who have been diagnosed with multiple conditions (i.e., have more than one medical record).
SELECT p.Name AS Patient_Name, mr.Diagnosis, mr.Prescribed_Treatments, SUM(t.Treatment_Cost) AS Total_Treatment_Cost
FROM Patients p
JOIN MedicalRecord mr ON p.Patient_ID = mr.Patient_ID
JOIN Treatment t ON mr.Medical_Record_ID = t.Medical_Record_ID
WHERE p.Patient_ID IN (
    SELECT Patient_ID
    FROM MedicalRecord
    GROUP BY Patient_ID
    HAVING COUNT(DISTINCT Medical_Record_ID) > 1
)
GROUP BY p.Name, mr.Diagnosis, mr.Prescribed_Treatments
ORDER BY Total_Treatment_Cost DESC;

-- Query 4: Retrieve the patient's name, insurance provider, and the total amount billed for treatments in the current year, grouped by insurance provider and ordered by the total amount billed in descending order.
SELECT p.Name AS Patient_Name, p.Insurance, SUM(b.Total_Cost) AS Total_Amount_Billed
FROM Patients p
JOIN Billing b ON p.Patient_ID = b.Patient_ID
JOIN Treatment t ON b.Treatment_ID = t.Treatment_ID
JOIN MedicalRecord mr ON t.Medical_Record_ID = mr.Medical_Record_ID
WHERE mr.Patient_ID IN (
    SELECT Patient_ID
    FROM MedicalRecord
    WHERE EXTRACT(YEAR FROM SYSDATE) = EXTRACT(YEAR FROM (
        SELECT MAX(Appointment_Date)
        FROM Appointment a
        WHERE a.Patient_ID = MedicalRecord.Patient_ID
    ))
)
GROUP BY p.Name, p.Insurance
ORDER BY Total_Amount_Billed DESC;