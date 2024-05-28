import random
from faker import Faker
import os

cwd = os.getcwd()


# Function to generate random string
def random_string(length=10):
    letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return "".join(random.choice(letters) for _ in range(length))


# Number of records to generate
num_records = 400

# File paths to save the SQL scripts
file_paths = {
    "Appointment": "{}\\Appointment.csv".format(cwd),
    "Treatment": "{}\\Treatment.csv".format(cwd),
    "MedicalRecord": "{}\\MedicalRecord.csv".format(cwd),
}

fake = Faker()

# Generating SQL insert statements for Appointment table
with open(file_paths["Appointment"], "w") as f:
    f.write("Appointment_ID,Appointment_Date,Reason_for_Visit,Patient_ID,Doctor_ID\n")
    for i in range(0, num_records + 1):
        appointment_id = 100000 + i
        appointment_date = f"{fake.date()}"
        reason_for_visit = random_string(50)
        patient_id = random.randint(100000, 100000 + num_records - 1)
        doctor_id = random.randint(100000, 100000 + num_records - 1)

        f.write(
            f"{appointment_id},{appointment_date},{reason_for_visit},{patient_id},{doctor_id}\n"
        )
        
# Generating SQL insert statements for Treatment table
with open(file_paths["Treatment"], "w") as f:
    f.write("Treatment_ID,Treatment_Cost,Treatment_Name,Treatment_Description,Medical_Record_ID\n")
    for i in range(0, num_records + 1):
        treatment_id = 100000 + i
        treatment_cost = random.randint(50, 5000)
        treatment_name = random_string(30)
        treatment_description = random_string(100)
        medical_record_id = random.randint(100000, 100000 + num_records - 1)

        f.write(
            f"{treatment_id},{treatment_cost},{treatment_name},{treatment_description},{medical_record_id}\n"
        )

# Generating SQL insert statements for MedicalRecord table
with open(file_paths["MedicalRecord"], "w") as f:
    f.write("Medical_Record_ID,Diagnosis,Prescribed_Treatments,Test_Results,Allergies,Patient_ID\n")
    for i in range(0, num_records + 1):
        medical_record_id = 100000 + i
        diagnosis = random_string(50)
        prescribed_treatments = random_string(100)
        test_results = random_string(100)
        allergies = random_string(50)
        patient_id = random.randint(100000, 100000 + num_records - 1)

        f.write(
            f"{medical_record_id},{diagnosis},{prescribed_treatments},{test_results},{allergies},{patient_id}\n"
        )
