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