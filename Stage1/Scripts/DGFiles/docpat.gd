
[General]
Version=1

[Preferences]
Username=
Password=2204
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=
Name=DOCPAT
Count=400

[Record]
Name=PATIENT_ID
Type=NUMBER
Size=
Data=List(select patient_id from patients)
Master=

[Record]
Name=DOCTOR_ID
Type=NUMBER
Size=
Data=List(select doctor_id from doctors)
Master=

