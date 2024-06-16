-- Update the treatment cost for treatments performed by doctors with more than 40 years of experience
-- Increase the treatment cost by 20%
UPDATE Treatment t
SET t.Treatment_Cost = t.Treatment_Cost * 1.2
WHERE EXISTS (
    -- Subquery to identify treatments performed by doctors with more than 40 years of experience
    SELECT 1
    FROM MedicalRecord mr
    JOIN Appointment a ON mr.Patient_ID = a.Patient_ID -- Join to connect medical records with appointments
    JOIN Doctors d ON a.Doctor_ID = d.Doctor_ID -- Join to connect appointments with doctors
    WHERE t.Medical_Record_ID = mr.Medical_Record_ID -- Match the treatment with the corresponding medical record
      AND d.Date_of_Start_working < ADD_MONTHS(SYSDATE, -480) -- Filter for doctors who started working more than 40 years ago (480 months)
);

-- Update the contact information for patients who have had appointments with more than 3 different doctors
UPDATE Patients p
SET p.Contact_Information = 'Updated: ' || p.Contact_Information
WHERE EXISTS (
    SELECT 1
    FROM (
        SELECT dp.Patient_ID, COUNT(DISTINCT dp.Doctor_ID) AS Doctor_Count
        FROM DocPat dp
        GROUP BY dp.Patient_ID
    ) t
    WHERE p.Patient_ID = t.Patient_ID
      AND t.Doctor_Count > 3
);