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