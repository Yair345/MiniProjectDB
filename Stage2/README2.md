# README

## Table of Contents
1. [SELECT Queries Without Parameters](#select-queries-without-parameters)
  - [Query 1: Retrieve patient appointments in the last 6 months](#query-1-retrieve-patient-appointments-in-the-last-6-months)
  - [Query 2: Retrieve patients and their appointment count with doctors](#query-2-retrieve-patients-and-their-appointment-count-with-doctors)
  - [Query 3: Retrieve patients with multiple diagnoses and their treatment costs](#query-3-retrieve-patients-with-multiple-diagnoses-and-their-treatment-costs)
  - [Query 4: Retrieve patients and their billed amounts by insurance provider](#query-4-retrieve-patients-and-their-billed-amounts-by-insurance-provider)
2. [SELECT Queries With Parameters](#select-queries-with-parameters)
  - [Query 1: Retrieve patient information and recent appointment](#query-1-retrieve-patient-information-and-recent-appointment)
  - [Query 2: Retrieve patients with outstanding billing amounts](#query-2-retrieve-patients-with-outstanding-billing-amounts)
  - [Query 3: Retrieve treatments and medical records for patients](#query-3-retrieve-treatments-and-medical-records-for-patients)
  - [Query 4: Retrieve patients who had appointments with multiple doctors](#query-4-retrieve-patients-who-had-appointments-with-multiple-doctors)
3. [DELETE Queries](#delete-queries)
  - [Query 1: Delete old treatments and billings](#delete-query-1-delete-old-treatments-and-billings)
  - [Query 2: Delete appointments for patients with no recent appointments and unpaid billings](#delete-query-2-delete-appointments-for-patients-with-no-recent-appointments-and-unpaid-billings)
4. [UPDATE Queries](#update-queries)
  - [Query 1: Increase treatment costs for experienced doctors](#update-query-1-increase-treatment-costs-for-experienced-doctors)
  - [Query 2: Update patient contact information for patients with multiple doctors](#update-query-2-update-patient-contact-information-for-patients-with-multiple-doctors)
5. [Constraints](#constraints)
  - [NOT NULL Constraint](#not-null-constraint-on-patientsname)
  - [DEFAULT Constraint](#default-constraint-on-billingpayment_status)
  - [CHECK Constraint](#check-constraint-on-treatmenttreatment_cost)

---

## SELECT Queries Without Parameters

### Query 1: Retrieve patient appointments in the last 6 months

מטרת השאילתא היא להציג את שמות המטופלים, תאריכי לידה, מגדר, שם הרופא, תאריך התור והסיבה לביקור עבור כל התורים שהיו בחצי השנה האחרונה.
![noPara_select_1](https://github.com/Yair345/MiniProjectDB/assets/116631739/fd4ff990-d7d2-4e54-83a3-7977e396041e)



### Query 2: Retrieve patients and their appointment count with doctors

מטרת השאילתא היא להציג את שמות המטופלים, מגדר, גיל, שם הרופא והמספר התורים שהיו להם עם אותו רופא, רק אם היו להם יותר מתור אחד עם הרופא, ממוין לפי מספר התורים בסדר יורד.

![noPara_select_2](https://github.com/Yair345/MiniProjectDB/assets/116631739/3add4db8-ab12-451e-9907-5e8073aed8db)


### Query 3: Retrieve patients with multiple diagnoses and their treatment costs

מטרת השאילתא היא להציג את שם המטופל, אבחנות, טיפולים שהומלצו והעלות הכוללת של הטיפולים עבור מטופלים שיש להם יותר מרשומה רפואית אחת.

![noPara_select_3](https://github.com/Yair345/MiniProjectDB/assets/116631739/5221b712-3623-4e3b-98f4-0fc29fb64a75)


### Query 4: Retrieve patients and their billed amounts by insurance provider

מטרת השאילתא היא להציג את שם המטופל, חברת הביטוח והסכום הכולל שחויב בגין טיפולים בשנה הנוכחית, מקובץ לפי חברת הביטוח וממוין לפי הסכום הכולל שחויב בסדר יורד.

![noPara_select_4](https://github.com/Yair345/MiniProjectDB/assets/116631739/a0e9c302-3a6e-4f5b-9b21-57378035b6eb)


## SELECT Queries With Parameters

### Query 1: Retrieve patient information and recent appointment

מטרת השאילתא היא להציג את שם המטופל, מגדר, תאריך לידה, תאריך התור האחרון והסיבה לביקור עבור מטופלים עם שם דומה לערך שהוכנס כפרמטר.

![Parameters_1](https://github.com/Yair345/MiniProjectDB/assets/116631739/4c5c406d-fb7a-4b77-8acf-7186e284dcc3)


### Query 2: Retrieve patients with outstanding billing amounts

מטרת השאילתא היא להציג את שם המטופל, חברת הביטוח והסכום הכולל לא משולם עבור מטופלים שיש להם חיובים לא משולמים בטווח הסכומים שהוכנס כפרמטר.

![Parameters_2](https://github.com/Yair345/MiniProjectDB/assets/116631739/ffc7d921-0b4e-469a-a0eb-fbdecc3d7b7b)


### Query 3: Retrieve treatments and medical records for patients

מטרת השאילתא היא להציג את שם הטיפול, תיאור הטיפול, אבחנה וטיפולים שהומלצו עבור מטופלים עם מספרי זיהוי שהוכנסו כפרמטר.

![Parameters_3](https://github.com/Yair345/MiniProjectDB/assets/116631739/d4c3be22-82ef-4fd7-8703-d66c6095f225)


### Query 4: Retrieve patients who had appointments with multiple doctors

מטרת השאילתא היא להציג את שם המטופל ומספר הרופאים השונים שטיפלו בו, עבור מטופלים שהיו אצל יותר מספר רופאים מינימלי שהוכנס כפרמטר.

![Parameters_4](https://github.com/Yair345/MiniProjectDB/assets/116631739/edc025c8-d4b2-4426-9633-90f3625c95e8)


## DELETE Queries

### Delete Query 1: Delete old treatments and billings

מטרת השאילתא היא למחוק את כל הטיפולים והחיובים עבור רשומות רפואיות שהן מלפני יותר מ-5 שנים.

**Before Delete:**

![Treatment_before](https://github.com/Yair345/MiniProjectDB/assets/116631739/bc2ccc3e-a160-4593-be83-00ec1fd92693)


**After Delete:**

![noPara_delete_1](https://github.com/Yair345/MiniProjectDB/assets/116631739/d6b88b5c-d2b4-4a35-af34-e0df3c9ead1b)


### Delete Query 2: Delete appointments for patients with no recent appointments and unpaid billings

מטרת השאילתא היא למחוק את כל התורים עבור מטופלים שלא היו להם תורים בשנה האחרונה וגם יש להם חיובים לא משולמים.

**Before Delete:**

![Appointment_before](https://github.com/Yair345/MiniProjectDB/assets/116631739/ec4999b7-3768-458d-a1f0-65f66f0e6886)


**After Delete:**

![noPara_delete_2](https://github.com/Yair345/MiniProjectDB/assets/116631739/4bd45634-6fc2-4a69-9182-0d3a63213c20)


## UPDATE Queries

### Update Query 1: Increase treatment costs for experienced doctors

מטרת השאילתא היא להגדיל את עלות הטיפול ב-20% עבור טיפולים שבוצעו על ידי רופאים עם יותר מ-40 שנות נסיון.

**Before Update:**

![Treatment_before](https://github.com/Yair345/MiniProjectDB/assets/116631739/134002a3-ad39-4cd2-a7dd-50fa96d34969)


**After Update:**

![noPara_update_1](https://github.com/Yair345/MiniProjectDB/assets/116631739/95080988-0f2d-4ec7-ba4d-1c7061a20912)


### Update Query 2: Update patient contact information for patients with multiple doctors

מטרת השאילתא היא לעדכן את פרטי ההתקשרות של מטופלים שהיו אצל יותר מ-3 רופאים שונים.

**Before Update:**

![Patients_before](https://github.com/Yair345/MiniProjectDB/assets/116631739/83bba65f-09d7-49c6-97ce-648e5a8bb351)


**After Update:**

![noPara_update_2](https://github.com/Yair345/MiniProjectDB/assets/116631739/7b643bfb-6f1f-46f7-969a-cfef4b970e47)


## Constraints

### NOT NULL Constraint on Patients.Name

מטרת האילוץ היא למנוע הכנסת ערך NULL לעמודת השם בטבלת המטופלים.

![WhatsApp Image 2024-06-16 at 19 23 51](https://github.com/Yair345/MiniProjectDB/assets/116631739/51e76e5c-60ca-48d2-bb63-092129f16776)


### DEFAULT Constraint on Billing.Payment_Status

מטרת האילוץ היא להגדיר ערך ברירת מחדל של 'Pending' לעמודת סטטוס התשלום בטבלת החיובים אם לא מוכנס ערך.

![SharedScreenshot](https://github.com/Yair345/MiniProjectDB/assets/116631739/a918af15-1d9a-4740-a068-ea9473115bbc)


### CHECK Constraint on Treatment.Treatment_Cost

מטרת האילוץ היא לוודא שעלות הטיפול בטבלת הטיפולים היא תמיד חיובית.

![WhatsApp Image 2024-06-16 at 19 28 42](https://github.com/Yair345/MiniProjectDB/assets/116631739/ae4b5bcf-1131-419b-9dd0-1fc308b6f573)
