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