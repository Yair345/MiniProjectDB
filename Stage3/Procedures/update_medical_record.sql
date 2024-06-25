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