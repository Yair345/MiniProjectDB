# Hospital Management System - SQL Procedures and Functions

This README provides an overview of the SQL procedures and functions implemented for a Hospital Management System. Each component is described, along with its code and proof of execution.

## 1. get_total_billed

### Description
This function calculates the total amount billed for a specific patient.

### Code
```sql
CREATE OR REPLACE FUNCTION get_total_billed(p_patient_id IN NUMBER)
RETURN NUMBER
IS
    v_total_billed NUMBER := 0;
    
    -- Explicit cursor
    CURSOR c_bills IS
        SELECT Total_Cost
        FROM Billing
        WHERE Patient_ID = p_patient_id;
        
    v_bill_amount Billing.Total_Cost%TYPE;
BEGIN
    OPEN c_bills;
    LOOP
        FETCH c_bills INTO v_bill_amount;
        EXIT WHEN c_bills%NOTFOUND;
        v_total_billed := v_total_billed + v_bill_amount;
    END LOOP;
    CLOSE c_bills;
    
    RETURN v_total_billed;
EXCEPTION
    WHEN OTHERS THEN
        IF c_bills%ISOPEN THEN
            CLOSE c_bills;
        END IF;
        RAISE_APPLICATION_ERROR(-20003, 'An error occurred: ' || SQLERRM);
END;
/
```

## 2. update_medical_record

### Description
This procedure updates or creates a medical record for a patient.

### Code
```sql
CREATE OR REPLACE PROCEDURE update_medical_record(
    p_patient_id IN NUMBER,
    p_diagnosis IN VARCHAR2,
    p_treatments IN VARCHAR2,
    p_test_results IN VARCHAR2,
    p_allergies IN VARCHAR2
)
IS
    v_medical_record_id NUMBER;
    
    -- Ref cursor for retrieving existing medical record
    TYPE med_record_cur_type IS REF CURSOR;
    med_record_cur med_record_cur_type;
    
    v_existing_record MedicalRecord%ROWTYPE;
BEGIN
    -- Check if medical record exists for the patient
    OPEN med_record_cur FOR
        SELECT * FROM MedicalRecord
        WHERE Patient_ID = p_patient_id;
    
    FETCH med_record_cur INTO v_existing_record;
    
    IF med_record_cur%NOTFOUND THEN
        -- Create new medical record if it doesn't exist
        SELECT NVL(MAX(Medical_Record_ID), 0) + 1 INTO v_medical_record_id FROM MedicalRecord;
        
        INSERT INTO MedicalRecord (Medical_Record_ID, Diagnosis, Prescribed_Treatments, Test_Results, Allergies, Patient_ID)
        VALUES (v_medical_record_id, p_diagnosis, p_treatments, p_test_results, p_allergies, p_patient_id);
        
        DBMS_OUTPUT.PUT_LINE('New medical record created.');
    ELSE
        -- Update existing medical record
        UPDATE MedicalRecord
        SET Diagnosis = NVL(p_diagnosis, Diagnosis),
            Prescribed_Treatments = NVL(p_treatments, Prescribed_Treatments),
            Test_Results = NVL(p_test_results, Test_Results),
            Allergies = NVL(p_allergies, Allergies)
        WHERE Patient_ID = p_patient_id;
        
        DBMS_OUTPUT.PUT_LINE('Existing medical record updated.');
    END IF;
    
    CLOSE med_record_cur;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        IF med_record_cur%ISOPEN THEN
            CLOSE med_record_cur;
        END IF;
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20006, 'An error occurred: ' || SQLERRM);
END;
/
```

## 3. main_update_record_and_bill

### Description
This main updates a patient's medical record and retrieves their total billed amount.

### Code
```sql
-- Update medical record and get total billed amount --
CREATE OR REPLACE PROCEDURE main_update_record_and_bill(
    p_patient_id IN NUMBER,
    p_diagnosis IN VARCHAR2,
    p_treatments IN VARCHAR2,
    p_test_results IN VARCHAR2,
    p_allergies IN VARCHAR2
)
IS
    v_total_billed NUMBER;
BEGIN
    -- Call the update_medical_record procedure
    update_medical_record(p_patient_id, p_diagnosis, p_treatments, p_test_results, p_allergies);
    
    -- Call the get_total_billed function
    v_total_billed := get_total_billed(p_patient_id);
    
    DBMS_OUTPUT.PUT_LINE('Medical record updated. Total amount billed to patient: $' || TO_CHAR(v_total_billed, '999,999.99'));
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
```

### Proof of Execution

![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/21f6193e-7f2a-49fd-b694-46fea34331a7)
![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/2ef5aaea-c45c-43af-bf19-c770c4041598)
![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/985f16ea-a26d-467d-b27d-0ecc5dc0e987)


## 4. calculate_patient_age

### Description
This function calculates a patient's age based on their date of birth.

### Code
```sql
CREATE OR REPLACE FUNCTION calculate_patient_age(p_patient_id IN NUMBER)
RETURN NUMBER
IS
    v_age NUMBER;
    v_dob DATE;
BEGIN
    -- Implicit cursor
    SELECT Date_of_Birth INTO v_dob
    FROM Patients
    WHERE Patient_ID = p_patient_id;
    
    v_age := TRUNC(MONTHS_BETWEEN(SYSDATE, v_dob) / 12);
    
    RETURN v_age;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20001, 'Patient not found');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'An error occurred: ' || SQLERRM);
END;
/
```

## 5. schedule_appointment

### Description
This procedure schedules an appointment and updates the doctor-patient relationship if necessary.

### Code
```sql
CREATE OR REPLACE PROCEDURE schedule_appointment(
    p_patient_id IN NUMBER,
    p_doctor_id IN NUMBER,
    p_appointment_date IN DATE,
    p_reason IN VARCHAR2
)
IS
    v_appointment_id NUMBER;
    v_patient_record Patients%ROWTYPE;
    v_doctor_record Doctors%ROWTYPE;
BEGIN
    -- Generate new appointment ID
    SELECT NVL(MAX(Appointment_ID), 0) + 1 INTO v_appointment_id FROM Appointment;
    
    -- Check if patient exists
    SELECT * INTO v_patient_record
    FROM Patients
    WHERE Patient_ID = p_patient_id;
    
    -- Check if doctor exists
    SELECT * INTO v_doctor_record
    FROM Doctors
    WHERE Doctor_ID = p_doctor_id;
    
    -- Insert new appointment
    INSERT INTO Appointment (Appointment_ID, Appointment_Date, Reason_for_Visit, Patient_ID, Doctor_ID)
    VALUES (v_appointment_id, p_appointment_date, p_reason, p_patient_id, p_doctor_id);
    
    -- Update DocPat table if relationship doesn't exist
    MERGE INTO DocPat dp
    USING DUAL
    ON (dp.Patient_ID = p_patient_id AND dp.Doctor_ID = p_doctor_id)
    WHEN NOT MATCHED THEN
        INSERT (Patient_ID, Doctor_ID)
        VALUES (p_patient_id, p_doctor_id);
    
    COMMIT;
    
    DBMS_OUTPUT.PUT_LINE('Appointment scheduled successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20004, 'Patient or Doctor not found');
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20005, 'An error occurred: ' || SQLERRM);
END;
/
```

## 6. main_schedule_and_age

### Description
This main schedules an appointment for a patient and calculates their age.

### Code
```sql
-- Schedule appointment and calculate patient age --
CREATE OR REPLACE PROCEDURE main_schedule_and_age(
    p_patient_id IN NUMBER,
    p_doctor_id IN NUMBER,
    p_appointment_date IN DATE,
    p_reason IN VARCHAR2
)
IS
    v_patient_age NUMBER;
BEGIN
    -- Call the schedule_appointment procedure
    schedule_appointment(p_patient_id, p_doctor_id, p_appointment_date, p_reason);
    
    -- Call the calculate_patient_age function
    v_patient_age := calculate_patient_age(p_patient_id);
    
    DBMS_OUTPUT.PUT_LINE('Appointment scheduled for patient aged ' || v_patient_age || ' years.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
```

![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/cf3a9c09-d749-49b4-bdd8-adee5cd1c9e7)
![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/a474dcc1-c77b-4667-a08f-bae5d9e9c089)
![image](https://github.com/Yair345/MiniProjectDB/assets/116631739/58f50cbb-2ee7-4b6c-9d9e-509d687771e5)
