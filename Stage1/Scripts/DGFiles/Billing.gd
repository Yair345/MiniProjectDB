
[General]
Version=1

[Preferences]
Username=
Password=2332
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=BILLING
Count=400

[Record]
Name=BILLING_ID
Type=NUMBER
Size=
Data=Sequence(100000, 1)
Master=

[Record]
Name=TOTAL_COST
Type=NUMBER
Size=10,2
Data=Random(500, 100000)
Master=

[Record]
Name=PAYMENT_STATUS
Type=VARCHAR2
Size=10
Data=List('Yes', 'No')
Master=

[Record]
Name=PATIENT_ID
Type=NUMBER
Size=
Data=List(select Patient_ID from Patients)
Master=

[Record]
Name=TREATMENT_ID
Type=NUMBER
Size=
Data=List(select Treatment_ID from Treatment)
Master=

