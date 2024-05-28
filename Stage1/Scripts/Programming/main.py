import random
from faker import Faker

# Function to generate random string
def random_string(length=10):
    letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    return ''.join(random.choice(letters) for _ in range(length))

# Number of records to generate
num_records = 400

# File paths to save the SQL scripts
file_paths = {
    'Appointment': r'C:\Users\User\Desktop\Software Engineering\Year C\Semester B\DBProject\MiniProjectDB\Stage1\Scripts\Appointment_insert.sql',
    'Treatment': r'C:\Users\User\Desktop\Software Engineering\Year C\Semester B\DBProject\MiniProjectDB\Stage1\Scripts\Treatment_insert.sql',
    'MedicalRecord': r'C:\Users\User\Desktop\Software Engineering\Year C\Semester B\DBProject\MiniProjectDB\Stage1\Scripts\MedicalRecord_insert.sql'
}

fake = Faker()

# Generating SQL insert statements for Appointment table
with open(file_paths['Appointment'], 'w') as f:
    for i in range(1, num_records + 1):
        appointment_id = i
        appointment_date = f"SELECT TO_DATE('{fake.date()}', 'YYYY-MM-DD')" 
        reason_for_visit = random_string(50)
        patient_id = random.randint(100000, 100000 + num_records)
        doctor_id = random.randint(100000, 100000 + num_records)

        f.write(f"INSERT INTO Appointment (Appointment_ID, Appointment_Date, Reason_for_Visit, Patient_ID, Doctor_ID) "
                f"VALUES ({appointment_id}, {appointment_date}, '{reason_for_visit}', {patient_id}, {doctor_id});\n")

# Generating SQL insert statements for Treatment table
with open(file_paths['Treatment'], 'w') as f:
    for i in range(1, num_records + 1):
        treatment_id = i
        treatment_cost = random.randint(50, 5000)
        treatment_name = random_string(30)
        treatment_description = random_string(100)
        medical_record_id = random.randint(1, num_records)

        f.write(f"INSERT INTO Treatment (Treatment_ID, Treatment_Cost, Treatment_Name, Treatment_Description, Medical_Record_ID) "
                f"VALUES ({treatment_id}, {treatment_cost}, '{treatment_name}', '{treatment_description}', {medical_record_id});\n")

# Generating SQL insert statements for MedicalRecord table
with open(file_paths['MedicalRecord'], 'w') as f:
    for i in range(1, num_records + 1):
        medical_record_id = i
        diagnosis = random_string(50)
        prescribed_treatments = random_string(100)
        test_results = random_string(100)
        allergies = random_string(50)
        patient_id = random.randint(1, num_records)

        f.write(f"INSERT INTO MedicalRecord (Medical_Record_ID, Diagnosis, Prescribed_Treatments, Test_Results, Allergies, Patient_ID) "
                f"VALUES ({medical_record_id}, '{diagnosis}', '{prescribed_treatments}', '{test_results}', '{allergies}', {patient_id});\n")

# Print success message
for table, file_path in file_paths.items():
    print(f"SQL script for {table} table generated successfully and saved to: {file_path}")
