-- View 1 - our's
CREATE or replace VIEW EmergencyDepartmentView AS
SELECT 
    p.Patient_ID,
    p.Name AS Patient_Name,
    p.Date_of_Birth,
    p.Gender,
    p.Insurance,
    a.Appointment_ID,
    a.Appointment_Date,
    a.Reason_for_Visit,
    d.Name AS Doctor_Name,
    d.Specialty,
    mr.Diagnosis,
    mr.Prescribed_Treatments,
    t.Treatment_Name,
    t.Treatment_Cost,
    b.Total_Cost,
    b.Payment_Status
FROM 
    Patients1 p
    LEFT JOIN Appointment a ON p.Patient_ID = a.Patient_ID
    LEFT JOIN Doctors1 d ON a.Doctor_ID = d.Doctor_ID
    LEFT JOIN MedicalRecord mr ON p.Patient_ID = mr.Patient_ID
    LEFT JOIN Treatment t ON mr.Medical_Record_ID = t.Medical_Record_ID
    LEFT JOIN Billing b ON p.Patient_ID = b.Patient_ID AND t.Treatment_ID = b.Treatment_ID;

-- Find all patients who visited the emergency department in the last month and the doctors who treated them
SELECT DISTINCT Patient_Name, Doctor_Name, Appointment_Date
FROM EmergencyDepartmentView
WHERE Appointment_Date >= ADD_MONTHS(SYSDATE, -1)
ORDER BY Appointment_Date;

-- Analysis of the number of visits and the average cost of treatment by department (doctor specialties)
SELECT 
    Specialty,
    COUNT(*) AS Visit_Count,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    MAX(Treatment_Cost) AS Max_Treatment_Cost,
    MIN(Treatment_Cost) AS Min_Treatment_Cost
FROM EmergencyDepartmentView
WHERE Specialty IS NOT NULL AND Treatment_Cost IS NOT NULL
GROUP BY Specialty
ORDER BY Visit_Count DESC;

-- View 2 - other
CREATE or replace VIEW ResearchDepartmentView AS
SELECT 
    r.Research_ID,
    r.Research_Name,
    r.Budget,
    r.R_Start AS Research_Start_Date,
    p.Patient_ID,
    p.name AS Patient_Name,
    p.gender,
    p.Date_Of_Birth,
    m.Measurement_ID,
    m.M_Date AS Measurement_Date,
    m.M_Type AS Measurement_Type,
    m.M_Value AS Measurement_Value,
    d.Doctor_ID,
    d.name AS Doctor_Name,
    d.Specialty,
    pub.Publication_ID,
    pub.P_Date AS Publication_Date,
    pub.Magazin
FROM 
    Research r
    LEFT JOIN Patients1 p ON r.Research_ID = p.Research_ID
    LEFT JOIN Measurement m ON p.Patient_ID = m.Patient_ID
    LEFT JOIN Research_Doctor rd ON r.Research_ID = rd.Research_ID
    LEFT JOIN Doctors1 d ON rd.Doctor_ID = d.Doctor_ID
    LEFT JOIN Publication pub ON r.Research_ID = pub.Research_ID;

-- Find the studies with the highest number of patients and doctors
SELECT Research_Name, 
       COUNT(DISTINCT Patient_ID) AS Patient_Count,
       COUNT(DISTINCT Doctor_ID) AS Doctor_Count
FROM ResearchDepartmentView
GROUP BY Research_ID, Research_Name
ORDER BY Patient_Count DESC, Doctor_Count DESC;

-- Show the average of the measurements for each type of measurement in each study
SELECT Research_Name, 
       Measurement_Type,
       AVG(Measurement_Value) AS Avg_Measurement_Value,
       COUNT(*) AS Measurement_Count
FROM ResearchDepartmentView
WHERE Measurement_ID IS NOT NULL
GROUP BY Research_ID, Research_Name, Measurement_Type
ORDER BY Research_Name, Measurement_Type;