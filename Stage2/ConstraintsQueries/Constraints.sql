-- 1. NOT NULL constraint on the Name column in the Patients table
ALTER TABLE Patients
MODIFY Name VARCHAR2(100) NOT NULL;
-- This constraint ensures that the Name column in the Patients table cannot have a NULL value.

-- 2. DEFAULT constraint on the Payment_Status column in the Billing table
ALTER TABLE Billing
MODIFY Payment_Status VARCHAR2(10) DEFAULT 'Pending';
-- This constraint sets the default value for the Payment_Status column in the Billing table to 'Pending' if no value is explicitly provided.

-- 3. CHECK constraint on the Treatment_Cost column in the Treatment table
ALTER TABLE Treatment
ADD CONSTRAINT chk_treatment_cost CHECK (Treatment_Cost > 0);
-- This constraint ensures that the Treatment_Cost column in the Treatment table has a positive value.