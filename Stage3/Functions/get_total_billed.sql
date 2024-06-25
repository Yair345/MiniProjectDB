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