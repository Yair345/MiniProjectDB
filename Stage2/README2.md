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

![Query 1 Execution](query1_execution.png)
![Query 1 Result](query1_result.png)

### Query 2: Retrieve patients and their appointment count with doctors

מטרת השאילתא היא להציג את שמות המטופלים, מגדר, גיל, שם הרופא והמספר התורים שהיו להם עם אותו רופא, רק אם היו להם יותר מתור אחד עם הרופא, ממוין לפי מספר התורים בסדר יורד.

![Query 2 Execution](query2_execution.png)
![Query 2 Result](query2_result.png)

### Query 3: Retrieve patients with multiple diagnoses and their treatment costs

מטרת השאילתא היא להציג את שם המטופל, אבחנות, טיפולים שהומלצו והעלות הכוללת של הטיפולים עבור מטופלים שיש להם יותר מרשומה רפואית אחת.

![Query 3 Execution](query3_execution.png)
![Query 3 Result](query3_result.png)

### Query 4: Retrieve patients and their billed amounts by insurance provider

מטרת השאילתא היא להציג את שם המטופל, חברת הביטוח והסכום הכולל שחויב בגין טיפולים בשנה הנוכחית, מקובץ לפי חברת הביטוח וממוין לפי הסכום הכולל שחויב בסדר יורד.

![Query 4 Execution](query4_execution.png)
![Query 4 Result](query4_result.png)

## SELECT Queries With Parameters

### Query 1: Retrieve patient information and recent appointment

מטרת השאילתא היא להציג את שם המטופל, מגדר, תאריך לידה, תאריך התור האחרון והסיבה לביקור עבור מטופלים עם שם דומה לערך שהוכנס כפרמטר.

![Query with Parameters 1 Execution](query_with_params1_execution.png)
![Query with Parameters 1 Result](query_with_params1_result.png)

### Query 2: Retrieve patients with outstanding billing amounts

מטרת השאילתא היא להציג את שם המטופל, חברת הביטוח והסכום הכולל לא משולם עבור מטופלים שיש להם חיובים לא משולמים בטווח הסכומים שהוכנס כפרמטר.

![Query with Parameters 2 Execution](query_with_params2_execution.png)
![Query with Parameters 2 Result](query_with_params2_result.png)

### Query 3: Retrieve treatments and medical records for patients

מטרת השאילתא היא להציג את שם הטיפול, תיאור הטיפול, אבחנה וטיפולים שהומלצו עבור מטופלים עם מספרי זיהוי שהוכנסו כפרמטר.

![Query with Parameters 3 Execution](query_with_params3_execution.png)
![Query with Parameters 3 Result](query_with_params3_result.png)

### Query 4: Retrieve patients who had appointments with multiple doctors

מטרת השאילתא היא להציג את שם המטופל ומספר הרופאים השונים שטיפלו בו, עבור מטופלים שהיו אצל יותר מספר רופאים מינימלי שהוכנס כפרמטר.

![Query with Parameters 4 Execution](query_with_params4_execution.png)
![Query with Parameters 4 Result](query_with_params4_result.png)

## DELETE Queries

### Delete Query 1: Delete old treatments and billings

מטרת השאילתא היא למחוק את כל הטיפולים והחיובים עבור רשומות רפואיות שהן מלפני יותר מ-5 שנים.

**Before Delete**
![Before Delete Query 1](before_delete_query1.png)

![Delete Query 1 Execution](delete_query1_execution.png)

**After Delete**
![After Delete Query 1](after_delete_query1.png)

### Delete Query 2: Delete appointments for patients with no recent appointments and unpaid billings

מטרת השאילתא היא למחוק את כל התורים עבור מטופלים שלא היו להם תורים בשנה האחרונה וגם יש להם חיובים לא משולמים.

**Before Delete**
![Before Delete Query 2](before_delete_query2.png)

![Delete Query 2 Execution](delete_query2_execution.png)

**After Delete**
![After Delete Query
