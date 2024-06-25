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