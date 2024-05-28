import random
import csv
from faker import Faker

# Function to generate random string
def random_string(length=10):
    letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    return ''.join(random.choice(letters) for _ in range(length))

# Number of records to generate
num_records = 400

# File paths to save the CSV files
file_paths = {
    'Appointment': r'C:\Users\User\Desktop\Software Engineering\Year C\Semester B\DBProject\MiniProjectDB\Stage1\Scripts\Appointment.csv',
    'Treatment': r'C:\Users\User\Desktop\Software Engineering\Year C\Semester B\DBProject\MiniProjectDB\Stage1\Scripts\Treatment.csv',
    'MedicalRecord': r'C:\Users\User\Desktop\Software Engineering\Year C\Semester B\DBProject\MiniProjectDB\Stage1\Scripts\MedicalRecord.csv'
}

fake = Faker()

# Generating CSV for Appointment table
with open(file_paths['Appointment'], 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Appointment_ID', 'Appointment_Date', 'Reason_for_Visit', 'Patient_ID', 'Doctor_ID'])
    for i in range(1, num_records + 1):
        appointment_id = i
        appointment_date = fake.date() 
        reason_for_visit = random_string(50)
        patient_id = random.randint(100000, 100000 + num_records - 1)
        doctor_id = random.randint(100000, 100000 + num_records - 1)

        writer.writerow([appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id])

# Generating CSV for Treatment table
with open(file_paths['Treatment'], 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Treatment_ID', 'Treatment_Cost', 'Treatment_Name', 'Treatment_Description', 'Medical_Record_ID'])
    for i in range(1, num_records + 1):
        treatment_id = i
        treatment_cost = random.randint(50, 5000)
        treatment_name = random_string(30)
        treatment_description = random_string(100)
        medical_record_id = random.randint(100000, 100000 + num_records - 1)

        writer.writerow([treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id])

# Generating CSV for MedicalRecord table
with open(file_paths['MedicalRecord'], 'w', newline='') as f:
    writer = csv.writer(f)
    writer.writerow(['Medical_Record_ID', 'Diagnosis', 'Prescribed_Treatments', 'Test_Results', 'Allergies', 'Patient_ID'])
    for i in range(1, num_records + 1):
        medical_record_id = i
        diagnosis = random_string(50)
        prescribed_treatments = random_string(100)
        test_results = random_string(100)
        allergies = random_string(50)
        patient_id = random.randint(100000, 100000 + num_records - 1)

        writer.writerow([medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id])

# Print success message
for table, file_path in file_paths.items():
    print(f"CSV file for {table} table generated successfully and saved to: {file_path}")
