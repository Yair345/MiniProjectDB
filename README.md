# שלב ד' - אינטגרציה ויצירת מבטים

## תרשימי DSD ו-ERD

### תרשים DSD
![image](https://github.com/user-attachments/assets/301b593a-fe16-418a-97e5-4195f9d03ea5)


### תרשים ERD
![image](https://github.com/user-attachments/assets/0cdeb5de-bb14-4318-a7e6-5362ab64026e)


## החלטות שנעשו בשלב האינטגרציה

במהלך תהליך האינטגרציה, ביצענו מספר שינויים בטבלאות הקיימות:

1. **עדכון טבלת Patients1:**
   - הוספנו שדה `Research_ID` כ-Foreign Key לטבלת Research.
   - איחדנו את השדות `FirstName` ו-`LastName` לשדה אחד `Name`.

2. **עדכון טבלת Doctors1:**
   - איחדנו את השדות `FirstName` ו-`LastName` לשדה אחד `Name`.

3. **יצירת טבלאות חדשות:**
   - הוספנו טבלאות חדשות: Research, Measurement, Publication, Medicines, Research_Doctor, ו-Research_Medicines.

4. **שינוי שם טבלה:**
   - שינינו את שם הטבלה DocPat ל-Relationship.

5. **טיפול בשדות חסרים:**
   - הגדרנו ערכי ברירת מחדל לשדות חסרים כמו Contact_Information ו-Insurance בטבלת Patients1.
   - הגדרנו ערכי ברירת מחדל לשדות חסרים כמו Contact_Information ו-Date_of_Start_working בטבלת Doctors1.

## הסבר מילולי של התהליך והפקודות

תהליך האינטגרציה כלל מספר שלבים:

1. **ניתוח מבני הנתונים הקיימים:** בחנו את מבני הטבלאות של שתי המערכות והחלטנו כיצד לשלב אותן.

2. **עדכון טבלאות קיימות:** השתמשנו בפקודות ALTER TABLE כדי להוסיף ולשנות שדות בטבלאות הקיימות.

3. **יצירת טבלאות חדשות:** השתמשנו בפקודות CREATE TABLE ליצירת הטבלאות החדשות הנדרשות.

4. **העברת נתונים:** השתמשנו בפקודות INSERT INTO כדי להעביר נתונים מהטבלאות הישנות לחדשות.

5. **עדכון נתונים:** השתמשנו בפקודות UPDATE כדי לטפל בשדות חסרים ולאחד שדות.

להלן דוגמה לחלק מהפקודות שהשתמשנו בהן:

```sql
-- הוספת שדה Research_ID לטבלת Patients1
ALTER TABLE Patients1
ADD Research_ID INT;

-- יצירת Foreign Key
ALTER TABLE Patients1
ADD CONSTRAINT fk_patients1_research
FOREIGN KEY (Research_ID) REFERENCES Research(Research_ID);

-- העברת נתונים מ-Patient ל-Patients1
INSERT INTO Patients1 (Patient_ID, Name, Date_of_Birth, Gender, Research_ID)
SELECT Patient_ID, FirstName || ' ' || LastName, DateOfBirth, Sex, Research_ID
FROM Patient;

-- עדכון שדות חסרים
UPDATE Patients1
SET Contact_Information = 'Unknown',
    Insurance = 'Unknown'
WHERE Contact_Information IS NULL OR Insurance IS NULL;
```


# מבטים ושאילתות

## מבט 1 - EmergencyDepartmentView

### תיאור מילולי
מבט זה מתמקד במחלקת החירום ומשלב מידע מטבלאות Patients, Appointments, Doctors, MedicalRecords, Treatments, ו-Billing. הוא מספק תמונה כוללת של ביקורי המטופלים, הטיפולים שקיבלו, והעלויות הקשורות.

### קוד המבט
```sql
CREATE VIEW EmergencyDepartmentView AS
SELECT 
    p.Patient_ID,
    p.Name AS Patient_Name,
    p.Date_of_Birth,
    p.Gender,
    p.Insurance,
    a.Appointment_ID,
    a.Appointment_Date,
    a.Reason_for_Visit,
    d.Name AS Doctor_Name,
    d.Specialty,
    mr.Diagnosis,
    mr.Prescribed_Treatments,
    t.Treatment_Name,
    t.Treatment_Cost,
    b.Total_Cost,
    b.Payment_Status
FROM 
    Patient p
    LEFT JOIN Appointment a ON p.Patient_ID = a.Patient_ID
    LEFT JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
    LEFT JOIN MedicalRecord mr ON p.Patient_ID = mr.Patient_ID
    LEFT JOIN Treatment t ON mr.Medical_Record_ID = t.Medical_Record_ID
    LEFT JOIN Billing b ON p.Patient_ID = b.Patient_ID AND t.Treatment_ID = b.Treatment_ID;
```

### שאילתות על המבט
#### שאילה 1
##### תיאור מילולי
שאילתא זו מנתחת את מספר הביקורים וממוצע עלות הטיפול לפי מחלקות (התמחויות רופאים) במחלקת החירום.

##### קוד השאילתה
```sql
SELECT 
    Specialty,
    COUNT(*) AS Visit_Count,
    AVG(Treatment_Cost) AS Avg_Treatment_Cost,
    MAX(Treatment_Cost) AS Max_Treatment_Cost,
    MIN(Treatment_Cost) AS Min_Treatment_Cost
FROM EmergencyDepartmentView
WHERE Specialty IS NOT NULL AND Treatment_Cost IS NOT NULL
GROUP BY Specialty
ORDER BY Visit_Count DESC;
```

![WhatsApp Image 2024-07-22 at 18 19 07_a295cda7](https://github.com/user-attachments/assets/21a49ca8-8c8d-49b4-b684-ccc589dd7b53)

### שאילתא 2 על מבט EmergencyDepartmentView
#### תיאור מילולי
שאילתא זו מוצאת את כל המטופלים שביקרו במחלקת החירום בחודש האחרון ואת הרופאים שטיפלו בהם.
קוד השאילתא

```sql
SELECT DISTINCT Patient_Name, Doctor_Name, Appointment_Date
FROM EmergencyDepartmentView
WHERE Appointment_Date >= ADD_MONTHS(SYSDATE, -1)
ORDER BY Appointment_Date;
```
![WhatsApp Image 2024-07-22 at 18 17 06_08ed9aa5](https://github.com/user-attachments/assets/f9ea6782-3ecc-4776-859d-e340f05a204f)



### מבט 2 - ResearchDepartmentView
#### תיאור מילולי
מבט זה מתמקד במחלקת המחקר ומשלב מידע מטבלאות Research, Patient, Measurement, Doctor, ו-Publication. הוא מספק תמונה כוללת של המחקרים המתבצעים, המטופלים המשתתפים, המדידות שנלקחו, הרופאים המעורבים והפרסומים הקשורים.
#### קוד המבט


```sql
CREATE VIEW ResearchDepartmentView AS
SELECT 
    r.Research_ID,
    r.Research_Name,
    r.Budget,
    r.R_Start AS Research_Start_Date,
    p.Patient_ID,
    p.FirstName || ' ' || p.LastName AS Patient_Name,
    p.Sex,
    p.DateOfBirth,
    m.Measurement_ID,
    m.M_Date AS Measurement_Date,
    m.M_Type AS Measurement_Type,
    m.M_Value AS Measurement_Value,
    d.Doctor_ID,
    d.FirstName || ' ' || d.LastName AS Doctor_Name,
    d.Specialization,
    pub.Publication_ID,
    pub.P_Date AS Publication_Date,
    pub.Magazin
FROM 
    Research r
    LEFT JOIN Patient p ON r.Research_ID = p.Research_ID
    LEFT JOIN Measurement m ON p.Patient_ID = m.Patient_ID
    LEFT JOIN Research_Doctor rd ON r.Research_ID = rd.Research_ID
    LEFT JOIN Doctor d ON rd.Doctor_ID = d.Doctor_ID
    LEFT JOIN Publication pub ON r.Research_ID = pub.Research_ID;
```

#### שליפת נתונים מהמבט (10 רשומות)

```sql
SELECT * FROM ResearchDepartmentView
```

![WhatsApp Image 2024-07-22 at 18 20 17_67ed9c59](https://github.com/user-attachments/assets/27dce860-5f3c-453d-b0f3-db3dc7baeff6)


### שאילתא 1 על מבט ResearchDepartmentView
#### תיאור מילולי
שאילתא זו מוצאת את המחקרים עם המספר הגבוה ביותר של מטופלים ורופאים.

```sql
SELECT Research_Name, 
       COUNT(DISTINCT Patient_ID) AS Patient_Count,
       COUNT(DISTINCT Doctor_ID) AS Doctor_Count
FROM ResearchDepartmentView
GROUP BY Research_ID, Research_Name
ORDER BY Patient_Count DESC, Doctor_Count DESC;
```

![WhatsApp Image 2024-07-22 at 18 21 52_ab08b760](https://github.com/user-attachments/assets/5043ed28-8381-4d42-8bf3-61fc6c2e759d)



### שאילתא 2 על מבט ResearchDepartmentView
#### תיאור מילולי
שאילתא זו מציגה את ממוצע המדידות לכל סוג מדידה בכל מחקר.

```sql
SELECT Research_Name, 
       Measurement_Type,
       AVG(Measurement_Value) AS Avg_Measurement_Value,
       COUNT(*) AS Measurement_Count
FROM ResearchDepartmentView
WHERE Measurement_ID IS NOT NULL
GROUP BY Research_ID, Research_Name, Measurement_Type
ORDER BY Research_Name, Measurement_Type;
```

![WhatsApp Image 2024-07-22 at 18 22 51_eb1f60bb](https://github.com/user-attachments/assets/644f2fe0-ed9e-42c6-9ada-eebff73b4727)



## סיכום
#### בשלב זה של הפרויקט, ביצענו אינטגרציה מוצלחת של שתי מערכות נתונים שונות לכדי מערכת אחת משולבת. יצרנו מבטים שמאפשרים גישה קלה ויעילה למידע משני האגפים - מחלקת החירום ומחלקת המחקר. השאילתות שפיתחנו מדגימות את היכולת לנתח את הנתונים המשולבים ולהפיק תובנות משמעותיות שיכולות לסייע בקבלת החלטות ובשיפור התהליכים בשני האגפים.
