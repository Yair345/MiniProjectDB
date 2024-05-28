from faker import Faker
import random

fake = Faker()

# הגדרת מספר הרשומות שצריך לייצר
num_records = 400

# רשומות לדוגמא לטבלת Appointment
appointments = []
for _ in range(100000, 100000 + num_records):
    Appointment_ID = _
    Appointment_Date = 'TO_DATE(\'{}\', \'YYYY-MM-DD\')'.format(fake.date())
    Reason_for_Visit = fake.sentence(nb_words=6)
    Patient_ID = random.randint(100000, 100000 + num_records)
    Doctor_ID = random.randint(100000, 100000 + num_records)
    appointments.append((Appointment_ID, Appointment_Date, Reason_for_Visit, Patient_ID, Doctor_ID))

# רשומות לדוגמא לטבלת Billing
billings = []
for _ in range(100000, 100000 + num_records):
    Billing_ID = _
    Total_Cost = round(random.uniform(50.0, 1000.0), 2)
    Payment_Status = random.randint(0, 1)
    Patient_ID = random.randint(100000, 100000 + num_records)
    Treatment_ID = random.randint(100000, 100000 + num_records)
    billings.append((Billing_ID, Total_Cost, Payment_Status, Patient_ID, Treatment_ID))

# כתיבת הנתונים לקובץ SQL
with open('insert_data.sql', 'w') as f:
    f.write("BEGIN;\n")
    
    # הכנסת נתונים לטבלת Appointment
    f.write("-- Inserting data into Appointment table\n")
    for record in appointments:
        f.write(f"INSERT INTO Appointment (Appointment_ID, Appointment_Date, Reason_for_Visit, Patient_ID, Doctor_ID) "
                f"VALUES ({record[0]}, {record[1]}, '{record[2]}', {record[3]}, {record[4]});\n")
    
    # הכנסת נתונים לטבלת Billing
    f.write("-- Inserting data into Billing table\n")
    for record in billings:
        f.write(f"INSERT INTO Billing (Billing_ID, Total_Cost, Payment_Status, Patient_ID, Treatment_ID) "
                f"VALUES ({record[0]}, {record[1]}, {record[2]}, {record[3]}, {record[4]});\n")
    
    f.write("COMMIT;\n")

print("Data insertion script generated successfully!")
