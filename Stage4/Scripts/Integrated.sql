rename DOCTORS to DOCTORS1;
rename PATIENTS to PATIENTS1;

-- Modification in Patients1
ALTER TABLE Patients1 MODIFY (Contact_Information VARCHAR2(50) NULL);
ALTER TABLE Patients1 MODIFY (Insurance VARCHAR2(10) NULL);

-- Modification in Doctors1
ALTER TABLE Doctors1 MODIFY (Contact_Information VARCHAR2(50) NULL);
ALTER TABLE Doctors1 MODIFY (Date_of_Start_working DATE NULL);


------------------------------------ Update the tables to intedrated the data ---------------------------------


-- Add a new column 'Research_ID' to the Patients1 table
ALTER TABLE Patients1
ADD Research_ID INT;

-- Create a foreign key constraint linking Research_ID in Patients1 to the Research table
ALTER TABLE Patients1
ADD CONSTRAINT fk_patients1_research
FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID);

-- Insert data from the Patient table into Patients1
-- Combine FirstName and LastName into a single Name field
INSERT INTO Patients1 (Patient_ID, Name, Date_of_Birth, Gender, Research_ID)
SELECT Patient_ID, FirstName || ' ' || LastName, DateOfBirth, Sex, Research_ID
FROM Patient;

-- Insert data from the Doctor table into Doctors1
-- Combine FirstName and LastName into a single Name field
INSERT INTO Doctors1 (Doctor_ID, Name, Specialty)
SELECT Doctor_ID, FirstName || ' ' || LastName, Specialization
FROM Doctor;

-- Update missing fields in Patients1 table
-- Set default values for Contact_Information and Insurance if they are NULL
UPDATE Patients1
SET Contact_Information = 'Unknown',
    Insurance = 'Unknown'
WHERE Contact_Information IS NULL OR Insurance IS NULL;

-- Update missing fields in Doctors1 table
-- Set default values for Contact_Information and Date_of_Start_working if they are NULL
UPDATE Doctors1
SET Contact_Information = 'Unknown',
    Date_of_Start_working = SYSDATE
WHERE Contact_Information IS NULL OR Date_of_Start_working IS NULL;