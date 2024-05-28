CREATE TABLE Patients
(
    Patient_ID INT NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    Date_of_Birth DATE NOT NULL,
    Gender VARCHAR2(10) NOT NULL,
    Contact_Information VARCHAR(50) NOT NULL,
    Insurance VARCHAR2(10) NOT NULL,
    PRIMARY KEY (Patient_ID)
);

CREATE TABLE Doctors
(
    Doctor_ID INT NOT NULL,
    Name VARCHAR2(100) NOT NULL,
    Contact_Information VARCHAR2(50) NOT NULL,
    Date_of_Start_working DATE NOT NULL,
    Specialty VARCHAR2(100) NOT NULL,
    PRIMARY KEY (Doctor_ID)
);

CREATE TABLE Appointment
(
    Appointment_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Reason_for_Visit VARCHAR2(255) NOT NULL,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    PRIMARY KEY (Appointment_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID) ON DELETE CASCADE
);

CREATE TABLE MedicalRecord
(
    Medical_Record_ID INT NOT NULL,
    Diagnosis VARCHAR2(255) NOT NULL,
    Prescribed_Treatments VARCHAR2(255) NOT NULL,
    Test_Results VARCHAR2(255) NOT NULL,
    Allergies VARCHAR2(255) NOT NULL,
    Patient_ID INT NOT NULL,
    PRIMARY KEY (Medical_Record_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE
);

CREATE TABLE DocPat
(
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    PRIMARY KEY (Patient_ID, Doctor_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID) ON DELETE CASCADE
);

CREATE TABLE Treatment
(
    Treatment_ID INT NOT NULL,
    Treatment_Cost DECIMAL(10, 2) NOT NULL,
    Treatment_Name VARCHAR2(20) NOT NULL,
    Treatment_Description VARCHAR2(255) NOT NULL,
    Medical_Record_ID INT NOT NULL,
    PRIMARY KEY (Treatment_ID),
    FOREIGN KEY (Medical_Record_ID) REFERENCES MedicalRecord(Medical_Record_ID) ON DELETE CASCADE
);

CREATE TABLE Billing
(
    Billing_ID INT NOT NULL,
    Total_Cost DECIMAL(10, 2) NOT NULL,
    Payment_Status VARCHAR2(10) NOT NULL,
    Patient_ID INT NOT NULL,
    Treatment_ID INT NOT NULL,
    PRIMARY KEY (Billing_ID),
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID) ON DELETE CASCADE,
    FOREIGN KEY (Treatment_ID) REFERENCES Treatment(Treatment_ID) ON DELETE CASCADE
);
