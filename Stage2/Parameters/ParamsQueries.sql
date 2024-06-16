-- Query 1: Retrieve patient information and their most recent appointment details
SELECT p.Name AS Patient_Name, p.Gender, p.Date_of_Birth, a.Appointment_Date, a.Reason_for_Visit
FROM Patients p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
WHERE a.Appointment_ID = (
    SELECT MAX(Appointment_ID)
    FROM Appointment
    WHERE Patient_ID = p.Patient_ID
)
AND p.Name LIKE '%&patient_name%'
ORDER BY p.Name;

-- Query 2: Retrieve patients with outstanding billing amounts within a range
SELECT p.Name AS Patient_Name, p.Insurance, SUM(b.Total_Cost) AS Outstanding_Amount
FROM Patients p
JOIN Billing b ON p.Patient_ID = b.Patient_ID
WHERE b.Payment_Status <> 'Paid'
  AND b.Total_Cost BETWEEN &min_amount AND &max_amount
GROUP BY p.Name, p.Insurance
ORDER BY Outstanding_Amount DESC;

-- Query 3: Retrieve treatments and their associated medical records for a list of patient IDs
SELECT t.Treatment_Name, t.Treatment_Description, mr.Diagnosis, mr.Prescribed_Treatments
FROM Treatment t
JOIN MedicalRecord mr ON t.Medical_Record_ID = mr.Medical_Record_ID
WHERE mr.Patient_ID IN (&patient_id_list)
ORDER BY mr.Patient_ID, t.Treatment_ID;

-- Query 4: Retrieve patients who have had appointments with multiple doctors
SELECT p.Name AS Patient_Name, COUNT(DISTINCT a.Doctor_ID) AS Number_of_Doctors
FROM Patients p
JOIN Appointment a ON p.Patient_ID = a.Patient_ID
GROUP BY p.Name
HAVING COUNT(DISTINCT a.Doctor_ID) > &min_doctors;