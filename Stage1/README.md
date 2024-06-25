# MiniProjectDB

## Table of Contents
- [Title Page](#title-page)
- [Introduction](#introduction)
- [ERD and DSD Diagrams](#erd-and-dsd-diagrams)
- [Design Decisions](#design-decisions)
- [Create Table Commands](#create-table-commands)
- [Data Insertion Methods](#data-insertion-methods)
- [Backup and Restore](#backup-and-restore)

## Title Page

**Project Title:** MiniProjectDB  
**Contributors:** Noam Benisho 213200496, Yair Lasry 214085987
**System:** Medical data management system  
**Selected Unit:** Database unit

## Introduction

MiniProjectDB is a database project for a medical system. The project is designed to manage data related to patients, doctors, appointments, medical records, treatments, and billing. The main functionalities include:

- Storing patient information
- Storing doctor information
- Scheduling and managing appointments
- Maintaining medical records
- Documenting treatments
- Managing billing and invoices

## ERD and DSD Diagrams

### ERD Diagram
![ERD](https://github.com/Yair345/MiniProjectDB/assets/116631739/f688b8d6-67f8-49a8-886b-1d00aa07a311)


### DSD Diagram
![DSD](https://github.com/Yair345/MiniProjectDB/assets/116631739/f542a74b-2dfe-4b41-bfb6-f5c72d9a7b18)

## Design Decisions

### Design Choices:
1. **Normalization:** The database schema was normalized to the third normal form (3NF) to eliminate redundancy and ensure data integrity.
2. **Indexing:** Indexes were added on primary and foreign keys to improve query performance.
3. **Data Types:** Appropriate data types were chosen for each field to optimize storage and performance.

### Justifications:
- **Normalization:** By normalizing the schema, we reduce redundancy and prevent anomalies during data operations.
- **Indexing:** Indexing significantly improves the speed of data retrieval operations, which is crucial for a responsive medical system.
- **Data Types:** Choosing the right data types ensures efficient use of storage and enhances query performance.

## Create Table Commands

```sql
CREATE TABLE Patients (
    patient_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    dob DATE,
    gender VARCHAR(10),
    contact_info VARCHAR(255)
);

CREATE TABLE Doctors (
    doctor_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    specialty VARCHAR(100),
    contact_info VARCHAR(255)
);

CREATE TABLE Appointment (
    appointment_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    doctor_id INT REFERENCES Doctors(doctor_id),
    appointment_date DATE,
    reason VARCHAR(255)
);

CREATE TABLE MedicalRecord (
    record_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    record_date DATE,
    diagnosis TEXT,
    treatment TEXT
);

CREATE TABLE DocPat (
    docpat_id SERIAL PRIMARY KEY,
    doctor_id INT REFERENCES Doctors(doctor_id),
    patient_id INT REFERENCES Patients(patient_id)
);

CREATE TABLE Treatment (
    treatment_id SERIAL PRIMARY KEY,
    appointment_id INT REFERENCES Appointment(appointment_id),
    treatment_description TEXT,
    cost DECIMAL(10, 2)
);

CREATE TABLE Billing (
    billing_id SERIAL PRIMARY KEY,
    patient_id INT REFERENCES Patients(patient_id),
    amount DECIMAL(10, 2),
    billing_date DATE,
    paid BOOLEAN
);
```


## Screenshot of DESC Command
![WhatsApp Image 2024-05-28 at 22 16 57](https://github.com/Yair345/MiniProjectDB/assets/116631739/3c48c7c7-a729-4773-9170-a641a407603a)



# Data Insertion Methods
## Method 1: Using mockaroo

```sql
INSERT INTO Patients (name, dob, gender, contact_info) VALUES ('John Doe', '1980-05-15', 'Male', '123 Main St');
INSERT INTO Doctors (name, specialty, contact_info) VALUES ('Dr. Smith', 'Cardiology', '456 Elm St');
INSERT INTO Appointment (patient_id, doctor_id, appointment_date, reason) VALUES (1, 1, '2024-06-01', 'Routine Checkup');
```

![mockaroo_Patient](https://github.com/Yair345/MiniProjectDB/assets/116631739/e5fe066b-58dc-4ab5-8de3-ae28e1672f97)



## Method 2: Using Python Script 

![python_script](https://github.com/Yair345/MiniProjectDB/assets/116631739/d63541c5-93f5-4643-9f35-e21cdb84fe40)


## Method 3: Using Data generator 

![CSV_to_Appointment](https://github.com/Yair345/MiniProjectDB/assets/116631739/c9cb67b3-a282-4137-887b-e49b7752ad52)


# Backup and Restore
## Backup

![Backup](https://github.com/Yair345/MiniProjectDB/assets/116631739/44d331ec-eb7b-4dfb-a400-c35ba0c6039e)

## Restore

![Restore](https://github.com/Yair345/MiniProjectDB/assets/116631739/fccd0fb7-335d-49a5-a6ed-c248d4c1d3a3)
![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/ae4febd0-f77c-4a89-9ab8-4c5bb622c02b)
