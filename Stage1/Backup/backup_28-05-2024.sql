prompt PL/SQL Developer Export Tables for user C##YAIR@XE
prompt Created by yairl on Tuesday, 28 May 2024
set feedback off
set define off

prompt Dropping DOCTORS...
drop table DOCTORS cascade constraints;
prompt Dropping PATIENTS...
drop table PATIENTS cascade constraints;
prompt Dropping APPOINTMENT...
drop table APPOINTMENT cascade constraints;
prompt Dropping MEDICALRECORD...
drop table MEDICALRECORD cascade constraints;
prompt Dropping TREATMENT...
drop table TREATMENT cascade constraints;
prompt Dropping BILLING...
drop table BILLING cascade constraints;
prompt Dropping DOCPAT...
drop table DOCPAT cascade constraints;
prompt Creating DOCTORS...
create table DOCTORS
(
  doctor_id             INTEGER not null,
  name                  VARCHAR2(100) not null,
  contact_information   VARCHAR2(50) not null,
  date_of_start_working DATE not null,
  specialty             VARCHAR2(100) not null
);
alter table DOCTORS
  add primary key (DOCTOR_ID);

prompt Creating PATIENTS...
create table PATIENTS
(
  patient_id          INTEGER not null,
  name                VARCHAR2(100) not null,
  date_of_birth       DATE not null,
  gender              VARCHAR2(10) not null,
  contact_information VARCHAR2(50) not null,
  insurance           VARCHAR2(10) not null
);
alter table PATIENTS
  add primary key (PATIENT_ID);

prompt Creating APPOINTMENT...
create table APPOINTMENT
(
  appointment_id   INTEGER not null,
  appointment_date DATE not null,
  reason_for_visit VARCHAR2(255) not null,
  patient_id       INTEGER not null,
  doctor_id        INTEGER not null
);
alter table APPOINTMENT
  add primary key (APPOINTMENT_ID);
alter table APPOINTMENT
  add foreign key (PATIENT_ID)
  references PATIENTS (PATIENT_ID) on delete cascade;
alter table APPOINTMENT
  add foreign key (DOCTOR_ID)
  references DOCTORS (DOCTOR_ID) on delete cascade;

prompt Creating MEDICALRECORD...
create table MEDICALRECORD
(
  medical_record_id     INTEGER not null,
  diagnosis             VARCHAR2(255) not null,
  prescribed_treatments VARCHAR2(255) not null,
  test_results          VARCHAR2(255) not null,
  allergies             VARCHAR2(255) not null,
  patient_id            INTEGER not null
);
alter table MEDICALRECORD
  add primary key (MEDICAL_RECORD_ID);
alter table MEDICALRECORD
  add foreign key (PATIENT_ID)
  references PATIENTS (PATIENT_ID) on delete cascade;

prompt Creating TREATMENT...
create table TREATMENT
(
  treatment_id          INTEGER not null,
  treatment_cost        NUMBER(10,2) not null,
  treatment_name        VARCHAR2(50) not null,
  treatment_description VARCHAR2(255) not null,
  medical_record_id     INTEGER not null
)
;
alter table TREATMENT
  add primary key (TREATMENT_ID);
alter table TREATMENT
  add foreign key (MEDICAL_RECORD_ID)
  references MEDICALRECORD (MEDICAL_RECORD_ID) on delete cascade;

prompt Creating BILLING...
create table BILLING
(
  billing_id     INTEGER not null,
  total_cost     NUMBER(10,2) not null,
  payment_status VARCHAR2(10) not null,
  patient_id     INTEGER not null,
  treatment_id   INTEGER not null
);
alter table BILLING
  add primary key (BILLING_ID);
alter table BILLING
  add foreign key (PATIENT_ID)
  references PATIENTS (PATIENT_ID) on delete cascade;
alter table BILLING
  add foreign key (TREATMENT_ID)
  references TREATMENT (TREATMENT_ID) on delete cascade;

prompt Creating DOCPAT...
create table DOCPAT
(
  patient_id INTEGER not null,
  doctor_id  INTEGER not null
);
alter table DOCPAT
  add primary key (PATIENT_ID, DOCTOR_ID);
alter table DOCPAT
  add foreign key (PATIENT_ID)
  references PATIENTS (PATIENT_ID) on delete cascade;
alter table DOCPAT
  add foreign key (DOCTOR_ID)
  references DOCTORS (DOCTOR_ID) on delete cascade;

prompt Disabling triggers for DOCTORS...
alter table DOCTORS disable all triggers;
prompt Disabling triggers for PATIENTS...
alter table PATIENTS disable all triggers;
prompt Disabling triggers for APPOINTMENT...
alter table APPOINTMENT disable all triggers;
prompt Disabling triggers for MEDICALRECORD...
alter table MEDICALRECORD disable all triggers;
prompt Disabling triggers for TREATMENT...
alter table TREATMENT disable all triggers;
prompt Disabling triggers for BILLING...
alter table BILLING disable all triggers;
prompt Disabling triggers for DOCPAT...
alter table DOCPAT disable all triggers;
prompt Disabling foreign key constraints for APPOINTMENT...
alter table APPOINTMENT disable constraint SYS_C008964;
alter table APPOINTMENT disable constraint SYS_C008965;
prompt Disabling foreign key constraints for MEDICALRECORD...
alter table MEDICALRECORD disable constraint SYS_C008973;
prompt Disabling foreign key constraints for TREATMENT...
alter table TREATMENT disable constraint SYS_C008985;
prompt Disabling foreign key constraints for BILLING...
alter table BILLING disable constraint SYS_C008992;
alter table BILLING disable constraint SYS_C008993;
prompt Disabling foreign key constraints for DOCPAT...
alter table DOCPAT disable constraint SYS_C008977;
alter table DOCPAT disable constraint SYS_C008978;
prompt Loading DOCTORS...
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100000, 'Ebeneser De Domenico', 'ede0@apple.com', to_date('12-04-1967', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100001, 'Alaine Burgett', 'aburgett1@cafepress.com', to_date('25-12-1989', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100002, 'Yurik Cahillane', 'ycahillane2@foxnews.com', to_date('16-01-1983', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100003, 'Lorrayne Tregien', 'ltregien3@discuz.net', to_date('23-06-1953', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100004, 'Claudianus Kighly', 'ckighly4@4shared.com', to_date('24-10-1972', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100005, 'Benji Flood', 'bflood5@gizmodo.com', to_date('20-09-1969', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100006, 'Malina Woolveridge', 'mwoolveridge6@reddit.com', to_date('30-03-1973', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100007, 'Muhammad Dumbell', 'mdumbell7@mozilla.org', to_date('30-04-1980', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100008, 'Desirae Loughrey', 'dloughrey8@zimbio.com', to_date('18-11-1971', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100009, 'Sarge Beaulieu', 'sbeaulieu9@upenn.edu', to_date('26-10-1953', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100010, 'Taylor MacDunlevy', 'tmacdunlevya@purevolume.com', to_date('13-06-1969', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100011, 'Cathlene Sterman', 'cstermanb@hud.gov', to_date('12-03-1989', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100012, 'Efrem Bansal', 'ebansalc@pbs.org', to_date('05-12-1955', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100013, 'Delora Davenhill', 'ddavenhilld@oakley.com', to_date('04-06-1975', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100014, 'Marianna Prop', 'mprope@nhs.uk', to_date('31-07-1960', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100015, 'Alfie Ebi', 'aebif@soundcloud.com', to_date('10-06-1991', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100016, 'Hymie Blas', 'hblasg@cbslocal.com', to_date('10-01-1978', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100017, 'Benyamin Ickowicz', 'bickowiczh@rakuten.co.jp', to_date('05-03-1958', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100018, 'Thatch Gairdner', 'tgairdneri@usa.gov', to_date('18-11-1992', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100019, 'Carolin Dinkin', 'cdinkinj@imdb.com', to_date('01-02-1993', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100020, 'Chrysa Saggs', 'csaggsk@shop-pro.jp', to_date('16-10-1977', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100021, 'Zachery Groundwater', 'zgroundwaterl@linkedin.com', to_date('24-10-1958', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100022, 'Opalina Rennison', 'orennisonm@behance.net', to_date('04-02-1984', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100023, 'Joyous Marrable', 'jmarrablen@biglobe.ne.jp', to_date('23-07-1955', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100024, 'Roseline Yitzovitz', 'ryitzovitzo@tmall.com', to_date('26-09-1963', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100025, 'Bidget Ferrers', 'bferrersp@youtu.be', to_date('25-01-1992', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100026, 'Livvyy Sibary', 'lsibaryq@photobucket.com', to_date('17-05-1980', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100027, 'Lowrance Pues', 'lpuesr@pen.io', to_date('28-06-1982', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100028, 'Nickolai MacLardie', 'nmaclardies@si.edu', to_date('13-11-1983', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100029, 'Ardelle Delicate', 'adelicatet@tmall.com', to_date('12-02-1969', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100030, 'Tressa Matlock', 'tmatlocku@uiuc.edu', to_date('27-08-1948', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100031, 'Siobhan Wishkar', 'swishkarv@dagondesign.com', to_date('13-09-1952', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100032, 'Marijo Knapman', 'mknapmanw@ehow.com', to_date('19-08-1966', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100033, 'Oates Pfeffel', 'opfeffelx@cafepress.com', to_date('19-06-1991', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100034, 'Fleurette Burnhill', 'fburnhilly@cdc.gov', to_date('14-12-1968', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100035, 'Dunn McGregor', 'dmcgregorz@edublogs.org', to_date('03-04-1973', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100036, 'Babbette Beavan', 'bbeavan10@xing.com', to_date('02-01-1987', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100037, 'Maitilde Einchcombe', 'meinchcombe11@prnewswire.com', to_date('04-06-1969', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100038, 'Bernadene Skillanders', 'bskillanders12@buzzfeed.com', to_date('22-08-1975', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100039, 'Krissy Sibbons', 'ksibbons13@cafepress.com', to_date('09-10-1982', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100040, 'Olenka Raynor', 'oraynor14@foxnews.com', to_date('23-08-1958', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100041, 'Tomaso Noye', 'tnoye15@intel.com', to_date('10-05-1962', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100042, 'Klarrisa Concklin', 'kconcklin16@linkedin.com', to_date('26-01-1969', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100043, 'Jessalin Fardell', 'jfardell17@eventbrite.com', to_date('15-08-1951', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100044, 'Kendell Hencke', 'khencke18@ehow.com', to_date('17-02-1977', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100045, 'Gordan Pollendine', 'gpollendine19@dropbox.com', to_date('26-02-1972', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100046, 'Derk McLaughlin', 'dmclaughlin1a@jalbum.net', to_date('23-06-1962', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100047, 'Johann Esselin', 'jesselin1b@smugmug.com', to_date('17-11-1953', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100048, 'Raddie Hallad', 'rhallad1c@simplemachines.org', to_date('21-07-1993', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100049, 'Baxie Pocknell', 'bpocknell1d@devhub.com', to_date('27-12-1970', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100050, 'Elle Shoobridge', 'eshoobridge1e@cam.ac.uk', to_date('28-12-1979', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100051, 'Staffard Dodgson', 'sdodgson1f@smugmug.com', to_date('13-04-1987', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100052, 'Heath Swancott', 'hswancott1g@weibo.com', to_date('26-10-1962', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100053, 'Ted Hugli', 'thugli1h@cocolog-nifty.com', to_date('04-05-1977', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100054, 'Cyrus Reinmar', 'creinmar1i@topsy.com', to_date('03-01-1957', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100055, 'Tomi Strahan', 'tstrahan1j@biblegateway.com', to_date('02-10-1966', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100056, 'Barn Gurry', 'bgurry1k@lycos.com', to_date('03-10-1948', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100057, 'Lenci Sawood', 'lsawood1l@aboutads.info', to_date('07-07-1981', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100058, 'Kalie Liddiatt', 'kliddiatt1m@answers.com', to_date('10-08-1979', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100059, 'Jo Potteril', 'jpotteril1n@illinois.edu', to_date('20-03-1978', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100060, 'Mariel Chitty', 'mchitty1o@newsvine.com', to_date('09-05-1989', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100061, 'Bartholomew Featherstone', 'bfeatherstone1p@earthlink.net', to_date('07-09-1948', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100062, 'Bendick D''Agostino', 'bdagostino1q@sphinn.com', to_date('27-09-1987', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100063, 'Stanislas Shimman', 'sshimman1r@rakuten.co.jp', to_date('27-06-1949', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100064, 'Sean Boow', 'sboow1s@networksolutions.com', to_date('28-12-1959', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100065, 'Alvina Feben', 'afeben1t@google.ca', to_date('25-05-1983', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100066, 'Arlin Vakhrushev', 'avakhrushev1u@latimes.com', to_date('15-05-1979', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100067, 'Shaun Feitosa', 'sfeitosa1v@weebly.com', to_date('23-10-1976', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100068, 'Florrie Spick', 'fspick1w@walmart.com', to_date('29-09-1990', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100069, 'Else Doey', 'edoey1x@addthis.com', to_date('14-09-1973', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100070, 'Doralynn O''Kelly', 'dokelly1y@utexas.edu', to_date('22-03-1958', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100071, 'Mariejeanne Giovanizio', 'mgiovanizio1z@noaa.gov', to_date('06-06-1969', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100072, 'Deonne Maffulli', 'dmaffulli20@intel.com', to_date('03-05-1978', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100073, 'Verile Ollet', 'vollet21@msn.com', to_date('21-07-1962', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100074, 'Misty Yitzhakov', 'myitzhakov22@etsy.com', to_date('20-05-1961', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100075, 'Mae Heiden', 'mheiden23@prlog.org', to_date('27-05-1976', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100076, 'Anjanette Littleton', 'alittleton24@eepurl.com', to_date('11-07-1976', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100077, 'Jaquenetta Buckham', 'jbuckham25@uiuc.edu', to_date('29-11-1963', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100078, 'Nananne MacKerley', 'nmackerley26@amazon.co.uk', to_date('04-11-1970', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100079, 'Leontine Borley', 'lborley27@alibaba.com', to_date('06-03-1981', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100080, 'Shell Iapico', 'siapico28@surveymonkey.com', to_date('07-05-1989', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100081, 'Jenn Dresser', 'jdresser29@linkedin.com', to_date('27-01-1972', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100082, 'Benedetto Colston', 'bcolston2a@multiply.com', to_date('08-10-1988', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100083, 'Adoree Soall', 'asoall2b@issuu.com', to_date('09-07-1985', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100084, 'Mervin Wasbrough', 'mwasbrough2c@newsvine.com', to_date('18-06-1992', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100085, 'Vasily Slisby', 'vslisby2d@com.com', to_date('27-03-1958', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100086, 'Marcello Klein', 'mklein2e@cyberchimps.com', to_date('19-01-1978', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100087, 'Alfy Trask', 'atrask2f@statcounter.com', to_date('24-09-1986', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100088, 'Agretha Rivaland', 'arivaland2g@pinterest.com', to_date('07-08-1975', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100089, 'Mirna Marson', 'mmarson2h@archive.org', to_date('28-09-1988', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100090, 'Jeremiah Odam', 'jodam2i@creativecommons.org', to_date('15-03-1973', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100091, 'Jade Hinz', 'jhinz2j@constantcontact.com', to_date('10-02-1980', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100092, 'Sharai Keough', 'skeough2k@mozilla.com', to_date('10-02-1972', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100093, 'Devland Healey', 'dhealey2l@digg.com', to_date('05-06-1963', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100094, 'Iorgo McGeraghty', 'imcgeraghty2m@freewebs.com', to_date('03-02-1990', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100095, 'Karlis De Benedictis', 'kde2n@ehow.com', to_date('18-07-1948', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100096, 'Eve Latan', 'elatan2o@bloglines.com', to_date('28-03-1992', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100097, 'Editha Borel', 'eborel2p@sitemeter.com', to_date('17-09-1971', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100098, 'Rem Ziehms', 'rziehms2q@vkontakte.ru', to_date('17-10-1973', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100099, 'Robinson Gabbett', 'rgabbett2r@blogs.com', to_date('16-12-1970', 'dd-mm-yyyy'), 'Pulmonology');
commit;
prompt 100 records committed...
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100100, 'Stace Andryushchenko', 'sandryushchenko2s@rediff.com', to_date('08-12-1974', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100101, 'Ruth Makey', 'rmakey2t@examiner.com', to_date('05-11-1960', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100102, 'Frederica Lorking', 'florking2u@cdc.gov', to_date('16-03-1953', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100103, 'Gayla Purcer', 'gpurcer2v@sakura.ne.jp', to_date('17-12-1969', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100104, 'Christos Rushmere', 'crushmere2w@cargocollective.com', to_date('12-10-1979', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100105, 'Boone Winn', 'bwinn2x@tiny.cc', to_date('16-04-1950', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100106, 'Malorie Chasmer', 'mchasmer2y@ft.com', to_date('27-03-1952', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100107, 'Ruperta Craney', 'rcraney2z@cbsnews.com', to_date('02-08-1986', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100108, 'Matthaeus Vogeler', 'mvogeler30@nifty.com', to_date('03-01-1983', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100109, 'Andras Josofovitz', 'ajosofovitz31@pen.io', to_date('02-04-1989', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100110, 'Ichabod Dovidian', 'idovidian32@ft.com', to_date('22-05-1961', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100111, 'Jammal Tommaseo', 'jtommaseo33@house.gov', to_date('19-05-1951', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100112, 'Briny Antushev', 'bantushev34@imgur.com', to_date('30-09-1955', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100113, 'Stefan Hazael', 'shazael35@time.com', to_date('20-11-1974', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100114, 'Nick Adrain', 'nadrain36@vimeo.com', to_date('23-08-1948', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100115, 'Aubine Cattow', 'acattow37@nhs.uk', to_date('23-05-1954', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100116, 'Aaron Eisikovitsh', 'aeisikovitsh38@yahoo.co.jp', to_date('02-06-1957', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100117, 'Nita Colley', 'ncolley39@ning.com', to_date('14-05-1984', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100118, 'Blanche Bullant', 'bbullant3a@guardian.co.uk', to_date('19-04-1992', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100119, 'Twyla Badham', 'tbadham3b@vistaprint.com', to_date('03-10-1965', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100120, 'Randene Stair', 'rstair3c@feedburner.com', to_date('19-12-1961', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100121, 'Lydia Canton', 'lcanton3d@wix.com', to_date('14-07-1962', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100122, 'Timmy Sansum', 'tsansum3e@opera.com', to_date('24-03-1991', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100123, 'Elysia Pollicatt', 'epollicatt3f@weibo.com', to_date('17-07-1961', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100124, 'Lee De Giorgi', 'lde3g@ustream.tv', to_date('19-01-1978', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100125, 'Angelo Goude', 'agoude3h@artisteer.com', to_date('24-06-1974', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100126, 'Myles Lumbly', 'mlumbly3i@linkedin.com', to_date('20-01-1975', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100127, 'Lissi Sketcher', 'lsketcher3j@theglobeandmail.com', to_date('14-05-1987', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100128, 'Karla Aukland', 'kaukland3k@ox.ac.uk', to_date('22-05-1955', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100129, 'Elliott Rennebeck', 'erennebeck3l@nytimes.com', to_date('17-12-1985', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100130, 'Robena Colliard', 'rcolliard3m@alexa.com', to_date('05-03-1966', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100131, 'Trenna Lorryman', 'tlorryman3n@cnet.com', to_date('09-03-1963', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100132, 'Shannan Bodker', 'sbodker3o@blogs.com', to_date('28-02-1988', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100133, 'Charin Allmark', 'callmark3p@istockphoto.com', to_date('09-09-1993', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100134, 'Patsy Shaudfurth', 'pshaudfurth3q@fema.gov', to_date('02-10-1955', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100135, 'Moe Wall', 'mwall3r@psu.edu', to_date('07-04-1963', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100136, 'Jeremias Swatman', 'jswatman3s@epa.gov', to_date('01-11-1990', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100137, 'Gaynor Walklate', 'gwalklate3t@huffingtonpost.com', to_date('21-08-1964', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100138, 'Florina Shingler', 'fshingler3u@woothemes.com', to_date('18-12-1989', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100139, 'Mario Normaville', 'mnormaville3v@smugmug.com', to_date('15-03-1969', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100140, 'Caroljean Eller', 'celler3w@time.com', to_date('03-03-1949', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100141, 'Nappie Moodycliffe', 'nmoodycliffe3x@exblog.jp', to_date('21-10-1959', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100142, 'Yoko Harflete', 'yharflete3y@mediafire.com', to_date('19-09-1985', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100143, 'Lacie Angelo', 'langelo3z@oakley.com', to_date('27-12-1948', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100144, 'Libbi Woodhead', 'lwoodhead40@mapy.cz', to_date('11-04-1992', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100145, 'Almire Kealy', 'akealy41@msn.com', to_date('02-09-1948', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100146, 'Jodee Palmar', 'jpalmar42@archive.org', to_date('04-04-1972', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100147, 'Fremont Jent', 'fjent43@networkadvertising.org', to_date('19-03-1983', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100148, 'Filmer Cartmail', 'fcartmail44@geocities.com', to_date('09-08-1979', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100149, 'Warner Yeowell', 'wyeowell45@google.com.hk', to_date('26-08-1984', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100150, 'Sophronia Perrone', 'sperrone46@chron.com', to_date('15-07-1974', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100151, 'Mateo Oloman', 'moloman47@hugedomains.com', to_date('08-11-1984', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100152, 'Ciel Root', 'croot48@booking.com', to_date('15-06-1971', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100153, 'Daniele Raynes', 'draynes49@furl.net', to_date('18-06-1970', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100154, 'Haroun Sango', 'hsango4a@theatlantic.com', to_date('04-02-1981', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100155, 'Cyrille Carp', 'ccarp4b@cocolog-nifty.com', to_date('21-01-1985', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100156, 'Yulma Cruft', 'ycruft4c@zimbio.com', to_date('27-05-1970', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100157, 'Cosmo Verey', 'cverey4d@about.me', to_date('20-04-1988', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100158, 'Ilse Kennewell', 'ikennewell4e@de.vu', to_date('25-02-1965', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100159, 'Rik Peakman', 'rpeakman4f@hhs.gov', to_date('05-07-1976', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100160, 'Davie Norcliffe', 'dnorcliffe4g@weibo.com', to_date('22-05-1986', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100161, 'Deeyn Liger', 'dliger4h@mysql.com', to_date('04-07-1986', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100162, 'Danni Creane', 'dcreane4i@bravesites.com', to_date('06-04-1968', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100163, 'Miran Cordall', 'mcordall4j@lycos.com', to_date('25-09-1963', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100164, 'Christy Rew', 'crew4k@xing.com', to_date('21-06-1954', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100165, 'Coralie Haycox', 'chaycox4l@who.int', to_date('19-09-1961', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100166, 'Locke Shipsey', 'lshipsey4m@smugmug.com', to_date('04-07-1989', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100167, 'Loree Merryfield', 'lmerryfield4n@technorati.com', to_date('01-10-1949', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100168, 'Maison Bickersteth', 'mbickersteth4o@shinystat.com', to_date('18-05-1962', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100169, 'Morris Bayliss', 'mbayliss4p@seattletimes.com', to_date('16-01-1969', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100170, 'Fritz Kelcey', 'fkelcey4q@facebook.com', to_date('14-02-1973', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100171, 'Antonietta Slixby', 'aslixby4r@topsy.com', to_date('17-01-1959', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100172, 'Parry Harlock', 'pharlock4s@census.gov', to_date('01-08-1958', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100173, 'Win Climance', 'wclimance4t@wp.com', to_date('16-12-1966', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100174, 'Kial Sansam', 'ksansam4u@nymag.com', to_date('29-07-1979', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100175, 'Augie Palumbo', 'apalumbo4v@odnoklassniki.ru', to_date('02-02-1987', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100176, 'Maddi Wickstead', 'mwickstead4w@webs.com', to_date('01-10-1989', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100177, 'Zorina Whiscard', 'zwhiscard4x@nydailynews.com', to_date('12-06-1964', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100178, 'Kynthia Corwin', 'kcorwin4y@businessinsider.com', to_date('29-05-1964', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100179, 'Gilbertine Braywood', 'gbraywood4z@reference.com', to_date('10-04-1958', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100180, 'Carline Perrot', 'cperrot50@paginegialle.it', to_date('14-10-1974', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100181, 'Ursa Loughman', 'uloughman51@cdc.gov', to_date('06-05-1963', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100182, 'Killy Coppock.', 'kcoppock52@taobao.com', to_date('14-10-1955', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100183, 'Blakelee Thompstone', 'bthompstone53@redcross.org', to_date('27-06-1977', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100184, 'Meara Austin', 'maustin54@shop-pro.jp', to_date('31-10-1958', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100185, 'Maryellen Castlake', 'mcastlake55@amazonaws.com', to_date('25-12-1948', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100186, 'Stephenie Callender', 'scallender56@hexun.com', to_date('10-07-1958', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100187, 'Charo Devonish', 'cdevonish57@cdc.gov', to_date('29-09-1976', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100188, 'Ludovico Grandham', 'lgrandham58@berkeley.edu', to_date('08-11-1975', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100189, 'Rem Woodrooffe', 'rwoodrooffe59@cdbaby.com', to_date('08-09-1948', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100190, 'Brandea Sayburn', 'bsayburn5a@ehow.com', to_date('13-01-1965', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100191, 'Barny Durnin', 'bdurnin5b@dot.gov', to_date('21-02-1979', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100192, 'Sonnnie McGrirl', 'smcgrirl5c@bizjournals.com', to_date('30-01-1985', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100193, 'Laura Janaud', 'ljanaud5d@msu.edu', to_date('13-09-1981', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100194, 'Koral Walenta', 'kwalenta5e@a8.net', to_date('30-11-1976', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100195, 'Cirilo Hanmer', 'chanmer5f@github.com', to_date('03-05-1959', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100196, 'Tate Biermatowicz', 'tbiermatowicz5g@virginia.edu', to_date('09-08-1990', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100197, 'Konstantine Inglis', 'kinglis5h@facebook.com', to_date('06-11-1959', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100198, 'Padraic Playden', 'pplayden5i@ebay.co.uk', to_date('07-06-1982', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100199, 'Rena Stratford', 'rstratford5j@pbs.org', to_date('18-12-1984', 'dd-mm-yyyy'), 'Nephrology');
commit;
prompt 200 records committed...
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100200, 'Sayre Pimlock', 'spimlock5k@sourceforge.net', to_date('17-09-1990', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100201, 'Ulrika Retallick', 'uretallick5l@apple.com', to_date('30-08-1980', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100202, 'Onida Harkess', 'oharkess5m@canalblog.com', to_date('05-09-1966', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100203, 'Raymund Siege', 'rsiege5n@abc.net.au', to_date('17-10-1991', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100204, 'Lilia Bartolomeo', 'lbartolomeo5o@nsw.gov.au', to_date('24-11-1956', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100205, 'Rafferty Alejandri', 'ralejandri5p@drupal.org', to_date('12-10-1969', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100206, 'Fiorenze Skinley', 'fskinley5q@wordpress.org', to_date('21-07-1982', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100207, 'Steffi Culy', 'sculy5r@geocities.com', to_date('27-10-1948', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100208, 'Rock Ygo', 'rygo5s@mail.ru', to_date('17-09-1984', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100209, 'Mordy Mushawe', 'mmushawe5t@oracle.com', to_date('09-10-1959', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100210, 'Codie Bootherstone', 'cbootherstone5u@multiply.com', to_date('11-08-1970', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100211, 'Felike Cuttings', 'fcuttings5v@nature.com', to_date('18-08-1951', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100212, 'Eduardo Sprulls', 'esprulls5w@simplemachines.org', to_date('07-05-1976', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100213, 'Wally Marxsen', 'wmarxsen5x@woothemes.com', to_date('05-05-1959', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100214, 'Alyson Beard', 'abeard5y@cdc.gov', to_date('07-10-1978', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100215, 'Brynne Tomasik', 'btomasik5z@51.la', to_date('08-02-1975', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100216, 'Somerset Geer', 'sgeer60@nifty.com', to_date('08-03-1953', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100217, 'Stefania Dayley', 'sdayley61@jigsy.com', to_date('19-11-1950', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100218, 'Ryon Skoate', 'rskoate62@discovery.com', to_date('16-10-1993', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100219, 'Gerome Drohun', 'gdrohun63@umn.edu', to_date('15-05-1986', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100220, 'Elisabeth Goatman', 'egoatman64@desdev.cn', to_date('15-10-1990', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100221, 'Faythe Snalum', 'fsnalum65@cargocollective.com', to_date('21-01-1979', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100222, 'Siobhan Loudwell', 'sloudwell66@jiathis.com', to_date('10-01-1966', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100223, 'Kory Plaister', 'kplaister67@squarespace.com', to_date('26-08-1955', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100224, 'Shannen Lombard', 'slombard68@baidu.com', to_date('21-10-1969', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100225, 'Olia Gales', 'ogales69@sourceforge.net', to_date('09-04-1987', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100226, 'Melvin Jull', 'mjull6a@naver.com', to_date('28-10-1978', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100227, 'Virgilio MacCarroll', 'vmaccarroll6b@booking.com', to_date('29-09-1967', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100228, 'Karola Blaisdell', 'kblaisdell6c@nbcnews.com', to_date('07-10-1987', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100229, 'Ines Clewes', 'iclewes6d@ed.gov', to_date('05-10-1952', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100230, 'Harriet Cliff', 'hcliff6e@slideshare.net', to_date('08-05-1978', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100231, 'Maurice Albone', 'malbone6f@bloglines.com', to_date('13-12-1991', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100232, 'Ida Cushion', 'icushion6g@etsy.com', to_date('27-09-1955', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100233, 'Ive Sorrill', 'isorrill6h@yale.edu', to_date('18-10-1966', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100234, 'Minna Ricarde', 'mricarde6i@gmpg.org', to_date('20-10-1957', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100235, 'Jonah Jallin', 'jjallin6j@java.com', to_date('05-07-1948', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100236, 'Corrie Raybould', 'craybould6k@sohu.com', to_date('08-11-1962', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100237, 'Vale Orrocks', 'vorrocks6l@reverbnation.com', to_date('08-11-1993', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100238, 'Celie Vipan', 'cvipan6m@slate.com', to_date('01-03-1975', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100239, 'Levi Allbones', 'lallbones6n@sphinn.com', to_date('19-02-1960', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100240, 'Shannon Kilgrove', 'skilgrove6o@elegantthemes.com', to_date('09-01-1966', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100241, 'Gal Letch', 'gletch6p@nifty.com', to_date('18-09-1970', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100242, 'Sidnee Norquoy', 'snorquoy6q@geocities.com', to_date('17-10-1967', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100243, 'Ferris Ulyet', 'fulyet6r@tuttocitta.it', to_date('13-11-1986', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100244, 'Ruddie Braim', 'rbraim6s@wiley.com', to_date('13-08-1954', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100245, 'Garland Hamber', 'ghamber6t@globo.com', to_date('13-09-1968', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100246, 'Roseline Stode', 'rstode6u@exblog.jp', to_date('07-08-1975', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100247, 'Cecilio Liepins', 'cliepins6v@vinaora.com', to_date('22-09-1956', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100248, 'Shermy Greep', 'sgreep6w@reddit.com', to_date('07-10-1984', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100249, 'Blanca Glamart', 'bglamart6x@wix.com', to_date('22-12-1961', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100250, 'Zara Grewes', 'zgrewes6y@wikispaces.com', to_date('02-06-1948', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100251, 'Imojean Keyworth', 'ikeyworth6z@cdbaby.com', to_date('30-11-1972', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100252, 'Janenna Goodredge', 'jgoodredge70@w3.org', to_date('23-09-1969', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100253, 'Desmond Conrard', 'dconrard71@cdc.gov', to_date('09-10-1967', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100254, 'Petronia Caulcott', 'pcaulcott72@mapy.cz', to_date('12-05-1957', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100255, 'Moria Kolak', 'mkolak73@msn.com', to_date('09-09-1984', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100256, 'Stephie Skea', 'sskea74@unc.edu', to_date('18-03-1964', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100257, 'Fons Coxon', 'fcoxon75@ocn.ne.jp', to_date('26-02-1950', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100258, 'Rab Barkly', 'rbarkly76@geocities.com', to_date('23-03-1968', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100259, 'Eugen Harnott', 'eharnott77@biglobe.ne.jp', to_date('30-01-1970', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100260, 'Merrill Bloomer', 'mbloomer78@sohu.com', to_date('30-06-1960', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100261, 'Boycie O''Keeffe', 'bokeeffe79@va.gov', to_date('29-01-1952', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100262, 'Debby Chalke', 'dchalke7a@stumbleupon.com', to_date('29-06-1984', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100263, 'Ange Westrey', 'awestrey7b@eventbrite.com', to_date('10-12-1951', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100264, 'Antone Legrave', 'alegrave7c@google.ca', to_date('05-03-1960', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100265, 'Crista Gianotti', 'cgianotti7d@studiopress.com', to_date('29-02-1988', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100266, 'Dorise Smithend', 'dsmithend7e@51.la', to_date('11-01-1969', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100267, 'Anissa Fevier', 'afevier7f@epa.gov', to_date('03-05-1952', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100268, 'Marcello Denidge', 'mdenidge7g@mapy.cz', to_date('24-03-1973', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100269, 'Reinhard Malsher', 'rmalsher7h@ca.gov', to_date('07-05-1955', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100270, 'Idalia Stanbridge', 'istanbridge7i@ihg.com', to_date('25-12-1955', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100271, 'Andie Ringsell', 'aringsell7j@jimdo.com', to_date('04-03-1987', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100272, 'Shalom Farron', 'sfarron7k@admin.ch', to_date('17-09-1950', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100273, 'Miltie Cridge', 'mcridge7l@wired.com', to_date('16-11-1973', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100274, 'Broderick Barnsley', 'bbarnsley7m@bbb.org', to_date('03-08-1956', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100275, 'Louisa Matlock', 'lmatlock7n@nifty.com', to_date('24-03-1961', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100276, 'Winnie MacFadyen', 'wmacfadyen7o@comcast.net', to_date('23-11-1979', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100277, 'Ryan Sapauton', 'rsapauton7p@webmd.com', to_date('13-09-1958', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100278, 'Isa Tire', 'itire7q@github.io', to_date('17-10-1948', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100279, 'Ivor Lakeman', 'ilakeman7r@google.pl', to_date('02-11-1960', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100280, 'Hollie Campione', 'hcampione7s@newsvine.com', to_date('25-12-1958', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100281, 'Alaine Ditter', 'aditter7t@va.gov', to_date('08-02-1970', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100282, 'Elysia Owttrim', 'eowttrim7u@booking.com', to_date('10-09-1968', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100283, 'Maura Gianetti', 'mgianetti7v@rediff.com', to_date('03-10-1973', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100284, 'Erwin Garrand', 'egarrand7w@nytimes.com', to_date('12-10-1986', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100285, 'Cammie Wyrill', 'cwyrill7x@redcross.org', to_date('19-01-1961', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100286, 'Boot Kimbury', 'bkimbury7y@uiuc.edu', to_date('24-08-1953', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100287, 'Priscella Gillingham', 'pgillingham7z@edublogs.org', to_date('30-04-1955', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100288, 'Ransom Glaisner', 'rglaisner80@pen.io', to_date('25-08-1988', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100289, 'Devondra D''Costa', 'ddcosta81@globo.com', to_date('09-09-1981', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100290, 'Denys Chalder', 'dchalder82@wiley.com', to_date('13-06-1973', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100291, 'Marta Cressar', 'mcressar83@imdb.com', to_date('30-03-1970', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100292, 'Alyson Dradey', 'adradey84@behance.net', to_date('27-11-1948', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100293, 'Robby Giorgielli', 'rgiorgielli85@arizona.edu', to_date('29-12-1972', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100294, 'Roseline Doak', 'rdoak86@unc.edu', to_date('03-10-1957', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100295, 'Naomi Winram', 'nwinram87@who.int', to_date('08-10-1981', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100296, 'Nina de Wilde', 'nde88@free.fr', to_date('16-05-1963', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100297, 'Elysia Triplet', 'etriplet89@eepurl.com', to_date('17-01-1965', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100298, 'Stephen Sedwick', 'ssedwick8a@weather.com', to_date('08-08-1981', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100299, 'Joane Isakovitch', 'jisakovitch8b@unicef.org', to_date('11-10-1956', 'dd-mm-yyyy'), 'Pediatrics');
commit;
prompt 300 records committed...
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100300, 'Angela Leahey', 'aleahey8c@ameblo.jp', to_date('19-04-1988', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100301, 'Fallon Setterington', 'fsetterington8d@flickr.com', to_date('08-06-1962', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100302, 'Vale Raeside', 'vraeside8e@wired.com', to_date('08-12-1961', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100303, 'Floris Crinkley', 'fcrinkley8f@gnu.org', to_date('03-06-1958', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100304, 'Alair Gilderoy', 'agilderoy8g@constantcontact.com', to_date('24-02-1985', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100305, 'Boniface M''Chirrie', 'bmchirrie8h@sbwire.com', to_date('20-01-1960', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100306, 'Ruby Cranney', 'rcranney8i@admin.ch', to_date('30-07-1951', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100307, 'Thibaud Haycock', 'thaycock8j@qq.com', to_date('27-09-1951', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100308, 'Vivyanne Spohrmann', 'vspohrmann8k@clickbank.net', to_date('02-07-1981', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100309, 'Evelin Vasishchev', 'evasishchev8l@edublogs.org', to_date('22-04-1978', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100310, 'Bendix Chittie', 'bchittie8m@stanford.edu', to_date('28-01-1956', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100311, 'Zita McInerney', 'zmcinerney8n@va.gov', to_date('09-04-1985', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100312, 'Duncan Leger', 'dleger8o@cafepress.com', to_date('16-02-1970', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100313, 'Bealle Stock', 'bstock8p@usa.gov', to_date('06-07-1950', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100314, 'Hurleigh Foucar', 'hfoucar8q@flavors.me', to_date('02-04-1974', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100315, 'Julia Crockford', 'jcrockford8r@google.it', to_date('19-05-1971', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100316, 'Boot Bragger', 'bbragger8s@alexa.com', to_date('12-02-1952', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100317, 'Nertie Wigan', 'nwigan8t@fc2.com', to_date('08-08-1954', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100318, 'Rourke Stinson', 'rstinson8u@posterous.com', to_date('13-10-1991', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100319, 'Elvina Flips', 'eflips8v@paginegialle.it', to_date('01-12-1971', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100320, 'Winne Williamson', 'wwilliamson8w@issuu.com', to_date('26-08-1948', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100321, 'Neely Goldspink', 'ngoldspink8x@skype.com', to_date('05-10-1983', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100322, 'Shandra Bibey', 'sbibey8y@addtoany.com', to_date('07-10-1954', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100323, 'Delcina Rucklidge', 'drucklidge8z@jalbum.net', to_date('27-08-1977', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100324, 'Igor Cortese', 'icortese90@cocolog-nifty.com', to_date('16-02-1959', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100325, 'Wilhelmine Deverill', 'wdeverill91@accuweather.com', to_date('07-08-1964', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100326, 'Alexio Spaunton', 'aspaunton92@usnews.com', to_date('02-12-1948', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100327, 'Maighdiln McClinton', 'mmcclinton93@tinyurl.com', to_date('11-07-1952', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100328, 'Matthieu MacDaid', 'mmacdaid94@cdc.gov', to_date('09-03-1984', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100329, 'Violetta Danielsson', 'vdanielsson95@jalbum.net', to_date('25-05-1982', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100330, 'Erastus Jordeson', 'ejordeson96@dion.ne.jp', to_date('22-11-1988', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100331, 'Dennison Sharville', 'dsharville97@marketwatch.com', to_date('16-10-1984', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100332, 'Betsey Cater', 'bcater98@trellian.com', to_date('28-07-1983', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100333, 'Marchall Eidelman', 'meidelman99@dailymail.co.uk', to_date('01-07-1952', 'dd-mm-yyyy'), 'Oncology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100334, 'Thain Atwel', 'tatwel9a@twitter.com', to_date('13-10-1979', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100335, 'Willard Delouch', 'wdelouch9b@amazon.com', to_date('24-11-1964', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100336, 'Claudine Tedman', 'ctedman9c@rakuten.co.jp', to_date('19-11-1954', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100337, 'Yasmeen Fauguel', 'yfauguel9d@theguardian.com', to_date('23-10-1949', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100338, 'Ethel Mangenet', 'emangenet9e@soundcloud.com', to_date('03-07-1975', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100339, 'Charlie Giacomucci', 'cgiacomucci9f@spotify.com', to_date('15-10-1976', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100340, 'Alaster Rosenwald', 'arosenwald9g@slideshare.net', to_date('02-11-1987', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100341, 'Kessiah De Maine', 'kde9h@thetimes.co.uk', to_date('11-08-1980', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100342, 'Lari Heiden', 'lheiden9i@bravesites.com', to_date('19-03-1971', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100343, 'Consalve Whitehair', 'cwhitehair9j@twitter.com', to_date('04-11-1950', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100344, 'Morgan Jurczyk', 'mjurczyk9k@pagesperso-orange.fr', to_date('16-02-1976', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100345, 'Mirabelle Smalles', 'msmalles9l@netscape.com', to_date('19-06-1986', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100346, 'Etti Rait', 'erait9m@linkedin.com', to_date('19-05-1990', 'dd-mm-yyyy'), 'Gastroenterology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100347, 'Carol-jean Fairbrass', 'cfairbrass9n@scribd.com', to_date('01-03-1973', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100348, 'Gibb Titterrell', 'gtitterrell9o@google.ru', to_date('18-10-1949', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100349, 'Sutherland Haxell', 'shaxell9p@photobucket.com', to_date('10-08-1976', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100350, 'Pen Lyst', 'plyst9q@fastcompany.com', to_date('24-05-1968', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100351, 'Loella Lowin', 'llowin9r@1und1.de', to_date('02-12-1981', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100352, 'Niki Sawdy', 'nsawdy9s@dell.com', to_date('06-01-1965', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100353, 'Hortense Keson', 'hkeson9t@de.vu', to_date('21-10-1972', 'dd-mm-yyyy'), 'Neurology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100354, 'Gauthier Shannon', 'gshannon9u@aboutads.info', to_date('09-11-1985', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100355, 'Pauline Keggins', 'pkeggins9v@hao123.com', to_date('21-04-1963', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100356, 'Torry Yitzhakof', 'tyitzhakof9w@oracle.com', to_date('07-02-1950', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100357, 'Brittany McKnish', 'bmcknish9x@bluehost.com', to_date('27-08-1952', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100358, 'Xenos Copins', 'xcopins9y@bloomberg.com', to_date('12-07-1961', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100359, 'Ted Shuttlewood', 'tshuttlewood9z@adobe.com', to_date('17-02-1971', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100360, 'Lib Parish', 'lparisha0@ca.gov', to_date('27-06-1989', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100361, 'Roobbie Agirre', 'ragirrea1@netscape.com', to_date('09-08-1971', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100362, 'Seymour Courtman', 'scourtmana2@time.com', to_date('16-05-1991', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100363, 'Eliza Giovannardi', 'egiovannardia3@europa.eu', to_date('27-01-1993', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100364, 'Eugenius Zannelli', 'ezannellia4@soundcloud.com', to_date('07-06-1976', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100365, 'Sibylla Clurow', 'sclurowa5@google.co.uk', to_date('18-02-1974', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100366, 'Astrid O''Halloran', 'aohallorana6@bloglines.com', to_date('06-06-1953', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100367, 'Lowe Kerss', 'lkerssa7@altervista.org', to_date('15-10-1950', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100368, 'Jillene Mapstone', 'jmapstonea8@istockphoto.com', to_date('02-11-1979', 'dd-mm-yyyy'), 'Gynecology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100369, 'Olly Cammell', 'ocammella9@goodreads.com', to_date('01-12-1956', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100370, 'Jory Cabrera', 'jcabreraaa@imgur.com', to_date('24-05-1994', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100371, 'Michele Guinery', 'mguineryab@columbia.edu', to_date('04-12-1967', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100372, 'Chickie Vanyashkin', 'cvanyashkinac@house.gov', to_date('22-07-1988', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100373, 'Clayborne Trusslove', 'ctrusslovead@nsw.gov.au', to_date('11-05-1974', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100374, 'Rena Pleass', 'rpleassae@quantcast.com', to_date('18-10-1978', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100375, 'Jordon Pilcher', 'jpilcheraf@chicagotribune.com', to_date('28-10-1948', 'dd-mm-yyyy'), 'Nephrology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100376, 'Koren Valiant', 'kvaliantag@joomla.org', to_date('04-09-1965', 'dd-mm-yyyy'), 'Internal Medicine');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100377, 'Alyson Lindup', 'alindupah@friendfeed.com', to_date('14-10-1988', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100378, 'Rafa Fordy', 'rfordyai@berkeley.edu', to_date('07-11-1986', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100379, 'Dannie Hufton', 'dhuftonaj@patch.com', to_date('22-07-1961', 'dd-mm-yyyy'), 'Psychiatry');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100380, 'Antone Clemot', 'aclemotak@myspace.com', to_date('26-03-1986', 'dd-mm-yyyy'), 'Surgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100381, 'Anni Fontaine', 'afontaineal@i2i.jp', to_date('05-06-1962', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100382, 'Arne Albon', 'aalbonam@godaddy.com', to_date('19-01-1983', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100383, 'Rene Malshinger', 'rmalshingeran@liveinternet.ru', to_date('13-02-1964', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100384, 'Romain Beecham', 'rbeechamao@answers.com', to_date('21-01-1993', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100385, 'Lorne Humberstone', 'lhumberstoneap@wired.com', to_date('10-04-1992', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100386, 'Giff Milton-White', 'gmiltonwhiteaq@t.co', to_date('05-07-1981', 'dd-mm-yyyy'), 'Orthopedics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100387, 'Eryn Couldwell', 'ecouldwellar@miitbeian.gov.cn', to_date('07-01-1976', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100388, 'Vickie Devin', 'vdevinas@virginia.edu', to_date('13-10-1964', 'dd-mm-yyyy'), 'Dermatology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100389, 'Francene McLaggan', 'fmclagganat@twitpic.com', to_date('07-07-1972', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100390, 'Everard Tilston', 'etilstonau@kickstarter.com', to_date('12-03-1972', 'dd-mm-yyyy'), 'Pulmonology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100391, 'Sheila Wiskar', 'swiskarav@xrea.com', to_date('10-01-1962', 'dd-mm-yyyy'), 'Cardiology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100392, 'Andra McQuarrie', 'amcquarrieaw@canalblog.com', to_date('08-10-1993', 'dd-mm-yyyy'), 'Endocrinology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100393, 'Laurent Ducker', 'lduckerax@seesaa.net', to_date('23-07-1963', 'dd-mm-yyyy'), 'Ophthalmology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100394, 'Ruthie Challenger', 'rchallengeray@omniture.com', to_date('25-12-1956', 'dd-mm-yyyy'), 'Otorhinolaryngology');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100395, 'Vanni Pay', 'vpayaz@google.com.br', to_date('25-10-1951', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100396, 'Herbert Avramow', 'havramowb0@nature.com', to_date('17-08-1980', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100397, 'Spike Salsberg', 'ssalsbergb1@deviantart.com', to_date('06-02-1970', 'dd-mm-yyyy'), 'Neurosurgery');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100398, 'Quentin Sansun', 'qsansunb2@huffingtonpost.com', to_date('22-10-1953', 'dd-mm-yyyy'), 'Pediatrics');
insert into DOCTORS (doctor_id, name, contact_information, date_of_start_working, specialty)
values (100399, 'Odelia Ingrey', 'oingreyb3@theguardian.com', to_date('04-05-1993', 'dd-mm-yyyy'), 'Oncology');
commit;
prompt 400 records loaded
prompt Loading PATIENTS...
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100000, 'Dall Eldredge', to_date('25-05-2012', 'dd-mm-yyyy'), 'Male', 'deldredge0@youtube.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100001, 'Tuck Bolin', to_date('18-11-1968', 'dd-mm-yyyy'), 'Male', 'tbolin1@reverbnation.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100002, 'Aron Farndell', to_date('27-08-1953', 'dd-mm-yyyy'), 'Female', 'afarndell2@imgur.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100003, 'Denyse Cowton', to_date('24-01-1964', 'dd-mm-yyyy'), 'Male', 'dcowton3@businessweek.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100004, 'Harbert Brammer', to_date('11-04-1956', 'dd-mm-yyyy'), 'Female', 'hbrammer4@ted.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100005, 'Brina Fearnill', to_date('03-12-2016', 'dd-mm-yyyy'), 'Female', 'bfearnill5@goodreads.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100006, 'Juliana Gavan', to_date('21-12-1964', 'dd-mm-yyyy'), 'Female', 'jgavan6@mediafire.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100007, 'Michal Puttnam', to_date('12-07-1957', 'dd-mm-yyyy'), 'Male', 'mputtnam7@mysql.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100008, 'Huntlee Dugall', to_date('16-11-1970', 'dd-mm-yyyy'), 'Male', 'hdugall8@lycos.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100009, 'Ursulina Thompstone', to_date('05-07-1965', 'dd-mm-yyyy'), 'Female', 'uthompstone9@google.it', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100010, 'Addia Atwill', to_date('10-04-2014', 'dd-mm-yyyy'), 'Male', 'aatwilla@nationalgeographic.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100011, 'Lanie Pirot', to_date('18-08-2001', 'dd-mm-yyyy'), 'Female', 'lpirotb@woothemes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100012, 'Teodora Horlock', to_date('25-12-1993', 'dd-mm-yyyy'), 'Female', 'thorlockc@samsung.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100013, 'Hailee Allum', to_date('05-11-2002', 'dd-mm-yyyy'), 'Female', 'hallumd@goo.ne.jp', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100014, 'Catrina Edland', to_date('23-05-1976', 'dd-mm-yyyy'), 'Female', 'cedlande@purevolume.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100015, 'Maurizia O''Beirne', to_date('12-02-1996', 'dd-mm-yyyy'), 'Male', 'mobeirnef@123-reg.co.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100016, 'Augustine Vasiliu', to_date('24-02-2006', 'dd-mm-yyyy'), 'Female', 'avasiliug@hostgator.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100017, 'Sigismond Skilbeck', to_date('24-06-1982', 'dd-mm-yyyy'), 'Female', 'sskilbeckh@istockphoto.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100018, 'Mariquilla Pickworth', to_date('03-01-1986', 'dd-mm-yyyy'), 'Male', 'mpickworthi@microsoft.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100019, 'Chrissie Disman', to_date('02-04-1993', 'dd-mm-yyyy'), 'Female', 'cdismanj@elegantthemes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100020, 'Candie Foxley', to_date('25-12-1980', 'dd-mm-yyyy'), 'Male', 'cfoxleyk@nhs.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100021, 'Meara Gullane', to_date('06-08-1987', 'dd-mm-yyyy'), 'Female', 'mgullanel@mediafire.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100022, 'Lexy Isacke', to_date('05-12-2019', 'dd-mm-yyyy'), 'Male', 'lisackem@adobe.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100023, 'Ellsworth Peyto', to_date('03-10-1989', 'dd-mm-yyyy'), 'Female', 'epeyton@dyndns.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100024, 'Sosanna Bloxam', to_date('08-12-2018', 'dd-mm-yyyy'), 'Male', 'sbloxamo@shareasale.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100025, 'Zebulon Lindemann', to_date('19-01-1954', 'dd-mm-yyyy'), 'Female', 'zlindemannp@cisco.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100026, 'Elle Mager', to_date('07-10-1957', 'dd-mm-yyyy'), 'Female', 'emagerq@symantec.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100027, 'Ami Haskell', to_date('06-08-1968', 'dd-mm-yyyy'), 'Male', 'ahaskellr@elpais.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100028, 'Tabbatha Du Hamel', to_date('04-04-1989', 'dd-mm-yyyy'), 'Female', 'tdus@unc.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100029, 'Saundra Darke', to_date('08-11-2022', 'dd-mm-yyyy'), 'Male', 'sdarket@youku.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100030, 'Teodoro Sapp', to_date('19-06-1981', 'dd-mm-yyyy'), 'Male', 'tsappu@shinystat.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100031, 'Romona Simonson', to_date('16-06-2016', 'dd-mm-yyyy'), 'Male', 'rsimonsonv@arizona.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100032, 'Maggie Esler', to_date('30-05-2018', 'dd-mm-yyyy'), 'Male', 'meslerw@howstuffworks.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100033, 'Carmelle Lewry', to_date('15-07-2001', 'dd-mm-yyyy'), 'Male', 'clewryx@cocolog-nifty.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100034, 'Clare Cannings', to_date('02-05-1958', 'dd-mm-yyyy'), 'Male', 'ccanningsy@cornell.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100035, 'Mildred Shearstone', to_date('13-04-2003', 'dd-mm-yyyy'), 'Male', 'mshearstonez@pcworld.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100036, 'Deena Drury', to_date('29-05-2009', 'dd-mm-yyyy'), 'Female', 'ddrury10@photobucket.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100037, 'Andie Denk', to_date('08-09-1996', 'dd-mm-yyyy'), 'Female', 'adenk11@slate.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100038, 'Gabbi Rexworthy', to_date('21-02-1961', 'dd-mm-yyyy'), 'Male', 'grexworthy12@csmonitor.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100039, 'Livvy Deeves', to_date('27-04-1996', 'dd-mm-yyyy'), 'Male', 'ldeeves13@storify.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100040, 'Donnie Baume', to_date('20-11-2007', 'dd-mm-yyyy'), 'Female', 'dbaume14@dagondesign.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100041, 'Kayle Bolles', to_date('14-09-1973', 'dd-mm-yyyy'), 'Male', 'kbolles15@cargocollective.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100042, 'Shaylyn Aggas', to_date('16-08-1970', 'dd-mm-yyyy'), 'Male', 'saggas16@newyorker.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100043, 'Willette Vaszoly', to_date('21-02-2003', 'dd-mm-yyyy'), 'Female', 'wvaszoly17@bing.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100044, 'Cary Mahoney', to_date('05-10-1973', 'dd-mm-yyyy'), 'Male', 'cmahoney18@usgs.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100045, 'Laney Pringle', to_date('02-03-1999', 'dd-mm-yyyy'), 'Male', 'lpringle19@alibaba.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100046, 'Randi Stickens', to_date('29-06-1995', 'dd-mm-yyyy'), 'Female', 'rstickens1a@ca.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100047, 'Guillema Whelpdale', to_date('14-08-1951', 'dd-mm-yyyy'), 'Female', 'gwhelpdale1b@myspace.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100048, 'Nadia Livingstone', to_date('09-04-1976', 'dd-mm-yyyy'), 'Male', 'nlivingstone1c@google.co.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100049, 'Nathan Siveter', to_date('12-11-1961', 'dd-mm-yyyy'), 'Male', 'nsiveter1d@photobucket.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100050, 'Binnie de Clerq', to_date('23-10-1973', 'dd-mm-yyyy'), 'Female', 'bde1e@live.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100051, 'Clementine Anderson', to_date('05-10-2020', 'dd-mm-yyyy'), 'Female', 'canderson1f@constantcontact.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100052, 'Elbertine Reihill', to_date('27-04-1975', 'dd-mm-yyyy'), 'Female', 'ereihill1g@businesswire.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100053, 'Otis Dawtre', to_date('05-07-1997', 'dd-mm-yyyy'), 'Male', 'odawtre1h@springer.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100054, 'Sheilah Camoys', to_date('09-05-1954', 'dd-mm-yyyy'), 'Female', 'scamoys1i@bing.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100055, 'Alix Molohan', to_date('16-12-2001', 'dd-mm-yyyy'), 'Male', 'amolohan1j@networksolutions.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100056, 'Dodi Simonnet', to_date('18-01-2020', 'dd-mm-yyyy'), 'Male', 'dsimonnet1k@berkeley.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100057, 'Newton Greenroa', to_date('30-10-1968', 'dd-mm-yyyy'), 'Female', 'ngreenroa1l@slashdot.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100058, 'Juliane Abbis', to_date('02-08-2017', 'dd-mm-yyyy'), 'Female', 'jabbis1m@soup.io', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100059, 'Debor Stinchcombe', to_date('29-12-1953', 'dd-mm-yyyy'), 'Male', 'dstinchcombe1n@pbs.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100060, 'Gasper McKee', to_date('15-08-1998', 'dd-mm-yyyy'), 'Female', 'gmckee1o@hostgator.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100061, 'Gan Blow', to_date('09-12-2006', 'dd-mm-yyyy'), 'Male', 'gblow1p@t-online.de', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100062, 'Tallie Francesco', to_date('21-12-1976', 'dd-mm-yyyy'), 'Female', 'tfrancesco1q@macromedia.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100063, 'Illa Creighton', to_date('01-10-1979', 'dd-mm-yyyy'), 'Male', 'icreighton1r@hhs.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100064, 'Millie Matheson', to_date('05-04-1983', 'dd-mm-yyyy'), 'Female', 'mmatheson1s@cdbaby.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100065, 'Elmo Armfield', to_date('28-12-1981', 'dd-mm-yyyy'), 'Male', 'earmfield1t@gizmodo.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100066, 'Lola Pallesen', to_date('05-11-1999', 'dd-mm-yyyy'), 'Male', 'lpallesen1u@cnet.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100067, 'Claudio Rapkins', to_date('07-07-2001', 'dd-mm-yyyy'), 'Male', 'crapkins1v@gnu.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100068, 'Lida Clewes', to_date('17-02-1999', 'dd-mm-yyyy'), 'Male', 'lclewes1w@qq.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100069, 'Cyb Burberry', to_date('20-10-1966', 'dd-mm-yyyy'), 'Female', 'cburberry1x@list-manage.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100070, 'Bay Nixon', to_date('26-11-1968', 'dd-mm-yyyy'), 'Male', 'bnixon1y@blogs.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100071, 'Olimpia Parsisson', to_date('08-05-1988', 'dd-mm-yyyy'), 'Female', 'oparsisson1z@cmu.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100072, 'Amye Edwards', to_date('17-04-2015', 'dd-mm-yyyy'), 'Female', 'aedwards20@npr.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100073, 'Alidia Hartus', to_date('20-05-2013', 'dd-mm-yyyy'), 'Male', 'ahartus21@weebly.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100074, 'Honoria Faughey', to_date('27-05-1970', 'dd-mm-yyyy'), 'Female', 'hfaughey22@naver.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100075, 'Sallee Duggleby', to_date('04-04-1960', 'dd-mm-yyyy'), 'Male', 'sduggleby23@seattletimes.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100076, 'Vitoria O''Driscoll', to_date('04-12-1960', 'dd-mm-yyyy'), 'Male', 'vodriscoll24@sfgate.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100077, 'Lynde Forcade', to_date('31-12-2003', 'dd-mm-yyyy'), 'Male', 'lforcade25@printfriendly.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100078, 'Astra Datte', to_date('01-11-2016', 'dd-mm-yyyy'), 'Male', 'adatte26@histats.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100079, 'Douglas Schout', to_date('11-03-1997', 'dd-mm-yyyy'), 'Male', 'dschout27@dailymail.co.uk', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100080, 'Gibb Lutsch', to_date('19-06-1960', 'dd-mm-yyyy'), 'Female', 'glutsch28@ucla.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100081, 'Oliviero Beveridge', to_date('31-07-1957', 'dd-mm-yyyy'), 'Female', 'obeveridge29@squidoo.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100082, 'Ayn Chinnock', to_date('25-10-1954', 'dd-mm-yyyy'), 'Female', 'achinnock2a@tuttocitta.it', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100083, 'Kizzee Halpen', to_date('02-08-1968', 'dd-mm-yyyy'), 'Male', 'khalpen2b@bbb.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100084, 'Edik Cheevers', to_date('07-11-1979', 'dd-mm-yyyy'), 'Male', 'echeevers2c@multiply.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100085, 'Linus Exley', to_date('18-02-1965', 'dd-mm-yyyy'), 'Male', 'lexley2d@archive.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100086, 'Fairfax Cherry', to_date('03-10-2020', 'dd-mm-yyyy'), 'Male', 'fcherry2e@google.co.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100087, 'Napoleon Sworn', to_date('04-04-1986', 'dd-mm-yyyy'), 'Female', 'nsworn2f@jigsy.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100088, 'Eunice Fowgies', to_date('29-05-1998', 'dd-mm-yyyy'), 'Female', 'efowgies2g@webnode.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100089, 'Sioux Cazin', to_date('26-05-1978', 'dd-mm-yyyy'), 'Female', 'scazin2h@ycombinator.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100090, 'Cora Monketon', to_date('17-04-1962', 'dd-mm-yyyy'), 'Female', 'cmonketon2i@baidu.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100091, 'Prince Leahair', to_date('10-05-1986', 'dd-mm-yyyy'), 'Male', 'pleahair2j@zimbio.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100092, 'Alane Rahill', to_date('12-01-1968', 'dd-mm-yyyy'), 'Female', 'arahill2k@jiathis.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100093, 'Jilleen Inger', to_date('10-09-2005', 'dd-mm-yyyy'), 'Male', 'jinger2l@naver.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100094, 'Kacy Braunes', to_date('17-06-1952', 'dd-mm-yyyy'), 'Male', 'kbraunes2m@flavors.me', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100095, 'Bram Boag', to_date('21-01-1968', 'dd-mm-yyyy'), 'Female', 'bboag2n@chronoengine.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100096, 'Cassi Stickels', to_date('10-07-1953', 'dd-mm-yyyy'), 'Male', 'cstickels2o@ning.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100097, 'Birk Milkeham', to_date('06-06-1948', 'dd-mm-yyyy'), 'Female', 'bmilkeham2p@arstechnica.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100098, 'Lucita Pratton', to_date('09-09-2007', 'dd-mm-yyyy'), 'Female', 'lpratton2q@theglobeandmail.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100099, 'Hally Habbin', to_date('10-10-1964', 'dd-mm-yyyy'), 'Female', 'hhabbin2r@usa.gov', 'Yes');
commit;
prompt 100 records committed...
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100100, 'Harris Sainer', to_date('06-02-1965', 'dd-mm-yyyy'), 'Female', 'hsainer2s@wix.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100101, 'Olympe Theml', to_date('05-12-1986', 'dd-mm-yyyy'), 'Female', 'otheml2t@photobucket.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100102, 'Ashby Di Bernardo', to_date('23-02-1952', 'dd-mm-yyyy'), 'Female', 'adi2u@biblegateway.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100103, 'Violet Weeden', to_date('07-05-1956', 'dd-mm-yyyy'), 'Female', 'vweeden2v@sciencedirect.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100104, 'Ernie Herculeson', to_date('04-12-1987', 'dd-mm-yyyy'), 'Male', 'eherculeson2w@mapy.cz', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100105, 'Karita Fay', to_date('15-11-1962', 'dd-mm-yyyy'), 'Male', 'kfay2x@sogou.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100106, 'Robinet Hovenden', to_date('29-06-1954', 'dd-mm-yyyy'), 'Female', 'rhovenden2y@nature.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100107, 'Nero Code', to_date('05-03-1994', 'dd-mm-yyyy'), 'Female', 'ncode2z@biblegateway.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100108, 'Ileane Sher', to_date('23-05-1961', 'dd-mm-yyyy'), 'Male', 'isher30@fc2.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100109, 'Turner Miell', to_date('01-04-2005', 'dd-mm-yyyy'), 'Male', 'tmiell31@apple.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100110, 'Mechelle Simonich', to_date('30-12-1995', 'dd-mm-yyyy'), 'Female', 'msimonich32@ehow.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100111, 'Pammi Ranner', to_date('18-05-1962', 'dd-mm-yyyy'), 'Male', 'pranner33@washingtonpost.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100112, 'Claudelle Errett', to_date('18-05-1968', 'dd-mm-yyyy'), 'Female', 'cerrett34@wiley.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100113, 'Shanan Mashal', to_date('25-02-1986', 'dd-mm-yyyy'), 'Male', 'smashal35@foxnews.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100114, 'Feodor Schoroder', to_date('29-05-1998', 'dd-mm-yyyy'), 'Male', 'fschoroder36@uol.com.br', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100115, 'Maighdiln Mc Gee', to_date('25-06-1986', 'dd-mm-yyyy'), 'Male', 'mmc37@apple.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100116, 'Purcell Burder', to_date('12-03-2009', 'dd-mm-yyyy'), 'Female', 'pburder38@hhs.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100117, 'Pren Kropp', to_date('14-03-1996', 'dd-mm-yyyy'), 'Male', 'pkropp39@marriott.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100118, 'Alaster Jest', to_date('02-04-1990', 'dd-mm-yyyy'), 'Female', 'ajest3a@dmoz.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100119, 'Annadiana Hyams', to_date('17-04-2012', 'dd-mm-yyyy'), 'Male', 'ahyams3b@senate.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100120, 'Willi Dunmuir', to_date('09-08-2021', 'dd-mm-yyyy'), 'Male', 'wdunmuir3c@wix.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100121, 'Min Kay', to_date('12-04-1976', 'dd-mm-yyyy'), 'Female', 'mkay3d@globo.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100122, 'Wells Grigorini', to_date('28-11-1966', 'dd-mm-yyyy'), 'Male', 'wgrigorini3e@netvibes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100123, 'Haven Ostridge', to_date('29-09-1999', 'dd-mm-yyyy'), 'Female', 'hostridge3f@xinhuanet.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100124, 'Ingunna MacAirt', to_date('12-12-2009', 'dd-mm-yyyy'), 'Female', 'imacairt3g@geocities.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100125, 'Othella Owenson', to_date('20-07-1979', 'dd-mm-yyyy'), 'Female', 'oowenson3h@ftc.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100126, 'Corrie Baldacchino', to_date('29-12-2001', 'dd-mm-yyyy'), 'Male', 'cbaldacchino3i@mozilla.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100127, 'Vachel Prickett', to_date('11-04-2020', 'dd-mm-yyyy'), 'Male', 'vprickett3j@lycos.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100128, 'Odette Leece', to_date('18-03-2006', 'dd-mm-yyyy'), 'Female', 'oleece3k@vinaora.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100129, 'Jess Hynes', to_date('31-07-2011', 'dd-mm-yyyy'), 'Female', 'jhynes3l@woothemes.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100130, 'Pinchas Towsey', to_date('09-01-1973', 'dd-mm-yyyy'), 'Male', 'ptowsey3m@twitpic.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100131, 'Ludvig Millwall', to_date('05-02-2021', 'dd-mm-yyyy'), 'Male', 'lmillwall3n@va.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100132, 'Lane Lyford', to_date('05-01-1993', 'dd-mm-yyyy'), 'Female', 'llyford3o@umn.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100133, 'Tessie Lope', to_date('24-05-1978', 'dd-mm-yyyy'), 'Male', 'tlope3p@umich.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100134, 'Hatti Koppe', to_date('06-01-1971', 'dd-mm-yyyy'), 'Female', 'hkoppe3q@umn.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100135, 'Iorgo Cousins', to_date('26-12-1990', 'dd-mm-yyyy'), 'Female', 'icousins3r@nymag.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100136, 'Carson Hurford', to_date('25-02-2024', 'dd-mm-yyyy'), 'Male', 'churford3s@elpais.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100137, 'Brooks Bytheway', to_date('14-01-1964', 'dd-mm-yyyy'), 'Male', 'bbytheway3t@seattletimes.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100138, 'Cheri Pykerman', to_date('13-10-1955', 'dd-mm-yyyy'), 'Male', 'cpykerman3u@theguardian.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100139, 'Merrill Casiroli', to_date('10-09-1998', 'dd-mm-yyyy'), 'Female', 'mcasiroli3v@soup.io', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100140, 'Hope Greenshields', to_date('26-09-1957', 'dd-mm-yyyy'), 'Male', 'hgreenshields3w@sciencedirect.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100141, 'Sheree Whyborn', to_date('08-06-1955', 'dd-mm-yyyy'), 'Male', 'swhyborn3x@webmd.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100142, 'Hymie Gibbons', to_date('20-08-1989', 'dd-mm-yyyy'), 'Male', 'hgibbons3y@kickstarter.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100143, 'Noell Borne', to_date('19-09-2019', 'dd-mm-yyyy'), 'Female', 'nborne3z@xrea.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100144, 'Farica Lochhead', to_date('31-05-1952', 'dd-mm-yyyy'), 'Female', 'flochhead40@dagondesign.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100145, 'Leonard McIlwreath', to_date('17-12-1950', 'dd-mm-yyyy'), 'Male', 'lmcilwreath41@list-manage.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100146, 'Stefan Chmarny', to_date('11-09-2011', 'dd-mm-yyyy'), 'Male', 'schmarny42@github.io', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100147, 'Siffre Eckly', to_date('04-11-2018', 'dd-mm-yyyy'), 'Male', 'seckly43@yellowpages.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100148, 'Ceil Gouldeby', to_date('15-12-2012', 'dd-mm-yyyy'), 'Male', 'cgouldeby44@youtube.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100149, 'Charleen Blagden', to_date('06-12-2003', 'dd-mm-yyyy'), 'Male', 'cblagden45@washington.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100150, 'Stephanie Fowlie', to_date('18-02-1996', 'dd-mm-yyyy'), 'Male', 'sfowlie46@bloglines.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100151, 'Carmelia Bondar', to_date('01-11-1993', 'dd-mm-yyyy'), 'Male', 'cbondar47@cbslocal.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100152, 'Camel Braferton', to_date('03-02-1990', 'dd-mm-yyyy'), 'Male', 'cbraferton48@nyu.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100153, 'Lem Wallbanks', to_date('07-05-2022', 'dd-mm-yyyy'), 'Female', 'lwallbanks49@freewebs.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100154, 'Isabelle Blain', to_date('30-03-1994', 'dd-mm-yyyy'), 'Female', 'iblain4a@ftc.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100155, 'Jennine Lamke', to_date('11-05-2007', 'dd-mm-yyyy'), 'Male', 'jlamke4b@usgs.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100156, 'Fabiano Edmund', to_date('05-01-2004', 'dd-mm-yyyy'), 'Female', 'fedmund4c@domainmarket.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100157, 'Farrell Pogue', to_date('16-12-1952', 'dd-mm-yyyy'), 'Female', 'fpogue4d@oakley.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100158, 'Obed Kolak', to_date('17-09-1981', 'dd-mm-yyyy'), 'Female', 'okolak4e@nih.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100159, 'Ebonee Dixcey', to_date('01-09-2019', 'dd-mm-yyyy'), 'Female', 'edixcey4f@list-manage.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100160, 'Arabella Wilshire', to_date('21-02-1998', 'dd-mm-yyyy'), 'Female', 'awilshire4g@diigo.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100161, 'Edithe Meadows', to_date('11-01-1960', 'dd-mm-yyyy'), 'Male', 'emeadows4h@macromedia.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100162, 'Gaby Crayker', to_date('17-06-1972', 'dd-mm-yyyy'), 'Female', 'gcrayker4i@myspace.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100163, 'Palmer Lis', to_date('14-09-1990', 'dd-mm-yyyy'), 'Female', 'plis4j@geocities.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100164, 'Vaclav Jewise', to_date('14-04-2015', 'dd-mm-yyyy'), 'Male', 'vjewise4k@discovery.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100165, 'Marieann Goble', to_date('29-12-1998', 'dd-mm-yyyy'), 'Female', 'mgoble4l@yale.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100166, 'Jessamyn Esposita', to_date('29-01-2020', 'dd-mm-yyyy'), 'Male', 'jesposita4m@goo.ne.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100167, 'Jonathon Melross', to_date('24-07-1984', 'dd-mm-yyyy'), 'Female', 'jmelross4n@freewebs.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100168, 'Geno Stopher', to_date('20-03-2012', 'dd-mm-yyyy'), 'Female', 'gstopher4o@last.fm', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100169, 'Rianon Eighteen', to_date('10-10-2010', 'dd-mm-yyyy'), 'Female', 'reighteen4p@hibu.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100170, 'Reynard Cheson', to_date('10-08-1983', 'dd-mm-yyyy'), 'Male', 'rcheson4q@posterous.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100171, 'Glennie Ragsdall', to_date('21-08-2023', 'dd-mm-yyyy'), 'Female', 'gragsdall4r@weibo.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100172, 'Tobey Dower', to_date('03-08-2012', 'dd-mm-yyyy'), 'Female', 'tdower4s@blog.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100173, 'Vita Haggath', to_date('29-01-1977', 'dd-mm-yyyy'), 'Male', 'vhaggath4t@omniture.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100174, 'Jayne Ahren', to_date('07-08-2012', 'dd-mm-yyyy'), 'Male', 'jahren4u@hubpages.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100175, 'Traver Leach', to_date('20-06-1953', 'dd-mm-yyyy'), 'Male', 'tleach4v@si.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100176, 'Eba Nertney', to_date('01-02-1949', 'dd-mm-yyyy'), 'Male', 'enertney4w@paginegialle.it', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100177, 'Ned Housego', to_date('29-11-2011', 'dd-mm-yyyy'), 'Female', 'nhousego4x@springer.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100178, 'Randall Matthiae', to_date('13-12-1960', 'dd-mm-yyyy'), 'Female', 'rmatthiae4y@dailymail.co.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100179, 'Darsey Osmond', to_date('27-01-2003', 'dd-mm-yyyy'), 'Male', 'dosmond4z@economist.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100180, 'Pandora Taylor', to_date('17-10-2022', 'dd-mm-yyyy'), 'Female', 'ptaylor50@epa.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100181, 'Lana Ioannou', to_date('04-11-1983', 'dd-mm-yyyy'), 'Male', 'lioannou51@ihg.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100182, 'Kelsy Cash', to_date('18-10-1979', 'dd-mm-yyyy'), 'Male', 'kcash52@ameblo.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100183, 'Lorry Petrelluzzi', to_date('13-02-1953', 'dd-mm-yyyy'), 'Female', 'lpetrelluzzi53@indiatimes.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100184, 'Crissy Cracknall', to_date('19-12-1972', 'dd-mm-yyyy'), 'Male', 'ccracknall54@amazonaws.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100185, 'Adriane Aaronson', to_date('18-04-1976', 'dd-mm-yyyy'), 'Female', 'aaaronson55@liveinternet.ru', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100186, 'Mick Whitechurch', to_date('02-01-1954', 'dd-mm-yyyy'), 'Male', 'mwhitechurch56@ustream.tv', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100187, 'Trey Horick', to_date('15-11-2022', 'dd-mm-yyyy'), 'Female', 'thorick57@sfgate.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100188, 'Brian Gorton', to_date('26-11-1990', 'dd-mm-yyyy'), 'Male', 'bgorton58@dagondesign.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100189, 'Genovera Ciccottio', to_date('18-10-1997', 'dd-mm-yyyy'), 'Male', 'gciccottio59@photobucket.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100190, 'Darsey MacRannell', to_date('29-04-1996', 'dd-mm-yyyy'), 'Female', 'dmacrannell5a@cpanel.net', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100191, 'Tobi Domnick', to_date('19-04-2009', 'dd-mm-yyyy'), 'Female', 'tdomnick5b@alexa.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100192, 'Valry Varley', to_date('18-01-2002', 'dd-mm-yyyy'), 'Female', 'vvarley5c@springer.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100193, 'Krystalle Pickover', to_date('08-07-1971', 'dd-mm-yyyy'), 'Male', 'kpickover5d@meetup.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100194, 'Sophi Reven', to_date('27-11-1953', 'dd-mm-yyyy'), 'Female', 'sreven5e@uiuc.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100195, 'Allsun Noonan', to_date('03-01-1990', 'dd-mm-yyyy'), 'Female', 'anoonan5f@globo.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100196, 'Terry Esler', to_date('13-07-1964', 'dd-mm-yyyy'), 'Female', 'tesler5g@cisco.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100197, 'Georgianna Hadenton', to_date('18-07-2012', 'dd-mm-yyyy'), 'Male', 'ghadenton5h@timesonline.co.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100198, 'Baryram Gallaway', to_date('25-08-1988', 'dd-mm-yyyy'), 'Female', 'bgallaway5i@wiley.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100199, 'Dilly McVeigh', to_date('20-12-2012', 'dd-mm-yyyy'), 'Female', 'dmcveigh5j@dedecms.com', 'Yes');
commit;
prompt 200 records committed...
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100200, 'Melony Woolen', to_date('17-04-2016', 'dd-mm-yyyy'), 'Male', 'mwoolen5k@meetup.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100201, 'Gardiner Lief', to_date('23-08-1996', 'dd-mm-yyyy'), 'Male', 'glief5l@webs.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100202, 'Chevalier Malins', to_date('01-05-1952', 'dd-mm-yyyy'), 'Female', 'cmalins5m@wikipedia.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100203, 'Morna Trippitt', to_date('28-03-2003', 'dd-mm-yyyy'), 'Male', 'mtrippitt5n@github.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100204, 'Cyrus Polden', to_date('15-12-1954', 'dd-mm-yyyy'), 'Female', 'cpolden5o@mozilla.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100205, 'Caressa Westmoreland', to_date('13-09-1981', 'dd-mm-yyyy'), 'Male', 'cwestmoreland5p@kickstarter.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100206, 'Tamarah Penkman', to_date('09-10-1998', 'dd-mm-yyyy'), 'Male', 'tpenkman5q@mozilla.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100207, 'Heloise Oolahan', to_date('15-06-2012', 'dd-mm-yyyy'), 'Female', 'hoolahan5r@vk.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100208, 'Meredeth Whaymand', to_date('24-03-2004', 'dd-mm-yyyy'), 'Male', 'mwhaymand5s@amazon.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100209, 'Carver Teaz', to_date('02-02-2017', 'dd-mm-yyyy'), 'Female', 'cteaz5t@shutterfly.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100210, 'Codee Batisse', to_date('26-05-2020', 'dd-mm-yyyy'), 'Female', 'cbatisse5u@latimes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100211, 'Amelie Dovermann', to_date('22-07-1979', 'dd-mm-yyyy'), 'Male', 'adovermann5v@mapquest.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100212, 'Tabbatha Antoniou', to_date('10-09-1998', 'dd-mm-yyyy'), 'Female', 'tantoniou5w@wired.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100213, 'Breena Eingerfield', to_date('28-07-2023', 'dd-mm-yyyy'), 'Male', 'beingerfield5x@posterous.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100214, 'Cris Brumbye', to_date('24-09-2008', 'dd-mm-yyyy'), 'Male', 'cbrumbye5y@tumblr.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100215, 'Cal Ridulfo', to_date('27-08-1984', 'dd-mm-yyyy'), 'Female', 'cridulfo5z@mozilla.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100216, 'Eberhard Reignard', to_date('13-11-1989', 'dd-mm-yyyy'), 'Female', 'ereignard60@slashdot.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100217, 'Milly Pardie', to_date('22-03-2018', 'dd-mm-yyyy'), 'Male', 'mpardie61@4shared.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100218, 'Glendon Dorr', to_date('06-07-1955', 'dd-mm-yyyy'), 'Female', 'gdorr62@google.com.br', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100219, 'Page Seiler', to_date('30-04-2006', 'dd-mm-yyyy'), 'Male', 'pseiler63@gizmodo.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100220, 'Nelie Moyler', to_date('18-08-1963', 'dd-mm-yyyy'), 'Male', 'nmoyler64@naver.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100221, 'Oliver Brecknall', to_date('27-11-1993', 'dd-mm-yyyy'), 'Male', 'obrecknall65@tamu.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100222, 'Domenic Clogg', to_date('08-06-1951', 'dd-mm-yyyy'), 'Female', 'dclogg66@whitehouse.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100223, 'Jodi Mumby', to_date('18-05-2018', 'dd-mm-yyyy'), 'Female', 'jmumby67@sciencedirect.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100224, 'Ashton Rheubottom', to_date('21-08-1969', 'dd-mm-yyyy'), 'Female', 'arheubottom68@unblog.fr', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100225, 'Gisele Ditchburn', to_date('14-11-1981', 'dd-mm-yyyy'), 'Male', 'gditchburn69@springer.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100226, 'Casandra Ong', to_date('11-03-1996', 'dd-mm-yyyy'), 'Male', 'cong6a@jimdo.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100227, 'Devora Gherardini', to_date('06-04-1997', 'dd-mm-yyyy'), 'Female', 'dgherardini6b@foxnews.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100228, 'Winni Carlin', to_date('20-09-1976', 'dd-mm-yyyy'), 'Female', 'wcarlin6c@google.pl', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100229, 'Gayelord Dahlgren', to_date('26-06-1973', 'dd-mm-yyyy'), 'Male', 'gdahlgren6d@guardian.co.uk', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100230, 'Wylie Sollon', to_date('21-05-1965', 'dd-mm-yyyy'), 'Male', 'wsollon6e@imageshack.us', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100231, 'Celle McTurk', to_date('18-03-2013', 'dd-mm-yyyy'), 'Male', 'cmcturk6f@apple.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100232, 'Jessa Krook', to_date('25-04-1985', 'dd-mm-yyyy'), 'Male', 'jkrook6g@cisco.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100233, 'Patricia Aguirrezabala', to_date('21-05-2020', 'dd-mm-yyyy'), 'Male', 'paguirrezabala6h@51.la', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100234, 'Marris Seally', to_date('23-05-2003', 'dd-mm-yyyy'), 'Female', 'mseally6i@nationalgeographic.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100235, 'Kariotta Molen', to_date('26-09-1965', 'dd-mm-yyyy'), 'Male', 'kmolen6j@reference.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100236, 'Bondie Macia', to_date('06-06-1978', 'dd-mm-yyyy'), 'Male', 'bmacia6k@squarespace.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100237, 'Camala ducarme', to_date('05-06-1977', 'dd-mm-yyyy'), 'Male', 'cducarme6l@ibm.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100238, 'Lanita Mingardi', to_date('12-06-1955', 'dd-mm-yyyy'), 'Female', 'lmingardi6m@disqus.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100239, 'Reggie Kalb', to_date('03-01-2012', 'dd-mm-yyyy'), 'Female', 'rkalb6n@woothemes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100240, 'Jon Borrill', to_date('28-06-1972', 'dd-mm-yyyy'), 'Male', 'jborrill6o@statcounter.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100241, 'Eduardo La Vigne', to_date('28-06-2020', 'dd-mm-yyyy'), 'Male', 'ela6p@barnesandnoble.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100242, 'Clint Laborda', to_date('17-06-1948', 'dd-mm-yyyy'), 'Female', 'claborda6q@cafepress.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100243, 'Carr Queenborough', to_date('09-05-2024', 'dd-mm-yyyy'), 'Male', 'cqueenborough6r@mayoclinic.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100244, 'Lurette Crumley', to_date('30-12-1963', 'dd-mm-yyyy'), 'Male', 'lcrumley6s@stanford.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100245, 'Nicoline Nys', to_date('28-07-1979', 'dd-mm-yyyy'), 'Male', 'nnys6t@umich.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100246, 'Bea Fleay', to_date('20-07-1984', 'dd-mm-yyyy'), 'Male', 'bfleay6u@gov.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100247, 'Gusti Rockwell', to_date('20-03-1964', 'dd-mm-yyyy'), 'Female', 'grockwell6v@msn.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100248, 'Perice Hewkin', to_date('19-11-1958', 'dd-mm-yyyy'), 'Female', 'phewkin6w@pen.io', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100249, 'Thedrick Faughny', to_date('28-11-1977', 'dd-mm-yyyy'), 'Male', 'tfaughny6x@elpais.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100250, 'Alejandra Granham', to_date('22-09-2007', 'dd-mm-yyyy'), 'Female', 'agranham6y@creativecommons.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100251, 'Netta Ludee', to_date('16-03-1949', 'dd-mm-yyyy'), 'Male', 'nludee6z@twitter.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100252, 'Neville Fiddler', to_date('17-10-1949', 'dd-mm-yyyy'), 'Female', 'nfiddler70@gnu.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100253, 'Amity Keable', to_date('26-03-1952', 'dd-mm-yyyy'), 'Female', 'akeable71@elpais.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100254, 'Elisabeth Elkin', to_date('04-12-1957', 'dd-mm-yyyy'), 'Female', 'eelkin72@nba.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100255, 'Romonda Fitzhenry', to_date('22-05-1989', 'dd-mm-yyyy'), 'Male', 'rfitzhenry73@answers.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100256, 'Nickolas Becken', to_date('10-01-2013', 'dd-mm-yyyy'), 'Male', 'nbecken74@macromedia.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100257, 'Mildred Hellwing', to_date('07-09-1993', 'dd-mm-yyyy'), 'Female', 'mhellwing75@netvibes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100258, 'Cassondra Strathe', to_date('25-06-1960', 'dd-mm-yyyy'), 'Female', 'cstrathe76@fastcompany.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100259, 'Royce Roggeman', to_date('29-12-1969', 'dd-mm-yyyy'), 'Male', 'rroggeman77@epa.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100260, 'Tally Cattell', to_date('25-09-1981', 'dd-mm-yyyy'), 'Male', 'tcattell78@simplemachines.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100261, 'Marlin Dorbin', to_date('18-03-2013', 'dd-mm-yyyy'), 'Female', 'mdorbin79@alexa.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100262, 'Paton Milby', to_date('15-12-1965', 'dd-mm-yyyy'), 'Female', 'pmilby7a@skyrock.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100263, 'Reynolds Kerby', to_date('09-10-1982', 'dd-mm-yyyy'), 'Male', 'rkerby7b@techcrunch.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100264, 'Hiram Smales', to_date('28-03-1991', 'dd-mm-yyyy'), 'Male', 'hsmales7c@shinystat.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100265, 'Rachael Hessenthaler', to_date('19-07-2014', 'dd-mm-yyyy'), 'Male', 'rhessenthaler7d@guardian.co.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100266, 'Frederica Ganforth', to_date('21-03-1978', 'dd-mm-yyyy'), 'Female', 'fganforth7e@cbslocal.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100267, 'Lise Shuttell', to_date('27-06-2023', 'dd-mm-yyyy'), 'Female', 'lshuttell7f@1und1.de', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100268, 'Alvina Straun', to_date('02-01-1986', 'dd-mm-yyyy'), 'Male', 'astraun7g@cargocollective.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100269, 'Orrin Bloxland', to_date('30-06-1998', 'dd-mm-yyyy'), 'Male', 'obloxland7h@wikipedia.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100270, 'Wakefield Musicka', to_date('12-11-1999', 'dd-mm-yyyy'), 'Female', 'wmusicka7i@joomla.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100271, 'Ivan Tookill', to_date('09-07-1963', 'dd-mm-yyyy'), 'Male', 'itookill7j@chicagotribune.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100272, 'Nickey Ewdale', to_date('21-05-1991', 'dd-mm-yyyy'), 'Female', 'newdale7k@vimeo.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100273, 'Doll Lippett', to_date('12-07-1979', 'dd-mm-yyyy'), 'Male', 'dlippett7l@newyorker.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100274, 'Junette Pilger', to_date('06-05-1960', 'dd-mm-yyyy'), 'Female', 'jpilger7m@canalblog.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100275, 'Rochelle Gerdts', to_date('08-09-2014', 'dd-mm-yyyy'), 'Male', 'rgerdts7n@51.la', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100276, 'Rose Alexandersson', to_date('08-09-1961', 'dd-mm-yyyy'), 'Female', 'ralexandersson7o@lulu.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100277, 'Malina Littlefield', to_date('01-12-2014', 'dd-mm-yyyy'), 'Male', 'mlittlefield7p@tiny.cc', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100278, 'Muffin Macer', to_date('02-04-1966', 'dd-mm-yyyy'), 'Male', 'mmacer7q@canalblog.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100279, 'Juliette Portman', to_date('27-04-1990', 'dd-mm-yyyy'), 'Female', 'jportman7r@artisteer.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100280, 'Denise Blamires', to_date('22-10-1983', 'dd-mm-yyyy'), 'Male', 'dblamires7s@spotify.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100281, 'Devonne Claiton', to_date('17-05-1968', 'dd-mm-yyyy'), 'Male', 'dclaiton7t@weebly.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100282, 'Elias Treves', to_date('25-07-2006', 'dd-mm-yyyy'), 'Female', 'etreves7u@sfgate.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100283, 'Clarey Binyon', to_date('10-06-1966', 'dd-mm-yyyy'), 'Male', 'cbinyon7v@flickr.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100284, 'Cass Eddisforth', to_date('24-09-1956', 'dd-mm-yyyy'), 'Female', 'ceddisforth7w@over-blog.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100285, 'Romy Van der Baaren', to_date('09-10-1983', 'dd-mm-yyyy'), 'Female', 'rvan7x@dot.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100286, 'Auroora Leacy', to_date('18-05-2022', 'dd-mm-yyyy'), 'Female', 'aleacy7y@sitemeter.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100287, 'Celinka Kubista', to_date('10-03-1974', 'dd-mm-yyyy'), 'Male', 'ckubista7z@about.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100288, 'Allene Give', to_date('20-03-2007', 'dd-mm-yyyy'), 'Female', 'agive80@about.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100289, 'Rollo Stannard', to_date('01-04-2011', 'dd-mm-yyyy'), 'Female', 'rstannard81@trellian.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100290, 'Rosalynd Shewry', to_date('24-10-1956', 'dd-mm-yyyy'), 'Male', 'rshewry82@clickbank.net', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100291, 'Darren Fears', to_date('12-03-1997', 'dd-mm-yyyy'), 'Female', 'dfears83@omniture.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100292, 'Stearn Snary', to_date('20-01-1975', 'dd-mm-yyyy'), 'Male', 'ssnary84@jugem.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100293, 'Gwendolyn Shout', to_date('17-09-1985', 'dd-mm-yyyy'), 'Male', 'gshout85@typepad.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100294, 'Had Lyons', to_date('23-08-2020', 'dd-mm-yyyy'), 'Female', 'hlyons86@csmonitor.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100295, 'Meridith Seak', to_date('10-08-1993', 'dd-mm-yyyy'), 'Female', 'mseak87@illinois.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100296, 'Rickie Joselovitch', to_date('24-02-1987', 'dd-mm-yyyy'), 'Female', 'rjoselovitch88@wordpress.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100297, 'Thayne Lelande', to_date('09-06-1948', 'dd-mm-yyyy'), 'Female', 'tlelande89@va.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100298, 'Pyotr Aries', to_date('02-10-1997', 'dd-mm-yyyy'), 'Female', 'paries8a@themeforest.net', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100299, 'Marv Mindenhall', to_date('14-05-1991', 'dd-mm-yyyy'), 'Male', 'mmindenhall8b@mac.com', 'No');
commit;
prompt 300 records committed...
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100300, 'Kayley Laurencot', to_date('30-07-1974', 'dd-mm-yyyy'), 'Male', 'klaurencot8c@discovery.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100301, 'Marcille Mueller', to_date('31-12-2000', 'dd-mm-yyyy'), 'Male', 'mmueller8d@geocities.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100302, 'Malena Lideard', to_date('05-03-1975', 'dd-mm-yyyy'), 'Male', 'mlideard8e@indiatimes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100303, 'Faulkner Coram', to_date('12-02-1956', 'dd-mm-yyyy'), 'Female', 'fcoram8f@twitpic.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100304, 'Erda Fabbri', to_date('09-06-1980', 'dd-mm-yyyy'), 'Male', 'efabbri8g@jiathis.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100305, 'Constancia Malek', to_date('13-10-1953', 'dd-mm-yyyy'), 'Male', 'cmalek8h@cbslocal.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100306, 'Filberte Mahmood', to_date('11-06-1987', 'dd-mm-yyyy'), 'Male', 'fmahmood8i@amazon.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100307, 'Annamarie Maciunas', to_date('24-06-1970', 'dd-mm-yyyy'), 'Male', 'amaciunas8j@opera.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100308, 'Gunilla Tonner', to_date('25-04-2018', 'dd-mm-yyyy'), 'Female', 'gtonner8k@reference.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100309, 'Abner Simonds', to_date('16-08-2018', 'dd-mm-yyyy'), 'Male', 'asimonds8l@businesswire.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100310, 'Carrol Pond', to_date('28-05-2004', 'dd-mm-yyyy'), 'Female', 'cpond8m@issuu.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100311, 'Hurleigh Cottham', to_date('04-06-2001', 'dd-mm-yyyy'), 'Female', 'hcottham8n@uol.com.br', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100312, 'Arlene Bunson', to_date('09-05-1967', 'dd-mm-yyyy'), 'Male', 'abunson8o@nydailynews.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100313, 'Melissa Welds', to_date('22-08-1983', 'dd-mm-yyyy'), 'Female', 'mwelds8p@nsw.gov.au', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100314, 'Maura Bosley', to_date('24-04-1950', 'dd-mm-yyyy'), 'Male', 'mbosley8q@foxnews.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100315, 'Berget MacLachlan', to_date('30-06-1991', 'dd-mm-yyyy'), 'Female', 'bmaclachlan8r@sakura.ne.jp', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100316, 'Berty Birchwood', to_date('30-11-1965', 'dd-mm-yyyy'), 'Female', 'bbirchwood8s@sourceforge.net', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100317, 'Linn Ensten', to_date('08-01-2021', 'dd-mm-yyyy'), 'Male', 'lensten8t@theatlantic.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100318, 'Laurens Poundsford', to_date('10-04-2012', 'dd-mm-yyyy'), 'Female', 'lpoundsford8u@msu.edu', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100319, 'Chiarra Laxon', to_date('06-10-1997', 'dd-mm-yyyy'), 'Male', 'claxon8v@alibaba.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100320, 'Peirce Pietsma', to_date('29-11-1971', 'dd-mm-yyyy'), 'Female', 'ppietsma8w@yelp.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100321, 'Petronille Skirven', to_date('22-03-1962', 'dd-mm-yyyy'), 'Female', 'pskirven8x@sfgate.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100322, 'Griz Overpool', to_date('15-08-2010', 'dd-mm-yyyy'), 'Male', 'goverpool8y@deliciousdays.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100323, 'Natala Dumbleton', to_date('27-12-1957', 'dd-mm-yyyy'), 'Male', 'ndumbleton8z@ask.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100324, 'Rory Cahn', to_date('15-05-1998', 'dd-mm-yyyy'), 'Male', 'rcahn90@examiner.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100325, 'Artemas Moseby', to_date('18-02-1991', 'dd-mm-yyyy'), 'Female', 'amoseby91@meetup.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100326, 'Nat Ibbotson', to_date('01-04-1971', 'dd-mm-yyyy'), 'Male', 'nibbotson92@blinklist.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100327, 'Portia Izachik', to_date('27-04-1985', 'dd-mm-yyyy'), 'Male', 'pizachik93@canalblog.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100328, 'Donnie Sysland', to_date('03-12-1954', 'dd-mm-yyyy'), 'Male', 'dsysland94@creativecommons.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100329, 'Kristy Harkess', to_date('12-08-1950', 'dd-mm-yyyy'), 'Female', 'kharkess95@pinterest.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100330, 'Kingsly Koschke', to_date('28-01-1964', 'dd-mm-yyyy'), 'Female', 'kkoschke96@storify.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100331, 'Sholom Yerbury', to_date('07-05-1965', 'dd-mm-yyyy'), 'Female', 'syerbury97@sun.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100332, 'Imelda Bawle', to_date('08-07-1980', 'dd-mm-yyyy'), 'Male', 'ibawle98@pen.io', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100333, 'Perren Clappson', to_date('24-06-2001', 'dd-mm-yyyy'), 'Female', 'pclappson99@slideshare.net', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100334, 'Rici Briars', to_date('08-06-1979', 'dd-mm-yyyy'), 'Female', 'rbriars9a@npr.org', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100335, 'Alexia Cammacke', to_date('15-01-2009', 'dd-mm-yyyy'), 'Male', 'acammacke9b@google.ru', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100336, 'Jennie Leete', to_date('12-02-1963', 'dd-mm-yyyy'), 'Male', 'jleete9c@microsoft.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100337, 'Genia Mulqueen', to_date('14-06-2016', 'dd-mm-yyyy'), 'Male', 'gmulqueen9d@nsw.gov.au', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100338, 'Ozzy Fairbairn', to_date('16-01-2024', 'dd-mm-yyyy'), 'Male', 'ofairbairn9e@scribd.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100339, 'Ceciley Cargen', to_date('10-08-1986', 'dd-mm-yyyy'), 'Female', 'ccargen9f@indiatimes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100340, 'Glendon Ambridge', to_date('04-03-1974', 'dd-mm-yyyy'), 'Male', 'gambridge9g@ft.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100341, 'Baily Ivanchov', to_date('21-05-1983', 'dd-mm-yyyy'), 'Male', 'bivanchov9h@state.tx.us', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100342, 'Elisa Keer', to_date('18-02-1994', 'dd-mm-yyyy'), 'Female', 'ekeer9i@bbb.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100343, 'Bel Neild', to_date('01-11-1993', 'dd-mm-yyyy'), 'Female', 'bneild9j@php.net', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100344, 'Morissa Branch', to_date('22-09-1968', 'dd-mm-yyyy'), 'Male', 'mbranch9k@dagondesign.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100345, 'Mei Sondland', to_date('18-02-1963', 'dd-mm-yyyy'), 'Female', 'msondland9l@163.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100346, 'Walther Lyosik', to_date('31-07-1951', 'dd-mm-yyyy'), 'Female', 'wlyosik9m@ca.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100347, 'Richart Hallows', to_date('14-07-1959', 'dd-mm-yyyy'), 'Female', 'rhallows9n@ask.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100348, 'Gaylord Klimpt', to_date('22-03-1966', 'dd-mm-yyyy'), 'Female', 'gklimpt9o@gnu.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100349, 'Fanchette Marusyak', to_date('16-11-1997', 'dd-mm-yyyy'), 'Male', 'fmarusyak9p@parallels.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100350, 'Kimmy Dimitrie', to_date('27-01-1988', 'dd-mm-yyyy'), 'Female', 'kdimitrie9q@google.fr', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100351, 'Doralynne Mawson', to_date('18-02-2002', 'dd-mm-yyyy'), 'Male', 'dmawson9r@hhs.gov', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100352, 'Lorenza Mellows', to_date('26-07-1997', 'dd-mm-yyyy'), 'Female', 'lmellows9s@youtu.be', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100353, 'Jeannette Tivenan', to_date('16-10-2008', 'dd-mm-yyyy'), 'Male', 'jtivenan9t@paginegialle.it', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100354, 'Kizzie Mohamed', to_date('19-11-1989', 'dd-mm-yyyy'), 'Male', 'kmohamed9u@nhs.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100355, 'Joleen Rexworthy', to_date('16-08-2014', 'dd-mm-yyyy'), 'Female', 'jrexworthy9v@usgs.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100356, 'Inga Lye', to_date('22-04-1975', 'dd-mm-yyyy'), 'Male', 'ilye9w@amazon.co.jp', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100357, 'Dari Ormistone', to_date('28-01-1974', 'dd-mm-yyyy'), 'Female', 'dormistone9x@hostgator.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100358, 'Windy Twelftree', to_date('03-09-1972', 'dd-mm-yyyy'), 'Male', 'wtwelftree9y@independent.co.uk', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100359, 'Karen Allsupp', to_date('30-08-1987', 'dd-mm-yyyy'), 'Male', 'kallsupp9z@twitter.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100360, 'Junette Ellicombe', to_date('25-02-1991', 'dd-mm-yyyy'), 'Male', 'jellicombea0@hp.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100361, 'Eugene Bullent', to_date('04-04-2022', 'dd-mm-yyyy'), 'Male', 'ebullenta1@netvibes.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100362, 'Cesya Crate', to_date('10-03-1996', 'dd-mm-yyyy'), 'Female', 'ccratea2@bandcamp.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100363, 'Gwenora Sandeman', to_date('12-09-1983', 'dd-mm-yyyy'), 'Male', 'gsandemana3@noaa.gov', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100364, 'Madelin Longmuir', to_date('15-03-1987', 'dd-mm-yyyy'), 'Female', 'mlongmuira4@ning.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100365, 'Yolanthe Pollard', to_date('20-11-2010', 'dd-mm-yyyy'), 'Male', 'ypollarda5@nydailynews.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100366, 'Sibylla Keinrat', to_date('25-08-1954', 'dd-mm-yyyy'), 'Female', 'skeinrata6@paypal.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100367, 'Felipa Flaherty', to_date('16-01-1984', 'dd-mm-yyyy'), 'Female', 'fflahertya7@yellowpages.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100368, 'Nicolette Greasty', to_date('26-12-2019', 'dd-mm-yyyy'), 'Male', 'ngreastya8@flavors.me', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100369, 'Hinda Syms', to_date('16-04-1958', 'dd-mm-yyyy'), 'Male', 'hsymsa9@sun.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100370, 'Tiebold Rimell', to_date('27-08-2015', 'dd-mm-yyyy'), 'Female', 'trimellaa@stumbleupon.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100371, 'Jennine Turley', to_date('06-04-2024', 'dd-mm-yyyy'), 'Female', 'jturleyab@ebay.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100372, 'Georgie Simcoe', to_date('05-11-1974', 'dd-mm-yyyy'), 'Female', 'gsimcoeac@abc.net.au', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100373, 'Mellicent Mayne', to_date('19-08-2003', 'dd-mm-yyyy'), 'Male', 'mmaynead@engadget.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100374, 'Claudio Roblin', to_date('03-07-1968', 'dd-mm-yyyy'), 'Male', 'croblinae@wikia.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100375, 'Pebrook Fenlon', to_date('11-12-1972', 'dd-mm-yyyy'), 'Male', 'pfenlonaf@umich.edu', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100376, 'Emlyn Benezeit', to_date('19-03-2015', 'dd-mm-yyyy'), 'Male', 'ebenezeitag@example.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100377, 'Vickie Jobbing', to_date('28-11-1978', 'dd-mm-yyyy'), 'Female', 'vjobbingah@mozilla.org', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100378, 'Lincoln Tufts', to_date('22-11-1972', 'dd-mm-yyyy'), 'Male', 'ltuftsai@japanpost.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100379, 'Darsey Baldry', to_date('21-11-2019', 'dd-mm-yyyy'), 'Female', 'dbaldryaj@twitpic.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100380, 'Farra Boays', to_date('03-12-1995', 'dd-mm-yyyy'), 'Female', 'fboaysak@amazon.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100381, 'Lisette Heggman', to_date('21-05-1989', 'dd-mm-yyyy'), 'Male', 'lheggmanal@sitemeter.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100382, 'Rubin Jahnel', to_date('23-12-1998', 'dd-mm-yyyy'), 'Female', 'rjahnelam@merriam-webster.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100383, 'Uta Ruppele', to_date('26-06-1970', 'dd-mm-yyyy'), 'Male', 'uruppelean@google.ca', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100384, 'Rowena O''Scollee', to_date('18-12-2014', 'dd-mm-yyyy'), 'Male', 'roscolleeao@jugem.jp', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100385, 'Timmy Madge', to_date('23-02-2010', 'dd-mm-yyyy'), 'Male', 'tmadgeap@cafepress.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100386, 'Ruthanne Wrankmore', to_date('12-06-1961', 'dd-mm-yyyy'), 'Female', 'rwrankmoreaq@netvibes.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100387, 'Minne Joynes', to_date('03-12-2010', 'dd-mm-yyyy'), 'Male', 'mjoynesar@goo.ne.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100388, 'Keri Pascow', to_date('11-12-1975', 'dd-mm-yyyy'), 'Male', 'kpascowas@earthlink.net', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100389, 'Annelise Forster', to_date('09-09-1995', 'dd-mm-yyyy'), 'Male', 'aforsterat@walmart.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100390, 'Milka Pinch', to_date('27-12-1988', 'dd-mm-yyyy'), 'Female', 'mpinchau@hugedomains.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100391, 'Josh Laden', to_date('20-10-2012', 'dd-mm-yyyy'), 'Female', 'jladenav@fotki.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100392, 'Rozelle Nazaret', to_date('19-08-1969', 'dd-mm-yyyy'), 'Male', 'rnazaretaw@friendfeed.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100393, 'Christyna Fidge', to_date('15-07-1958', 'dd-mm-yyyy'), 'Female', 'cfidgeax@exblog.jp', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100394, 'Darren Dominici', to_date('06-06-1966', 'dd-mm-yyyy'), 'Female', 'ddominiciay@amazon.co.uk', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100395, 'Karel Dosedale', to_date('11-09-1968', 'dd-mm-yyyy'), 'Male', 'kdosedaleaz@shutterfly.com', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100396, 'Jim Huffa', to_date('18-06-1961', 'dd-mm-yyyy'), 'Male', 'jhuffab0@cam.ac.uk', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100397, 'Kissiah Honsch', to_date('21-04-1988', 'dd-mm-yyyy'), 'Female', 'khonschb1@cpanel.net', 'No');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100398, 'Olav Sahnow', to_date('21-03-1986', 'dd-mm-yyyy'), 'Female', 'osahnowb2@apple.com', 'Yes');
insert into PATIENTS (patient_id, name, date_of_birth, gender, contact_information, insurance)
values (100399, 'Madeleine Proudlock', to_date('29-10-1976', 'dd-mm-yyyy'), 'Female', 'mproudlockb3@1688.com', 'Yes');
commit;
prompt 400 records loaded
prompt Loading APPOINTMENT...
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100001, to_date('30-10-2008', 'dd-mm-yyyy'), 'uEMjQLbtDpOnMTDhGCpXObvSdDnQiAkaOeixVNdJaApxGFLavA', 100310, 100334);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100002, to_date('24-06-1981', 'dd-mm-yyyy'), 'lYlgBFDLUGjKWDAvYxMItUtZLtmAcPRTjjrfsefUOTFBWNxHeh', 100362, 100286);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100003, to_date('22-12-1994', 'dd-mm-yyyy'), 'NUDJEaklpYodnBOePPdYwbcFSxMLCGLnPCBLKLlzKZGeQCWzAn', 100299, 100175);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100004, to_date('31-05-2023', 'dd-mm-yyyy'), 'xSBSJqCuUPAEHTzWhKCNgQSyZbyyuMrUwjyhaPTBJGpItGfSmG', 100335, 100174);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100005, to_date('12-07-2015', 'dd-mm-yyyy'), 'AVGwNxpomuHAhITpQInGgEgWLIimmprKEMOPllPbrcBkNiaTdY', 100128, 100376);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100006, to_date('11-10-2020', 'dd-mm-yyyy'), 'qIfMBJXljVFRUQThURWBVDUiaNKFcVYmtvyFZhsIEQXINddZVo', 100112, 100277);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100007, to_date('12-02-1986', 'dd-mm-yyyy'), 'BdTTXHtikLkvUDbqLjtmrjEYxFNuzkiHcUWHyNmeOSxDudfcuU', 100135, 100050);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100008, to_date('03-07-2008', 'dd-mm-yyyy'), 'GUozoSIlPmUlaxbPoJgdItFdHuBKEwompWNatXFAwBxjMVCxRS', 100196, 100372);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100009, to_date('22-10-1972', 'dd-mm-yyyy'), 'tTeYqFPhzegnbwWbEdMFavwZwwQecgUudGECuItNKXHoFPvism', 100104, 100095);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100010, to_date('10-12-1998', 'dd-mm-yyyy'), 'cXjkoQtdsLxxDPVhtKsJIjsyclrNlXzpOmeCIjoUykcJjqUXrF', 100243, 100139);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100011, to_date('02-08-1973', 'dd-mm-yyyy'), 'xNjWbvYupmOPowcfOTIRRqZzcToIFNdAlEwCoJuExEFzvlcPIP', 100237, 100244);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100012, to_date('10-04-2011', 'dd-mm-yyyy'), 'LKFfLngItckrwDhIndkDEdDdCNuhuxbWnbpQVUXClTybZcPXXw', 100376, 100324);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100013, to_date('03-07-2000', 'dd-mm-yyyy'), 'GaFWjKvWJiGYNbvgDzviQSyPGLnTqIlXIqVZadvVxWmixpsxqS', 100384, 100126);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100014, to_date('27-05-1994', 'dd-mm-yyyy'), 'piDKvPYfFNXQoAtMXnpEhExCTPlvgkAIuuiRHrTwmGKuNcXGRl', 100179, 100344);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100015, to_date('17-06-1988', 'dd-mm-yyyy'), 'KtJFQozKfNUfUQCUhspIIPsQnLqzdQyegqvchDzOQwPDMnYgOR', 100234, 100097);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100016, to_date('05-10-1982', 'dd-mm-yyyy'), 'UIRPFJPHoCEZgSuTFtMhtgkOmYaNtEhIdYnjgSgatswKZDFPaS', 100240, 100122);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100017, to_date('07-02-2004', 'dd-mm-yyyy'), 'FMRKkDjDjYHwsAxOCQdDNTyRhGIKCClZyDTzBsYAYhyGdwDcpg', 100152, 100382);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100018, to_date('15-03-2022', 'dd-mm-yyyy'), 'mrRhcbzPfTUNLQNSUHQCppUaNhNRthSMsPGileOZCyzHmkPnBF', 100072, 100331);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100019, to_date('05-10-2008', 'dd-mm-yyyy'), 'xaOqGnMwgmUypvhABIOmIBhcQPYbQTAOtnJXRnTWNlXyBOupTJ', 100104, 100134);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100020, to_date('12-06-1971', 'dd-mm-yyyy'), 'HNySbJAuqOZHjRNbvRhMsUJTRIjTUFgwTgoPfJICJVytzaPUUl', 100009, 100350);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100021, to_date('11-03-2002', 'dd-mm-yyyy'), 'zzkWhxDNDtDfvEOWHhyCEJmuHmGZgoJxhNEJkpJHMzOjxAzdrq', 100195, 100372);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100022, to_date('01-05-1978', 'dd-mm-yyyy'), 'JyJDqKpKofSbxIPHBJaZycwfpKyrwKlqTtEZhOrGhmBXzFePXD', 100311, 100387);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100023, to_date('26-04-2006', 'dd-mm-yyyy'), 'hdUsmZMENZjejUqMPPWUZQbaEADQKgOFtGoPFVcDPgJHEzqohY', 100352, 100047);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100024, to_date('01-07-2017', 'dd-mm-yyyy'), 'VgaCvjIcFVyNDySpnemfVdzudghoJmbUZYAQMTqMBDbCUzgomV', 100128, 100369);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100025, to_date('24-10-2003', 'dd-mm-yyyy'), 'oGbaYzmwOnAjomFkixRuXwNerKBikQEHqQDXwUnGFbfwuTDeJh', 100345, 100274);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100026, to_date('26-03-1994', 'dd-mm-yyyy'), 'SGjKrLSGCRNUAvVscANqwUpNqIewgVWZdIZwFPRQoygYlqbxMT', 100100, 100185);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100027, to_date('25-11-2007', 'dd-mm-yyyy'), 'EjSpxJXwfvunxbIHqVJkFBCMTiTAnIPsxnRyacAMweNhGTHAeW', 100184, 100148);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100028, to_date('22-01-2009', 'dd-mm-yyyy'), 'tJdiuiIvYxPFBMuUWqOuaquecKXQibeyRwGPRXdImMnGgykZIH', 100389, 100051);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100029, to_date('26-12-1997', 'dd-mm-yyyy'), 'PpDRcUxpWPQVrmEhlPpJyZKHWLpAenexVhunAEriGntCUslsYH', 100231, 100212);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100030, to_date('26-05-1989', 'dd-mm-yyyy'), 'ZaaujddMYSUjXSRRdwQhDUgbjyTHKbeeyfDwCHlGxdreQfhFGM', 100372, 100350);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100031, to_date('27-01-2007', 'dd-mm-yyyy'), 'PDNDywRJlgIgoAUIeYYxTokwGhfFFgnDEpggBZtZUfFpyhzKdL', 100126, 100301);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100032, to_date('31-01-1974', 'dd-mm-yyyy'), 'zSGlQLuUEmIMecMymenKlFEaLNEsooCTsrqkkSKXhSBRazLQgS', 100059, 100067);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100033, to_date('08-11-1985', 'dd-mm-yyyy'), 'ETfoytBfYLdWghUMOYlpuzPVkXvuaLFHztNWHyVbkkbtKpBHIT', 100380, 100063);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100034, to_date('15-01-1982', 'dd-mm-yyyy'), 'HVhoJFlqlZqQvyALqrNUsBYEalrOybofvQGqHRWcDlYntCYFPH', 100232, 100038);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100035, to_date('20-11-2009', 'dd-mm-yyyy'), 'PDJnYIWsoFXwGmfLclknAlvJDoGNsipQQqrjpfNVuoKqrQyjgB', 100298, 100131);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100036, to_date('23-08-2022', 'dd-mm-yyyy'), 'IXBFaSXfXyJuYJXEmzmMwimHwfBVXZPejzVKpAGXtiQxdfpxWX', 100386, 100215);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100037, to_date('17-03-1993', 'dd-mm-yyyy'), 'SsqNxdTvywOKbZtkkAINJmaEBRditrBzASyugPfvWdkkVJpRkL', 100102, 100206);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100038, to_date('13-07-1982', 'dd-mm-yyyy'), 'zsKrSEkAqQffutktnNoPiYgoQFCbNaDGhDUXoZMUuHzkENzOED', 100061, 100224);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100039, to_date('19-09-2014', 'dd-mm-yyyy'), 'rdsGrCltUgtrHGdvFzochEiVbBTOshjDXsICCacdBlgxmtfdnh', 100119, 100062);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100040, to_date('26-05-1986', 'dd-mm-yyyy'), 'aLdsYIxRbTiBTdlncYeHFziClOagFbzlxLQrjfScHZVtCxYQIJ', 100256, 100362);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100041, to_date('02-04-1997', 'dd-mm-yyyy'), 'nBZysVlbOXAGkSvVUDoXaTEhLkfxOCZLnqXjchupMechAxugSn', 100005, 100100);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100042, to_date('01-11-2023', 'dd-mm-yyyy'), 'HxEByvlCRuKCwVkjYbvWTUwKbCyGWgmeGnPTMbnQbcmAbUMvpE', 100249, 100308);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100043, to_date('08-09-1995', 'dd-mm-yyyy'), 'mMOcuqPRAYXKoTpuyAkNcRKHZDqIQBYTdDGLRtRAJQkHCflvfn', 100160, 100366);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100044, to_date('13-04-1980', 'dd-mm-yyyy'), 'ikTiHCQmkXVAKjNETKYZqIuIkhDFAgehjBuXrhhDcgvryBdVDw', 100279, 100275);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100045, to_date('13-06-2011', 'dd-mm-yyyy'), 'UFaYSrsxypzJcLdTtiKwgVBqtTBWtYQYYWxCDyteCfLxbIDPYq', 100267, 100281);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100046, to_date('02-02-1999', 'dd-mm-yyyy'), 'xXisSuDJrNPNtjUqNNoOmsNIqRGtqWGKRQzLJYIvrhdGNXgFSG', 100285, 100232);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100047, to_date('10-02-2011', 'dd-mm-yyyy'), 'mHFckfeItDpggZqGFiLYtAKUZtWzzEeLHlZZnuEScTuCKYOues', 100073, 100028);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100048, to_date('06-11-1982', 'dd-mm-yyyy'), 'IwdVgKZpOKKikuwHDXosNYGqxynDSdgTCPGtyIWsgLEMJgvvNO', 100299, 100327);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100049, to_date('15-01-1997', 'dd-mm-yyyy'), 'PPzMBDcVwNmxBzbVZAxfXxydVVUcvbxqtwbeNRhaCQitzQpJLl', 100338, 100179);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100050, to_date('11-02-1981', 'dd-mm-yyyy'), 'EZtXuqbUvrwMgCgZmttYTUmiCYtTkodYrGQgKRntrBghNbtEiL', 100043, 100380);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100051, to_date('23-11-2002', 'dd-mm-yyyy'), 'shuvxqGRWlBAqshCzQoPzEKhwBLpnCnANHqhkSfxNflXvqlKfh', 100216, 100120);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100052, to_date('10-10-2004', 'dd-mm-yyyy'), 'tUJNoOiKOecKDBWUHnPjHRDELEWBMeeGhqefmZQwrBCTdLyYHo', 100186, 100031);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100053, to_date('08-12-2019', 'dd-mm-yyyy'), 'elaiaoqxRoVeBmiwXfoCAloqlNbDqTQhygzrecTsuSaXIfyqEm', 100030, 100116);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100054, to_date('02-07-2001', 'dd-mm-yyyy'), 'PbQJnjVheyerkGxGYKGAfKkVywksYqxPhWHEdwJHQJItsZULRV', 100181, 100287);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100055, to_date('02-09-2015', 'dd-mm-yyyy'), 'eKdYIGkPOvLFxCkfZVnRbmJTKVBvSpuqhYBREKVKyRYqGTCSlL', 100110, 100315);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100056, to_date('27-07-1976', 'dd-mm-yyyy'), 'kFSPoydLYmePAXbwUMsxvZIAFWsufDNbVCKTCKeShYrcTgbhIY', 100138, 100121);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100057, to_date('12-03-2001', 'dd-mm-yyyy'), 'RmxohJXWSXcWxsSHcuussZFnDtXgHVQdjMGRmbnQxveqlPcuHZ', 100018, 100244);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100058, to_date('04-10-1989', 'dd-mm-yyyy'), 'GtMjiEpsYLDQkXKzVkVYWnuxHMECwCekXycFcEFBXnqOeFzuOD', 100035, 100103);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100059, to_date('12-04-2011', 'dd-mm-yyyy'), 'rWkEoKIabeoyVlbavNUDShGGAYIKDyWFMdEoAnfVARMRcdmEaz', 100223, 100297);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100060, to_date('16-08-2019', 'dd-mm-yyyy'), 'CNFAhhuzQQuyreYmVQtWcUeJjpfzyRhSFDxWFTBDzWUUiauzzf', 100126, 100082);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100061, to_date('12-10-2012', 'dd-mm-yyyy'), 'JImuQGzaPokjEZnAMbeGgnHmULpjPIMwTAkifgtwudKJiikWfF', 100040, 100389);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100062, to_date('29-12-1993', 'dd-mm-yyyy'), 'xviSWXYAYIcFaZYKTwIlcXVPDXjutffZIjQeISuHtMbfPQhGDc', 100117, 100170);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100063, to_date('30-06-1972', 'dd-mm-yyyy'), 'OxYIvAJYmgaOYwESIjrwEPstxQaZBGxtDqjjUIAtPPRkHvnNYX', 100094, 100396);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100064, to_date('17-04-1972', 'dd-mm-yyyy'), 'zaqFkkKfHaMoCkUdKxqwoLlYAHMnwYapzsFyMScTkvUEPhlOJO', 100170, 100036);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100065, to_date('24-10-2006', 'dd-mm-yyyy'), 'sfSAfctCuCMcwurpqWeKOKyVbTjdWPqfnCdqEEDXSakmjtAttM', 100327, 100069);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100066, to_date('15-11-1984', 'dd-mm-yyyy'), 'eEGbDvwZzyVisptGSIPgpKBvhnjMiDTHgVLKsSkJOXVFYmNBFR', 100242, 100210);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100067, to_date('15-05-1970', 'dd-mm-yyyy'), 'HLHSnwePXAAgpnRGePKidFoBpMvHFoLdbsXzbeVyNQWxxHPgYa', 100322, 100126);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100068, to_date('14-10-1990', 'dd-mm-yyyy'), 'IlODkEhusBdoCZIAcFAETntZxeFADVQUHewHkvMOckzqaEgvyY', 100051, 100389);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100069, to_date('01-06-2012', 'dd-mm-yyyy'), 'IbTVqXzWaKaCkaSrQOuDfgQwIVDrgUMzFTDNeKoEyAvSuGnwbk', 100386, 100029);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100070, to_date('13-09-2001', 'dd-mm-yyyy'), 'KsJoZbQxieYmxLjboNDyRpyQSaJgnBTuMKiprbXLgPbFRPaICj', 100249, 100392);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100071, to_date('02-05-2018', 'dd-mm-yyyy'), 'tDaxOahSlJljYPOqlJycNEJLqzoKvmgWqqTiArvNLeSSjtSQCg', 100130, 100377);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100072, to_date('02-10-1993', 'dd-mm-yyyy'), 'UGSpijxtHOWvfKlTqXsKalPlJdrmRFUfOYDJQGejAuwpZnNnbJ', 100278, 100146);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100073, to_date('19-12-1972', 'dd-mm-yyyy'), 'MJpKUSApvZvhMBPhrnDGbVHsKOdaIUlLseBfatqnDunCLrAocI', 100102, 100217);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100074, to_date('19-02-2003', 'dd-mm-yyyy'), 'MTIxOhLzjmrwnpgnvoqQlifSAGXTXlurBKonKyHCfPcupoWjwF', 100327, 100152);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100075, to_date('04-12-1998', 'dd-mm-yyyy'), 'YcsfwSHBjmhtiCiIWCeqfZUpsqbEIPUkWooROnOoNrBRIbBgIT', 100103, 100393);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100076, to_date('05-07-2017', 'dd-mm-yyyy'), 'kPBoCWNKqSTrxMfvycLrpiRBwVxHTGTmCrVaSsWJweMaTthJRK', 100217, 100187);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100077, to_date('01-06-2021', 'dd-mm-yyyy'), 'BzQCOwHKGqxWNgvLpnDYbwtGUsfijikXNnApSfBgjZNcVKwldC', 100126, 100009);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100078, to_date('12-10-1975', 'dd-mm-yyyy'), 'EPFHhiOmWjjhAIduYlyzQjBixTjLRfOctxPtQfraGZbVSxisWD', 100002, 100308);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100079, to_date('23-09-1992', 'dd-mm-yyyy'), 'AcCclDPTiHGuMVEEdxPKKJpmOCwVoSzQdcylPbjwNxRvZXJcSV', 100149, 100285);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100080, to_date('13-12-2012', 'dd-mm-yyyy'), 'KFbNvpsBHCbWtOSrqUNkitldMzCGMATXCTnHrVMUVIdnYurBCY', 100235, 100339);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100081, to_date('01-08-1982', 'dd-mm-yyyy'), 'hVrpqGqhBjNOWaXpZPrYwRFBdvJYVqnmPDXDHFUzsccvhyrpvf', 100351, 100191);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100082, to_date('24-06-1987', 'dd-mm-yyyy'), 'WDnNCAtZuQzSAThYgDiGqQFLyQpdwHFOjjBltpJrjTElAVdquj', 100031, 100079);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100083, to_date('03-12-2018', 'dd-mm-yyyy'), 'pUwJLpISqLNCAISNPEWRJbKizjmREKYYVDhsaeAYLRbjoOUiFJ', 100203, 100113);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100084, to_date('14-09-1990', 'dd-mm-yyyy'), 'WFfdrynKBNznfcTlrhYZqkaRIQiNKELkbSQQWkwBopgWFQcAyA', 100199, 100140);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100085, to_date('20-07-2014', 'dd-mm-yyyy'), 'byyRXDsuOuQmEoDJJWViqCgkkYphbHYVtatGWcFYFKtfNhljGi', 100073, 100387);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100086, to_date('04-03-2020', 'dd-mm-yyyy'), 'wALqSWLDUQCkTausyjEdLccnsnnURAGSdrroFHTEAsOSryOMbf', 100054, 100339);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100087, to_date('14-07-2000', 'dd-mm-yyyy'), 'CdLnLaPYCkhaDPVkOOqxBxJzJTBdUWXqfNACUpBSkLVgPBgZRC', 100202, 100067);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100088, to_date('08-04-1971', 'dd-mm-yyyy'), 'RxacUlgMfyoxNcBmBtOVAtAgVBiewNcxDZDGNNYisUuoRCaLjQ', 100254, 100180);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100089, to_date('10-06-1983', 'dd-mm-yyyy'), 'JJtqyDkbmVCmhYHFerUBOIbiEYFahsRZnmENZgNQtqjQicICVC', 100073, 100275);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100090, to_date('24-11-2011', 'dd-mm-yyyy'), 'FtnfIFRVODgJsyGniZxReVXDZNHkDEpqICFhstWYIDejRtaqDg', 100149, 100365);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100091, to_date('20-06-2014', 'dd-mm-yyyy'), 'zLYDxTNuWFScjdZANwRGkUCdmUQMNuHObgekrRdRiRzejzGiae', 100156, 100349);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100092, to_date('06-09-1982', 'dd-mm-yyyy'), 'cWAzkrGHJTgHGJtDWBvOsmwhbDzTbrVBDOcrKfAPoWnpoyLwPs', 100119, 100068);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100093, to_date('20-10-2020', 'dd-mm-yyyy'), 'tvyshPcFePNymHrFzhwuEXIYunkJNychzkckeqCnlHkMdEeFkF', 100221, 100071);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100094, to_date('18-10-2017', 'dd-mm-yyyy'), 'fsGyUbPvIGYuZHARIDEKtYcUWrRbbLydNsZzrvcopIIcQuiOnc', 100182, 100185);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100095, to_date('30-11-1990', 'dd-mm-yyyy'), 'JVMfrBDOjJuNmACAEbZgMklkojvlTATDABJvuaOczOJXNtlwEk', 100035, 100320);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100096, to_date('25-09-2015', 'dd-mm-yyyy'), 'lJtaCoorZiPyxWwbrJsPVEwIFkQkbjFrlzCwxRSFETyRLIcQWE', 100265, 100323);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100097, to_date('11-01-2001', 'dd-mm-yyyy'), 'tLntxbWxHaMVyVNVPvEvUfagXQOKpdJOcjpjxhxATZjbWoHURE', 100175, 100291);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100098, to_date('19-10-1990', 'dd-mm-yyyy'), 'tHXePNsSHpJutqNjhksSshZhPzdgKWUhvWpZTsoEMfuZIcgqyE', 100126, 100295);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100099, to_date('25-03-1991', 'dd-mm-yyyy'), 'HFzBjsLrMcKNlkBReQraDiUElbumxfUWomPhcSDtKpzBlSDZnh', 100173, 100066);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100100, to_date('30-09-2014', 'dd-mm-yyyy'), 'hCnzqsGxZNwTMDIRykIQBdCmbVRFmKHxgRclrSuEZaZhRYeKik', 100211, 100170);
commit;
prompt 100 records committed...
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100101, to_date('20-04-2013', 'dd-mm-yyyy'), 'OfWEegNSvwsZuEGZqqDLcqaPuGdmRNLmlTiTOdwQZYlmgYVJbS', 100311, 100354);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100102, to_date('27-08-1971', 'dd-mm-yyyy'), 'eDuqZSdNIVvvRGifvBugDYfORWgqPzRIcOaQXMjPbQLxWGFQmf', 100100, 100007);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100103, to_date('31-08-1998', 'dd-mm-yyyy'), 'iJvPsdiMArveBQileWXUvmzblKwHjjAQhfjvMcMyEsZxoqjPFk', 100227, 100111);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100104, to_date('20-10-1981', 'dd-mm-yyyy'), 'wmKZBFRFtUKeIGpjcNvBvCuPKAWMnCJVuiYDPeMYZZcOwTzpmR', 100075, 100162);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100105, to_date('19-11-1983', 'dd-mm-yyyy'), 'IbrBQBjNSzLvMLiKVidRDWErowPTZNyCdKqVvODWwvveckNuik', 100223, 100155);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100106, to_date('01-11-1973', 'dd-mm-yyyy'), 'pUZNZBBkLCShgbzfUAHUAvPJEKQExsQqmwwMzDeXuRqOJRSKLE', 100025, 100045);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100107, to_date('14-10-1970', 'dd-mm-yyyy'), 'MZIyvEelVRSEAoRCRIOMLzyqLFmwcjrRRtmxqTxYKeMbaGXgym', 100149, 100143);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100108, to_date('05-03-2007', 'dd-mm-yyyy'), 'YJbOMqPGDfHnaCJUuSRpIahlqoeVbKAQjjfrEKyXjMFVOOjaCX', 100180, 100397);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100109, to_date('18-01-2002', 'dd-mm-yyyy'), 'uYNiTNsKwwaoZvigqBTdestGJKFuBfNtZfFNWjZljMdKLdiVnF', 100091, 100081);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100110, to_date('15-09-2018', 'dd-mm-yyyy'), 'pwwZsZUrLeiDsyejaDUUcvAvvceszXSxTHFSrONyMyKehBwFLV', 100065, 100101);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100111, to_date('27-09-1996', 'dd-mm-yyyy'), 'QMcwSLunGHlVTLuUHMGFaYCykBhFCgCAJfKhIoQdIDzTdOOEwN', 100259, 100028);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100112, to_date('10-07-2021', 'dd-mm-yyyy'), 'vURnuSZsBVAXgMIWWvZkXwtEKOZTLZZWvFFyJASdqokNrydzOQ', 100376, 100383);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100113, to_date('30-03-2024', 'dd-mm-yyyy'), 'zfOieMKjEmBREOaSwDNuYCCSdHwDuLJjEvRZnAnGjkwxicOXge', 100216, 100184);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100114, to_date('17-05-1991', 'dd-mm-yyyy'), 'wmbIAarqluiYXgSwSqeJZXgpsratCttQsrZIAoitqBSdUpelpY', 100016, 100213);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100115, to_date('25-01-2023', 'dd-mm-yyyy'), 'SAGZXWUobZOpTCfGIstgWtEcopnmFBRpFMxNHupfwdVKYbnATe', 100368, 100141);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100116, to_date('22-10-1977', 'dd-mm-yyyy'), 'klIJvFWshxPPDDezvOKFVxHITFySxlUjHFQdRsKuTbNsIOFRtN', 100042, 100007);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100117, to_date('23-06-2008', 'dd-mm-yyyy'), 'zrJNCqecMqRUxmRmEkhSAAiRUGOZObokBOdTFpRlJrfyWMQOIx', 100169, 100371);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100118, to_date('24-03-2003', 'dd-mm-yyyy'), 'BCqFydAtpnulTmhxkMBhVxtSnSXhtSTmoZPEGwoeywaKGqTtSq', 100148, 100305);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100119, to_date('29-10-1986', 'dd-mm-yyyy'), 'TdeTQtLZIleSMRTzZNTWRBzqmVpsredCqnFeqduITcvnCyXPfD', 100212, 100282);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100120, to_date('18-04-2005', 'dd-mm-yyyy'), 'padYTCdagTrdJArUQVyBzKkdfSDQepIIysjMkdgPMTvgfgFSkG', 100043, 100349);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100121, to_date('07-03-2010', 'dd-mm-yyyy'), 'rtxzEWvyThjsERorKKcsEPEEgudlWMGusIkJSESzYeeghhVEdX', 100282, 100238);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100122, to_date('02-07-1985', 'dd-mm-yyyy'), 'hOherfdPlpUbxUJCIoiHLcxJIhhrxznqqDvxMOoRBYBJAXKsjW', 100321, 100053);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100123, to_date('15-12-2023', 'dd-mm-yyyy'), 'JdobCvQcBlrsMODbUvUqhXPIYTyivYXfgfCvkBulJZNwdaGWzd', 100040, 100225);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100124, to_date('29-11-1993', 'dd-mm-yyyy'), 'kxvhmsUiWiyndLtupFZjdoIXaZCUnMcqxAcnoYKZGlUZNDiZJE', 100077, 100270);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100125, to_date('10-08-2023', 'dd-mm-yyyy'), 'FBiMAOfvZYlVjpCLfYMnodDYxsLnbjwZLuUKijbdwGDuRdfiif', 100199, 100174);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100126, to_date('06-05-1973', 'dd-mm-yyyy'), 'ifWGZTTNNmKiytwjdwLyljnfAkUuweseCdwNPUkYSwcRffKUpG', 100286, 100294);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100127, to_date('15-03-2023', 'dd-mm-yyyy'), 'wUhPZDvsYRXEPiZWjCJdEFqoNirBQuvmELFWSLblIzUlaVtEOl', 100243, 100227);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100128, to_date('04-01-1971', 'dd-mm-yyyy'), 'IbdNawYUopAlZtHJkXBEckzHlDhdDlNqxietayhfAygqXUmjWm', 100256, 100314);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100129, to_date('11-08-1976', 'dd-mm-yyyy'), 'uHSjaYeFziPBpWODTmgVyehNkXylNmBWMYltYYenQaMhoBjlnv', 100271, 100244);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100130, to_date('22-05-1995', 'dd-mm-yyyy'), 'cTDXLuvqVsjuclXSUpZWgvcBjGrAqGlXIzJETIgmgrzPvNdHca', 100291, 100395);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100131, to_date('18-08-1971', 'dd-mm-yyyy'), 'ZbLjIviitMHVJEhHXKDYZrKraRPwetHtwHlbMzYWQLViTulKsy', 100288, 100248);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100132, to_date('31-03-1982', 'dd-mm-yyyy'), 'bHxzVECBBRBENufmfANUMTuGgzIzfZxAfiGqbZQOFfcAowgvNn', 100134, 100342);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100133, to_date('01-03-2004', 'dd-mm-yyyy'), 'lrQgfUMYgTCvzRCCDFBVgAqnmOQhEfrtJjIiyBQyzsiPFggRyb', 100312, 100103);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100134, to_date('05-04-1974', 'dd-mm-yyyy'), 'cXQbsUbSAVQhWnKQhxKSmlehZfADxtOwFpCTfIaqnvKQdNWoVE', 100190, 100032);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100135, to_date('20-04-1998', 'dd-mm-yyyy'), 'xIUXwBWrXvczUCkNUSUfZTZbbbIXWksxhBZcRsTEbDVPiTEOLu', 100058, 100328);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100136, to_date('28-06-1995', 'dd-mm-yyyy'), 'xlZMcskPALfbnulJPUultEONHkKHODdxKiEqeBjWnCNxgAIfSz', 100040, 100088);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100137, to_date('24-12-1987', 'dd-mm-yyyy'), 'alTZCfvUYHkRTcsfVQEVoiQhQDTDGQnGoZmyzcOWDjyHTeGwLK', 100096, 100168);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100138, to_date('30-12-1978', 'dd-mm-yyyy'), 'AtjWJHdXbnCRgevZjmKbRWgWCxCaIbsmOpURfaNTrYSHjCJbHp', 100396, 100301);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100139, to_date('28-11-1971', 'dd-mm-yyyy'), 'AuKGbncxpbTXiiNgFKUCHtUQHweCBFVEVsXeZraFiPExDQcMMu', 100321, 100347);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100140, to_date('09-02-2002', 'dd-mm-yyyy'), 'FRSLBYAdyHOQoOumOdtvlMxmKKPZvEAwKThETHtSUEbpbxIudT', 100219, 100116);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100141, to_date('22-03-1986', 'dd-mm-yyyy'), 'igHRhZoYLtaaYeBoFGsjvZCUmQXhyEriFgcuXUKtPhrPmhUePM', 100061, 100344);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100142, to_date('18-07-1997', 'dd-mm-yyyy'), 'SrFLZchOOEzXCqzFGcvzklOmfgDztDwhyclNwWcifoxFGebdST', 100304, 100266);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100143, to_date('20-06-1983', 'dd-mm-yyyy'), 'QljVnHXjhmhXdwigsTpAVDsFpyagKtehFLETpkzuMGJwEGizLM', 100064, 100313);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100144, to_date('22-08-2021', 'dd-mm-yyyy'), 'vJqsBZpczJQzplqWEYQYHOZmxYMeWlqRuYhgwaIzqhXbrpghPb', 100328, 100172);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100145, to_date('01-09-2020', 'dd-mm-yyyy'), 'KqagHtOYYbYgJkXHITzvbkADaRtXleVwZwBBzgYIgRfenZlzGY', 100364, 100151);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100146, to_date('28-12-1997', 'dd-mm-yyyy'), 'aKDIEODgEqLYGjvfDkxNtnpNtcvMbOGZqzdEvcSOXfXIpRYpre', 100163, 100292);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100147, to_date('17-04-1994', 'dd-mm-yyyy'), 'bYEdQrltWwpaotNLQnoFTrSYSwSVkNchezIzcpxGzMNQLwfHey', 100119, 100265);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100148, to_date('29-02-1980', 'dd-mm-yyyy'), 'DRKnkSMIoQTphdkYIQbJbhllhyrfUlfrwPjJvoOeclexPwopZq', 100248, 100334);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100149, to_date('04-01-1987', 'dd-mm-yyyy'), 'lVmZnhGwFEGoaSuBeasGdLCUgJkwJQxoYHNMQcpVNtbyuITBqY', 100066, 100176);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100150, to_date('09-08-1985', 'dd-mm-yyyy'), 'zINHKqMRpIiIWzcNncjiVQbXJyXJQvmjfnHrybZDBmOLWTSLyV', 100014, 100237);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100151, to_date('22-05-1986', 'dd-mm-yyyy'), 'WHFRUGkRkwjgUjyOElkKKzzFlXmlrIxfywDxMGlnEiMVZXJwaZ', 100048, 100163);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100152, to_date('10-04-2004', 'dd-mm-yyyy'), 'UKMDXriGBwSEBWsEvNPFCOihaUwUYbaQLLjraKwvDXQQcCAnKO', 100150, 100385);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100153, to_date('31-07-1991', 'dd-mm-yyyy'), 'WOKwNOUugSteFJWUkPuZbLcIYKGCaxvgPmIWhncJpvjQDfzUPK', 100363, 100336);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100154, to_date('06-04-1980', 'dd-mm-yyyy'), 'fgTMvljOaSiYjBKgOvYcAvpxjqbmNwIgnaXRBRoYdDqWvNLxfj', 100373, 100237);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100155, to_date('29-04-1988', 'dd-mm-yyyy'), 'VBotAcraUAWedRyvXlsSVGrnlOzYweRyhohNhfEoYXDwnKIxYb', 100118, 100136);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100156, to_date('30-01-2019', 'dd-mm-yyyy'), 'RJWIBGaPcdgOiegBkrjqErqXXZMvGMOOvRpCDFEcvGdqzHCHpE', 100326, 100000);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100157, to_date('24-12-2021', 'dd-mm-yyyy'), 'grdDRSssMVkxyTmzYtznPMXMPJsaxIpewEnrHIuADEeqnMUHpg', 100392, 100345);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100158, to_date('29-10-2021', 'dd-mm-yyyy'), 'eLwcaBPdlsfbOPNYmEAUOtVAIBbusmrYbqJXXjtIFcHIkizBzD', 100244, 100223);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100159, to_date('22-10-2012', 'dd-mm-yyyy'), 'KICusbHZrBQTdnxfuFANhBhktaMEeMLRGTVbDBlEIUvBvznJlT', 100181, 100383);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100160, to_date('10-10-2005', 'dd-mm-yyyy'), 'xESJIqgiAurPBJPhLdRXwHNuuhbkpsiMNtcMXQRpiGMXHGRKoO', 100309, 100380);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100161, to_date('29-09-2009', 'dd-mm-yyyy'), 'LwOxLKYEhuYTJBGdCSBwPNTDnPCCTEjajpezHGYPamXJGIICXW', 100158, 100295);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100162, to_date('02-11-2019', 'dd-mm-yyyy'), 'DYpTClBSqbMqcTxdQRiYfhnVGQIOyAMlmItRoMLDcIUnhdzcMH', 100038, 100227);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100163, to_date('24-04-2014', 'dd-mm-yyyy'), 'iiEINaPwKgixEpvOeSwsgcBRxiVvCtBJLmIonToqaopQvBJMtE', 100183, 100162);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100164, to_date('18-06-2007', 'dd-mm-yyyy'), 'sgQWrKAYVMdOVXsMQpWcGAVXZCOWnGLfpqomONTHxvnTrGcWhj', 100069, 100136);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100165, to_date('02-07-1987', 'dd-mm-yyyy'), 'GCjvWnsGywNEKuzUlvRwygsADgsQYXscMZxsQOxLPfSOwslvsl', 100317, 100338);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100166, to_date('26-03-2008', 'dd-mm-yyyy'), 'QlslsqlMKLIlXyiuINqzllvkItBUjzqzfkgeUGdKyjckzeKQqm', 100176, 100201);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100167, to_date('07-06-1987', 'dd-mm-yyyy'), 'zJEQMetjqsqUMQDpKjIqNascxftHEuwAaeLxxqIkzjJNfcdTHz', 100062, 100218);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100168, to_date('26-05-2017', 'dd-mm-yyyy'), 'fUJIwnwaFNZsqFoLTvYryKXyuqszfuQvNSRCeGzTxhgdtxjvqm', 100348, 100145);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100169, to_date('07-05-2011', 'dd-mm-yyyy'), 'DqcvmPRzntiUAJPgrIRdXndJzJfLLYmIaTvDJuCIpUkcSaTIMi', 100128, 100010);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100170, to_date('06-05-2023', 'dd-mm-yyyy'), 'TQfLmmaFMRNpwzpafsYgZaBTEnttMeIeUfALDnudZWzaqkXOMl', 100052, 100224);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100171, to_date('14-12-2008', 'dd-mm-yyyy'), 'KTeZFXcncguDYaUoONRVytDzKjPkAZRPMnoYjGEFcCabZJyMfu', 100177, 100025);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100172, to_date('03-12-2005', 'dd-mm-yyyy'), 'JViSaBmjhWVHGyXfPLZMtBkMUYFlkibYltuIgsvnkORyIkkHxc', 100086, 100093);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100173, to_date('28-05-1985', 'dd-mm-yyyy'), 'LLnwSUydQprROxyCKiLzBHginANokbeOcsBiMYQqRXLdWQlRdy', 100196, 100178);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100174, to_date('16-09-1984', 'dd-mm-yyyy'), 'IFyQejQJjkNyHbZmSwUQvVBGYemujmpeMgBAvCUxUFTDfdGVWL', 100387, 100038);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100175, to_date('04-09-1974', 'dd-mm-yyyy'), 'JBddmZgYiQlMCdcZvrPfUtKTmVkttoWnzjTNHGeXYybmLvZYGS', 100396, 100093);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100176, to_date('17-07-2012', 'dd-mm-yyyy'), 'CXXEteNTGtnIeMRZckRrdwbUXWhLdcdpqVpdroopeukDYtTkMg', 100114, 100240);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100177, to_date('05-10-1993', 'dd-mm-yyyy'), 'ZjaqIOGwCNCDAALSNXiepJzvydcJiGvWPPJxreeqLHepRtilwM', 100319, 100054);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100178, to_date('20-03-1985', 'dd-mm-yyyy'), 'pedAbEpRdnscbpUuaaoxccNEojaiFAfjFCExjcRbyVbDsyYVSA', 100175, 100125);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100179, to_date('30-06-2019', 'dd-mm-yyyy'), 'ljAHsfozdwVSCKYEtHxcAxsFgPHvsiAYzCGKJxlHDeaFJIoUji', 100064, 100191);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100180, to_date('13-12-2011', 'dd-mm-yyyy'), 'wpwypvyLnlZyZwtZPsEMqfaSxdBsdXwfIugXReNfqMyAzKZTuR', 100390, 100064);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100181, to_date('26-08-2021', 'dd-mm-yyyy'), 'jkeIUptAwpLZeMfFhjJddqZIZEoBAKVKJpSEMisDODyZpOVDNh', 100135, 100283);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100182, to_date('09-09-1972', 'dd-mm-yyyy'), 'PWtBvmUgWCNeWOjHzufqESVCozKEoveEiJnZFUIebpTwjzQUVr', 100378, 100375);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100183, to_date('04-07-2004', 'dd-mm-yyyy'), 'cJjogHAhGeoycaoAlHPBeoHLxItRpegXhosbHkumqYdlzLQssx', 100194, 100008);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100184, to_date('28-03-2013', 'dd-mm-yyyy'), 'DInHHWZffckwAVgrKWjMOFYuPhiXMBKwzHeViLGLHKUwtPWmip', 100312, 100310);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100185, to_date('25-06-2023', 'dd-mm-yyyy'), 'VAXhlffKwulNswayXsHCFCfgEzrLSNLCOVZwnHxFTjfqjGWLky', 100084, 100010);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100186, to_date('25-10-1989', 'dd-mm-yyyy'), 'okogsVGgWygqZXnYacxcRUSSRzqqSZNQcjTzWnYPkDvWiXDgkO', 100329, 100177);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100187, to_date('09-03-1981', 'dd-mm-yyyy'), 'UgxuJspXuTvRgVCJVtSDgDPRfTwqrQztOoGRiMJQzBtRumaoFU', 100307, 100237);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100188, to_date('20-07-1993', 'dd-mm-yyyy'), 'qlUALrzulpRVKekWcovfVrpkRVaEjwrBpWGFPNBBKhGgnqywYe', 100182, 100398);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100189, to_date('04-04-1997', 'dd-mm-yyyy'), 'xfgcNGBoEQsJXiHpauKZSFBMGNDPQfzAiKckpLgcxyBePWNjUR', 100154, 100076);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100190, to_date('24-03-1981', 'dd-mm-yyyy'), 'aOVSZDWMdkpuDACzXMfHAldVEzALGPaWmxYESAspmkepjkluMI', 100329, 100276);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100191, to_date('11-05-2012', 'dd-mm-yyyy'), 'adSSlhOvHsUGBgndGMqJBLFXSLnotLpZODHLWRXoVasDwhxvVp', 100316, 100034);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100192, to_date('29-12-1992', 'dd-mm-yyyy'), 'ccBVecUeywowDgnzAwKOUGRYuYmLZsLzXkeTqzJqLZZHLBhRvf', 100382, 100162);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100193, to_date('19-09-2017', 'dd-mm-yyyy'), 'BmsgThawtXIMNiELhIEsusUhdZljpBvjqMgenLJSqddAmOXjZg', 100399, 100353);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100194, to_date('08-04-1976', 'dd-mm-yyyy'), 'xuCUndKdzxeNMbooXOPhlVDigEfOKZJKOAUAsdNAgcXbtpVGPS', 100061, 100228);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100195, to_date('05-04-2010', 'dd-mm-yyyy'), 'IyytyOJoTDFBBfoynVCIIXslzIpSHXFgGgcExcyBvnEaNRYnky', 100279, 100033);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100196, to_date('19-06-1988', 'dd-mm-yyyy'), 'iQUGlOmBigFlzpGWzuOwJtGrbquoNBwSFlXJGlCWGXopVydQOm', 100256, 100341);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100197, to_date('07-01-2011', 'dd-mm-yyyy'), 'xqJSSGPbeICNWFwQBibcIcXvCGQEHKvUgCRMMztisKCDFsXiiq', 100163, 100036);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100198, to_date('17-01-2020', 'dd-mm-yyyy'), 'MUdCqnDzyXXUHDYyZwnEiGoZRyFouFCbkStiaJsBacEbnRlAWt', 100133, 100170);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100199, to_date('23-11-2021', 'dd-mm-yyyy'), 'ZwqxYWCUHPNYVNKFlECCIYWynWPoopgFDREWWSXeCSvkZLREKJ', 100195, 100142);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100200, to_date('18-08-1992', 'dd-mm-yyyy'), 'oMBvlwTfsOLXUUJvIdOvgBIiuhhSpcpseWuGBfJtTkNCWttxKb', 100267, 100366);
commit;
prompt 200 records committed...
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100201, to_date('15-12-1983', 'dd-mm-yyyy'), 'bhtKLzPjDwBFHBiecsrVbtEBZDfutKlSknWLuedOoFmlHqFwJS', 100156, 100018);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100202, to_date('17-04-1975', 'dd-mm-yyyy'), 'HZkqoCkaJlQxJsMBbCZCXQFUKkKlunSjGwBoqIceRVuswWcNUZ', 100342, 100144);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100203, to_date('02-07-1993', 'dd-mm-yyyy'), 'aaCGXimBfXoENRlnfFbTaGzTkEqVjyOyIbbkHoNwtXsTOLMxxD', 100391, 100192);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100204, to_date('28-05-1976', 'dd-mm-yyyy'), 'HlRVHcBYqNTDqcilaLudIRofNvNujzXlRtgyHnSsMySxzSAZdA', 100224, 100246);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100205, to_date('02-01-2009', 'dd-mm-yyyy'), 'YvVwMRzdEODhmeAnOUrUBTcGhdMOFwyATtXYNTfJNqpJNqhRqr', 100218, 100108);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100206, to_date('05-12-2000', 'dd-mm-yyyy'), 'GTtWThZYBhBYpVYxJNsKplgtzQoMtrcUDCFXQHZejUdLQriaOA', 100042, 100001);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100207, to_date('16-10-2011', 'dd-mm-yyyy'), 'OCgLljgsiMjNVUOJGRVDYRemqnUjHKyqJVmvfUTfbCjqNcZLaq', 100218, 100173);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100208, to_date('03-11-1983', 'dd-mm-yyyy'), 'jySdZjFJmZIcEcdXnOKOJeItQlLdLTWQNDcymgwEcpYOydMSBD', 100263, 100045);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100209, to_date('01-11-2014', 'dd-mm-yyyy'), 'YOwxBSMAbvXaYSFyUSIQMfmmaKDQSTkxPqpktyCOzMcWfwBJLd', 100381, 100110);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100210, to_date('05-11-2003', 'dd-mm-yyyy'), 'ugTDpsPFNjRFIwuIAjVeGDluCBVmXnapkEjXuKOrxuzYiiIKTE', 100171, 100315);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100211, to_date('15-07-2015', 'dd-mm-yyyy'), 'wEoDeNwnUlaWetlCeeNLQfYEUPDbOkzZRPfCGPplzLpwEqWzOS', 100360, 100255);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100212, to_date('14-11-2022', 'dd-mm-yyyy'), 'QvsPqEAhcDkXmhWOWjwPrGcbrmVCNcWBBtnnjDwmAbAahZWAMi', 100016, 100216);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100213, to_date('06-10-1994', 'dd-mm-yyyy'), 'mebOLBBtQzlLZoJvPAIURjGfSrAsyfWDRlJxkpVgROniiGVvSE', 100297, 100044);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100214, to_date('07-04-1981', 'dd-mm-yyyy'), 'yhelRCNUtceOtIqubpUcaPVfSWhnzPJsCAtexFFbZjUXNflISr', 100222, 100175);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100215, to_date('20-11-1973', 'dd-mm-yyyy'), 'hzCWjZsKsYUHAqAQkMjqPoqHplZfurjxJCUakfyqQLdPuJFzHG', 100384, 100316);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100216, to_date('11-04-1997', 'dd-mm-yyyy'), 'BvmTVmGACNzaYuMnjPStrKyygCaiXuxdhqcFPjHYnrXeevqfLv', 100132, 100211);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100217, to_date('11-09-2000', 'dd-mm-yyyy'), 'nVTcJeTliqyGvTKsQRibUGIHIfetMetCFZFOygOzhDDqvYkQZE', 100117, 100029);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100218, to_date('16-07-1988', 'dd-mm-yyyy'), 'bDMpyvMGQJtnWMmAtiSBaGGkYRoVtMMOBQXYgrXyVdHaOJViYP', 100060, 100236);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100219, to_date('06-09-2011', 'dd-mm-yyyy'), 'VKYoLashIyfXDaKiRtVspjNUvLgslKsSHbrJGuaHisjSFdlESq', 100320, 100131);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100220, to_date('04-06-2016', 'dd-mm-yyyy'), 'XERFlAuTnWhfXWPfweTdaeTagARIVJfEUQlUBEagjtGvVyLeqi', 100030, 100337);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100221, to_date('04-09-1977', 'dd-mm-yyyy'), 'FlNCAZlzOYbCfNGLdEXMxmlalbraZxXvXOxRvzkgIOxsUXIvBp', 100256, 100320);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100222, to_date('12-06-1975', 'dd-mm-yyyy'), 'tfgesWvEAkqdHimbXRdnfKYtimdqfZwNjfyTnBokKWnlmmussb', 100003, 100168);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100223, to_date('09-06-2002', 'dd-mm-yyyy'), 'YgikLtlgPMtGcbOFFeADHcoKslbVtmQtyQROSpSILOJlEZVvMT', 100220, 100164);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100224, to_date('10-01-2022', 'dd-mm-yyyy'), 'vbdgYblAovKVyAroUPeTgAepwmvnsXIdHkYDfCmYUuPvyFJUBX', 100231, 100325);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100225, to_date('31-08-1971', 'dd-mm-yyyy'), 'TXviMuJUoMytKyphrNfejCqjjTCvFclMABsIctcvZECArWLUZT', 100332, 100171);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100226, to_date('02-02-2024', 'dd-mm-yyyy'), 'KFVhqMClnIeaMgMnZOBJJXdnjAAHMHaBCagPtqCBxGjuABakbz', 100384, 100333);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100227, to_date('10-07-1988', 'dd-mm-yyyy'), 'zVZFdlhzEhgawTGiLOWnBICsvExuNkOSzDyjlxpwHuKMeqPHQi', 100005, 100080);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100228, to_date('27-08-2019', 'dd-mm-yyyy'), 'vjOWYDgTUyQnarlJWKxWPxtWolwZWgmuYFUwoEvNLwBMDjrBSG', 100127, 100329);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100229, to_date('17-12-2008', 'dd-mm-yyyy'), 'DmOPmALeQHsPYrxvFinicETkoHJOQkrOnWeSxbdwdmvedjLGPy', 100381, 100042);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100230, to_date('22-09-2001', 'dd-mm-yyyy'), 'OXjsUCemQmCdcaMpNtgqkStlatvuUYsDHJpXLfywIQXnDPmhTN', 100283, 100102);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100231, to_date('18-05-2016', 'dd-mm-yyyy'), 'cQTkyYKKFwJKJCOJKOsZFBRZPIKyKhzhUssbdINmnwKpSRCQic', 100006, 100114);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100232, to_date('07-02-2017', 'dd-mm-yyyy'), 'sUWGdcMoCMxMrtPGgZPrBcMHpkZtXSaPQEyGveUZqSwsnTVCxt', 100010, 100317);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100233, to_date('14-02-1998', 'dd-mm-yyyy'), 'FcECsbwMXEYNhsgmrNagchFloMeXBAVDeRRhoaBIXIgNwyCWxN', 100098, 100336);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100234, to_date('17-06-2012', 'dd-mm-yyyy'), 'ZuDkMCbsTqDnziErGDDwiUBlfVsAftpwdqELvOFWOQweZHDXnD', 100056, 100050);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100235, to_date('16-04-2021', 'dd-mm-yyyy'), 'VzIskAIKxXMAOMvxYmEkDZElQlHNzWIdxxeoLnyLTiIWlRRMaY', 100181, 100002);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100236, to_date('01-11-2003', 'dd-mm-yyyy'), 'WeIXBnuVwempBTigLWVfKHdOpAiPEueEfKXChyOMZqJNvGKvxy', 100055, 100077);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100237, to_date('02-06-1985', 'dd-mm-yyyy'), 'bGgrwUgQXkfHcdAtRRpJopuNaEDDrByrFcpCmKEhKlBHRTAKTE', 100026, 100148);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100238, to_date('17-10-2012', 'dd-mm-yyyy'), 'yonyXQSELegLHIAZJcAeHiQUZfMcAygfcvvyytsHYHgXbqEWae', 100211, 100215);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100239, to_date('07-11-1973', 'dd-mm-yyyy'), 'kEmioujcTBMOcwBfURvxdSUoNFOyMRWfHEsWNdzAZwUjkAMsxl', 100379, 100255);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100240, to_date('25-12-1997', 'dd-mm-yyyy'), 'jPBJMshWaClFXCCJKGSqIUeehgonOYruHoybvZuljvbuBYuHwS', 100084, 100120);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100241, to_date('21-11-1977', 'dd-mm-yyyy'), 'CwXkZhtKPdnkbLGpqgXCImKdOsbIcEczPMJIKbOLGoJwVfjLBG', 100122, 100358);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100242, to_date('09-05-1977', 'dd-mm-yyyy'), 'YUuKanoMsQZHgdWRrNTGOPQxXxvoPlpjoisxTPEQxGOlsPrubP', 100182, 100329);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100243, to_date('31-03-1995', 'dd-mm-yyyy'), 'OojVSaSxmANrsdChCIxfWqUYBAXpFroXdjetqUCZxXjtaXvina', 100100, 100041);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100244, to_date('30-09-2023', 'dd-mm-yyyy'), 'ncFHNqhAYJUxjjdEKwABOgUUZsVqFygbubfvIFvfbeYaktvweM', 100003, 100358);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100245, to_date('05-12-1984', 'dd-mm-yyyy'), 'ZXwyDSrTcIMiHgzXenEtWdWCiOloHoVpxvYkjmYlQHYCHqXwZz', 100180, 100240);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100246, to_date('13-01-2001', 'dd-mm-yyyy'), 'ajfysVlMxrAQOtzoxQHfSQHmYcjdTXZCkoFqfyYSHOeHYxlPJT', 100236, 100242);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100247, to_date('06-09-1986', 'dd-mm-yyyy'), 'bbGyLSkGzHWhxdgPdQhnNTzMQXuMOXxXddwnvqZYyngYsPfLSy', 100086, 100097);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100248, to_date('30-09-2006', 'dd-mm-yyyy'), 'lwWdXKnJrXHecQUyttLEzFIrMgndpVmPtfIbTVNAGpxvQQvhlR', 100062, 100148);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100249, to_date('04-06-2006', 'dd-mm-yyyy'), 'ycxIQIMAmwZujDUDjPJvODooLOqLlDFGRyGAujfZVSQAepntGK', 100006, 100362);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100250, to_date('22-12-1986', 'dd-mm-yyyy'), 'UWNqocASdPPkmjDFghSYbqSAuqvGsXJHxBFPOXnzJApgCbSmdS', 100187, 100196);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100251, to_date('22-07-1977', 'dd-mm-yyyy'), 'VVDhNclSoqJaNbVbAGLpCVdwbigpOrilnVPkrOkFxCFGmlCVYA', 100075, 100147);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100252, to_date('23-01-2016', 'dd-mm-yyyy'), 'ZtwXaiiyulLVwUFDECfXjBiJXaedGoaucNziRiSQYBVaJBfsqn', 100339, 100079);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100253, to_date('07-08-2020', 'dd-mm-yyyy'), 'fkBAIAfqkLwIAiCMdOSUqucFRKinAhqUEGBxNyLuxdUnlyQZpm', 100366, 100387);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100254, to_date('06-10-1972', 'dd-mm-yyyy'), 'VFGUurgAdLcvAUfUtBoitDBQsZyfULMBTmtvSkieKOqfcasKHJ', 100200, 100378);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100255, to_date('23-06-2004', 'dd-mm-yyyy'), 'oZSVZQqXaaLKEAXQTSSvvhdGNnlvPIGJnmeiSRmKJcjXlsTjqF', 100145, 100349);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100256, to_date('22-11-1992', 'dd-mm-yyyy'), 'buINoijVjUpCdziwpiipDcZqQbMPsBbxavqzagwYuVRhRjryXK', 100399, 100284);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100257, to_date('24-07-1999', 'dd-mm-yyyy'), 'xZheXwUYeFRLOyWmZYaMwFTMXRJOpzsirzeSHIGDvmDLlqapOR', 100348, 100302);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100258, to_date('30-11-1996', 'dd-mm-yyyy'), 'QMCKPmHAMLBPZaugWEpThJxuEXahfyhhjPXvcxAStOWsDXEuKw', 100331, 100211);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100259, to_date('13-08-2013', 'dd-mm-yyyy'), 'ZdMBedQiiMfmETLRFnQKxGksDzceMCAGohfCswnfMZXiKRVsEJ', 100042, 100219);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100260, to_date('27-07-1981', 'dd-mm-yyyy'), 'EHQyfwWxQrgZWXyTJRrOYwqMWEbEvdwCmXCAjeLVKIjtXqEpIC', 100152, 100204);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100261, to_date('12-02-2014', 'dd-mm-yyyy'), 'ZgDdgQqTgltTGsnqywIXpkCCBcFEbKNRnhmpvLwyWmzWLDSIzG', 100361, 100308);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100262, to_date('20-02-1990', 'dd-mm-yyyy'), 'pqjQBBCsKhUcrSPzEWlYFCpgvbNXZDVFayzviByilsagyiEsQk', 100132, 100036);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100263, to_date('22-08-1970', 'dd-mm-yyyy'), 'nAsmybCzgoyUUEcppMnQGeKrXBaSTcOREoNrUhXPNduCWNzZVV', 100063, 100343);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100264, to_date('27-02-1988', 'dd-mm-yyyy'), 'SQCTkKKGGyIiAuptSKavcnvisqSXWlzbMnttNSYiNDEdxOWzrm', 100061, 100231);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100265, to_date('14-11-2015', 'dd-mm-yyyy'), 'oKIApEPdwAqseiHkpCuVvFMngNqPIbGPUsAXUwMDnKEHTRVbvF', 100305, 100261);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100266, to_date('23-01-2012', 'dd-mm-yyyy'), 'RtEOsEBunxaqwxJZQZrsnngKDnBGLoLCQtbpWudUmgznQyWPQa', 100383, 100144);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100267, to_date('20-09-1982', 'dd-mm-yyyy'), 'CVfopeXTqFQHipZNzhbBaYUfyYgOOUNunXdilPIvAUoEigKPIq', 100174, 100238);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100268, to_date('01-09-1995', 'dd-mm-yyyy'), 'KTDeyEFgbqYDtpQbJTmFmKBGOtXwQpUJJfVcItRbHNhuurrLBF', 100047, 100206);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100269, to_date('16-02-1982', 'dd-mm-yyyy'), 'orjCVJXTMtAZKDiLqfZQlgVXzIJGIhgtqbVseFDBLGHfUAHIbx', 100077, 100011);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100270, to_date('15-09-2004', 'dd-mm-yyyy'), 'hSKpbxczSHjFqjPDTJUVjiywURVRsaBNMemzAtIXxgpXBkvbPP', 100228, 100216);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100271, to_date('23-12-2015', 'dd-mm-yyyy'), 'brPfJISwWfOrQxfnBGddGmJtUqrQVVEPHaTWHyMmOdzjsegQsb', 100327, 100151);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100272, to_date('06-10-1992', 'dd-mm-yyyy'), 'vYxPnGKFChAkJstPBDOaqUFcZFWkUZhVTRRIdwDgOVDfCgBXeX', 100104, 100228);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100273, to_date('25-02-1982', 'dd-mm-yyyy'), 'uupaMMCugHDkKNOjLTsxKgOWvAmIjmBIwivpybOIvrmEFVRPyp', 100149, 100112);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100274, to_date('16-04-1975', 'dd-mm-yyyy'), 'JfqHPrcRdSzYmnTqHUYDiTzlsNCkfbplhXVNznPMHHypMWxDME', 100357, 100243);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100275, to_date('12-02-2018', 'dd-mm-yyyy'), 'peIrCopDhaHaWpNPquFtRFZrogZUccicVrESTItGRsDlSVYaym', 100333, 100335);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100276, to_date('05-03-1979', 'dd-mm-yyyy'), 'oEwDYRsZKXrDUCHEUkdEMjpRJYlZSToYxjzdNmGFOmUIxtILMR', 100372, 100299);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100277, to_date('06-10-1993', 'dd-mm-yyyy'), 'DBxIkwPxkVmpljxtTfMjvTGrPQkbwerPgtXUjakJxGeaLpmdzm', 100142, 100201);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100278, to_date('24-07-2017', 'dd-mm-yyyy'), 'KuKnjZxAGLhLFjKiDMvKyvdchmeGKEckrvxBrlzENdqumPQQLd', 100022, 100380);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100279, to_date('26-08-1983', 'dd-mm-yyyy'), 'cMZPSerNOQpFpLIYGjLPRGnIYYphpuPzpQAKxLxBHduaBUWdbo', 100142, 100116);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100280, to_date('19-10-2009', 'dd-mm-yyyy'), 'hDIuUagCCaTWnfiYHERJxgZtTWoMUQxyAMQOcpbtGgNDPjmano', 100363, 100078);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100281, to_date('19-05-1989', 'dd-mm-yyyy'), 'RmSzEKSAvZVhjfkaiFEuLYNOoQChAjkVMgikGbNTpPnzatrFOK', 100009, 100197);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100282, to_date('24-12-1972', 'dd-mm-yyyy'), 'OAXqEpSsoPtArjTTycwTWYJIikkCStbwNGexMTYfrLuuUdcXWx', 100215, 100386);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100283, to_date('22-11-2018', 'dd-mm-yyyy'), 'yHCwlIOpluOopeLAgnTbrTWmEBQYAaeDfJRjeDJkiyZCMixpLX', 100310, 100006);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100284, to_date('29-07-1991', 'dd-mm-yyyy'), 'XfaCieblXVfutILnyHFogdXKmNwGNvSANFoeuWcxxXlxsKDQPQ', 100192, 100000);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100285, to_date('25-03-1974', 'dd-mm-yyyy'), 'PLdBPLdqwUvCLAbiHGdYkvUTdUbTXbqVxzGPHEirRooKlxsTWv', 100270, 100051);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100286, to_date('19-03-2010', 'dd-mm-yyyy'), 'bfFsxMRuLVucOMsqcIMiOXzizBNFtwuEqUsiPSSMyMxPvtgCYn', 100225, 100223);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100287, to_date('08-11-1971', 'dd-mm-yyyy'), 'QXIiVsapZpnEvbozroDHpBrRbaCqfDJuNfAZgzSdiRVAWNiZOQ', 100231, 100142);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100288, to_date('29-04-2020', 'dd-mm-yyyy'), 'nPWyBXhbIWpFBbDCPkcMRfPtaPVBJvieLXpRpHdsVaaddYnTTm', 100129, 100154);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100289, to_date('28-03-2010', 'dd-mm-yyyy'), 'OGRmslLFhKbfTsiQBKfjTvdaMBHZUgMIgQlPhONxXPbWRShUeZ', 100186, 100048);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100290, to_date('24-05-1996', 'dd-mm-yyyy'), 'PLfteBwuYnuohxNbWdeKIuebqFxnhrOxsEagpzHVsOLlEofxuS', 100232, 100176);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100291, to_date('04-02-1980', 'dd-mm-yyyy'), 'wVWxefvFKwBjWHemLWnNpPSILBRfIenDgcYnNKIUGJkZaBYJfz', 100351, 100314);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100292, to_date('26-01-2022', 'dd-mm-yyyy'), 'drOAXJpFMBBlCUKgSTNUuDdkKSpXiTxULcgjUssDspALMBmDQL', 100272, 100393);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100293, to_date('08-12-1977', 'dd-mm-yyyy'), 'ZKNaUgRAmKphZPMEcThMZxoSeobKgrTVEQQDQYvBSaVaIZwzbx', 100382, 100075);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100294, to_date('25-01-1984', 'dd-mm-yyyy'), 'jPuYKTsxqkEfaecsUPNKBGyWyzzAJusKouEQkQahfzbXdyHjnS', 100056, 100247);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100295, to_date('08-11-1985', 'dd-mm-yyyy'), 'YzEtbYuduXcrVXrUKAnYhhYiGMkvDApWVQOGKRiNtTvjGWHqBy', 100348, 100320);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100296, to_date('30-01-1981', 'dd-mm-yyyy'), 'jIkVeDIEDVhsmIKVMGBwvBQPjLImMVSRkFzqgtIVZUXGNzvjSl', 100123, 100301);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100297, to_date('18-03-2007', 'dd-mm-yyyy'), 'FThbYvKiSoXFAtnZNqcfsCSrBepZypMrzXVfXlKjWyVKWjQELN', 100182, 100375);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100298, to_date('28-05-2015', 'dd-mm-yyyy'), 'fhIPFZfBmKaCwKhqYvaeDjXNqBCOrTDvSHbFYYpKSDHNMjQlzy', 100330, 100122);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100299, to_date('14-12-2008', 'dd-mm-yyyy'), 'TXOnCquvMFtotLZwXgKpanarRMhQOoDCoQIeDCBKFiOfQVAbPA', 100390, 100347);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100300, to_date('29-12-1975', 'dd-mm-yyyy'), 'nGxZcoEoNbiZnIgjbOsLlJuiugnqxJQrAqpNMDFodRqRwEffVr', 100021, 100055);
commit;
prompt 300 records committed...
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100301, to_date('09-07-1970', 'dd-mm-yyyy'), 'GTPtETSHFiLHXShpTZxMwzTeMpLUYzVfHFfCpaQbBKztsvbGEF', 100072, 100282);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100302, to_date('16-02-1987', 'dd-mm-yyyy'), 'qmwqUBSteslPnidRPibSwMmACCsoXwwAfLprVMwQgyjsnlnsnc', 100351, 100248);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100303, to_date('08-03-1993', 'dd-mm-yyyy'), 'nWUgqdkadwoBohfbWxWYNgtFxOmziKuAVegkPNLIwSqMLeQvBU', 100067, 100341);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100304, to_date('27-03-1988', 'dd-mm-yyyy'), 'XFGLeReneCtMEkiiDOmkFTIDvpMmjGipRyqWRprocCzeVgdTGv', 100127, 100097);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100305, to_date('13-09-2008', 'dd-mm-yyyy'), 'DaDZVKXceeYOnDoHslneEAGnAjICZUHgUtaFLyBbqmmYKEalQy', 100292, 100049);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100306, to_date('04-01-2005', 'dd-mm-yyyy'), 'bbohkRFjNVGdYGsAWYNSNJtbhqHdhHNwrJPASagvoYDKUBKLnf', 100372, 100004);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100307, to_date('13-06-1979', 'dd-mm-yyyy'), 'woEiTkxyVvTBBvxrKcOLKaVuiqzcmhcIGptsfrPWXSxiiBbVSp', 100330, 100122);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100308, to_date('04-02-1979', 'dd-mm-yyyy'), 'uKdwRaHaBgyiEtRbbLwVGgLfaIiVrIHjDLoreYGMwFWScESwHN', 100031, 100142);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100309, to_date('03-01-2020', 'dd-mm-yyyy'), 'GERTHWjDITDuIDCmsyUSfcMnrajmiSvoAdmqiQeMaAxYQwhZkb', 100276, 100217);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100310, to_date('23-06-1990', 'dd-mm-yyyy'), 'ybBrnhqAGIlOXXLUswYcJNtRbSLdJqeqdZTrbNKCFhQJcUtpaZ', 100290, 100323);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100311, to_date('12-02-1982', 'dd-mm-yyyy'), 'ThtdWtOuGAzOcdjQhLmIWkOpdGSTcxBbgBoGJyPosMtBAeaEcS', 100313, 100240);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100312, to_date('17-05-2023', 'dd-mm-yyyy'), 'HdCiyhjqvjmtvvnJfntYhVjuJhTKpXvIJdQjZCKhfBVWHHMtiv', 100176, 100092);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100313, to_date('26-07-1991', 'dd-mm-yyyy'), 'VMMdEddFVNHnyGQMHTENNicsORDXHQpMnwTLUqbbuxwhcyHZLu', 100102, 100133);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100314, to_date('04-11-2019', 'dd-mm-yyyy'), 'CLjgydfDkvpgFUYNJAiJlkqFrfdLsXbdxtMTCIvCWnrwxvnxUE', 100285, 100002);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100315, to_date('26-04-2003', 'dd-mm-yyyy'), 'rOMZbeJNgcNOQfvKhuNWawSyEVyotzkQWXTKoZxIpMByubqUIH', 100326, 100136);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100316, to_date('12-07-1989', 'dd-mm-yyyy'), 'GhnQqmjMWQJbLoooNuuEqfjnQBEelWvHcaPvXvvZDabWjXXGQt', 100253, 100145);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100317, to_date('22-08-2021', 'dd-mm-yyyy'), 'VBDCCGduXNdVpxwoByvbyoULyFXMjethscosmzuRGCqQhVjwxi', 100245, 100081);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100318, to_date('05-04-2010', 'dd-mm-yyyy'), 'VOStwehYyJbOfFTEWZazdoFfdoclIWvFpIPvfWomfAUYiQnvya', 100297, 100072);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100319, to_date('03-12-1996', 'dd-mm-yyyy'), 'AXRwFPolRoRlgTebXGzXvbdLhJOoqxDsUkzCQXhbgVJfaYgYuM', 100053, 100264);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100320, to_date('23-09-1993', 'dd-mm-yyyy'), 'MVUtmFFhWNOGRhRZRppTwqRlnImpNMlXrxeLocruXRPiDhnhlv', 100056, 100131);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100321, to_date('02-11-1991', 'dd-mm-yyyy'), 'kzOhCVpiSdvTyVqhXUpcbOzSmkdlmxMPjoyAHmnUhyEtbOPBZW', 100296, 100348);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100322, to_date('19-04-2005', 'dd-mm-yyyy'), 'TwPxITlqacVUkyMWCInOyVpqZCUSEPeOoggeHeleshdWvCujPe', 100066, 100398);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100323, to_date('22-03-1994', 'dd-mm-yyyy'), 'DEcguYfDCdgIkszxcamvzxlnzKSNkVhaSTdkdZZDqbacsthukD', 100369, 100032);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100324, to_date('01-04-1992', 'dd-mm-yyyy'), 'rcDszJVUybUKynEeHjFAhJDvNvLmbBXcvucuaaEwCHAyXLJxHV', 100056, 100070);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100325, to_date('06-09-1999', 'dd-mm-yyyy'), 'rSNICfQATiKlyvzkyXeNSrYNtwjHMsVgGxmTOGDPXMmOZQOybB', 100281, 100110);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100326, to_date('05-05-1970', 'dd-mm-yyyy'), 'BsjNzaPGrrffxGvRYVJVmGAPlPYIcZabGMtfEPQKLKNuhtIVYh', 100388, 100017);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100327, to_date('01-02-2006', 'dd-mm-yyyy'), 'xrusvjbDNdFSHMjnpPCnyKTjykauRFneBUiLiKEChJvvjhaAuc', 100009, 100175);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100328, to_date('02-04-1985', 'dd-mm-yyyy'), 'rexHmgxPeXRjZwkedmVArXhEunKANVAifqrCgNoVGSoXgRpvCf', 100121, 100038);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100329, to_date('22-04-2004', 'dd-mm-yyyy'), 'bEQZijiOIJKXZOHvGHTYqfzbiXSBCZohJznKIUIFVuojcTDjVN', 100205, 100059);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100330, to_date('25-04-2019', 'dd-mm-yyyy'), 'spipcpunKkbYeYMCPDCrLpoeZROoapMxvWKDYNNwDRTwTxpxdv', 100397, 100248);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100331, to_date('01-03-2020', 'dd-mm-yyyy'), 'AOmqzvUvlffWhcupZsAEDqgEvfAArVbStuvJlUVlXGGVsnwqvj', 100168, 100380);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100332, to_date('06-01-1995', 'dd-mm-yyyy'), 'xzdgzJfDCgBWLkyrdzaswIWRruVDVyStPVHGdkRfXWqwrIDbPT', 100371, 100069);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100333, to_date('29-11-1993', 'dd-mm-yyyy'), 'QGLWALsqVpmuLePwHvLjTJYHXpmparpWhdJOENWmcAxLPIhvBF', 100395, 100161);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100334, to_date('13-05-2014', 'dd-mm-yyyy'), 'TihPssUfZuUuybsbGKRJNRInsegmnokBlJZGcQlFQpxeRheJAy', 100140, 100386);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100335, to_date('16-05-1998', 'dd-mm-yyyy'), 'bEIlPJqKfaZRdkocqyMDQnmCrUGptgWWKAZGNGepItkbMFWcLQ', 100371, 100082);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100336, to_date('17-07-1980', 'dd-mm-yyyy'), 'SUvQpyrnpqnuVMzAGVIPqflNtOlonmpnqJBnQVmbbjcWUPgHxJ', 100389, 100398);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100337, to_date('08-04-1984', 'dd-mm-yyyy'), 'qIllaJYbtmaYlEvAjBLFITIKdftrbtpMXcBdZwLvYXZDHpxzZe', 100091, 100179);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100338, to_date('13-03-1995', 'dd-mm-yyyy'), 'lhaHojcWDIZAKWABPITyBQzxISiJqtgSYlwrWPQrJRZqelTNxZ', 100301, 100305);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100339, to_date('29-05-1975', 'dd-mm-yyyy'), 'zLqzlgvONqCImQkRVRgejKQFlhQjOmSKLiOzOxCJiBdtWVLrKb', 100227, 100140);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100340, to_date('20-10-1992', 'dd-mm-yyyy'), 'fgnfdKYSYzuYlMSyqMmcjlMEwiSxJpMmgArquohPaJGGgwVzhk', 100106, 100034);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100341, to_date('23-06-1992', 'dd-mm-yyyy'), 'ZTlaMBMpEGOKmxEuMMpeIUondFIczaPccXmIfqXlEGcdERSLON', 100337, 100246);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100342, to_date('20-11-1973', 'dd-mm-yyyy'), 'bjBnNpTjSrJzKwgLYCMmyKZMsDjgsaejcFUUzIOSbwWcXpLqYY', 100053, 100316);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100343, to_date('17-08-1980', 'dd-mm-yyyy'), 'biCrKNNDAESIMZaxOXDmgLRXzmrNYWHeQGJusyLytWbDkpfaAS', 100292, 100163);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100344, to_date('25-03-1990', 'dd-mm-yyyy'), 'guJqqQaNhhwrSfLoqzqfCMbRjTbfjrOsVJFFnmJaDKaURNJWII', 100110, 100327);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100345, to_date('05-10-1989', 'dd-mm-yyyy'), 'rzttHqMZTXxnksYSdgTSSHIFQdaRgXKEedswZQuPdJCLwhDCYe', 100051, 100279);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100346, to_date('22-03-1981', 'dd-mm-yyyy'), 'isapvoEuzQaZcDCSlQCOCnfSkfLcsiIETMwXEuiOVQeizuQvuJ', 100251, 100074);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100347, to_date('18-04-2003', 'dd-mm-yyyy'), 'KCIyikJGsNjcMccWvkFCcQEhjdAUDEYUztHPgcnNnjnzgawFYM', 100003, 100130);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100348, to_date('16-09-2001', 'dd-mm-yyyy'), 'MBSBegPXVaXHPMVgWmBCTFhfumFTDfYCGSiRJuJQXjUQOJOTib', 100173, 100184);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100349, to_date('27-08-2020', 'dd-mm-yyyy'), 'tSJJEcGBLpOfdEPwVLNdGbquBKVHBUoWdzKBJHxEJWxJzJdaqs', 100049, 100022);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100350, to_date('27-09-1997', 'dd-mm-yyyy'), 'eWnZvEaakrKWwCBgnJnHDIzrOQRuajhVtKGOUEheJdEQUmePPl', 100335, 100374);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100351, to_date('24-11-2006', 'dd-mm-yyyy'), 'gjSUGZqqQbppbWTXPNRwcpfhDzUqFisxSocEhmfaPpijoSodPd', 100260, 100282);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100352, to_date('24-12-1995', 'dd-mm-yyyy'), 'fJxXQXvfwsfjCBYTiOesREujheWfAlYohwZPZIsVYqyDIJnVkL', 100394, 100322);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100353, to_date('11-02-1993', 'dd-mm-yyyy'), 'UfBubWALzKBXUDaIrRFOAQJghWkBfVOMygLgQzYVsPaSSSsDNL', 100225, 100071);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100354, to_date('11-03-2021', 'dd-mm-yyyy'), 'naOLaoHHcLesQBqucqNYSwjQepiAhGZCYKgrwSldcSSYFUQrbY', 100337, 100010);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100355, to_date('27-06-1990', 'dd-mm-yyyy'), 'tFKXiJpqFaSxpWXtROMIptacoaLFtVEZAZaJpQlXxNWpOmcVYL', 100278, 100250);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100356, to_date('30-05-2002', 'dd-mm-yyyy'), 'vlIxxScwKPRJgHWrGEjrzRLniTDwmMkQnnKLdgnHAmqnYAmPCB', 100360, 100304);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100357, to_date('20-01-1991', 'dd-mm-yyyy'), 'mOeXQjpwpvYtSZfzatZkIqDRjsBVlxnzvxUcMOrPPuOgxCgCNF', 100249, 100324);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100358, to_date('06-01-1994', 'dd-mm-yyyy'), 'JzTyJJYKiBtZNoUFBtiMjPbRNKMOzFHfgZqEUGgRGfFWmQAQwB', 100393, 100101);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100359, to_date('10-04-1995', 'dd-mm-yyyy'), 'XnZchwHxwGbdCJsWUOAbWmrflfAvadTpYNAtxQhqbuicYvMMEI', 100068, 100138);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100360, to_date('11-03-1989', 'dd-mm-yyyy'), 'CpXvSpKDKlQNAFmARCzdlvTqULUCdJzFwbLvBJVVjvgDCsooYj', 100269, 100090);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100361, to_date('08-07-1976', 'dd-mm-yyyy'), 'dKftUaatYqdtZVxjbiTsuvrwPOwKcXhCIRjMyENYHMIqBOZUjd', 100075, 100160);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100362, to_date('24-06-2022', 'dd-mm-yyyy'), 'KpcWdrEESrNKjbTzqTGMLnMjPdifwiEWGpkhMOsKqFeFDxQVFL', 100179, 100349);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100363, to_date('10-04-1976', 'dd-mm-yyyy'), 'tMtnmuIkwaIhGHVMyUggoCGMrxdpqKIfdMuUVQbNohuftsziyp', 100321, 100133);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100364, to_date('03-09-2017', 'dd-mm-yyyy'), 'wxNGbDKIHphczzwhQGSNsKMKOQwGwrlLwAWxIlFjIZOWVOZBtH', 100091, 100133);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100365, to_date('03-03-1999', 'dd-mm-yyyy'), 'uqUUAsjaIDAOqDMbaLDpOUzeXoWKXXJVzVqgEoxwOVJvsQCVas', 100029, 100286);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100366, to_date('13-07-1977', 'dd-mm-yyyy'), 'FqkvnGTpTDrMnykzaAXlWuHCUoRrIpAGEJXaIgjscJExCIvRKE', 100132, 100150);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100367, to_date('03-06-1995', 'dd-mm-yyyy'), 'xVMFMwwWkfqIdtCOfeMFIJeEmyNPjoFoThVzAEqKCFPSXNyksK', 100089, 100312);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100368, to_date('04-04-2017', 'dd-mm-yyyy'), 'oidSOZytcUNjuIqapwmukOJnfDSvjrWRNLopabmSAEtcBDmIvo', 100336, 100198);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100369, to_date('26-08-1986', 'dd-mm-yyyy'), 'dOwjvzsfJGWsDEyqHRytjOKnbgjoLhLPFVbQkxwgFTaZTwEEsU', 100308, 100102);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100370, to_date('08-11-2021', 'dd-mm-yyyy'), 'eiFqhPAcGbRUANrIyGdmlSEIdenAKXVWIPqYGvOPcVVYloplND', 100329, 100368);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100371, to_date('03-03-2013', 'dd-mm-yyyy'), 'rxABjErbNRitkLIDuOEZxCiPQBdAKSbfwtYQUWiQKZkWYPNGch', 100223, 100295);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100372, to_date('01-02-2017', 'dd-mm-yyyy'), 'SlnlobTUSsYKQOtuXdTslbQkyzybOtrXfQndnQwYwYwQRrXobN', 100171, 100148);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100373, to_date('10-02-1992', 'dd-mm-yyyy'), 'BMcGJLiHFTLweBVDKuugnHgcQlbKqXfqlNJMUjlNNpsWINfTVP', 100118, 100039);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100374, to_date('24-05-2001', 'dd-mm-yyyy'), 'kETzFzXcCwdVXZpoTaGXalxXmDstlcvmQSpzjCZPakSdHFRODt', 100352, 100150);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100375, to_date('08-07-2009', 'dd-mm-yyyy'), 'tWVdClEXNhILnTvpjVVLjXAUveiHYHyegVcypdAylJMFwMDOcN', 100287, 100244);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100376, to_date('12-09-1984', 'dd-mm-yyyy'), 'EztEtHMVOAoBhvQuXRzyvkThYuCnYvSvvMSCxXJcuTlTJPhTfm', 100139, 100277);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100377, to_date('23-09-2018', 'dd-mm-yyyy'), 'OmqZBlBVMmeTDoGApeeWIQGOwJbmaRmizJWQAnhXxYdLzNqGEi', 100023, 100263);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100378, to_date('13-08-2012', 'dd-mm-yyyy'), 'pqrNJScBmXyQnrtytFUrQHHIdhQUFSPZEgQljiXMYaNuFhuPNE', 100003, 100383);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100379, to_date('09-05-2000', 'dd-mm-yyyy'), 'eUrRnDNLHeqXTryBiCYpYQxKqwtLcvvCKLMmHNlZmFQtQIVMKE', 100159, 100326);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100380, to_date('13-10-2011', 'dd-mm-yyyy'), 'ETVusGvftVCcXBevqipoxzALOGJSfVicWmuxovRkOejzNGGnlA', 100274, 100111);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100381, to_date('06-02-1997', 'dd-mm-yyyy'), 'hqIZJzOPuEcqSnSkeGRtUDjFRHXfFkMqTzBOHeGFxzVOcfGsTx', 100028, 100127);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100382, to_date('14-10-1986', 'dd-mm-yyyy'), 'eqlsRTvVOueejGJPnALlszdRZSWREVrXIaJelQCoarxHTAIagr', 100250, 100339);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100383, to_date('24-08-1989', 'dd-mm-yyyy'), 'YCFOgbgdBEUltSFrwVmsfbwFrRUbmgZZwMopUNanHyjLLsZAqs', 100208, 100065);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100384, to_date('06-03-2008', 'dd-mm-yyyy'), 'rqykzyvYPQNqkkuOpKhPeRLEMzXqdZYfgpcHYfhmAbTDbhHUoq', 100230, 100124);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100385, to_date('20-01-2021', 'dd-mm-yyyy'), 'RAAGCCEGkFcBwYfMoxFrBXfjLcWdrEgyBSTerFpzYWICXWfPXm', 100392, 100229);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100386, to_date('14-01-1980', 'dd-mm-yyyy'), 'iwqYhjIFTrpjjCmBvmNxaYrlWZBvZjRceHPCGNEAQUnmGxszwu', 100252, 100223);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100387, to_date('18-12-2007', 'dd-mm-yyyy'), 'zDYpHdroeJHFphNEzHSmkAnMkYQhscDobQrorgAoDkPETQPRMe', 100356, 100111);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100388, to_date('19-07-2012', 'dd-mm-yyyy'), 'BcfHzPxwkjvDpJlEJpytSuFaTECXnCCEFxYPjrXTyUibANiJhu', 100251, 100263);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100389, to_date('13-03-1980', 'dd-mm-yyyy'), 'DcmnyBoIwafsSRrwscWIaKUXwcJwejHasveIzmKTuTcAjaQDHO', 100055, 100284);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100390, to_date('10-02-2019', 'dd-mm-yyyy'), 'ufmUYjUectFjiHbSfGDxptAPyuHBqpOnYEjjbvJYKjLGfJGvzu', 100145, 100247);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100391, to_date('31-03-1987', 'dd-mm-yyyy'), 'cVhfUUUCVYacQcdPPmDBPIkrHrFnoFwWSXbmWqDAUkyjtosdHH', 100082, 100066);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100392, to_date('14-03-2003', 'dd-mm-yyyy'), 'knsENZNafArDnuNMbozLCGnnJxpZfoTeAXqYRdLKpcBEmMIfvg', 100289, 100345);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100393, to_date('07-01-1996', 'dd-mm-yyyy'), 'UvVTdfKJDahvetJZcAPAMNQfCJZodAoEbmdzUAQBstdqIfUjSR', 100058, 100299);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100394, to_date('17-06-1970', 'dd-mm-yyyy'), 'tudJStvwwuSGaBzRZWCeUfgYzMqKelaqCjArcPMSQZvQqPgpEB', 100193, 100203);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100395, to_date('19-03-2012', 'dd-mm-yyyy'), 'qhYjScGinfzPQaRxBfhRArbQGrfPcrkYOAalECrqrzZOrpCPwQ', 100341, 100005);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100396, to_date('21-01-2006', 'dd-mm-yyyy'), 'egwFkSansDqTOHqrFwQHsQpVEnqsZPIRxLVABCkPzfiNUWqVfk', 100141, 100098);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100397, to_date('13-02-2009', 'dd-mm-yyyy'), 'zhzdipFOACWLiJXQSXwsFzZBSbVDBksJSbePkGDPloYjCSFDRq', 100230, 100227);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100398, to_date('16-01-1999', 'dd-mm-yyyy'), 'arhCvxmdSPdKxSYSootuxgGTnOHZOJxDnKcWWPvTPEHEBdFBxz', 100292, 100369);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100399, to_date('28-03-2020', 'dd-mm-yyyy'), 'ydkVLujPbkGhmzBrOOJxHMFtOtWTdnlBcGmETjeJqTUCccgerG', 100319, 100129);
insert into APPOINTMENT (appointment_id, appointment_date, reason_for_visit, patient_id, doctor_id)
values (100000, to_date('08-04-1972', 'dd-mm-yyyy'), 'hBVbLaviIhoapaRlcCeXWJzdLgrRRuqcAPmBrbyfykWWDOQEcD', 100188, 100218);
commit;
prompt 400 records loaded
prompt Loading MEDICALRECORD...
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100001, 'HKgmHVIvPrKwDZaeBNxUoFZTQpAmcTZyPracgwuccMDBPPrZuB', 'qMKliFJieWnFOLnnzgxFjKHGNSmiZKkObOQuMHHGpnPFSSNXRVxFHhaypypSrRDPNDAJevkfvlfsgBkadojDQSUQcuKpGMhnnyIz', 'nLgpHyLdAvdzUQyMjXphTPYdDZXGrNYPkTBuoFpiiMdOyGTbfUwQYYXwfFanzGXsdkWyVRtOwFOJzDXtsOCxiSmUNuDOykAbgELC', 'PNhaiTfnHaoZhPwSCcorqCOZbYKNtqXJoYrhhzHXLgefYnUjBF', 100327);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100002, 'LZxLUmEygeJjeRsILNLJyvgVjNmjoYlXsHKlHdRWnpXaaJnGkn', 'JeBdGHHmdpGbUFOGVozcVSdgawFmaPYDnnSCzyXgKpCfviMIbXgmYOMytENLSFJKGjIvZJAKBKJuCbNHNYsMcTiiOVQVuldGmfDn', 'YNBCtkDwAFXdUOwUvjSaDmvRTCseHVCmDqMiPDGMEVciDrURzjhdgeZeAvRwGvPsLndvxuLIHPBecsTVmBDKdMElngJldsgWVhzY', 'ogEGajzqFeCcqJNLgAGYlQVbIylvBbCmmMAnzbXifPXtPMDvch', 100089);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100003, 'WnKuBmLwjdLbgAsHZYtcAVlaqnjmXqdfrFGTWwodPojfEOLfzV', 'DeyvkRbzomkPSEFYrsIHWfxpAjfbBeJaDRazNzIyCOBtyfcJKRzeqMdxyGHDbdJwEEoCzTHCjhlPuFamIOeMaboqBlTApCMiYdLo', 'aBrlKdzNOgyrQpMjuRDltCzdAGckuxXNWqzFxnzhPKcYqbSsHbzhkELIhDNeYvvBiSdgMijWYCZmHetBPmkckkjvtnqJoLdQRXrG', 'gprloMsWuafShORMUrDrmcYVDjDBCSxZvCTXSBcfnMEfJprXnQ', 100088);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100004, 'IRLPvoICQzrBIkGMJrGoukmmauVNDmhpltSGLXyuHaSkXtlBFS', 'ahwbtpLnalhhbFXdKRQnjVvtNQeevMrEramdSMpwGuNVMaTFurKVDpADTslTHoPOFMkegrIhJbZjvLuwQXjzjSmMxHnLBVtVIYQM', 'UOGRyiAQohbLQJlBXYHxdpKwwmsURPCONmAKXgSbjZpWxpLPBZwfgbCflSIVPmQqLHEhTxBebnjTEUpjYNOFXziyHRcPjBlZbSGb', 'JgJSQHDMBIjUskIpdcmoicGnvxPFpwLoMwoebvTVyDqoqroufZ', 100019);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100005, 'zhovXNwGVSJWLYdaTnXKZLiIwWuWMqxheUwIpVmtbwUxCWmqVi', 'zTzpesDDQaIVqpfeqEQEPxQLABSImImnPwJIJwgmNgMrugnBdsOViFZxKpMqlriWzvANnrnnMzwcODEbQIwpZOTThedAlbbWETol', 'GIDdvDdwQIcqcNsSfbbXkgYSFewymJFopMogdoYdIdVJbbkrWrfmRfcdhmdcTadSLdCJupBJbixmfuphPeuQYmzuzLWbadpsAich', 'ebGLNtVBuBzFcaSJmMvungjeQCiagadTEuwCxshLgrfFsarRhH', 100178);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100006, 'uJlFutBrseWNtCqSzoxseZFGugefgbQCIITbfbBjvITFOJPEQe', 'SqdbmhGkJUJCnsrEhsVHghnQCoOAokKrBaCVhSCCdSFjulwJjTMwnMiEAZwaCBrUlwuHrUlJjCnxQCUuxClkwdXSIJUhwYJRJolV', 'ZyuLoRXiPgWvpEosrXMQyGFTiGVWzZUFWnbzurNzuZuzopVibPdRwdDrdlqxNjdloiikEvXQWLwJPXHNqifQQSwAZTPtphmBXnYR', 'YHbDpjGLykNKswYCWIHkeHVCzBvcDOsGCQqJcFKVtZFfhFAUjO', 100184);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100007, 'llkbpCPzpUcjqhvmhlfWmTjznaYvJhpCmTjmzSLvgbZqweUREt', 'rcdAzJEfEIBdwcALGwFCyFHQXlXBxvdWVCDIMTOvKYsIFIoPTSbObvfFglDGmQSEEhqFUgsApstvEJstPEvbtcmPVKCAIdQHLnGJ', 'DYWiKfbmOEisgmlKfumolfeeixhHZimJgidXmBXWbnmTxHmAfhZnRVSjjgUhTtcjiSUwDEOoahzCWpwTQaYRSIDOmRAwhEDizssb', 'FYXsHlGleWbjFkqaouUOQCydpOimtHCsyMcGngralbMbMFDJcN', 100316);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100008, 'oZjiTiyVjSkuCgcicbUWpRxRdzqtPhmfYwUOlvKpXbdblYfusB', 'TqWeAalLkkYYOaalXoYpHHFVtizbZUUipUcAxYsEUqQxMBEXyfEGvJdpJmCdCneCKgZnHKYRPPuGbiymUapgLVBsRROCplkIJvMl', 'WUoVaRejtVPzrgkrHRvetDRVKDtRzKXbfTrMgOuziRRhoufPAqsPZuAvxQSLkHeqULFkGFxuXLjnBWIlDPkGJQcOvwPDEeMzPGBn', 'SzofeVZLYPKdpoTvaSmvORgPZeAnvtWkdUTqXMgoSEfIegxfLD', 100310);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100009, 'bNSChzpJbSpGtojAEmaojGLFyHggLdSlJUdAxMKDtsfrmvWGvs', 'YERvuPDNLlGkTmjeMhFQpwiVDlSBpumYqVfXpFWoZFnMxGYDepzghWoQoVnMMLTymihzQywYLYXqpWadWcdeevEfFJlcYhcffHaS', 'YTqdecLSwHoyyPSQeiobEDpvonUIjiRCgVtJNuxHosnlQqumvkLvnffakHoywIwdxFUhXAzVAykuHzmhpidSPLRJoDsIDbhcPsYj', 'NqsnXBRzSYXCNmVBjWaALxWdFvofMkWekWdJNdTueNHDtoEtCB', 100264);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100010, 'WxhKsChYQZqfvoGoAdgjMMteFClbawPuhmUMTpUxyevgaZALtZ', 'gxcMdbpVPbgkuSkToeNBBmPGZVdDJBsttpdzgVeZWpPNDhEOrjtKJHlJekhNHcVvmiHjZOnSEhKsFwOZMgecynoAlUbIKFrOIVKG', 'SjYvmotHMYRgRMUWsUojlTBOQTupOSwVfCypUNfgrvuzzOnkVyFysLnmuxmafGDehVMMRSQlYUEnCanJLcyrbQkoEpjywBOynXAL', 'QwAvCXzYZLYGZaaWnGpsdbQMWzWGFuCKhDWsAFNvxtYcgYhWgo', 100329);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100011, 'MXeMXWOfLGvMsVDhjZqysttfQnZAADsdNpWlbaLrVuJEDHsCml', 'AsZXjQkKByEsIHtBWxzEDYhaEQBsyZroVAmeXnUbAnOuJgyyLjlAoPIhQWhpqmuktCNKVvvmBKjaHklykljbbgMvQkPHnjUlfSpH', 'tQrvLTrePbmnUZiMTTkDmjefwZGjspPPlywZVNSwFOFQhibFtztOSFsHHXOpvDVNNJvAtgoLZaSFZJfeXIgCWEEleOZZgyypUKIy', 'pXwuGygiwjDeJoqTLoxtIvXbktgIbczwiWOnzJEQtQIBXeYcil', 100307);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100012, 'baVMPRMbkBIudpYORxwwEgGEKkjNThEWlSMJuXihjwLjyxoaoK', 'sdpIBJUrqYMLcJJMJwZDJdiGVsxWKkChiUbTkMaFJpLbWoVUEbbONGWjvjrkMTfVHbrkcRGsvMEpYaLKbMJIzknRzBVyfzEEydgT', 'AiAyAurbDfDWvzIpUcQXAIdSctnwzsIvgKPRxKLARNZHkRzWHDSxJVNpjFzjGnFxtwFUEnQZvlFyYzoKRdlNbwxfAWxujCCnKdGV', 'eHGshjmqcoIcUKLGpilvyHGIjZFyvNKSULoCMmfTwxjdGmGrEe', 100057);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100013, 'yESJPpJKknsWfIjRPiStpofTuJbwhSpYXUUsCVPhBzNdazshtf', 'jhFXtsmRurijObPYDjfWiMhFobaRLJTSKxSuqlRKEpUoqYyixmkTeuaFfYkTNLvtrRxQTRqvDhFuYHyvrNNZKiiyujXOwUketGhl', 'TCGjqCafzUOXJVbiriLZMotYMwULFeErPRaJfbSWpHOOyLXxRKvyjQcCkHXrLjkQMsRCmLdqqPvsckzotfGuZxkApWTSRxdYfJbc', 'ijuhUXhkocMLOiuUOSbZzEBOsvqaJjTEaLSJwAXxuSVQIHryBh', 100025);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100014, 'GhsJLeLyXarzSDFohVHvpYsxNtKNkRNuKEACcTSObHhZfXglru', 'dExEreijeICyOMgIzzVDgwqVZRjcXqMZdTpqxlPBpPqQkSiQjsfSkViTpMWdArkuHAMOUOLYWhKHgeKJjrLnAJwRgZQjXZyBcWMS', 'rFMxNwStMRcgEPQBQMSMijGDOguJWwHxajHKhEMuKpYJCezZVfsGGXGmGqFgWRqFgvdKLOUSPkdtfqebilGmQsqfShdGtjSSvMhi', 'KIhvjmPrVRVLdLMAkwZRsKVcwCCNbANdbwkxBxFlMXYAbBzrGm', 100123);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100015, 'GxBEznpoHWDwtdvLDhnqmKTlQbFuNKtYQJwNUwcvQykHzZeNrN', 'WHzZsKuSzEGOalXMbkeYFUlXnkDdlPVDwsbFzacbVRHPzDgSXCUxsrCneLhpuydyBYyOVlNhboXuxphobXtJBfboxMXwFXvUnhCl', 'jtQDElquCVnXWPEhEhItnnVhDNtYFjuJwOgbvjEIwHYMbrGVOuwkYkzbbvIfRimKigSoFuuNkKSnxidLMJnFWVZGQBcPQBGyANTO', 'uqYifDMSRFVknVHxtOeDtvsHlFWCLFYkwKmImaUyDVcCRfHNXP', 100061);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100016, 'mqYaehvZgyaspAjaUbOiLXwnPzcIvDuKPjfDgKnqifFKQMueBs', 'sxyzJwhOcOFbzVtTDTgnSbVLmAqCvkWCZOEVjSkfGwLvExnBYKZyzEMVXXRzBGxUoseSsLQypPfVqEYssMEkYyLunwANzgmrQHFR', 'qvzoOxiIyZOScGmmTtGBodPNtSwkEbMCbzDEiphmZWxKgxiADUJcsEbQznOoqkloDOvamurXrLKZXyUeOquHbFJliXKNMJJkwEgk', 'QVmbWGnhjJdKqFKwJqFHcygzyHquHgDqeBDXzOJXPRXuwiAYuT', 100263);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100017, 'NgjTVQfkfVCHsFdhiRXSSmaynsOWqnnrEzkgRUcnMwKLBHjQZN', 'gxuvOkISewuCkCpTaEZTbwxXiQtSEUnwktvhBxSbMoRdLfQZxOWddkCqOSAXzYdXeCBumbMceCoufsOYwdeXkqCBGKVkCTgUStkv', 'uHTPMwxOcszzfGpsgYnVRBNdAJtkvvcKovZnmVKwwpYChxzVPMnjFsIgIysyRaSRNYGLRtcCGlTwbRdGIZcFCfRauyxXFChqiLQQ', 'KVSIDbuiWToEvmkwcaZDAiXvJHvJqGVgIotQpztEaAfWyiHoxq', 100042);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100018, 'DrVRdJECzPJLuUKiWOJZkhmqjGyTLpxXwWQynBSfkrnDVnPhAu', 'eBjCwGtbbfXnRlHVgJUbjsvUbTuAoeBWjZTucEjMCyPzfyOVdrEEzaOLPllhrdTfeSZPkdVyukvrVMEYJTAxORjrskDXmzhVMDVD', 'YIVKMQtBibqfAhSvQCTCsNtrLKKmbOlvRPwpClWhtfbZniBgrEosEjGSMVyFMElYnRpzWpJEoVgKCDrtphWuoCOdKJUpQmbgtBBV', 'nDkxkknXYqbdbdgcqqfsCBCxXaakffTDhxkrBtHbzNKxJLziZQ', 100366);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100019, 'HStEPgcOYsqYgnmntUMQbHkHuorCScutWkroCMhRrssbISMzgF', 'LWfUjHfJMFJVBBrDbglPMRmjTZCyzRXYAUOGYgXjVpdVOQlyCQzZqBhwaRBCgzeUXfkPZCmHckMHUdizTrLcbJYyehSKnsdiCTPX', 'nXjswNUbsfKITudXRSvBBXfRGhoDQUYiFICdABizhGfPdQKHeABLfBBNQBKfHEuaFzpuIALKFqnyMWUdkPxgNBABBiZqhePIAsDw', 'HUBDGDLwrtLehbMMhVZZpJwqmfdkRTDIXoHrkeHzUVaWQekIAX', 100056);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100020, 'LBvEXpwXrJCTTHLYRmFpgjOKrktcAIYASwqSApjoRUHzSfKiLO', 'jWNNkEtcgpXmPJjMhGdRtgLbzhCmZRoHVccZJEGqZjeeHfhBKkuESURnwpWdLzsixXdGZVgRazqJSbtyFtnLiqxEcvfDexTDwdde', 'wJxkVwDHDloHoapTvnWigRKCmVrngGNlEKOHGiioOrvrJywqIIjxmVyNwvXHzpJtkXuGXDQwwNJZOZxDAtGcFaqpdMEtzGnFrhMe', 'XoCxaAhhQadXbrajLhpqtZsrWBEGbVMcmxFLpXJjcjvlWuyRJA', 100297);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100021, 'DcmGsrvmeQBTLAAOnVpmlwNVvKbDTKCpKBJkbWdfXIqTsxxxwS', 'EVghsUySPgSepFjNewLYKuAxXciZWYgfnyiBdZvfjAXKweYIhXGnitghjrVzafIseFhXfQDCKhtizAIZsHcuVbiDIjSdVYwptTgp', 'gUmvVwNyxjbDuMnRfFCyWSSIzsYtOWKdDuXqqbiqEDJelTexiSKbjPgSDgfOZZZfkqwbSVtZoMofUKhBREegXkdXZUyctnLCXigz', 'HHEYXKOphJiONUrwURMGdtsuJHWkWuypXtjzusZfWdfEPMxIrX', 100130);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100022, 'SHOUVVPdbaTUporKbdwARhmYmKYnwPcOxWQTykpKTbPwOEIIxk', 'uRlikfmCQPQAXtRFiwkbwyzmWpbvudsKQTwIotOBsmOOdXgzaszkzXslMPzCXLPGpCjRIWNpvPIzMbeieEYLfoXtWmHpYRqciolZ', 'RIdLlITrtiUmbEipGinFhtpqrxhdbJlDJrtqYaxvXZNkggHWUxVsCIFjrjMXwNxfSSVOfEpIgrcotxQNTZcgwpGbUIfwtalHCnex', 'cbGTuuADpbbwTspXRRijWedIKBHqxZUajYXXVqISqhtdaDecGx', 100309);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100023, 'IqpEjaYffRIbjLcBpepxBHWvjXzsMIsALekBhkopbBkPVCVFjl', 'uBfHLsZkaYMCfXulHPLRKLOkDJBppaVAuULFCnkKRgqvghPkiIrJtEAdgtXEphjiwjrUpqPgnkdKoPitIryfYVUvOXZSWzPbCwTg', 'DfmnqqPPTlFhZtomkUafsldhHfPLifgcxSKWiEEBpznCXikQxRnNNOJmaTJcondOhFMrfbXGcePDHwBJyYQShBHufJSnNvkgAHly', 'HTgfZDTVloEWejuGAymXFyeGUYUTwDJqNgaRIMenmWTUhXiAPy', 100303);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100024, 'iXSpFEuhqWfMfGwXFeXoirxdOHqQZQTGaGoioiFMSDCxHugcrm', 'zvWBxqVHrPAKHYmPDHullOPNqYbWqBhQytbwcLEWEfgfKgtqTaJrhLovuCFbAaCCQFBpHEzmtVNUOnuWqXSlCHpaUyyWRIJMQWBm', 'nULygoyqySdSmNysueghXGuzifILbYpKgsLyXdEJimnXTpslRmghFJlABLqVYGrBhyKAhFovBoviNBwJRWtfdRlCjLWeqofObAhy', 'nOyNXhGPyCJLjSWivLGwvkVKmMtOHVscGNVInQNVhjARunmMal', 100109);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100025, 'BBbNnLpyQwJXbQqENzoxpjvYaDGbYichEbdIiCaFVRgROFJXRw', 'NNvEaRnSCiQWffTyGFeYucoPyENZLARUVFtqDFHAmAVQAbtaDSkvraYtWcnfLzTFmTuauKSDLjRhnYrqVfrQlyIbbmTaqOrQbxXG', 'UvChuNwUIRqjkWIlVjDZybdBKsMKrfICiYSxJhvePYcsyjRpWpbUIxVNkOnSihPUVovedbXZAXrNjTTlgzsbinzSKFvonQAsiDrI', 'kAfmsrAsvUQFuTXZhLGrkMETZIPfPIHjrvoutObsoqLWIsKrzd', 100353);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100026, 'RBjWVquAygkhmNCGtgifciHUPVGvDcnIJyqCKYwerFCYsZyaRE', 'cLJBaYZqkkXASYQPTlwXBvRMLNXExlBjMAfiXYRLSrPtNFSuCNdvuiXTKgeasLbMhTFlkLpUzmWjbgWuKekwoGatjMXfcrvzlugi', 'cwKOABZSXqlYbNWjMpeiaRRFCpQcEmPKzoyohTKbnbgEhLiQpHEaNOsDfPLyElZGjzHQGbpOtJRVgEGutfTJSrToMxtohenraaVa', 'QxthTNzIPDflHOfugsouUsJPBYaYwPpnwtmlvCbrNnWiShBxHn', 100260);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100027, 'dYXZoWPhbdLbRdOhnlicAmHGYiCBTqcAlnvUVmYQTbRpXVJfPS', 'mSuvjUAYSeUcVedYPpiKQemtJBtspEanahBUUkBbZgrBwoIFnEGzQgIPJdatYNnpeiymMpPGJaXtQUXxRqgRDNUdQXRtaXdDWiuX', 'yqyFcqxzzWcVKIetGtmcEJDcyaTyameTvaPTLKqnZjsIHzgwtrjPgchvUNyVhfMtzhUqgXSnCPdLSEmnSIWtYedFKsMXLSdlqCXR', 'uYYSisTmZCGkMGvBJYnYHDDOoHdlrqFiYDQYxTnqrkoQPBemWG', 100286);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100028, 'epBzyaqxUdmJCfafwcMgYijgenIrUXWvuHUhsOaVUgFaZMTlBv', 'wTClglIsLiWcJzBtjBGJIzbbdswIZWzjvyLzykaZmmqfAIzXSnRWXCbKebtkGITZypFXdIUgTOlmGGafYhTkkwwMzJyVxvvhoCXy', 'fROHoOqsSwRzSBETTDkuPUkeoiRkzDOzuXWOLjecWpsFEbnbWvzZQpVgBGaWGEMMAvyJjqGjNdIzypfwElORzYtAFACIQvirYOCX', 'veirjibKWGrVYsrYnPnrVPYFziwZpwEpbeXNTukIEvHRWapmBk', 100210);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100029, 'yHugNDTrvxWclWadAiTqQBsHFsOVVrMyygswaRdullZGTWNraC', 'cIQlZJcHbthqIMrpxkRSAmSrLZyXMHXTQxskmLSreTRThlTljKUinBtTXAdqFsPYBYKdUrBKCtTfgRauoWShxkxsUEkOtKDarRBP', 'VYKAVCwVkLgFeHIaiQsTHgjqajstXbitEKNovmAdGAlaefxarboMJZMjBrPXarDDZELnIWGytaIxSsxfPkimxxreYZeVsXfCyomQ', 'HNfgLZipEaOKpPCReCnNiQgnKAbykTQFyDlvoMVneBvttUVSZE', 100225);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100030, 'nwjulwfCuTwydEZFdpNLAeQnklDwptZsBNpJGGgQrkPHBOuvGu', 'HZokXNwWSrQIibGXLIXCIkOKNVjhaRtnhoMBqpnYzakMSeiOYUSLwrTykjcIPEuYxruRRfNNsxHysDDztZepNAlxbNsROmGZOkbs', 'gYYpQmlyXWZldYLmJhRXemRgEmsVNFJfXswNbOxOvuzFfHoZjtaFFoSRWWwuEfHceRMWGvzDQIbrNcWIDggamSkUWazUXfVTEFts', 'HatQyAKCcTwubVnqDtftjVpWvmlqmbwMpVgYvdYNpWKAZZYtHV', 100064);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100031, 'xkLEQMTSwVzaAhxZBOpppBUMvEGsUGoaspGsxObZvvfuNpFNdG', 'lMCvYAoYSVqoZYHxmAIYWfxDeMULbeIeSrpxyAwzUnVPzwvfjfledYfVymJeNuKxYAwRoGaXpwTUPldsNAZeclyltHFyIcLrilIR', 'TFuPjSJAXpuvdNhTUaPHLQcNWtFdxzmEKlVasCICOtOEZEmKgExMIMPEkyqynVovqwaEPolalCyJwSvXVAOBvTYpGKWXuuwMLMIU', 'BOQkhWqugqDsoqKfVrTuOmWSXwunmDcFHEFgCTaAbtikIegWlW', 100067);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100032, 'aXpCzuZewtOILvziRFEUHvWBZmUzCNMtkwdBTDEJYYaTnMxGBe', 'hhnEqRiMTkjKsUjgldTnzuaORUJBcKSNGkELuORuVtRTiRtrXRpPqkzvlKPFFpCzuFkaVqVcAYtOVbJHGNHczlPdmeOGpRJNgsho', 'syapTrKbYNMDCqbaxtkegcUfwpGBIRlnDdOcATcCBGUIJqJYzLeFUPdxsOFYPzXTpfmWCgZFWoeMqNytUeMDOewqfLghlLkDMKHK', 'ZiJfvFmUcpKCqHrZNrunWctPmEVKXfyopIPktsFuQaLOjJWSuX', 100054);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100033, 'OJWLCBsmeycBIFbCyJKakOMJVBdEwsZnSTBxNsZmFzEQJoIitM', 'SRuSiGjsPBiAODUXGsVUeVGFfdPErMonLYUQkwejsSvGmBMDIYVrVMQzWBclyMKzXlkEkJpPBzpgmbcyzHXyNefgDWiuFjzeFIwQ', 'PFxDeNsBhtEHYHUdnOyLplddMXQHRcgqZiYskyXbggTnWQmfXiozzQtoonwURpRiAsdUPYHIBqkaDwSHDyGJelJiGkhXpdFqQUrf', 'nInCJAzmWEXfNxdxbhwOYlBUPraTprExdHygaqOjuOruwJVVZo', 100126);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100034, 'QgaPcXBbqlGNFNhXzVYcFtwmAddpVewzDOnGdmaFzqXRMDRRDF', 'aiQaXrbACbNkbBFdfJfKRnFHVRfaDZaqLQrMiqVOjoETFFrGamrRVPkBNbLLtitTzcvMuEhtoMzMOsfbstrqBAnvIXuvoeTiSybi', 'yeiKfhxMdUHBhTlpXrltyimaMQWRHoYrTvsZhNIAbOOQVppNGaQIDHjZSsZeEGPCTdDqLbYbgOIldZyDQgtXoSxrDFkkYdyMcfrj', 'PCupzLAQvCrSsqdKtcquoEOWfiaHTHMgEEdVyzAdGhybonqTwl', 100208);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100035, 'PkxAmUmpDwxgZLSCUguKsyKmzObRfdICeKeDmiGppyteeOsMgR', 'HYAVmUQdGaeFmvrEuiSLByGCWTMlcOIIAbAVzeTCNdkwcJEyaNFVgkItGCkikJGoycmCIKXzJQahDSdMKlshPGJnLOEIdjfGISCE', 'OWCeVQTvEOEQVshysZoaFHEiRCleEpuUDYVmGeKOsAiMZvfSVCnuboLrmHZQIBMOpuGHgODHYWRWZTYstnaCfWmidmvoZCbjkIvw', 'UoyHwArlbnvmyxhizKTwDwgMtnJufeNMhdXrWOWAgVgeSakRTv', 100100);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100036, 'LOzqjKSMRkqUIiXmIflEUZMgkFPhiiFyiyucEiBBCxAzDbtwHl', 'rbxCiIZFaxIxWVXzcuuRAkeQdfMcfGkQTgRNjwMYJhVeMSkblYFjgycGXiFVpqJhhXJTHLLrThYxGSoGAzmHpVKRtFmYFhPRkwzW', 'UebZZIojGKEdNpsnnWckiIADhBmLfHjTzDDKHdBBQgjfwayEMpCwbMZUYwYWUhIHjDPFFqxtCMBDfAoqXRxeIhBJuUFDZdqkBysJ', 'LbcUbQGJpEchWuTpioDCzmXjmzxeWgtwsXVVTjwQJkipHbpOuh', 100162);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100037, 'RSNyyqUIzzuCxhbjjaSPBSOYZjHuWWOAEDYpWYTfHQUdseyKOQ', 'pmWxdsTFxuAwOkDTxXGnSIVdlTTJVldKCuNiysSqeVYmWubGjhuXPCaupYRqzfAkCoPHzNiQpPJcVFWlJVddKOSZIWUTIoZJGhQB', 'AvIyfbhFfSNtTCMGjhEfOJMInkAwetJutqCfOHuqslRBoiagfeTbdixjdvIJdHDOuTcZwMqjCfpDuQSPyZbjAEISkgKQaGoLpBGw', 'HvIrdrGvmfyciuOGdLKVgXPtsXpyRpebFJqIlmJcbjVudFIGom', 100091);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100038, 'LWrzmnBbZGgSipipzFtzEbwJRuIdcLpqYJaHwsyiihtlVriNiH', 'eXomXoBSqNGejAwteULhmiYnIpJDHgkOsTasMrxUXbnwlUzFKfRFXPPcqaENGGdEvZLtSpFBkNTLMLRQgpSIPGNihELMHyWiuiAG', 'suCWsPhLrqrgOeyCWfJKEEgQHUwfpcUiVlOQGZJbNLsaJSBUuLjrFMtmLsEyaJqsPrXDHAaXCfaTNBWPUQEUwITGkAnByzlbBEZp', 'jxJbTosFxfqHcSBNuVkhXKsYNjmcvUpLgTYxMCVEhfHxWBaIAv', 100165);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100039, 'gBLbSJybKUINOkiDguDCEcOBCVNQLxQwuTiAbdHLHNSBUQIPTX', 'cWgmvJlrgTlHuqGlLSjXOMHThNcpEVLiXNgTATESfqwsvTdljgTQskNuzlMnXfXVaLJGOWsqtJEMpEgvMojcjRHfuIDHLAssxWhn', 'LmiGEbWBOpGacBOoJXsxpADlAsZPvIJhVLyHRKlvgDYwYjgqkJFguhFrrDIBZVPoaccjoAJYYEVwirETpcxNRzokyhZcvMbrZOyM', 'DYBqylvZUvPYUrvFFGqCEixRKDahIMsctYcKrfOyaLPKiUzqqR', 100356);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100040, 'lEcaYtzzXfQPVEniUyqiQSRAaJJloycZzSJIhaNLbERxwpPsni', 'RhpXVuMsuiYejeBVNvbyylSPMUuKvWOzvfrHOBPCxogZAXMpitUwjSbVPbPMLZHsKokWbNvWfpTEwLpcSbwiGHeCemfLWOAGsMGn', 'VYBbKCdHHRjhDukidxlLDNkGIIBjGqqKBJsGKqdKmdKLAIhcZTUWfSSgEIpPQFjbMvtxhprosfqNdnNVppCAkpDdjkqMoebZfvBM', 'QgBziWditsFrHuMWnHtmpSRxhWNDTmTMHCRUjFBkTSFkACNTho', 100365);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100041, 'vyUPRAmdDlhFxzJZfiBkXmBsnBfULdPpWsAslHrbjTJqRuVOUm', 'xCaeqFpbZoqcBnmqRduLiTGevAZncBHwWguTUJwegfOXQJaCFqgTLRKXLrOPYfZjoyPsHYdEAsaoNzYppIqaGLOFvpvdlddqFMBr', 'gtDxFTywrHAGAQymfsTMTdyKKLDpsPvnmmoKNnzbWsbyHrrthlIbyOUEuaCSXdySinEMibRSmAFpLwaSWpBJRnZnmrPgKKzUuBYr', 'vZUNcEgxROyLkoKnSuIrmkXABIrNTTyBfhYriRffEmtdFkatBm', 100071);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100042, 'PcsrmOlZnfQfSDpahScoLxSmUEsEgOcWDGkWnsJeJVewYbSbIb', 'oeivMlqbIRJGVodIZpgpIEnfCHbDVpBShuuXkoFYOTAyFzdxjDCSWbmcIUdUXgVkBcNSFaTmWuGDteMMpoYGCNTXGGgIIqOYvUKa', 'qfojcwmRwEaTdThhIRqkMusrWJjngiLTJlEFWVeCjZoSPXMcxJUPOuvTttMZSlHLjOSKfpzwWnXEsrpnDmtFqzrprxKwhLfjzpfD', 'gugpOjFWuDnkRButXLcuuemyPcYJIWvWqTZjxoUpTwonyCQlgT', 100071);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100043, 'kHopGdhKcjtnGsHMEAiAUKuzuGopZmCurTzHAMwHKNAIAXhwTk', 'JBWXWsELLScLXysRBeLoUFuaVbSGiysyzDQgdqWLTrxTVvJtMXdayQYMPnClDEWPtfqrDAtIMqWCEXtARDyIDEmqzeRUIowNZtCB', 'CMGEjAwRVBqFztxxoDSkssAHUtiIFVJKjurCoKnJLraklisyybkIMXPYLnuCagKqnrQhCyBybUQCBODrPwBwpRDhNsZJDDnyNJcF', 'AHWqagNwxIZHgYkDGhKFwhkhwMokonddolSKMUmHIosaWsRRvV', 100159);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100044, 'RlcLuHsTTFVgypaWFMzRSzlZFZLiBZrEiODnCOsMZTaswRlLLt', 'uawgzmGkPWAEPSEvqHzGuZnvafrdFClcNJHuRMYakFBBcJbMLErvAfSOIxxiBSOaAiLjGOMHHCTqkkKVcEMZItkZqdDfbpKRkWUi', 'oGbuYGIIRYFaxnlAFTleVCYLLDtOLBsYIxdOtVeCiXAlWciGxhNKMvnQgFxRhoPQzRTseyQfzsRYBaEgzUXvHOKOLFeHsxKBUwhq', 'AlZOAVRKUrbkCnQPspwagJRwIUIVglBXXIxVIrUlYWjvcXpwmH', 100159);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100045, 'kjLChrSdWFuBnEgvOZcfbfEZMhCRCBifadBTTfmxgAdOWlzlfR', 'hzlBoQrtPXnyuhzzRdKkECrXOSDhcMbFaihlxVaWDDCDLogVvQsXdVsWCrFuYgHyylwdpUkQggLKiEdyVPddPJbPCpvXRksGpiLx', 'QomwwiccvYCWbOjxwXFPVKkgAbDSmXTLwodUhRGliQUYPAYxCLkTBSFVfJcCsHvpkQswhijgvGgeFtVijlPnrpKjnpTIMhOwmGOE', 'EedXUSLKdOHjXbtNmejUZpTvpQsKXpHfbOPsLAfHWiBtkjmcEw', 100360);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100046, 'DvBVIIHAyLTpWIfTxLuURrcMVffRbGvJZnToRfmoBgCtdBPoAf', 'tmvsBtQWwQzWVRIhtekmMOpFDMoGwbVumUVTikqRtbkrFNSbQANIyWGHqADsctRMwKLWrsFeFoUTqNYqEtukeXHOxtprTVpjbRom', 'YstuxiMjXuYWiXYuCsoxJBHcvBCLcASaDVkVNtORCYNcUKmIlWkIJcvpMtnVQDgeNgPRodBKHUCfcAUcnpgptoSFISULTxlSDiCd', 'UQOgifcJQBduOBoFyUQvEzHttARfeaGiUKZFlNATptvTLzDwxH', 100304);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100047, 'LzcdxlwXVXhLDpmldNZkatqmcqcieyMvzZuLedcRhYSLNXEvWi', 'tnlgmlPeDnhQytjOFeshfblzgUfIbhGXTEVcROdKRBYdZzGnsGPbkkjFYrajFNuIZRTWSrIguuElrDjfxpYLlbnNgLZbuLQzPoEr', 'OtxCDsSNZvupZaXrKHdhcWyUeVqFxnficsNnzsAKQvqmqwJsBthzJzzasKXKkVDeCvsCNjJYTJhtOTfyOGrWlcjDrsAnEqWoEDNV', 'PIwpIbsikVCRDcKOKMKVLrgRHCMGaPWIsRFGPmJYRPBAFOVOGb', 100079);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100048, 'LywqnsOSAOYJMaXdoxtBeDeuzuYtqBqumdmFOYmWoMiwGGmjSg', 'mebezwhWdRxpSNCxtKRLIPUsGaqihGSgOhbokoFDedHgEmFVBkmzlmHRYAfRIxOoqcigPpBwJWNFJwYZylfzPNfGsRizfBgPtIVU', 'XMpgnEpKYOjRtRBqWKnYIPMyHgFOUFIDBGREntZnMuRUMiUDOsKxElWfUgXEmCmCizHtQwzYfELBBZpmtqWjteoadbPTUYawGdeT', 'JOZVAHTAcmvFHOiZCQENCJWMYJlIxDTXSGWHzRVyBBLwtaDNQu', 100205);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100049, 'KHKKkqKCnBdMjTzSQduzNdGKCBjtNBDvLraOYpASEjIcBaStEJ', 'pBaTNCZWBBiTlJdWQOexBbDcAfpCXEwfuhEeQzZPsikbZFBMIWVjpxHHyHHhAmeOGbYWjoIrQnoVBIagRzldymfQkZxmcaBJagMs', 'tnUJAjbOTNoZWqtCwCQCvfbizeZkyenpoRhQMxZFuMksankZbqRWCgvqduYahMoKSCoYeDNxEYYMDzuOAuZntAexZsizubTWsEcT', 'haXnZZrdnnaEdQTrjYMeOcTZlNwONuAKfwKmQdXrijndhFtTUq', 100093);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100050, 'bqdQhenvRtUGwLwqlgAkMVvhGclgZYJAkZpkrmiwihswSXDcCn', 'sluiQYAhHvbofFhQXdyQAdBraNNhpWqlWBOkJfHjrUrlfnxzFMRmMAVUZNYXkxdqUPwVYgeblAxSUjwBJDZuJXdIcbHNODjPnTnR', 'hsBxjwAwPCFNNfmdhvRXCFaBLyQHXsGCXdboNDFrHxoEbNeSJyAYOCiHKgfIIeEVQUXmMUYUqpOTJYBOtrMQDpQUUuOaPGcgDCXC', 'hZuaYeFLMdHpINSJCqqpZMfAjxPbNXakJtkNbZqvmKXKcNfQrC', 100070);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100051, 'mKMMZJYiDsOwHItNYRTHdOuzuCScMoSPQqOaGRCdWqqZqPdDRQ', 'gNqwzgcfuhYBvDpTbRXKLpSrbdLvKrIfpwBipUfEHaemnkIEOimEiZTKBNHyHomJWpNMjJXSxznLeFhtTmExIzMPSTOefcvNLFnr', 'azDKMeykyFgvyYaAZkGvfmbNkNhmrczmQmotRushZOJprDBqApmAYxeKVPyRyakHEtlyMTtdpmIoALePhryzbxeNjVfeNeiCqmBL', 'bFgUQEuQbHSbJSnrqWZdxfxiavvNiWbtdjhkmCpxqlgHHZoYKK', 100029);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100052, 'NqlmPlyPOCtShXebDfnriSFjllDQOOPUOyMeBoWKFojsfnknaV', 'RcDvAwZeoephUacDzxspAnlZAFjQCTKdkKkDdWxPvjQDiHkhiWEzslJXHUtLlqdlDLXDTNzymkBFjVPANSzpNcDrMmoKASbUPkEH', 'OoPXpBmuPQyNGZwfNqleTagsiYtiKQmTUIhWSghHjHDIEvppylTbPHkARvEVhDVuyvVONJGXXVatzMGsQZWvqfHPCNZHzmcWBHoU', 'GEWRcPgIBThypATpKXmyTrSMWExcNzXHNQzUBHbaHPowraMAWz', 100123);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100053, 'IPtOTvLTdCFUlxJFRusoWuyADvpbLbcRLmKqgChcJQUHyjfVNm', 'RmMuHcBDqljBqcxgcrrvYoiPeHeHaRsHOPgsDtFoCfbvKdnzPKnKTFTnxgrsYDIFkNZpdfCQgLvIgWHyQfyZPDjgogzHoFeabrUE', 'eDwviIUlnbChFdZzmlSZOTWqsBSmAbYbrXzZMmXIpbRuNpRQfNdxbNGOHUOoJiwtFziGCQytBrSEtxsGwqKgXAzKftDzCLzqGpPy', 'WoClDBGWrqyzbLQlLPGPrRUlyQeJtdzTILWrQaWsDmEqLDrwhR', 100239);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100054, 'xCSYNruwWZWYKCMXSbcqNwHiAJrLBDwsitamkdNOdJzbfaYHQF', 'eOAExwjxQhhQabdbroDKACJDagsexDXhDEIaUQvnGZrlcUZEaxkyQPUaMfgAAVrpgjISUqdNfLSBGYuXsHyGyAQOLjMVYmZnSdfk', 'pTdpHHQDUeUYLpQwWFARPBKFKIKYNNcmbslFjATgqOoeShclJfaZdqEcEuEHhXvDMvGghbIrQUBdegQMuZjSdxJvKRmAQseTVOfm', 'RnoGPxHLPWosrQFGmKfqeIWAfemBiEhiNafYPdiHgcpOoMWHQH', 100394);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100055, 'hUWzAXQEvRHeAnSgKobRUnumyGWZkwWqeIUsYjMQCZLQfFKzwW', 'WoWORSNVmmCalQwXjgjibEuHlORaAiRtmAdAIsqXMFYUpTasqrzzablzuHwYogSBrhnVHBvXXnMJvKpjLbnCbioOFNttljecyBBX', 'raZcDmMkapSogAbcMYWopXWIgxKCJzKqhTEkLPBXyVvFZOfpVpYLSoJlVwBHpgZCcTejBXBBJdepXjyLVPxAQStYQReUJxwkWKEG', 'XgwofPJDNPKzZETVAlVhlwEEREgAwTInXtcJnsFFzJoPvEiUYs', 100398);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100056, 'WHPECZtEbiKGipInpALzgdtXmGtIGdAiceDAwLzeercUiUzxhb', 'aDbrwhnrhbVRAyqpMTcuNNMTdRziqiPSPfcWbrIhZqANJeEwmtiBDCGrQPJqLqvxvmQlMovlyYyOZuBrfnARcmLPGsGCaZomoqGP', 'FfcXGzYEdoWvmNEXmCprkbkqgcVVAGLwNVWXBEmuHYLUrgPeFXLcJFrwiymBYOhPPTYiDJKWueFHGQOCQJIkJzJAJlOtlZRrfLZD', 'SjnDvgQRuNLWiCrTlsQzIJjxtIldIyieqKOuRkQGLOtJKGWUTi', 100177);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100057, 'JiVTOAXlXsiFNzSIsshtMKOvtUzdzMFVmduTWoejJxlxYuEbYY', 'hpAAqgunOKJTSHBUkfCWyNAPtjavBtrGyHmIerieRgSiilYZTcfyDcPEVBIpOuLlEnuuEKetUoKypzApfeyGEuPDWKGoquyBtstW', 'YqktsDwqAFcBynKbGbYtxJHRccuZzXXiqzgHvZDvGBBEmQvkRiWpDRLVyhrPuNTKvDEJiCldtvUiYAQvFVhMGpbIhlFnkjJtxoBF', 'lRJGZQVctsRfjIrosqUCZDVuQTxpTovXIAYGxRENpbiDgdPsHQ', 100264);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100058, 'OlpMTGPCnAaNzjKweAoXmqkzZNOakTEAepdaVxrmcWpAvgpPsW', 'yzvVyeneeNKejhTNUIIjBkwqfWagwnBbWuptdxEffVVJjIOYQlZbvswKFBqewglfxcfFVjUfECOdNdtjZCHCkqCAkXgzcNUFqOcQ', 'dpoAEzDdizbjOgTNEkdqFIRLKRyuTfitvftWEuxiYMyHddjhpizmlzZufwszDkWREvDwUotBYhopTdtiZVLhzDZIYLnAoevEaPof', 'FIjJCVvbJNIPwEieZKKTXaSatMlgxDNpzJWYDjLoXbtLOOqncI', 100015);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100059, 'qdSyQhghzFdrujbwpkAajKqCEFFHGDDQnLgiLCqVBVXDnZxUfE', 'WZYldqdQiMZCncSXgZsocBLIPdTwQCZMIaKdfGarBQLoZimcPYSmWkiTvPRGlWkxrrzxHwVQMGHhQWKLhMJGWDlOAfccqUHjpjgZ', 'cmWYzRyFQreMBESwUuVHkZbAZAmKkEXaXrwEifnvBxIeFSrqQlnIGzkjYqaOBWoamJOLkffcSFvTQqednckpNiSRReyuCjxcbsPA', 'BVsPENiqWKxFcivOqxfpzvquAfSMBYWuDjqcydQKXOrBHZHEbD', 100290);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100060, 'sVbHtQpLDItdnhUDYuemVZfigGOWIuzlnqtqAISLwMnYKxzLFY', 'fWFYgCnBXtVipwQvnSPcaCxqzswxjtiUMblJEYZehzdSBFdcTQxaZEBQVSgCbnqGqDVGWjPkwPzglOIScWFeyshFSjsXOfGgIspn', 'RfORvSquMFQuUkVlXRAofviEhXnpqkzAwUXZxghnajdXWNHdobWvVgVaFGSPnXeqZuOThpTbnvxScHoetmDTETbnwwFqdCPcGGkY', 'wWIdHcmQhuqwqiwlUtfbMaSGZOoCjZEVvXXlBQLQBpxxGextmQ', 100240);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100061, 'MzPWMAEVLZAXZNaWluYqMTwpEEaGBPoGWrySuWQWXdoyXOUXPd', 'NANBpaBcotySGOZjLrqXTvOfSKiSigqcVGDQPtrjqaCYFuNmmQiuPpVzjihmetxXfzxIkXQHrmpuYkoOJSkBbWsDJJWiFeJBMHEA', 'nYwlRwBxqkDPvBnhQjIuMJmOjXnUUcNwMdXnFgjNGPLAQGzSAFjuBAqHwlhwzQrZwccpkoDvxvYkjRvoJLQYFGgsRXplnpYXyWpM', 'MPUclyxzXWXcunNVBzwDHfKHQRiHgVGgqDmmCtjiISUWWOsszA', 100152);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100062, 'UFnsAfMEHjailZltuIomGLQUhnkSfxUFTMVuQjnmdlbrZhKytn', 'jxAQIeCMcbCIIEhPgduNboGjYDXRKNFPbXOUkxhchgKHrCLHkEwfGAEvGLHpHzhiohBvCilhanHOtdYPlcRBNSfxFPPBYAyDKWlh', 'JbFjdHAHPXQHoutxpWRFEwXIxBWrePcyWihrzZMiMdByDVaqTOzwbQygRTsTtWDXeCIWSIlvEPgjsnMnnaEtWCbXYSdrlayPzSoP', 'RfxExzpCuskLkQRDTSRaFIGdIAoxDtIyonJRCZXvwUIXAqrhzA', 100168);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100063, 'fDZXVOFCqVOfFLumozobQFqkJZgWKZAzdTdXdjzJTKVAnyJnbH', 'vgOrsUtHOLnNqRIUQSFwoOeFYnMRzQJsQZPJTtDkHzKJtrkHDPmggRzFVDgaRqQHfdoyndXLbJkeRKVIQcqXKTOyTqjxLdJsdseu', 'yRGBemcXtvkjwRIGrurHuUDIIMeTJatKmBNISLUXBRdAILITqVVpalIRjRHTSwygWMHKbtrGtNQHjdWMAdgYFpfGwnmRrJUOoAWT', 'ngwDXkwbspgLMMLaAYTWekmAKImJlGFljjWDSEwZtvGUuTIfjh', 100002);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100064, 'YzDxvsuqSmTuQrEodrngxFGpOaENEOsvQNgcrRSbTlzVbFWeUd', 'FPJrhajbdjgrOODQtZtNxEoXkzerJbmgZoxxEgnPMMVfgdYipmtZSIrjeFlpFNCsoKrYZreOBqhUuPWQWDdAzbWxXzgoCobnJSwf', 'nfzgaHSiWbQywzKCWpbqsuNFlOZBiDpqvtNcaQdmukpuBGkaJxJEUURIkbKcDUJyzuIXVTYaZYCkGwIynXpLxADXsBDoPBZLkAXy', 'FizmjSbUbZQtAYIsrsNdAVvQrcmONgvGvGUbjyEWQbEPFLMZlb', 100308);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100065, 'WDNiCkWEvAGduPRXJzyeySWHdSccbGiAaBQUtAEyquIAWfycXM', 'zweFKBlMdhztsxqiiREKrsvlmZWFViGsBTrsiOInYklxhZGBcfSEowFdgogMDgNKuZohHttjPmssoXFpeEAtKHTXXSkUuDzXYBjk', 'GGHniqPBkldYJzhmadRuPwnIJqtNsuWAdCLBVjxmWaoEWLPFYmNdGuyPdJBamhIVacSlGbpqtFuUdpFJrwCXoVOgEmrdEwTBSLrM', 'DTBXLqZHPWyhTfDVhPLtligFxkmcBWArCKJFLaBgJTYEwNvVqC', 100125);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100066, 'KTPXtNNaxEAQrYEdjwqvzpVnABXuSUtKqlVyaQfLZKmhXeSSSi', 'PXIZQuxKywjkDsdaSzewcsaYTwSmNgRLztfESikFoejtqLtEfTGkJPIrXvuAgdlZUilEXUJUJyvVryZvEJFxepXzzUbweSwyStKK', 'aEPTZJDXpElYZNaWCYXIQHaOExUBtasuLigozsxGUsyLukfMMoVeYnNdwIVvHiEGQYLYOtGtCOiQQJGuWWMVkunhCEiiQxLdFLHZ', 'roZJIGeMGKttoGSDlCPTJfVFnmPssdcllDGhvNOBHUCxqecVdi', 100034);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100067, 'GcYLRbNwTZvxbYBHOXVKUnZsxczbXdfsekgsEsjgLVDouQPFFB', 'fathCxdjsvoqhKpAGLfSVHszMNTKRRcjHLFVStafuEuzjcYAXtoRNhpChnaoirVbAigHYSGXySzilBbJpdyvrMOhQaalVBSZABld', 'vfdyubZOMgfXMHyDUDPXggAMABpNvPlTHLzMsxtYUzkqpRGQsAFryPqVlKsKGXTNjOdZisDjvmuWzZDVaUGHOefysCnpPOdnPzYG', 'RXInOcAvlHryyDrMiCdeYZFEcYzNwCdJqabquEWtAZaWCnFwZF', 100010);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100068, 'dqgciJCayrHJTldPXgwlJatoNhIenumDFECvGGMgNRvGyMLkkG', 'tJkyQAaMyHKAqlUIOjvwYdFqIAnRDZixIJyWtqtDalmgFLIIYHWNPaibMemLARMvOGaFaRkYxrCBIEMWSGmBnxqwAujgSicUWNTx', 'hyFXBCOGtAlgSfYOwmXRchNLRQqBpAxIwnJobwsvcHmKCdRaMVmNQzUQuPRPynUtMPKZKXgmsEUwMFDmbGvkdeWxkQoMJEnUtgtv', 'harbDWrEHPjsYbFbNzbfizjjIfFfhVxEXChobtFEEylUUgjiYw', 100080);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100069, 'HRJKZHhkJvFAumqhkpAlcaLsWORAHxWtmKeySqzevrjrRyIsAR', 'LVxKHQmSaIZfrJIJUJTcxtaqAQxrGmJjCxLJOozVMsVfvxjFLtvSEoDUInOzlVmDDzIQUdurTohlSmkIZqDjLevzEibitcBGXDEv', 'GXlAYOlMIJUmSQHjjjTaxixsZwAlONBzvrIicFRvWiaksMAJWdfnrsLTqJQSZUzSXKgclbBBttwZoeLYLTTqHgRoVbwGdaKoQELZ', 'KgCTBlPsyrKGAMZWNNCwddsQHBEnsEkrVeLzIaKZRiQWbhhyGR', 100390);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100070, 'zOOLShOPZmreUkZktYIGVPWplufeBUVMFzPUBQImEYLSSKKPNo', 'ihNBwjsjvJvpZssOFrvcUHFDhdhoxJYDSMRqvRzJFtdpMuYGCOCRdejXiIjSyGxwQTxicwWGuAQBkdyRqllGAllXUerjMWwLsnbB', 'YDeZkBhtLcrhgMQQXjLdEtxLbJBbAyEiBCtvIGmxtsPgRGIsQClqvEimTejKKLBWptiMxjUfkwRaZffYktEzpvMvRKXhiUAukCCa', 'uYedvrQleFJpqMOjftxAjSXNZTUSAalKrsJkYTiBtFiNmIqFam', 100063);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100071, 'UJLjttLGFXdcDNhkQPeZvgwmAIEzleiUmKFVYWDbxTpMrBUhJg', 'LVgAXBmGkjpiJqRrEopJAHhIfoRWKUWyYHkoBJOMDwYTcQPbkFJGPctKVRRMGBKCVhbxBQyDdICWflBBawafiaXgcfiIYeXRkjcl', 'pFVDudBrJOCPSfgVdcqXWPPhPBwqlbxOZLZxqENRtKxwwgOJhIKWregdDSWGTdbyjRDvXdSnWqYrsRfTQXppokxEiUwnbUHNMRhm', 'bBLZOuDZwZNqZllCqFJmuHvOgAbuqpDYcAEtwLPruXEPWuLJVo', 100390);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100072, 'ejQooVWnBlbfKbdRMVilVmvBHObZxLlkKsyrsltapqHLHuJUXn', 'HyBbrwKWhrtuleqdIKUzHYNAhAYGnlCXDwbhBWBoOPjLRVtzuyUihUoGQHmuWARpdAEORvkzbokMGqYzSycPuFnpVGDHrApozqNH', 'WCBtOBbuUWexDUGAGxsrFEyVqmRoxOEZfqoVJutLhHDhGWJOZTAUwrJTFYJStUJmifirTgsVVeyRsffkifRQyVOTkYcqHMXQJGnQ', 'VhXxxRVBLeQmQtrnAIfSQrpMtDMFcJHQOLYmbxtnooHZyVndrR', 100243);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100073, 'qeUSlTJICEyCpehosIVOUAISVhYGglkrEkLERFZdvwzjRxKWMT', 'wMCLrNpREKvzcYqYjFzQsnHUIsgOnsArJoEqhnXLKXXPIkXoXKjTZmaOxSbnjLKRjykKeDcxCMYrTDbrKVIEjcKcHLuupfAtEjuG', 'xmRqYXWixoOKFRozBAGSZSaTZDhnVDMYdyQlaWwDjykyOOisPqpmBcdqegHXjEfNSPYCWDBSIacKEfeSPvKosNJuImIvUdxfWeMn', 'lwjZQXJIwXLbYoxPTyCQdGWOyUlpUsztOAsOBLufwiDRrmCzhB', 100281);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100074, 'DSTFdqYsRUeCHHTtHyRMelisOrYLsRnuuOqhOsxMeznSROPSHQ', 'ZVzJgKRnrRjFtRQsMfMmzEAZSKVDBxzTUVfSrsEjiefsEyWEoMzkbTqBFAYwkyIzKjkgPybECRQlbLBlgsNgMQAweXpFKwEdJPLT', 'jLwHSwnFnNPgqCEqxshUZHgUTtLAvgWvwAyAIAVDnzWsAkQrbWJuLXceZnWVpEGkFfAmVmovPSFeKXyExLXsqVRGMHycOKnSfssx', 'PnPhstlZvPCIPPXdwCaCArkbLyBtCOyzsbZMXAWYdHbExZZGZc', 100083);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100075, 'jwsmmEvRgIWmxAwkodsCFSUPnMqlGCOFfkHFmsOqdNXkzeCJXi', 'TARikFriKnMIpflJeNjsPzXegOZYFWyCcDjAXVIYYRtFUsavyBFYLPIeGnblZVDCCloIvYWDdDWSsMbLoBDkUkBjOTdLNPmbmeje', 'aLxsUkdCFRJFKZtUSZEVrDNfZSamCiaoSfXsGRcNzqzrZQtOHDQxGwVHGSncgcVIwRnGNBDyaTPBOwOcSXJvObOZDOLJEDnSQMXO', 'hMKlkbMnnvcnImbiqezwpDWBfPgmkuqEqDuHMlppJhcCloAfET', 100392);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100076, 'ZhHKWrncOMALosmxeMPxfScFdQPXVAznGyKKuAbTchXTOzorFf', 'fMfoLOLnxiPZUTNXbZijplAVIKKrToNEdbSrGfmUIVSbUUlWqxYhhElfpDRXYvZFXiJvYiSrSAeBkJngBvPUSVEtjXpvwWXObJWq', 'mJPBftZjkIoRLuNODxPKeoUyKkcQIXbgCVWtGqVkCuZFrZThwtiZiioMRItxzJKQowPsCSbOXWGUnGapwKzJSfLpVJAczrNDmYdl', 'PjRSeVGPlDLlNHiUmzzvqAfvfWcfAWliAFmlCqNydYJRrklwcp', 100082);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100077, 'TgQgCtpruAgYIjTgzXtVxeIAZswIYKqqMVsCPlErGaMlLEPdfo', 'HTFANsTPcrKkDqpNiMKIdedcJgLLILLYLZUVhmrhdgqKLRqoKSmYYErjiCyFIGXUJqiiSoeyrSnnBkzaAxOyRGOljDgoGMkSlSPp', 'gqgomMGMskULWTNeVVxbFJOsMbLvaViXGvtCmWpzQSxKlgQReqTltkWBSzHIoJGVkTJhkAuPvemPAWbpvWwartfwrWybzdGNGbkx', 'wHfUCTwFrGazCMdvQmFQCTcGEohnloFCvAJiyxejBycxWLhjIg', 100073);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100078, 'DCEiTwQQOHIOpGymGpQqhngFVBUorcgbhCuqIGCqwwMFphNmKv', 'TUAnSEsROmWIZerGmiAqfdUMDnOuuQqmqsjhemMASjMonFEIWdAyNfDoYDKPbgehqtYMTgrBoSnsRhluxRkMOmTqyGXQpZfqtXcz', 'tWciUmBfjyWMoTzgIpnbdbgewAxLwprkZfKCBsjecHEfQolFppodNTuTvaiXsQZBRvMLIWaswqDzYIUSgMBEYCfntOlUwnjgwYmS', 'MiwILSqGmLEwyDSnQZNyXiTgoUQKlIPWsvhKWqsWUkRZhSTwiZ', 100250);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100079, 'IOQpNaQAtmhHhGfHcGCfJQRpCvrOrkwiaKNZVDPGbmIPSUIJLk', 'vpbDZgnsnyHSxXwfqhYQxAVGaWjdsgihALgRUpcPjyETmhfTNZaOsTRJoyxLRukSjjVgwLvNiSiAIzbfPEGvtMTsOVffadtOwjxq', 'DSvGFMmjxXYjhzcSuhqINEIVZIwonyUXpiBCTvozvVPjpPEEssKTnklbBxmXmujaGtyUjBNPlESWNSehnHqjROZbGZzORqajcOoS', 'iRZFSBhsyRNidmxdDreppuEQhFsFLxctglMllDrnlCRcjuxpLr', 100001);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100080, 'RdRELxRoIVKOaOcKyhUZdFSXUZhPWkQZwbAjrvlDBvkMeaXffS', 'sBEEnQgcfgLChJlSggAkxIoojlkrfaDEmhxKSQBxfRfFhFwrmJWetsADUIpbjftFVPLUKJoCTTbwYsxVhcRTyRDcvLblqYObDtTV', 'editdipktnmgnRwHTZrgaaNfwHCWNQkLuchSYQseqJUlUnRytkNWhRKVMTFFUbxAsOBVaMqsMjlSfUWyRzlBHJBGYGpMbBpxZyEQ', 'ErcSESjlNNRyxpNkJMgYNdZfOTMHoAOwfjjrRHFYAInMMHNNyF', 100167);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100081, 'eWIUKQmJSPjBlyXXWRnKvtzIVpIPjGLwfxbyPslEzaZexxGrzW', 'REaDfNtsnMQZTjPieGSWlSAHqYpTlPgcxXtNkcOdjfvMjOWFvlKEFERyKgIaScykMcHRsaPdmTeGHXHvWKmSKqhgDWnirXlMsBUG', 'ZTAQsZTwpHVBZjrGNdmHdQKXfLyoSJbwWQopgyPDgBzxojIMYCmVCrMFhGYQtjRjObKfTqHtVoeqCOWzvepJXJhkHDtyVMiCkSQs', 'ZmwauSYfZBapxSjCfBIBVXzwJeABvhOkUwORLCmHCXHZPmIURj', 100256);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100082, 'xEpSaQclpdTLwMSNJoUPZENbJqtZoOBOXeenhiBlvAzwTElDTv', 'CnBekscUdrQVjxUzLcxOYHKUXFORUitCWRVNIrWVFzqUdRgOwDqIAJcmSfFSqhGeglsTpssNezrwabKrvtjZYCYxaEWXgVFRQdpP', 'CndxgubOjvKBqmJnnkCJGQrzesSbHCfwBOosKcLywwYBrTYBcBoYGvTwuVQpGWnGhVraSLjzbdfRBHJOsqhwKRNGoDTMLackvyTL', 'KJNzGagHPGUGjbvXEMIxqWFKrpXFtJVedMmUvAlJlSeamTOXNK', 100209);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100083, 'XkuVTsoqUwcbdHZRAOukUrOEBuHsFdjkkeOcoMVTrRBzWgSJaJ', 'MPqKDrttwoUVAnzTnvYQqQwtgPkZOCHMrWLZDjoWmyXIhyfCLdnTRTvZBHwYoljkOASTvWEtPrBcvWxPBgGinRPuvVBvmuZKLABz', 'UpBMXIsQLfUEvycOWlCTnnXkpsDOtztWOrXsERwsfuTAFMmDEzbdODktzSiuEHBDvehqzAIRtEYPuJRcmGIhiSZObRgaJCrTLboP', 'GqfUPhOsayFDmAgKYLzvQqNKsgeTvUTPywZxbjrkThXjbxoFcM', 100025);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100084, 'HAGAxKWjaLywtpaoAtoIXgZrlxcZkSAtbqUSeYMzkdhcFWJyxO', 'TNKVhMrvPyXUCFDPJiHejGMKvVdnPMRvYlFOvAeefJkmxWAlUlnNHgetIOhisyhWDyVkUhHBLwqbCsKdQPDEQvNovBNzWVogmucw', 'WRsMucEHTWUZQTfsasktSoXqGvdPhOMNixRSJyMCFMSaAVIgqWOWIbEYhHIaAXmhdnScRbpwmVtVvukQbcoEoSBcTutEigRMCblt', 'EtUGGvgdWJiWkjHBQTitxITUGyvBXqAxUsNmVkKSjdgWvyqJzL', 100281);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100085, 'PkukhRVCNYLBrUmvXzYxmaalhimeRvcQOWApSbbLBfLPnVsSGY', 'QtATMZCkisFeOkPfeLXAuYWcMHVhVEwOjygNVgCYTTSgTcFPOVhrIyITqLTBoBbhONhKmOikdQFsKRpHekebluMHhmGEDCTzNEUc', 'rzLemsXhMqfNPCPaRZZkzYyENKDGIonRcQvOeQZujxvQfXtXoIHEYlgCXNWBYAxQlnrNxXexqcKemZFChAlPfwZHMMpiwsGeJDVO', 'FSaZVCNxjyNHRkKzAvgpYOPajYMtulOBWlYzEXkAtfNQeRNCXa', 100092);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100086, 'dqWNzbHMUIviticqfFBxWugMeHcZylNZrpaWbbitWlBLXgtsFy', 'VvNYBCdAcyJjTFWmzgQKUpAVMSpRXJQStARNGLvzDFfeRqCVSRdhPyihJdrcEBNlaxOkKoiQWdeowUpqzzmNmupGDHYtkRARCUvs', 'cXwaLJHvLGXbKpgDleHXaFcyJSoIKIQCEiJvGpueATtLquYnsMhZRSSeDpobQlciSKnlyQFrjtMTLQhCmQytazKoYlYAtuEkUliw', 'gupttJCtuqdeuzqhROSINNhjhhQahZkmYIdUhmCiOZKvRlhMgH', 100298);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100087, 'eTFNzcnbzjsnWIMoNfpGSTdcrZrGeBNPCvOQNbBjJONdsZcbBG', 'xKISSKNVdTPKybwuuDqGOUenkVXBYrWgnsrqlDqdSINhufFNgMrpRxdofeMWXSQBMnEYWXRVDvOAolIBmvJUzfaVJiYDFMMVVvvc', 'XVnSvDzZHvAjGPYRCfuMfzVRyFdsgFOLiotdfmLPGPRPuGORTGGRxZMYEGmNcOYxmXtUTFCtruIvYyXEypcGcIrvtnYyyvpoRTWj', 'BJQRpbtkUlrplMRSOQeeuXHXuRNtfPpqQOroIdaAboTCbdUnSJ', 100256);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100088, 'KaJsevckvNIXuYGCyltMsQAWWWsaRPyLsuLuvaGPUvfRWcPFZW', 'UbEPmyjwhDfeEsNzWdIIbXISFbvvENRhtbrfuizGZfMJatpAgQjsEJcybkDKzrTFleMzxoVcsSISjOpGInPYKFNDTMIfBgBpPjrG', 'OHhDPytIRanGfrXrzcSrlpcKLuNTYCHbyIPODxdiPdOcgzDrTWgkHRGylukbeRoHDOviMentEQOUOAPLaGDTlHpPaCfyDdrmvSEQ', 'DFTgVjCQTPZBQlvEPuFaArXfTzVkjzGaUmqNeEcBqCNryiHFnl', 100241);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100089, 'AZoJsCGpzPDjqjUnndysATnhsUDeBUOKMCiCzjZrlVsyKjcjcT', 'eRHANEkyehUOoRXnEbkwIQGGmEAeCrMGHyUoeVjXqkmFuiPXrZpCSFnycCVzmMqjmoMqJBQATZvBtNQnbVJehgtfldArODXbYraZ', 'NeFbOknbkHBjiYkHaTvwMBpjNurvLzEvQWpyaTUarWAGHiDXCJkYEhpcijlZylXTDeVognmfAgOTcMiSrFmTgTxzYcAviQWoOULp', 'AjyCKJbGtqpejtzIbqIXRZYPjOSywOxFTXSJwrsJNsswvcLVrP', 100373);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100090, 'rHKOcnCtVgEikBUCOuUtGNXuVxQovvvIMuDReCipPlOAPdMMhl', 'RGsXWnBqkePTNpMcMugKJpHDvxvwjxWVxemSCFohwGzrrepEohVZcwggdSbMPzEUjpCQvLSeTHFsIZiuJcmHOsXsieROGWGsPFcm', 'USwJTCWgTfooiVEETXIKHIinrMkbHtsJyuwUhltXromLHMANWQtGDerdIBtotDkniwWprtVMhBNpfSXMnoekzkxXyTIFylfJiJHX', 'YHsAuAgLDKdVdxpBXAULvIFMARVeulROvHgMFkqQwjFQXkWETn', 100297);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100091, 'MYIjYCjaOhrUxwtgLyiNjXamJKxQiJuvowXSrYuvsAffENbLct', 'DdATQphblMFijLcxeuZoySnSFXPXxrQmECRZspcNOiuNjAEDPaCqcWkbJgZpCcTRhtVdfIcBIjBcUqPbJdEHNmSzkERnaiCtRcaX', 'tJjgVhbCQvoQQYQXUVjtzTfBnrfaArhBpvUduLmXAWNxhryETULTQlpYhQRKdbQvZgjZYICBNSMhVwvwRNQpEvVQgFYHslfKVXxH', 'lTflIfQxBryCaDPNPNiqUUGHEHQZgxBEtSndjLdgdJCqvJedVS', 100214);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100092, 'tsbsvQzUyMbxZffZpKHzriRvHZzeEOyIFTWifCTEiSvuqXpmrW', 'fYfYrMbhXPeawsyzrPVeURIPOpjfqDDxzKbpMbOAFlKKLgkTEuemgZjgRwmvwhpeCGCaIBCJtYXdBvunKKpjhHgeMNuqaWutsypB', 'RorODuyAHcYLxezuVJmSQChbXSLJxFXCBfkkOqtrvoLIKwsZpXwdZbQTWgiNTijClDcsZzlrsYTBJYBYYCrYOzzAHebECSQMWJaE', 'iHxjjnbHtpIHhDJhGiJshUErPZTMOOxZONpXoyDbMSgWPGOjYX', 100362);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100093, 'KLXODSrUrKnNibvwKruFJmWvgrnKNAhoFKZWoqHtdJfKcjscDl', 'FMqGumfMiOqrPhOFJJNRbwTpazffghVohywRHUJIwOHdvyPWQVKJnHhDeKNuETFEGGpaGqziuIqSjwpSFBjkTeVCuHQcjZFefRFb', 'yKdEGLDLQkmdnpMcgoxwgrOFdNdqnepbbyeofuHvfRwEUlKbKxeVEWEDGgBETzDgFCgPYnwhEyVWEjRCAqZudayKMZvmyFXczqOm', 'LtsuDYfhRdsCbgelAGtkTlNoxNIgvKxwMINmRysCsaFVojkKwM', 100121);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100094, 'tdqfTMEqwurGyNiSyexZHLcwvwCEaENvFmThKTHZFCkmMygstx', 'JSoOlaeZtLXNnXzmKoTdKjcHNniRMnrKsXdgcMdhdUriUYUemisRfYKkbbovJlIcozsIphFDhcquLDSyUErFbCyKZhBfGwaEKmPv', 'zcBYGXJZSQQKInVKsUzWaTEkuakCpyTlkUhukdGYsyXVIfTavfyGfAFDMdniYitGNmjfSUJCoOkSIGUhanFMzmjeEGHPWlKkpzVp', 'mfnhJxLPZMCHbdAbrfTGtBFKfaEHWTaEXMJjaEPSiLnksmzZpB', 100055);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100095, 'UpzmbxxjyHfsuAwqsPTLAkJsvojVwHjRsQNsJIuCVAGgrUjSfk', 'NhnsKSrCgMbKkDULwoGbOTqJqVgryawPyJvNMxBaVmSlWpSGLnKzsDekWEHwiWWupzToyilSbYeEbWHlJMncjgvjkpHspiUpGKvk', 'uVSRxixVDuIXkRpyKkWqRtlZsTqznLCEWEWOUyDYMFfuzumxzyBzfNCstKMaSiqWeFMXPDLyCriXfZwWdbYrAzLZBtZmndrxOIYy', 'OXVbjHCHMIhWSKuNdDypuuGginvAjXKAfWgHqPxHCsxSbzFaJB', 100385);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100096, 'wMwiRmYBcZATzrTnJsjKpyOFokmqGqYMBlcZvvPyCzOqxeIXSg', 'dAWlJSmrPYqkQoFtjEFxquJWqaQcFsGZBZJgcNSdmqEtebxvoMcpRBCeDaUybyABlovfxOpUzZpwiaYSULHXSIfQplDcdPYsRmLj', 'RHVUpitbFrjUWNcQDzwJSkcvnzPtgLwAczQlsJAeeggYGGsNBloDlIvVeVhPHSipRcVFsZVtDMBUcNNZmIhDEThfnHMGDHXxjTBt', 'IwoNsVPcWonjfKJLZslWJlKsGJyqRDluSyZwdEYrzVLYWMFAuM', 100279);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100097, 'LRkdRUnoYEXslQRhppQyEclDcDCCdToJxLjNtdRKYOrsTYPtsF', 'GNkTEbMNRnUOulbeebpfptAvhcaOYfqtEIUsJolLtWhKFgJMDabOPqAuHziiFTXhciyqYECbKvwOLiTKJaZyJBYlhJLvjqZgmRBd', 'PEjhCaapligNRUfaKybJbgpbxYiqfTJrxWivmHXurjqFzJpSdhDyOiJypSliHAHQyGGGtkFyfLYRcmYLDnwMlwQVvbZtnBIXEXxq', 'moYYnsPknLLqfQvyWSFuwPDkdpPeolYXZtYBRpALnyAmaNYtGf', 100316);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100098, 'BUArHfiaPLjrlnKeEIdQJppNizLzRNmhSZZyUYwPKMvqmbUizG', 'UkYjmfOoplMyQIkZOgIpoflUBPvVOXztJcPdoooINgnHCfYEjHJCKpDKJvoDVLBeHjKIopXyvsAFlZHAEgOUqyfGPynsuxHiQRiD', 'fxLyuBRChoRDCUXnRujRgNaZUZOSHyYcWhxymNOascgFmxeSvajaNOhYSQTnldOGZbBUXeXPffheMIlVbYFhvKzuRSEGIGkxGiYM', 'sVeRGudYayVJUUuHSTmqqjpVGqPQIwwPfwAQeoTzsmPbfPXRjm', 100159);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100099, 'LjNLzceRlldqxVihViDKjmmAYVsJKKFOKmenMkoWoMVTOGUYzJ', 'YOfYKNAEozKBZBWTvIkHYOVbqSDgYkcXhsiCRjiuODoJVNeDFrGhfgXZUUGdziDzNPvpsUPhMLyRVqBMaMKTwiBaCOnOqmuGDrJb', 'akTsfGstFVODjucRTiINDOSdbCayEjZDFrNMbPwuNCjIqAYlvAYqgprXcxXdUicZmgjeAVIdsxySWXQQHVmwLDFpDfZWnJKKWVcj', 'GraTXClGhXZSnAjNBaJnBqccPDIwKYuHlOuqUzBrmVZzoJJDBB', 100288);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100100, 'cnlIcSuByiZDUOgCLUTcFYQXrmUWHhsUFuieWBhacRUEmDqAVn', 'THojDbuqTYknznbMgaPERlooFobGRSAvitzjtVzKBEiNwIWwnyJtHLyFmCrYwYiqjgBMDnQMdMvdxxvYQIIydwBklqtpvAYfDavi', 'EBGuhYoKIAMxnTbNNsvWFUFYRCorGeMJqkKHHSHoKVVzyzmiHucBkCIBLgDidkLjyxOsqMLDPMesZwAZOWGVxRKeuHguQBXsDgWI', 'SzhRQkIOxzEsjHPFtRGYHarKwrAiibcNUqlUMXteOAKxxYxIqy', 100109);
commit;
prompt 100 records committed...
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100101, 'RnRONIokqGmrUMmVXGYPHsBUaNUrIJvIHcgCshkrspQBBpOeFN', 'pemCTOWDGwGMnLpWBLnWaQfwvoWANVsyDrsjolVpgzfjcecTVXDnzJgdzZhfbVkjnpFloDqrwnfvpPffJqufQGAFpHdsKBvrDBhy', 'XtPqrCqkSNZCnCsoWiuYyHZpUsBBOzWWmjpKDHWOlFGRwrDLnHvBiZyAPWsrquyOoORraVKJLOfAWkOgOXFkqZiXqfkPSDgQwILT', 'vrqrayTlIgwbLhgbHkFeATzhBpgXycFaCcWEQwiQgblAunslzB', 100022);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100102, 'QHtHUMdPUBTbgtJauCGdZoYZziIROzuDpfhKWvldyQbQChJHVS', 'hraavglwVQdqMlEmdHUlkmAMjCBdyFEmNWuegNGNZMPJskqUNyQnPweCytONjmIhpmtGbcvYylfDyqvXbPUtXQnulfZSPYqwetIZ', 'gFgMvEarCMnGDBxtLLqoiZOsKDQAbZOxQehFLpvlBpaQqbdKmxrehiNytkZjjSOgVvQFrsSJThDpAuPbwQifRZCRzbWhYrBSXbGu', 'FPGKXmrtcBxGBpGjIbArHMqbenbHWItRspRuAnyNuyGdidtlAy', 100359);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100103, 'ryvHdXBVkZyfHHIxZoqoOWGMjwcvkhtJfxziSzaXujdBsLtmcY', 'vqrmnYFuvyJjUjjhzuizgnoyjMZzBGYcvofRUPYajxAWHePaKfvTbDtetQXRVrzlEriSJiAYaaqmJxLYMuPeVCwhwdMjNiNztMWr', 'MDhGkvfSIbVvEJmhUdYzmmntVIchAdxPHUNnhAEZkGYjEdousqhnfllnVvCoPsCjSNXZjywghoNQsmDnqCFGRLCIsdfdUauwAskc', 'eTLzvXLaEhXnkRlcgPyYtczUKilOywUBxUDTYXHubuhcgSDtUO', 100066);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100104, 'yIAQmJpBdhRAuLclJjrWcENpvDXIWqMnpewQtGDtmhfjwkhlyx', 'ddMluRMbEFDuweaNrKbkAfycZFglkXXALIbiUWqNXlFiRVMrLIUjzcfnhtKCoDpmaoMmsfxAIJTfmPhcOvMOKIsgIfGRWhxFAHSL', 'jyUqGxPWuetprvdOVlzdDFvlTAblteTFcEkNyMjHjwXLwmsdrDFrYqbgwBZNDLRGqdfsmKmEIIqsOUGAAwtyLgKxrZXPrhfuBdag', 'OmcNbMbaVvZoCJQDtYyGDZSdZuaXzkVCmAzPZjszOzSAzuWePF', 100177);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100105, 'PtQvoplpkAJcFltfmpBdJmMMXxEetkTTcqGksvuHwQPgIGLRQe', 'MTjgeTKHFSdajUSEpOhyqlkCZttFBiILCeISuJHWthLURNIIGIeSvfsSAmdDsDSIDxMQRnluIxFjgEEOnWSNISVcoGDRHmISBCLb', 'QSxPNxJEVWZWoqhntEKuMWvBFMPbeWyLzXLrDeOKWHEUDiDUlDgrlYgmvsHuDSBuNnoyMaDWryJilbLkRrIVnpHXqdLIdeUFtRjd', 'urEahoGeSEJDJjuXfGBLLZZASJlylCalsrSDrymDIqxiWzSPBn', 100052);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100106, 'mVkNjztxinMDdpdEvGWyvoSOACHhJpjNIFktatNGNFcIZgsLlk', 'mabMCqkyWnFBKVGpYOguGePFjrtxFXwrXQIzFPNhGTKzMBVdkDpXQvFWkjomHpLqeaSYLwuIdwejRbShPSaxOmfgTfVUTXxWAzpE', 'LesOqVFSOdXNvefghXpQtBncyBDArmbymBlmFPjCrSOcpogsbZqBiKqNkMxRkEzrouroUBZUiEZPbjZytEEmPuvGCjriBLmNmpoU', 'UFtDcgOHCZFPWMrtQIjUgSCiTgmypQcmPFpKVUpuPBZFkpYktH', 100066);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100107, 'hGMFPfGZvkmcpunCEImjNkvJZErlfOgjkCgkRjuUvXjXxYTjhf', 'jNRiNFSLJnfJJImoRqLxHkCmnIHfdefnJDdjqlmwYfduHhTlVvkrfkEGmgAcLjWhAConRpTaQzUMitSlECuhQYKkeAaMIGnlOCpW', 'mltNbFmlpJibcBXjUKzJmFSJVQDAGwgCULnbaxJDdwORqStSKoNYcqXuQGtEkWHxeeECNApFaTJYufopJTXssnqPCAIaLddnSjoP', 'MDpnnGAeWBsYBMPxcpikvIoRyKBpEkFuWVtpHOltUhGedYGOiq', 100252);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100108, 'lcpjbKoOjtCdkIkmhlwbjFdCnLHoKSbmFgJyyZmbqFonrQtltC', 'vhbthvqcAPlEwnnviyeOIDOiLUXMWtkNDvDidzTaePfoavxGOMrdnpMzVwCmdIfSbANPuKwLkrDUMNCqntAhBXjgvEsLvXpQEcDg', 'yPDVrkYWOKdItzgMXlsVAKqyJfQZkpKzcfkfNPNuJUxXoaFIlkdpmlHwslbLYKlGYqcIAFuzSOynxYcOsYDNTmkgvcOLRXOzgUwT', 'GPJgFScBJnmIcLJVYVyPYCrtBjoAuoSjmwXVLMEhzQMSzVQSHB', 100342);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100109, 'ldFyqyGUMHkvHLPKKRLaLgygeclLYrahapZfXvXgvQvAstSgVo', 'LrqQDPhYAHazwgvhzheNuPEiyygulSzIIHyvkNPjXngxlezVivouxGDyKmdzbuWiahEFngJibqMhgsOLWzJOGCRxNZwfhQMjeVBl', 'mZuJWbXuwXdAMKTrNGYbcnDxRhwnHeviaiVdAMurYLDYiNvAotfOHmOboohAgXVwWcYCVRpFXmoNmsusOkADpBgpgnxzrCrrSdUi', 'tAYFYYlARyKaUyhWzHFFRnXqYpIBMOyLxAGSEZhODQqsStPuKz', 100335);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100110, 'xYiQRVgZPOMWJjqvFZRpMaKUmzFPKmnZGauopimSyZtrOxxUhX', 'UHsTHgHJjmiKwviNRKkzOPaSdQmdXqLgfDNPiqtevftFxxpjKnyKzZzzKHTJEInbFHTKzEzYmUryBqrkLyfFSvjctndHXfkZxSck', 'MSJZWDpeyTTtagoucNvqmfyvWnLusXrbuGcHkAtCqTEhyZsdTBGMGwoByrpohCXVTGwBPLuFqfJfgDADloSgvEHXJpdPvNbcZbnF', 'HNOouelENZCfmTDBiRQjEqUzrDTEoAfODrhCSFXZSSePciomVZ', 100314);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100111, 'oafOrKboJXvVHmScnOZfdtTJqpNMCvfvsWUCyLTzMNpBvyBrNj', 'MqJmvHeyrHvwnfYoTiUHcCeRjIdZwlGJQxigJCKJwBJrbszscdMfMwmhDflcsQlhQBkjTLRGrOssnHmHJtITIbNmVIKBtxqvbQMm', 'DFGwBRXQqLwvrEpslSBrQIastBKimiKpryUnwMIoQnnRtsJwYFIiICHLCEYOdLWHRjoFKjLDoPKlrNKkwalZDyoduGQVancyOIzb', 'RpfFfzPTvARolXdYOjRTWZUwWOqXXyYyCPwRuLIVSaiNgUDByX', 100068);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100112, 'aeIvNtiFlkFoQZVnjNIySmIMZiRGiWdVHDxPBBLjbdRVPMzEGF', 'sfksSIpKrJApTZBJntvLddNkZCAIjCLDyTvnqldMJEBndmffhLUWVCwpXZNTVILOZgkuwzkAxXLOYXtNRcenOyQGGsOMerjEhaUo', 'UdszrCnZpJupLXYjbGVFuqBfZGgHdOgrdDGlafwwEyzEDzSBbsZSsjNCYcomxfGoxDbSXWcVGNYxgBMExkLEyIYIxyenxcUEpkFS', 'IKqmpLPgiWxOpurpciZKIuwCiVEtXWwobKlKDutxBZiHrJpBQf', 100014);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100113, 'bIUigPmqoSvjpSMsmCmkFWHJLyCycmUjRGsqnYoarPlHFjwrEm', 'VFpTHXuEYwvQhvQRHmmLddUeodJiDIayhyDfJrDXjzdWbXndUSfmJLycPBYaQdrGpRXgfVsUYlPTWqkTqDVXszbEJCSjmIWjMRPN', 'hSyLbdhfGLitKPVJkCWVjZyXWHNvuXZdEOwGoJUzofOMIktpjSbeXjYlrPksABbeqyjBopEbTEntjauKTQurwhQppWsjitusXCGD', 'MEwKjIttABruNFNefNGAYyJdKSIjgGAiwQooHVXiQCHGjHiqlS', 100368);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100114, 'skngVmTtzGfIVkKDgAvvUBBZGuQhwqeHxotBScMsAGewrHlbvB', 'rjvhUeEcowOzuSfKJOpQIiBxNyiJAJocUhRSFlqMTAEFlAXzzWQlIStfwZEAQgVjofGRLxXdRbYWrBajyOcCddpqFEGrJppvwZCn', 'mjnAbcovrFSCtFVqkYiSHZOJIDFVxhDVfhpRthUpwECXjHmIhmMybLsEqdkUXsTjFLiJudNdembICTPIUJmfRCFjnvPyKchyYSHa', 'RZkZmkkFKbjPxNwetiOpBfBSVTOnDQeyaHNVrMmwqYpgSQVmqj', 100075);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100115, 'qbaUnnNeKimqOJUZczSfGUOzXkstQeSnEpbJstJaOgIInFecHJ', 'WkhCdXsJqdIZjsQULMwtJuxjLEMCeEXCGPmCNIFLXNodoHPIFSgtjhERfMubQmEoIfBWvVWVrheMmXAmlkBdQMKeiIweHjqmTTxH', 'SWvTiQzYVXbHaiBdRCvmyIjIrBkisbcEZHxIEEuYTvlsBiPHsesFYEbMLMkRJDfrJKRLKldBcIJKfETHuwaiZsqhnkRYULvpUTKF', 'EKgiiMSOvEEBJVzejyOyLNuTqRkhtBOXOgNSaOdQFTVSqCIRuG', 100163);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100116, 'hIQmtcIIYwRSWuXKQYHkWBgsUYTGuIJEADMnWFunxyBIsFEZgT', 'afIUAxtpixxjMVNLIqEnSiIsXwAdDvmEKPYiLaGFRKCVROGYUJHbHiPUNzCWoBuFUoYmAzOtTrIcPMQYtflveYhbBNKHBaBeJWgQ', 'QburRrAHFDrzoXIKRaKzwFFjgaIibwYhqJAbbIHqDCvQBvVrwKvCJKUkBQJcNwZUSpMsUjmXqBEKktEldVBLSrOWEaFhtGEELSDU', 'abGMIdmhERokdblgBHxDCNOmxJVpffhrlZHaWuGrZLbqsOGkXM', 100289);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100117, 'GzDVdsJLIrJJtDYKFTzwUvmUxkiiwEFInNmWJLejYDFhbwMkiJ', 'zXGuNbvpvGGMFHIowohVJHfLGDiIdKodGGvdGuTRRbIgYJfQlKQUUqhuquJmvAjeewoFTQpVGQLwWwsMHoKpjYkhHIHNkUlmQHQT', 'YPNFsukjvCMdgwPazmVelenUaKPMtTDXcNSLgSjEvwHgiCeHepMtNRBfGngQtJESuPxYZnNKwBaosKzxyIufAKANsbvYqkxwhunH', 'lRzGLlplJUPQRdeQESliNprxdctKTlZTpRmOEEeUBnaasrTtVB', 100397);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100118, 'cXyGeEPXPShhDykRwcHOSFoSQlhGPcxPKbCfyAkwZfCZYQkulj', 'kISjuKUdLhFRVQbcvsZyCTObhNyflhSXDeUGipleIweeaHQkWLdJvlztWDeCOZbairomgCucHCRSNpKTltdjrMrLYaBZjSzteQDu', 'SrMxOHyZoAKAOlNbNkIoAgelRXoxgCbNdQHWgAqxxGKvRGMKWyPKCIVhoVklIBdFQnVPBCsdzWYnZCHnrgxURYkUmBKPZBokwGMs', 'SuUyeATxdfnzstkBYwiPXCswVqLPizPZlRhtIvFAofiscEnhQC', 100329);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100119, 'aYBFdKJQBvBDlmpUJbWTMFrykcpKTtlBDlQjBnvOsCONtARlzq', 'HKjnHtlkOCSsdfXoIteIggEsHAkYrmcwIxrvgGQuAGqjiKCkjyIAKSxukpKxIEvkoEuaRjvMsfGTvUECxcdfonrYVgHZSzqIhsmg', 'TypiLkRavhttIcumsJQARJeHElJoVrOunozXpJgGQOgceOfRRVqneJsJRVFhdgKyWTqCZdakVQCAZcXskFcWSqddPhlyYaatZTmR', 'wTRhXPeduQlhMcfzYslEHHRSDOmxOtuWbabOOlDVxyDpEnVDSI', 100045);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100120, 'cjrqsylLKAehOazBLclKtTIqSsNsJcYhGUJQALRyOBOaOKgiNI', 'qvkhjAsHufHDzuQCkgoVJuWfrXpAfmvPRJVCQXTqALWLmfefhbArDePuORbrDBCovvINZmVLRgAcECiGXZhxnsNefmiWqtpSiuEK', 'CKVAfKUiELRurzGXlTCkSoCzycaNtPRprqyFSHBAjnLmEgGgnXDBOHcPZWzGMVGexTpsowpmwpcJSuUhTpSPwFIeZiKNEIbsbwQS', 'veIyNyjIpiYCsCHPKsKDuzdcrUkhlsJFQjDgrXCkWTXwBRXAEz', 100299);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100121, 'QtBURADPkRFpKHgCNZphshbKLVRyIUUKpStXIYRiqYgyyBsIEG', 'UwpvkYPaokWkPEQADAFBqkzbGBSHGmbcYWUIhtrCEdNKcsrxfrZWxvVfnrsAWYvVPOECipCzdRxQoGUzkQtktMSkcioSEeUxtznK', 'NVQUokPSNxQHPurNGwJGGSzlbJqxKUsNyxJXhjSfxOHZlFlXoYqfrOHtXVnVtOSBILkOypwsyzqGtyhAxTnjRPitpZeUWAbGFVUd', 'SdzOaRrLOXUsaWvUANgpROSTPqpQiiFBuERrpRPZJdxUWEQaUQ', 100022);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100122, 'zGuixEzWwNLBnIixejjXhTnlKaBRwqWefirwcjeKrMwflUHZjJ', 'QKhRGqhpMJZSDvVUPrgHhrpCQMMcAyvCEcmdvzJpSWBVnJRsQQSvJEDqAkTBoXUQkThYHFdRbsdwFXeaptNjZlpdaIcGIHXJQuls', 'veKmpQtzKhtEVqntGNkWncdPXzSBtLjZstxQGyATySMFdtXrTiWqcwxdTCsMGfjJaKfMGNLozzEeVerGfLqtXnzaVlVwLnrMyMGq', 'ViqnIYPbVCeujQRXbPWpARoKoRhxUyWRjOBZdfpuEVBFdCttDl', 100085);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100123, 'kmMJZNtiyeYAiWwcDXqzschyGoSgXGrBBEkCncBpjlPNbUHWCW', 'ZwezhdhSIqmQqgLWIfJuPcxwdEQmZjXOvPJgnGoVlfSrflLTabfpsQuQCWJyIZVwyPgjAOpPzSADWBBFAsoYCKUeFXpGOoXZGnLL', 'CTXGmCcKTXxAQxNpbDfTQvBsBskVAhDxzTtOqPsfssXqNtOUjMJpPlvMezPthNUfXDZtNavrXdtaqcoSwCPZJtEtamjCZhUlZVzN', 'zYkSWiCasoUnFtsAoXvjbFwqqDGhqoPrIRaspwMadmHCtPHHii', 100060);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100124, 'DrbwZTMiachbbeXKDcmOOCnlEFOZNTvVJFkpnXyxCSguNPuZyN', 'MYDpVIHqciPPGcRazjiMxJoHvOWqnyTntwyPZnGGpQvsIPHVDEdwwmorlEOrztBwKwlAldnVKUFHgmUQrTnQFeXBDhLboBAFDpNu', 'EiciOTAENDffZNCPMBkZyCnyoHoezrFAzHwgrFRZntghlFsBKVguhWIWAQCLeCnUZFqzeqFtDrxLheizILrLAwgNhvSImYPBPlJw', 'kWnhQEUzEkHGCwGpDEtMsLjrUYsjgzNYNwBuCGbgjejPbqAvzt', 100221);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100125, 'ZQwpYslvSfiAbuJSheXMjpbPMxGehxYsSMDvMwAAbrJWqYCpaX', 'OpiFvgeccUbZNIAXNktdzUZDwuxnniFCcpJnLmfOywTlrizVSLyFLdkvyAixDuxuzYydpeiZwzeTWUBdKmfrpKKyagBVwjkhjjRF', 'eNFMyXfeSdXjqvkVDtkSjpPaYReqbqktpyhBHOvcpulysABRGDTFgrLalDvqbqcyGBmszHMefmcmNsdenSLujKzJQtLSBhgRbaFf', 'TSIkEfsdTmjvqEoqYrNlyoenQrZPHBfxzCTNyAPQXyNkuHoOLC', 100155);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100126, 'NlupfDPJTLzdqlqMAzLbyULlHslnbFeDAWnpWWaEXPRGUIkqNr', 'bCrHZrWieSfEFVBsMjluxfnaGxLLjNOSILIOUNCZmSfcHJLrPUrKdWyPERFExggFebisAehlEquHfrksyUTYkkkKfMCeSPjnmVvr', 'PQSLOwBjAXdfAmftaZmoTRmENESUXrXXVjmEyhjlHHJKSXqtyHyFmmagUAAGCjHAaKUywmerdGRLsAJoPwhbZsIrAdZMGFUxduNW', 'CPzBgkuQQkUqLebKliPinftsXPlByUbFYGZOvHZgaxtRFssmNT', 100151);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100127, 'bUGUxHDeJwJjtXHOSnHAGcOEovreukKKUzydcOxXOuYKTHfAsT', 'IPAMCszLGXyDMzIKWzQvtZaPjFDRTsebsEmJQqTxUwdrUUDcHUjtSMckbzWGfObHMxrkgsuwupkznhILNesrhYupMcwMRpJqlcXw', 'YAiHUtHXyfCfznrsZPrADhTwqdDpAtdnTSztYebCyJPlGoteqHrDtQqtIcYdCXFLTEDCKKmpipeTCZJECntDNBgaXjivsFMNysxQ', 'QDqVPbzMupYWUqkCCSwlCSBttNEiCRrfYEZtLLUZBpRHWysRTC', 100024);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100128, 'AqqjwgaIqtmGbrnTUFnBhGPVTVvZDScaMcJuMLWrcLxrjdevJv', 'lXQYKWiMKrfPtwmfYlvLuZpbKFXAUsZGqepRJemenAbqhceYRstMxOZxCWkWIPkHqedMjhTMMqdfSYdxsPjydpJcqLrHNnLnDRmg', 'PBeQVFAQgTIfZEhgtBPylCDcpIzRggIhiEqPpYjmLtOHuiDMmTJCqLrdaabBRxJfZNAWhszTloEnbLDEOfonGPqbBrPJtKtyDsIX', 'SIQbwrdOypFfeAQcxvUPVKYxRoUUgsoAGvFPLLlgMyfrsAqkHb', 100323);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100129, 'WopmeMyYHyhgBQwMcTjojoVNVGQNSyYUWtzWhurvCdmEEaOWJk', 'QNwOVjTyHoxEcLXvdWCVqdGCqOCtGKnXxEqZLNZfuPKtWkNXQCmkGZwsOWGuzhmVKrTaiONofJZVABDqePbptkVVGmgNIOoHezwX', 'IPLrtzDDOpGfESnYjBukpZdqwlKwEcelDquSHKkCegXdWPaYzlHRXNVfmjIACDFtkhLRtKvgljbuAMcBZYQSDEZbBdHUsiLBzBLZ', 'QOLvKPNJGiybrAHrScRburkVridakcukVfFkeuIDEIulvAAVRs', 100280);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100130, 'ldtrhcvKZPtvPgyazlIYDCKvTjglxLgWkWSsMTbXJhAypXTNjX', 'ZwvbjHWpOLbKeQpfpqFkaEZrIwcCgHqsRBNVciNEYzZZUmOJvbViILBXuXSHuvhdtmnAGFfXBbNpwxbFdbYvjLioeVgFhniHJuLx', 'VWjIaYkhFrjpLmljOlTlLZguWvIZyKXtSEfOrmlvFMaPqzaHDLUuTBOOodoBZPSWdgHsMyVEwsrfvmFsYkjEwBEAFDYVdldesTLn', 'lxMxraUdNBNiafCGzEmeNCbmEyPvGfyAZusCmCdgKigbyoRlQn', 100081);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100131, 'OwodyuvqEMdFoTcEZzwjXqRhillQcjgsRwKlArErGwEZLxEzxD', 'UkRxGQJNaEPzrfZeYgcdckOYYhzuYHkNUkIpjPTdiWnvQHaJbZmOvdGGHbMfDssmXIsDgfCABVgnsGUNYTOPjKtWSBvNPKzQVtZN', 'oVxpRjLWbaNGVNcuGFjebyWpDqPFOWihrxsoRWMqwnIYpwyKKHsnOtscbljucPGuBoQgjFgKSQIxUUXqWlxKieHEALUiNffxFxUV', 'LBkrZjgUMLpvmUWOITkteklOBBRmrakBoDNMkTHCVHMQpweRZL', 100117);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100132, 'BdTOxWGxYahYSuWUzfrJWFfbQBWuFlGnTAvhoAjOLXovrdduzK', 'YkcjjEYZqurovlGsEinCRnpcABlHAzPuXaNSfqGLUgfQqHIisBaxtPnvwfNzJhahMAtDbsoyHWHPkNHETQrrtwhHcEWRflQwoZfA', 'GCYOKSOcNnUjrrksdrrOPcrqGaNMYZjboehkUQscywMrqtGuzqNAfPlQodWUbOkTyHcgRSBqjLCOSkYsgukgzZslxFbesZbxsBVl', 'xxgzzVdeUWWqFHaQIFGmJLuMPAyIsqqBzIsQohyaGNDMzxkgmv', 100130);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100133, 'feSUYJfrbBBolJmIDFZWhnrmRAPhCgsgENRyOqDgUAkhpfAJBs', 'JLPixjuYliVYqKpoiZuYEVwYJcLjvlfvnTzoMAdtdTiJIVxAyrMxniEfgEtNImrOHKYnqyPoyqekVxImSWoAsjWRdzbrWaJZFlnf', 'bobeEeVOoJNvUHnepTvttREdqFdZXbCXBUvWTHdRjCiHasIeBaxoZxynbYzDvwPGEHGeWeFomMoyayQKPkPEFRaGfVgxvNbvdMkL', 'qCOxCVuXABEcFYvUUeAXcFEzgbZMBbiqyYCdytzKvSibqGzKOd', 100134);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100134, 'shHVyWDFHAlsBQSfSoZoNePnoFskGlIQszjtGLvRYZbEvMuxzN', 'QhWgdVxmYZVgdjrkrmVpSaKPlBLNQBZnnZHlItQIHLWteJofGiGrNSxNeEgUFykMAhFaRGGYxIoTIbTQoylPTRNAZBBwTCNkHQWc', 'MZxIBbBwouhwLcHoSeYUkCCIxVMpMihdlVdvEgZELSehrZCHxwzVkHsraIJGYQNNCpcEMAqMsHXfBXLzmsGYTBOWlMoFDoDhsywo', 'sMpurgBFeAjgzSBQFUUvkiKpHOopfCRBxBKrVzoQCtIXEBzYNg', 100026);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100135, 'rTDroVFZWlYxTVQTMrezUpeDJOUYbygXLaeIgePgyWYUZNFSnf', 'jjKFYUZqLtBDUmneMJXNdAMezZCvtsNknxQyvNWiKVwosPiCcYrTUFdQDqkRJSbnoSTWgyFxIkujncJeNzjzuGhOjlgxUObDyusl', 'bugLzVmQPxEFsEGpMmXccymFGYUvCdLYTVJbFKMqRykStuPOOiGxlxOeKvFFciYLijMjHpLSkjQIEGrzEUBiBhlQYWGJfounrJvd', 'xgNsaRpDLQHNARpSowtXWyWJMyFixbqCvMCWgEQxfIlXXrVKrV', 100012);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100136, 'ucPQvWGIOkFLIYKZEEYQvMOjWBySIBMMAvUoSIOFnYoVxBacxZ', 'ChIkEfdFXRIOaocKLintdkOZJkdvmJMmrcpMZxmgtfDaBePsQKlBCsxznYXUYuZSzmGrQSyfKmXSHJHdmXbjXWeVyPulpqizdotl', 'PJWsRRNArfruivZJhnrheRdFxTNxpWojYjZabVpMwElpSMUtkrhovHGfhcPSoTqhgDCJhrpwAnzRjelthJNTwlkHiQduDoLvUeDX', 'yFgvmoBKiiYAbcZjtzWQMRsJwPXcWqogyUtBqfVPRVKTtTikPz', 100093);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100137, 'FjTNfiqhCnBeLRPgbthmpeKcBduVqPuktQHKvCXJHfHTxyGiIh', 'tNoacJAfbsQsbRDLJRIvIwgTdkeEjtQcHeCkNjOTObHvcGWTlIiCsyxGjzHDaJXdpZEadlLWCBQAgwsxTNuxRYtZHnKumOmGSTxY', 'tZElEFoiYKHFAZsbZFpNncrfIrjnXyNNHiMmKQZCghyoQRBoWURRZuynpaVQHqVhGICSApatMLYRUeVXSWmpOTdkKOhSxHdirQBQ', 'BZJYTTKRiwJQQVeRQuLOlDqOHgJWCCEZHtgeeNpdAQFTMyqwKC', 100054);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100138, 'BrhacotneteDlgXMQlAdQqtBOCkileVqxelJtzuwguzDhlKTDs', 'ZJLFbvjfEuJMdhFGEnkkruvXPcqPVEVVKngRkQgKVxVGwewglWYFSfRlOiRnxapWucxVYATpAUzcCVZLTOEPauqjAUhTCXwFffeq', 'wbonNelAVVIUjBDllOBNlkpmYqCUNABWTGKRaqFhRcGMmjXdoiWxZrWWIpIZzPeChsFDWoktKFIYMSLxwgChSjkeTlPHFjLBNxHf', 'ELbuHBXvIGUWlTSnxtUmLTsChRGvBlyiWlbDulZQVaFSKlsFDB', 100227);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100139, 'slIdFyzvcZgQvBlJjDGWNhsPiMbujpVsjvIGpvBStKRPAGoVxH', 'xBzFFilLeaqOblAHTBucBCIzhONuAbpmVYPesbZmRQlWLaYwwXtDyekUkghqReKAPAQCXGtrAQihKIZNLCywDXWXflRfHAnICrSC', 'gKdmVALOVTchKGPtBTYXVnBApftsxPFnXXlqxDvEvoblQuUoWSPuzovslnkfnbnzPPUnVBgGtYuSrnVfYjDecNVvGMvOAkzMNoAk', 'BUpNXUWicLKMPKdLThWWvUAzqlBjSgnqHaVmImgOPkJTJeMjHv', 100280);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100140, 'fsVRHfaVDFRAhDFldJfAjPlpsyIogmFffroNErNAJYlwWeLtfJ', 'zVZzlZUzxAizpUoAzLIbBLqMykARlhQJYxCSsQGxpPyDXCFRkqNbPHvmCKZMoJfbWXhlyqzCtNPxqOnPZSnGAmMfrjUshgVpyKyr', 'GkBAUlbgQVsZVoGyxHLUXhkZpFQvnkmSwBXGWbrabxfkxerUwqvXjeBxXCCQxkhPgzMRRzgtETkdXfossMHVZRMyyXDVxOgRVVmO', 'wEDWbcqaZYcrPhyuWzGvETdhsAtuDpPikNWQueTsZKcdkiJMAO', 100159);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100141, 'PwvNzGBZMQFCaNdXVkZxJROedNeySYICCLwmgiSwmQIkeKnXdG', 'WhqnbVBNEvUshmbnuoEWlUuEJeMQtxcLkVIzOioSpwVtExFcYGNWAwTxbaSPunMJAmWsJdeNLVMifjYnpoZtDSYUwtojCKqLtfsA', 'ezOnJUhebWlsBrsAqiRdQQRiNdjmVUzedkNQzsArAovlPFCejEaMoOjgbMOgxISDhHahqDtZMnCvpLHeefySLVgrHpdRIpneQtZG', 'oJlyNjAEGSCgNxQGDGUEWIKggogpZqTuUDEDwCFAcvPgaVPRrI', 100078);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100142, 'HBDrXhboXZpcPqiGnmgSropBkBPRQwFEdYLXcBSSMZqElZlDNe', 'ghBoCeWDlUNBUhQtnnrZuuWlVrZRTPOkdoQvJPpkxDMjmxZCPXNXZYAbETKPwLlFwPBklQMPAZwvbdckcMAOItkVlksiUxDkkced', 'WiKPBagBYRXwsbpcHrlCBNVYIEkFzjnxuGowWNHxKFGSWxtvgxngxBFmrOvAOIjpbXENSgtuyewJpmKwuHoyHMonSqlsEHQMkfHb', 'YJCJWtRaMhTjkNuwVyFiHnMXTWRVVcJlhkWixxjIvkgLtUVGhu', 100163);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100143, 'ZIaPAPYgCYFOrBedzSjoUnRRYRFlmhYbZguMumdrNYHEmOpWtt', 'AacyfavCEUbHjUQSMaYYmwNgIzrFSQCuKGtUNvKKACqmvdRCMdnJZjfRYZVMhaTgSfyRXsTjDotVWMOzjBftqDikEEwDPOmKLUTS', 'RNNIteeLIgAJBxtWBgHDERUJfFbOkQxRDCsvrXuoMqiiSLKDZwbmthqGnPUiLZpafRUoGIAkNutlgpQBjElHAbABeCDBZxlKlguE', 'ZOPMLHlUmxhFSsTgRzOVbEgvjYHKFibDrXSZzeidIgFzmrFeaG', 100324);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100144, 'cbDMgpOKrACwsWlpkBqQZtXHevwHHuWuikDpbYllfDEGaZCYfl', 'yvvxPCPCDwsZBmIZdUDnChHxhttdacmrlvkmKlolTqDVJhyFpQzwGizkCclOzAzMlbpiqOXwjtwIThRDWYmJXhwRHejmiWetMNbE', 'lYpnaCDnVhxyTWSAatmEluQkzBsyTLLTyNPKMIElRqafBtRuZPRmOdpBpcMFJiIDBlneAoOMLjIYXGTQkLwdsyrrKsgTXtNwtrTk', 'ISLMJnOQxuOHlJRzjaJJGzeDBpLHqcPDVhQIfaRrCYxgxLTKPQ', 100110);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100145, 'AcpcRvgpnucmHVEqMsbSSyhFYUWypPQyJFmKFGMZsMrubSNvzC', 'wVOgBZenChTIgfPTnIgLmLCNNRZFObtCUEqdOqMIiEFBMrhtQdmytrFBkMYprEigHhbjLsEQunmhaPqouDFzNvZxhoOzfzEWFEFa', 'fvLVPBkPIsvXYlclGRZIeTahFrPTOyavVLcfPJgrOaMkxSUWUKHewMozpHkGBDgewxpgXpsrrZxksrPhTeTDCWpdPNcXLEhVwvWS', 'uGmzIQDOqZmeRgeLfDejwwfJzkbADusdeOwPopkFWJqcUfXbVe', 100005);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100146, 'IohrDajDxkezzxflfHQUvBjpafCMGhzrVZDxSKxTrepuqtpzec', 'tlziLwLHurRxJqfxNZAYwnXoGbBTZskLrFtVkDBAMJylASxaoomLBKmqEYnNzZTytVuyWUVDrAISRfLafQbuCkVqoGuSghcUkumS', 'QSKdVYkpQlQUVnDHnbJgmuhNMNhpGTmrxPFmSfPFUedRlKDQdhKpYjHgEfmFssKuOYDCuarzWldZPWocDhQpbGIcuRLfqmKlZtov', 'drvJremwKocHLNMFNoLnvxHxsXNVgwZWfYKRaSEtWNXXoksTzv', 100233);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100147, 'gYLbMmftnZhZRmfsJogxtMkxliuEWhaHegVDazNXhWCuWELKvB', 'cJtFLTidyGOxQcOSFEmLxGbBNBeTlinDyoeNdMoBmlOOGfGJXlapbMAqauglUvJWJcVMRlxEHiSuyWufwLgksBgMOWLaexssgfzS', 'PlaPwqNnvTlKvRVMzhRnghSINWMXAkNeInImOAAXMVjnyUmwIfdgTJlMvtUPHuXeDGOaczVCqxFOtNtKSEGlqlqZPPigPHrsRukI', 'DUfEIzDVjaOMbgslIabAeCESluJOYZrvlBKpNfhfzkJDpmeEQo', 100283);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100148, 'pWecZBbKrpBwgKczlHvNIsEfvKfVxtJWkMTEtvtfhTwhGoIfFD', 'raroiBuhSMeuHYeUfPFTlxBNWhySuQXzNtGeXICQvyvIhDHDOGNvSgxmIaMlyjqIIjuNLdzUACMluRdCdeRGYNaWdWedYiVhASCW', 'jGxxZGapGKmooUWGGZlweShwSSKGaZBZJVDkzYfeaoVIoWWpUARelXamMWMyAIpqVrqoCVaSnCBjtPEqOmtGWjPZJONExcxZLmhm', 'uQwgjpGYXhhepMqqvBQwuwQlBHMBOvbArYYWhZilafoqClJNUJ', 100055);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100149, 'uScptKfqfXxpZkgZdOGYqAMrGPfgHkvjBlAWSSzGnoSaaharRU', 'vOdhKwzBEvsijKXaWpqtcktsxqIDiUsxFMriRWYkykSywEHchwdVnfqdntVTOSpxZTaCOLLmzqsSAQuYVHBiEUAhmCszwANYoCXY', 'vhKCIGrdLQtFUxtStvccJdQCbisakoMITnlggUqvvyRaXikRAmolvHJLrElpxGANkRqaOpSRCYxUDQFzaSUydmsScVSINLrFStpJ', 'nrDOsivYKpfanBvrmKGPlAXOFVhlwSKhJyGmsIikQaBEQjCWYw', 100203);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100150, 'hBDcjCCzqhxCJaxngTZHQezjlJiyVgHAcffOVhqfrgfmTobEha', 'xVowGawulroNMAOygYoWtoUOKgTxTkAaifKbxrRjTFcmEbybQLiJWqtqlDlLaxkJJmEqUbuaTuhysZdwEAHkVYdJjdhpYRVScKTY', 'CcbLuubLJdhXTgoHNxrnogaIQwsthfncoXaxEjvgZyvIaZQbcifDcYKZAQHPWIfwFfLHKgtaEPpKKOaHjlGjbjhnAvBaeJaIdwBv', 'JrdNFDUZGijCAheZIORMeKaGutQGEiiQlBhoSzoHybvBsaJLmu', 100180);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100151, 'CmEbFZcYVgzKoGkmauuQNLcljqOFdhdnkjMqjWkhkvgNcSllov', 'HLknfWdJIGbUcvvgpvcZKddYohkcSQuSnLtHIarugzuotEysYURRJmsMuESLcIzaUysMxkCfIiJfZhKmDbrHkyYeESyVaATgIOlr', 'cGBlfjByrUpSiTPeMbSRepAPviVhHxPyRCkESidJRwsLrdzXCUXNwSjudCQgNknHOZKyOGmGBXnlQpMCbYXdrMqrimXsZhNmffWE', 'RaFfocTeWqfbNpBnuDaQHmSeybHDhdaLyndaiaVnJIEkdwVMjZ', 100097);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100152, 'NqbSzKoVDUPGkfiFSVPPPqUDiexdRwNTRrWDZexacLrmKRUrcL', 'jjrLViopAOyIVGtTkMedmWivyerikHxFdRLYTkyEyNgtAuTtgeJcTndSlJhjgfHkgBnXdfKdlhqqZhGyRYSwypXGsQPYakAiNakP', 'fZbilcTPIIHoCJcVTEhCaMYNJfIsayWTWevqiBAdMZVHjNdHNHvmFLJOpyWMScdrQrZwhXRGhRYWvOaVZvhNkwkLSJYGWHTfZIcF', 'YDzulwXusZjWQwTjBtPcUpNasHawZwATFlVfbrMmjAotIjROsg', 100161);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100153, 'TdiTadOSIadpFTNbowdQbkoVbdFTZiyKOlEnUgQSeaDiFyBTAt', 'EJsnYOEmmHKOvcvmoJqixKSXqNCbYYvZwdIGMUXOBLAQqcrmOmdUNjGJeInDDyaQGiPajgtEyIJMTVbWuNfcZKmxlgJHKsAkHBCo', 'ZakeyeDLqWfGAzxkojqIWCnrEUSQWeHytaUlOuUqeXxJAwXBPcBpCcSKmVeAecZCrXRDUHwsPWhuNmxdOEiURjilDMIeROdQuBJQ', 'eDDiRgyhJPuQbMHHsmLFJLNMWLSuRtBZHNniTqqEMqovcaLcIM', 100195);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100154, 'aDmCaOanhNNSwRprDpFXBwWFQtxePndQpxVUjldPjCJPGdmLIM', 'zBbrvAFksPVvkAJdrxVriBJjRLIjhjBTslwCBmnWkdRcLUbTJfQgrbzNpbtanuERfEvlzCeDULRNyAOsuhLvgrLXkUZOfHGpKUMk', 'WUIdubilWbIznAVoiTSqLbTCVAFErrLALgwnAOXaPEYMrEyOjwrgpADvXjkQzZvSaKcwIPJtPcYMrKegvPJbkXwrjUYfjknIOUsf', 'ZnjFYlgWpOjSygDdMMxFCtDpDbBYZowqxtIKcuIwGsYiEuHWfw', 100146);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100155, 'KxKaOSnzOIVKqYNGGZYIYTYyXwLWYsxMiiAcYPNrLgaLYItZcW', 'uyqkSSQQYErJOyFwPlcAqMGhGWwhAQzhKTOceipbGcxXVUnVaDXWCmGogyhYSnNXOlleOPsTanVwYZQkcaRvOWsXDRWhxATAWeje', 'VwnccDtguwlsdWoObKNJjCDvtryVZVEoQvHkJZLXWwQOalHxHtpetYlRGeMwXBtnfSbNnmOtUOAeLcGUMOwnmFgHiWKKXcDsEZhk', 'CslATZXnZxqxpMnWDpmkuFRfpvWkwpZYTHQpYFgHEBhuIYIUaW', 100369);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100156, 'CmwYFuaGJMWDZODMbJQEadBxgyQatHoYhmTzCXjZwaGIRPpkDG', 'ieHbbsSwPcRrtkkaandHOAuOJTZDGDynxAgCBaUySCltjIxwEDnnGLupwRUQPLNGwpYSQzGIhvKOPDNgjYVIADTBzLqIGBRppYuP', 'CPcexiihPEuAWRrEcEUGeJEQPZEAJeCXiyxRrGEHNIfzpGdTTeYycELyCaEQzpZDzuoUdtowroFxvaQViVsfsmEXznyejVdaEzMv', 'VuJCqgUwwhPZsnAdPtqIaEpYcuLknGuRzvUVGJczQAEelUGQsO', 100034);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100157, 'HcJeIkgChWEyMTyhXlahdkIEoPbdqtHXdRtlfGygVvcDGGpfQv', 'MoCMhTvJzpxovpRvLNORPHYwIORknPZXIfwQAkCKABabKllrJqWZGsEXXcXCTrzSZZTETXYImwTEGGHaKorbtSBolWNZFFdMmgwE', 'VHSTCqRfQNKSKnSvecwWFGsXvPfLVENinFRrEYlKpJzuIbuHmBhoTPqIHMRWGvtucmEBFcjHSJaOmNJIOxZsCbcihIhnFNvdckiE', 'ZgHXKlQSdXLJXSYlrYIgGBYyPgjzStblUrcJdLRtGemSRLnjPH', 100159);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100158, 'GuAXQzdySIjpQBZOfwCAyjbbbizTLnsPPYjsnATIzlbXOCQisF', 'cpWBMjEgStptCpnSrhYetfSwhtiZaUzmdpxZLGyGXchttJCSSFmSOZsNAthTsbRryaPMeXbRASGcgVyBnjnKOovrTnSFYUZUPFPX', 'ZdOjWDplkuEnvEvCLZJEVYlLOfBjXInUdWgQaKCRPzqEpedlaGFlNlzGATWHYDGkzdaCTqrCxMjDYIdJgybZcJgkfjKqkgydMGPN', 'bAQjcwGHiIZtWRMwWgVVmayDxDZBWnBInnxOewTTTxeXaEvJPn', 100032);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100159, 'NefUIBYKnlkkccXBokzaxzyAkiMglNFbvTXkMCbtLYkZquJfpK', 'jCGzjTytgimPqpZwzpToDaCCsfCCiukrfzelBNHuIVEDDXjjnwXueQHDGOpyscluxJRfYVAIvGxHkLnpEFnsbLkuRCNKYlowTBjP', 'pxqEZGDwSjSDZPeeSwaZbgKZSVcWfMjcSwonTJAGOdNKpqHdprLcSoCZGGwksyanQiEpVQMDUbvJHoRYGdFOkFOpVGbsDMMjLPmD', 'IIoHDNzRJDaxQbHHJHpasDZeSdGrTuYXlHfHUCbYmWsKgeXDYB', 100016);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100160, 'gAalHcUeuGwJUvnmNYyqUZMnraPVzUeOgjgkrlMqXWkEjVIfAI', 'iPZlCPcXVRfsnQraxtuwdRaYgbEajSnXOXtwHnXAZLLsgVlPBIcCwqNiTRqGoHciALxuTRvdkhOSMixbrqrIHRlqKoDGqWbRnbCd', 'DvPsVhbztYPtQwuGQkQbBgtCQrWFbhbHoLSncyVCDWvPRyQfugoBRWdWtbshLXbeCbPXVuZEwAcBBIEAHbXWnGStGmpKcuZamBmE', 'YuCAVgyYCkbxWnMvCMzUuntzJcigGwAZsUpLKojKkBQcKLTUZf', 100083);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100161, 'rPkBgaUjQiKSaVTdIWjnbGcCBpIAzbxyYaqPMNqpORWUDXBMon', 'TPYlLGOyJvvnRpmEAaHzSjZOotGIieQAfReEsFSFDYLBRovmVealVGtaGNoGCZLUDDNVYIoeASFXGYGhIcwVpWOnyezpdhgSmVAJ', 'NITNnGvuJztHQgshFwmNxxHoHeJzVMBEHHNowpqAQiSYpLvqTaRYSgZIlunyaSwGpoUepZGCcDEWlFsgdOtIFxkITxSkwOFnlEfs', 'VfJpAlQJYNJxpbJqSpRZWQRSxRRhoSrBqwvxbiWfSPNlUNgtGa', 100322);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100162, 'nJFPjefVRlLUBoezZLuElLbVDaTbALjDXxBPPtpPcDrcviocrT', 'eNxTdHLgWdMfNcHcUZJoxvvlyHYutTVDQjSkqBTNTrHCEyyUQAfFEtriBTuNXjGnUAmXvCJUCtvMJNXDlJFmFxXKLabkvzWdwBJE', 'RFMNQPpsOaQdTQaCYZwEanXswMWzDZMByWBgjkiowkPxSNssYwIAsXrsfaDgyrtyQpGlsxTAmZpcCuALUOLjeECfWfTRUsXolhCV', 'kttCjsaHPIHPloqqQMsweuabEZUqKVokpoWyFXHZUyjZoBBBpQ', 100156);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100163, 'SZPsQogNDltAMNOBKNYMJvIQIrKbzDSvIcEeRTkacetWVosCId', 'otlzimHbEIKtIyqBXfYqBnXJWwoflTlazrieSBjshAsoRyQgOTLiyEyqiOPKnBCYhWnBnBEmPMUhoxvCFHhprRUJzQNsXxrtGUqO', 'HaHcEKJoeLRvjHtaOmlZiLAudxOCMLFPvtrDACzsnvXFAQaKznSrINLAgsGAzkdYbusczkspjXJCZktyeFZtvrPdisoojWGSIqpX', 'uCkgBodSlrDGQUKdufitFSarwrrBSGXliVaEEBFlOCAVTRXlcz', 100279);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100164, 'MsbRBwSVCwMQWlxGZBTETqveThKsFYVntqcwViGNktWkmoJwKk', 'tpNqLgyrjkOeCgxUlzKAOcXhTfSXltjRXbenNVTiqJPwitAjKECawBiMVdUCEegjHlnbChlBlwcDaOnZleUyabWVImhkITbeaGCX', 'ZRLTnSGoxkgyEZnDxVfZjZaGGLMAovsmGwvDCXhErDYcXfGifZqfUwXJbYGQGNfmhSVxxNHZMZGOhIbskkxQYWELazNvUTXMdfLl', 'pfuxcyNKQYNINQVekqOARGfBcpcXqvPHeAwPoGAkjLlrffzoGh', 100312);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100165, 'WeNdvTTegqWcnhdQzEGZOMyAkbvPTlWgVUfgrKfwmPPMYNscAl', 'CzcuiwoouZMddKPaQKrJGfwLtcauKjiNjwseWswbENgzqIEtPegZiBaZFoQmAWFlpTjmUfEtmjCdGTCNPPfJWGHdUKmFrZEflMfV', 'OVTPKCljdXQKaYITTXmYqxFHpdCAbHnTUZeJyBJLEZKwMZVbDDoGElkLzYVdJsousupVgtQubrWChEfLTuFhpbGmbuAaXIQmKwpk', 'zjcddPHEMrsGQMBfnjxnakkYoCxRkgENWnLYqaOaYUZrnqQQNO', 100388);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100166, 'FjuKhfEAUcNShNzSsRsRZrQNxhTBKWifXrrucNhXZuLHCfwppN', 'lvDGkbReibzOQLCOgKEJDKBlKaovBgMOXvgNgPrCvaFhdQOpLrPaTJrwUqtdRWpeYNxrIaIOdnAcupFcGSwdpDheYqsRxWCMmcPp', 'JNBkTSEFauKhLyyifJCVzrRywUoFUCJUSvBnMFKTPsjXWarqUXgCYagzFoNMneDxPJfIynvDZMXoryWRMOWXgaCIJfJUiCckVQnM', 'vwkTaGfTIwKpUPVkjvfvCOnFGmvxgxuMcuGNGhGFAwkzchZgLy', 100242);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100167, 'cnzBRbhQGhFKhBpZfHRwxdPnMEVwiDFTGmGUpgvVZwETICgMNi', 'WRFvFDJXQicTyMZdAxzsFTNctVqSzbwOVYiyrCKaLWdqLPUsrjfdEnJzjmeelmJoIKghbJcyAgCWIUZcmCslfropVbYuDzxtJEGa', 'ULdABmWhyhnwAkePrDYUKgGWOIQzHBEXHMzNKurnCMMOiQXnhKlYznxJiXgwgiTVSBXRGEVVvKDddqKFIdtXzlkUjzkTxuEBLyQp', 'JubMFvtOgqDdLBsGIpiJqVgQbNBkIrBHpdRZXJVdQjJgUVfGtT', 100230);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100168, 'cXYQrBOKYZdKOIMsANQjHYsVhWsKxbaXxSbOgbsLZYlCMZZHsb', 'HvreQxnaaOwxQSuzAygLRKYQTLfmidzovSSIqTBfzaJVpSwkzBzjfoYyOCpMcuePDErLHytEDOiwkstQLxAelDUasoLTzHSntNvl', 'XczECLasyimeAkonqLSiYnyHgXSPySBthYoTfrntgawDcCPriSvvEixRoiYuKvpaZwzErjtaHWazDmerysnmRFdHzXoAHUHvCvHx', 'RLDPWvdRQUwcFziDqlBCWHBnoEpMlTGgxSWBoyXTTepkNowSAc', 100237);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100169, 'KWfevvincaCqPfBSsEqGXpjkULyWsegsasfNDAssZDNwBWwXRg', 'nZcSZcckJXPsHmpSKPJHIbmtKqbsRvnikXTfHRfsNzsUNUsZoqyNfrVUQLneiOmfKyuKyHrbXrhnjgbUkxNSPvLNPfwhBaipyQRU', 'iZBDYuLxNYvNJSZTisxbkZVAIabAMHvbsfqiPpviZonEbNYMbEuHkTAMaxNLargdMpkpgmkPXJZZbufYegSlLZhyEwWFwGshmJmX', 'yNyopOtcHDbcwRQoMaIGcpbtbyskQaUWsgrmfVgakJcEFYpABy', 100076);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100170, 'WgRkqevwgQvhzaGIPKcJPLNNVCXvHgpmcnFbwxRooFpxvmYdau', 'APRKugcVCdVRTlOqecIuKPWdHVDHXIHxOYsxKRLbnUdnXXChyQOWlvvqlIUrzOAqmbObggEGyyTdRmHpMfgLOPTgPFmDqyXsuGFV', 'jgTZuTJbPYoemVSTYtOllONdyvXjEiLaAZjazrxdQqwbAeInvIblbhCuejLMlKyrXzCnnwXDtMpmOEhTSqTVcXQNgvLrdnXUTstn', 'uTkvKNyxnyUtudRWjqvWOMeAdhnbQLNyiLbxnxIjNJfFLzsOEG', 100227);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100171, 'qblYPaWFeWXDFSFOGlzxiQLALUHlYXRdBBWTYpgtEdCGGHOAlL', 'UBcAfFcYEiTaUuBcDYKkBXxiNsMaMJlOabbqJeQBEkNyTWNttTInBDDKZXyxCNrtZKaymebgaIjWBZgurfKtrSRcVIQKCzZrCoCw', 'sgsgrVIGRoltAhXEOfeEizMUArrGknbeyvvzZDzxfkoVcQJucEpyiHwXwWFoUAEPcmBjlVMSZxkLJkcGOruaEAsxNNlEyHVFWzMy', 'XsXPCMsNvnVhKURyPmNWszKklRpMPGRtpQUeKHPROZxCnlRBZw', 100188);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100172, 'sFnkUxANOGzjpDqlqeJXCyZCAINLEecUvJKvZIRxAKNueYZPAB', 'jQNSVoZNDBZPJfcWQSJnWMrCAzFAEtvbNyEmDGXHuwqwJGwoThpgnIAKxZiCZuwEIGugNpJRKxCVBFrDAvgKbTUSplaXClNVGrah', 'zYlZggHDGxHcgdzrbPTLBPnOzdHlSXNsJdWQopxOOqDXSqSaRawWRxXjJyppDMIkHpsNjdxWFJijjkqMMVknLKveaOBpZRqvGIwh', 'rLmikccbbvNNzowMXdgAdRHRmFvTIWEbVslZmPCogJtYtKfCFs', 100221);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100173, 'cgZosXuzETWTUanuJRpcbBKKWJujUQLAVsIkBdpARYelAlphDr', 'TfRNKFHAXmklSBVaRctuyYiuCiJPCCkhAlQqMzrEZHyDwzusJRwcdITWZhTdTzehsjPUfGCDgbMDAUeQrTzfACzwGrlmOKYdWZIR', 'ziMvyDvxwBTdNpjDOyMNmAjGgdPVhDQObzkubAipNKpanUrFPGHUxxqZgiKkDsGvKlmmkYphNpzEpJaXHfjRSMqdSqbtRhPlGOUb', 'tluQTLGKEhENYNghtMEHFutMqrVBCYjHRFLgrDTacoBSsSPHZv', 100268);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100174, 'lerBqdRxAtJaoYySAEBdpNgIzxdrbIXiLnPerXJqmXncnPHIQP', 'udzMeGqdaYLeuxdUdbOtUXbbYxdlDjLHgsgETGqbvuEthAeDEhDCpTnSzcykaOwJXsYpyMtkXSMgGjpfDPDzyRHMcIojpMqRhskX', 'xatvjTYcecBKyXDujrlusWjJWnptCyEejumqvEYkVQhbDmMlorjiZvpIKTZUOODNryVBREnEtMiwGGMHTZlMZHwqNgVuHlfnbSAD', 'jKlOjPnEcqDFqDjxtuZhWGoCzhzMKPOXnXfkQXXuFhYgiZmGbt', 100190);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100175, 'jnJHayqWciQKVmFglhRcTefjlAkrgjSeTeORWMuzebQkqhYfrP', 'neLKskZrkhxBflZjRLmnckRAOyXZDYKNItRBtUGkwelOVYauOrOtpYyzxnxjQvgtecAQtvXauzpvKpefVXRUKyYgUJNrPCnpwjZj', 'JeyaMxaQJeayKkNmxRDmslWOvtLWhNeBdUdeRcleHBLBEXVEwNTyrcZZKyJeUDGVTeppVsoqxHsDNpbmjgDrZssBcislwJTfVFAa', 'aZRPsnhmDisNfgOhmikKQVxCGgNelNYszhrDQqhbwdQCXxCTnZ', 100307);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100176, 'sNVyaPpayPgyghpiKJFCgJmSddrWnMePLhfCMfoaPPUjLbEeuX', 'qWdjJAYuQVAVKgtQFyNhSeLQifPaElVfyvHMCeFAfpHjlSBaAAyDDaSUNLuzFubzgsPuDPpHdUEjiMjVKHolzjNIdVJUjJEyByDK', 'amOVGPaKoIMGNpZnxaHkhvNvvDKQGqMcDBOkBrMQjIXMSESxXYkjnnpifndHgXXRcnTQEmicjwtoEglVYSdsxRniuMVSQTUkAyWC', 'ZfMUcpjkuJcsBjDCoCBHWXVEXmIiisUZHeVgIlhlBUUCXanIkG', 100122);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100177, 'YRlxpmSdOysdBpnXfvRudQaKBaLDPubfkBanQjbgwHDzGeyqSk', 'TJYdKzSlFBtYqpJlJzsxJcBDnWrgykGyxfCNGkGrPnNBrOgBzSEtdgZcjRaAyJBweFEMUVshbDsCVTikmCvDwNYmOUTutBgIukkt', 'GWLWYEWTpWFDKUwfTMJAOMvBLfCPPPqefmRpDbzldswBVNAZfKvQyRYUKXLWgknhkGOBJHnDAsVXLhGMtboJZDFnJehrGyeqFeXt', 'zHJzBjoRwTdlhWBZelTSernubjQoOJlSsMRNWVleCnSzVqbmOn', 100064);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100178, 'eNRpTVAVULZrcDXdFUluyOPaKNJTRNpaSgjcLiAOyCGQWganma', 'TurfiRVFKnkxrpufCuNoqsXAXAXTDYuDVaTwJsFsxQkvZandYibYXuhZVMqAlKCdaxlfavyJPgLmGyRrIGiaHcMVqLpygyvunGHZ', 'oDrghvznkDyNsLoJqPujaEVLMRnQhpQAvKkBkkpBQTbHJjrHwvsckSIMDgcWBksaRAgbYAJemSpNkzirJXYjzCTgTISmgEsQVFIQ', 'RvNSukJxEWTcrhSOqPEdYQiTQNnuLwZyqBAWidCvRBLfFJWEgA', 100091);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100179, 'ywSTBzCQnPAqTnGmsRyvpohNczSgqzSgInaYGZtViznhNVmvdg', 'cQjlVyznJGAqFrokFGuzlVgaEalkZQWpmxSaUBrpCxeVSGAfDRowxCPcnBkZJPfARutEfvMhnLNeiswKkoqAfjgtBpSJIzcrsody', 'gMUbaGVKCZWcofSkvPvfDAuveejRipkqpdmojPhnhSrdrRtxBTQZcjoaZSnihoLLwVFzieEcmzNusmsbxYrhEQyuivAdvjNjFXot', 'TFgxLadXDYhExypLswChHYgHogWOqRyvMsXzKEPGImHbXNAwRT', 100120);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100180, 'fegOhwgcyVuwQaEVDirzJPLAfzpsGhWSnaWmlWnMwHQNXHnSFy', 'CUItifuYWCTLOYwGKWxPPPYeGHRVwoKSHULjmiTEnoeWysIsosTZugRFrglveGTDTIBmtjyKyRQJbeThYKmhnrOVuScwQIOPoMtR', 'cOzTtlVXcdfJEjHgxoOuVmkZrfCCqiaFWMNmRmdyVBgahcMsMLXQEhyfSXtSOhLUOkxMbLEZLJQahGcARwjiDtRhoFvdYiRmpExp', 'GGihNICTmaIrnHdXNSCLFNEcjbEZOLukPKpkMvAOlKzeihStDj', 100188);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100181, 'PsCVJhlMCljQPFnphSbpEEqKbPsPmKTPxYPoAuaqFkxzdZmNxk', 'EAOuhcjFFMrFbCvEtNiHQxBCYzvqiAstBjalcVAKiJLvSsiExJQJSSZxGbzMgJOrgyDQpRLMuyQLWvJQFTcvmTzicSTbIotzdLGN', 'nUziqEpFrqNvCzaLpGopSPAXHnOqJbZspGrLziwkWuSrfBfSnyVrfwJxDyTALzfcZXpGTmnARHHKhhQYcWvembsUwGuxdoDzAqPj', 'dIXeepEICIUMmwycFPUDwxLjKjiVTpqenCuffZLvAXTMwVPMWs', 100093);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100182, 'uuNWNnOwRUbHNZdEkggEFOLkjDjBisNYyaMNalwvpQUYvmNqSh', 'tQsGIaMTfUGGgHBFVCBmVsiHLacxIOShcwGGkHhJBqZvyFYPWTlbqsGUIxrbaVcNaAVKPZchWWyVDVOPOZRVChFUrrlQNDlHxPBr', 'zsCBEEQplscijLipeTfbpapyMjUeeRPeHWXfRZZqXgEcECYZwVijDRfsYSdYjMOmSqEnauaLeVOiuDWySWQipQFLyKoXpHCjVaQx', 'ZmKyFjxaaaWegnbQwtOBXLLKExraTYLqoXjfDsMvhXfYLorOqc', 100044);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100183, 'pAHBkJazgKMkgROYhnwlosYWpVsttSamTnYKYxezNqKaStjzdv', 'SbUnhukBljffTChpCcBapnHsTQOwNSLyaVimGOvCCWgJMDUYqWliccqKpgPzkZpFieIBcogOPqhNlPBDNBlIlqBCejnYqVFNMsrQ', 'tvoULloyFsaJoZFPSdHgHMBJjthlVgsFOJgZKvQoHWnViqYgvXmDLawrNYkepTYiLwHLCGptyhrxVbRGWiXLIFvbBEByQvXpyAwY', 'emsyeVgJpBCcZUdFEzHdCgXSQhGYMTchrvMWfpFvNOWGRLMsWD', 100260);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100184, 'pmwZsNakHFevuqihSawCFPtHRBRzevEjwUeLknLbwzYZOFBvhF', 'sSSFqjNtwbZBCLIqtAihDeOjYWUAFQMueokOnOzAtmjsghIxFsrshoZuEGiKjRkKcMrvRhGcbBNjKYozipgYCgqdrmIiqzvPPVoC', 'WZdZvfJvOVdRPXjyvIbLLWGqObHKIfcDFqytpvVHTfbKdAxWeVsCJiTDbKBOHAeoEbuOnzkqlJQuuFAljxrGDNDKTegBQPMikRAr', 'jIUEUQkwMIavyFMNoutzTRvNjEpWCCouklIEwHSYcHIXGaqBod', 100333);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100185, 'nJTKSTxHOlDgRfNGCuJyoPdcGjkSJKfeMRNXEMIOyxnPFCekTj', 'ytFCuNzqQcNqxNjgeOecsfXDVwEFXlKaJWiWCLDdlvZyiFQIhcjAsvbDApltCsdkxvnUIlRkfCEjQUuSAPDRPJwhknwpkqUDYFkH', 'cZUMRyfQRLqoUnhWVjGJDmxLAhLUXgdgyXwJZSZLxQCTeivokcgdvSoAvRHUGfeaRwOZBUOkLppXywBTmRHWDFAgGfFhVtXcIPew', 'XqLMNQZlYKfBGeWLPJOfJLxiAcYkzruJrCLNDmKzgdgAPTPxih', 100090);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100186, 'TQsPElhJzcDRkOPmdvqwnsyIbuxUhxFHtrApXpHtgxMLHNQUWS', 'wnpExPEQRgamOvvYUJwRHdTEwtNczBXSqNxThjWKzJNDdBTGpaMAmToBgTHSZOQpmxIWthTfGnZqFZlpPtqSOKkDdJjwCZgOEIxJ', 'rXiMwrSYwJxSdazwQkRTOZirSFfgAQRucTDwRHDDvXlYNavRISoMaqVRhFDZoSfXqNYULhATTplFNNyRpmOeeNbnWJaytCioeFus', 'oCWYphyxRGUPwIyIJNsWsKRiRCroRCsRqtQfXXSQvhtnpJHFMD', 100286);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100187, 'sZjqlOdrZVdEKVxDiLVltdVHYffWEanoItwDxDZteHTanqHoNd', 'VjujLatUUCchLWBrZBMmUjirByQlGCmslMVmPGPvZImZOTSawmYreCUHnWjtKCOmjkgmzxbcQuoEBdZNdHXQyVNFXJLKVLRbNfid', 'TghiPOcLZUWhEScpNKaBMhhfUxqeVBpTZAZYBcMBtQwJkSxpwolUFSKzQwrkQHPSuYEAoJxNkPaOEyMAGrxfQRIdcYkpLyAgrmyw', 'uzTxTddEAjGuJxCZnNWkZLtcfMULmSnPdEeuMMlvQabTzpJosi', 100199);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100188, 'OlbhgwuCUOBpKrVshEdYEzabSvHBhRFdttIZhktsmOHjuxCtef', 'HzXYfvUisSnQJIiFOovUOZVbEMovNPyzrWPchTvvzHyXzMjKhBnqJePrhfYPqwzjWJSIRKLccPpQFOzkbAzGwqFlHceGckCSjiaQ', 'yvhKVlzYAJUglDDrGlMrNXjTLvcRgUtbxeCiEMjqAXKkAfNiyVHdZlqYxWcVZMQrxjxlsgfmdOZOUaXPPdYSGLfZdcyukRhUJGYL', 'PaqkKsGFpwZRSLUzQcRCpYPlRleYUqTZvTFgQNwsMZAMLOSctq', 100380);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100189, 'JjsGZFtMzZjwCaUJSmmasDlmgDkMTBsQmfTiuWoDHRFNfGlGOz', 'HWVgIFBwtErdXOlnHHUyWHAlHtBXDxXMqcEJalCxMFINzeSqlwyLmqXeWxTRZsIvVkFQBQXeynlGAHlvRRjuAAfDoTpCOlPAAYqp', 'XKbBzMyczRupdSKjHmqSVlstGrQaXBQTNNdoXKxHOLZiWBzSoUrtBQjMJKztvoCdEYldToRtAjSKHrvxkRrHYJzvJfVmvYWqkkgb', 'cDfhauHPEaIPATKdZciKJWYOoRItDTyyzfpLuFrICqwzEdyelr', 100166);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100190, 'UHlSXnhypvGVoNYpBYxfQiDKWENpBtWpwSLhArBBPQxsbpiJVZ', 'LhyKzPEpJJtwIBYJKfopNWGNlZSYnoVUFCheHAwxKoQmAdpREaRxXEVSJHKKeiOODSkfHznhfkcwABrMkQvNabeZzxMWEEntvePI', 'JlrhkKNfVCztgfbkREtqyehVuHqcQbGDgrpXBIcYcOwzIEfBgrEZPxAaDcAICaDyHXaVhqJDVauHeRBIvZpQaJMczsapKmKaQOwZ', 'MNfIfWULBwBVRaWweiFofRisuGyyBQfSKRadcRiDdDUaIEJNfu', 100024);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100191, 'LxrwixepGViDkEtwbXApfMxIHdHtKHaQYtTDnpvnikRoHJpLDj', 'fXqpePJzpvBhgsxfLfcnpqMiLGBUiHKEWNoGHexgiffLYznUiRHdJDpYZfwSogdoJVaYMadYUVYwnDCLbtKzkwXYRSGwSafvKNAI', 'bayiWiBxeAgfSCJtwDOYstJjatWGHoXWJLGjfKukmlmrNUmcYQeYqylcMiZAwhTByMiKsSHoscmxApPeLNMYzTFyMPRDojSHEZcx', 'CPyFejoDCaMVtpNQEwmuftZbzNFViukWordjidFmFhdYVVDbrp', 100288);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100192, 'SxpKZQlQfKZnRDDeDHpVrXRMaapdQJCbAvmzhmwlRSPHiomOGc', 'JNLutzHgZUHslYXMttkKuQpZdkZOaCvfBCaDhBpIWUNFkXgTQdScTeosPPPRtLlTPggLorsOGYyIWDwdCbFyXGqxXiTfZCnraqTS', 'DPaqkQZKcWlmwjOvvIGBgdWMTaRVrTYBCXzURLphClgcBpnzVHftTFatwWxfhUmtpamIdJGOrLzeTpgBvTRkkOMpQgErdvGgHVJC', 'elmOhxHkerLFSUEbZMHxLHFLmlSiKBNRABpWTUGwglWfIrYHXP', 100222);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100193, 'gRasuKlWBkkCQELsSoVWKTJurUFunHWFREbyBqiXzyoxNoAzsc', 'HBaRrUImKhlVNrhjHhkDUIGcAfDRifekQZRKuybzDqUsyKNBBvGmdzrqXSERfJeLLLSLTcrfojVVXXkiDAxnduIzpvLXhxctZlxF', 'DTkdvHxWtUYHgPrVEbjdRBvAODjAYXpXvIUvFUjykWWmLprrhXbRBlTJjeOfVRavpXstifeGGBvBycRnRdGhoZbCSItLHXYgGVto', 'xhoocmfVtwLNaaOLzqzOFBJPKVAAOmJaITxbfOjMEZnfxxyLLD', 100227);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100194, 'WfMGoUkWtSOYwQGpzDGZLafQKgKydYkeVbhQlFubOIcENJJVyF', 'TcHbcpBFygOHImutaizJAdVtJwNkGnnVsXuwOHQjUTZPVNZUjPgIYWdMteVRWglxttrBEBmRctwJfCFBBAslUiYOFpFYaPrCXsmw', 'TCFEhTdMlxZwHxiiYEtJJTCXonRxWEqugXftoxxqcbcASDrbTNkZwKcBzfnNGDHhmuZWQQdHGgtfpSgfpCxunJjfxObxmpRpnqXn', 'PYAaOtTKEZnMMNhpqrncxuwJXRwVDRjnMivpVbiYxYOApqmpFb', 100105);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100195, 'ESVxOZWRvdKWDKuvxmstDoDrFfgPigNKNpMxyWHrTrkpAqLbwV', 'GacfwjrPbdVGHxquvwHzQFhiMfnKiMlhjYqugOaCEISXDqjULmCfkNuRZqUdbPoskkjtIdMkULgmIxTpCvXNXgTciBCXiPkaXQHZ', 'SXSHyryMRZfvFSJPvsXXpKUkkHAwCWfjUvrOYQJDTqwoKLhazljmeMZkMQuLooyuVlAZONWaSJRNmLPTzmGrtOaBMRXypAICOmvm', 'JCjYpTAxMSxvisXXOUykwMOBYtaYdSHUMdjHWhUhiyxLONXWMb', 100362);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100196, 'nWekdtpcbenrJnPAwabKpbYRemnstCXGOkKTkwtbiLAGNNWBpU', 'SPlxKkEzXYRpQsXNnBRAQUqstuqapGyfRLCscWDtFcWAHnDlugqaEgEjVopdZFAChxtFJHtSMQcmBJhLUMvqkdQCCobWWzsxANjm', 'zGViWRRQeyFsPIfzoNTkBUwlbEhdvrkdWpJZIxmhrRhXbxdFEgLxOINsYtegVFAvaVcJAYyFLMNlLRyrBVfHOvsmdJlJyTYgicmm', 'qkpBHmsJSsoJXCyYyDcluoQthVwTVSOLQYdwLSlkeXcgYNcZXz', 100229);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100197, 'QDCEQQNsizrVczLHeShTwYWUlrCoGIXBBQTQCbVJHIDokiCbsQ', 'BULElzRsfTBMYgaSoxcgWtuhREGtohFtQnXICISCmsSemohHjFVDdPRbzfleHVBFFMllIYSOjbFwQeopXOeFnGSBbFwosCOtlEsR', 'WBcILDxariYYbUvkMVNWGYzXpbCViklDWeOJsNJkQznJXYuJnqBDegPVByfFntxUdwbaSmHXAXXpqgchSFvSTspipPKcoCKVmGVB', 'NjKvajIhHfCvqrQUxhblaHqibhAULcBoaeFoBjKZoFTSAPUHvD', 100214);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100198, 'IwNQRBjBOasKrlbiYUywUjauWndJDRgdcNOePuvvOugXOrRXyv', 'JSPubzEjSWVOMtOsTizDillvaEeVnYgAOzkOabzJXVCjIJclBCTOUmibekJwihiRnXfMhDtDSfIcvasFgdHdWxUBqKdKbuLHrivN', 'OlKKNTADOfoEmLYqufrFyCuDRLPafJpGFkEduwIFowcoOvkEDepNxtjgZUnGMbCZlAdzFxvNAexuKRZnwsalDsBwjSmaSSEqrxJg', 'MhIsvwKThiZiFiwgTzfPJuJydvMFnTIjtZekiaVnoaqIcxnwxH', 100261);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100199, 'rCjCyNSlODOgYraFRNAiBVHlhFVqNKXlysLMbnFNdoPVNVChAy', 'flhmQGKYIMOIQYZwqoseIhmTGnBuqVmMSMLLrYYMeTuKDDZlICaHSqWzXMqnOXvTwMwKtibFhLjmbYbZmyXlePBeYurdDyOdybMN', 'GNWyHJueJWZGGJKIAZTkNibXvZINKuaBHfJIHfKpzSruDjUGcVfZHaWTPQrCXbXRkObHKzsFLLxEBKGQevzbkKlrgqwSCKEnlFmx', 'pxbwbyWIpIpbxEEvcGcWkvZhHtDDmnYexXyuPUtNxYkUyEtfgO', 100320);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100200, 'SyLVOHhqewGVmKdKLgtJwPIRnDRdUYceLJdTrtFdqottliGvGO', 'WmCSDdwivRrXztnMiXcjsluRsgDxEZFSppUumanJKKCsXDwUeodNEakYmehxNkhfzoZSyGIRVcDKBBuzpwXCHpSpkekXlPIOvxHL', 'gabeugIyslQeUoFIRRGEhKcGLoZpxzRwzWdJUHeOyXunWUtnnKuWyhsVcCFNQHqoZKLFVpiLeDZgzHRmLCECHBUgWvmtSmRIickP', 'bYyopyHuxbSjnSmSsysJrhcgUnxhLYxDpACTsTAjYsSGJSDAKG', 100258);
commit;
prompt 200 records committed...
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100201, 'EnEMlDtEkQYFepfFqCcGswWonVRbcKpuGWLJeQZLwwutlzMtFy', 'rRUHgxQHgSjBRDaamyhaWnYctbwjbGrXOyKZBvlzQLDksifHbLucBKMyOoLCbUfVqIhedetyjKsqWZPWiAzFUjtcKQyHMTdjUGzU', 'rZWsRSjVyqMoSZsrbyCnKoQaduiPUtACJzPQNwHsdEGNNrsZOwXFfzDRLgSmAgEMWHckBvqEAqLiEdswYlSIABotOdqPvDFIvZvA', 'RZwJKVSJseAKbJdReIAcxZiaMrNAmBGIjvZqlmbMrNKLNlujlD', 100382);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100202, 'wNCJZNQQEVvhTFabiHJRUXHkYnnutppOsyuZObVkVjjMgenqQw', 'kDyvvyFAyfHCcrZvnoTdKvjGAgQYYRqFabTGTxgLMNOzqoLbMNuOzdVZBHSQhsGcOHftYBCZGLmIdwGIXFXhongqBkyRHtgFMrDN', 'JlaNkhTvDwNuAHKofUDOzErnWLvYXNFQDurYunrYkTiMoHYvPUsDZRoLgNwsnJHxFfqNOfzwYzzEHhmqwuaGZHtAVqQBXMkFYCwb', 'FpdvbdBtesJelANwodRBEwrEWeKsAVOIIDlAxlMSlPYUkNKKIs', 100204);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100203, 'MKbaOVjLYvdJaKgBKxMbKnQqQbLExnJHCyJAXmQoghhbEFfhlS', 'poSHPlcCJrRmzwuBxypZeugIfZvsnuEdvCwmLzkPHZGNGhHSGkpfvPKiQbPsTLbVjkfAWNhUEQCaDoQprDXCpVtZiraZAWHdVQGz', 'KlzAgqyiAInbTqRzlvKbreRLLOrNVoqYQhIkhAatYrhVTTBLTWgREybtkgglYKHOoBATxpgWRjkmVQHVJizkXGSrlixvAAhZMZlw', 'KxBcGaWCAlgelISUpXOMlAAypPPquNjEBWBUKpmwgjYMAlwRfb', 100341);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100204, 'TkPjczUfFQuWkMVjCoXdFEoxDDlhUjLFClDEFHsvWDLJNVDCJJ', 'gDIpRikqBeiGnyfJZdbrlqfmDGSlpHCYawdQaGGlzQuQxwIxwLICTczVSlvxXgUGFoGJuqYylLAjDDHWxbQaeNqcvLCZNAeDsnft', 'xOmbufEJtNZYtqTbKqnDVOVwpsIpoHyIbHMerOpMlGmdVNmvfidvsUoFdIImLBrGiqnyMeQVqehXsxiKNwrFKLPCkTMjjoUcMIkS', 'qrXkhBiYRPZlYdHTMrTWIWIsCCTMvXdNChtlXSIYaCMKCbhLBi', 100160);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100205, 'eTYzhuHvQpYvYNUSmZrDEVpacWZecSifTLEIrLMDELixXcdieN', 'iBYWrfnhKfaiMgWWrwOeLkCmqoUgExalgXSyOTaPRiMyKiaVvVDtKqZJievxDxlWCySjjesoGIWcCZECzJkhsIzVMENtZqDLorBN', 'iPXdUdjqSMijiNtEIJuTqkJoZjCDNyvEbSJsPvoQyUfqvjcEyoCRiTgsedcOeHAmlAVoizwNXCRkTshRFrenSZkfsNjecjXTqMMY', 'bIGPeishPqcUUASsrabmeUfXnieTjoyXUFZHHRnjJlkhoBwNwU', 100099);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100206, 'zLyLNVzfunfxlnspuYptbVsMqTocPdqTlefbexcYkeXDTQEBeA', 'qtsyanrArfXWZIRjaifNSRpAkPVeMiysGvmttzPMzVJMnjDrNMpfiRGKcNJzJINayeRpdumVNHTYENQuIRMmDwviQWZJihqkQRwx', 'AkBNQxPvTvLLCGLlQnjFoFWeRGeKQdyXyRlWrnSPSvyvhJZYQBPNoBMFiVIFbsQdHlRrsMqacxyEaVuRwGWdHnmORaXnUdTdxvTL', 'xcAexYbcHjyIrOJLuQiLXtSvMaVEsmkFVhynAaypFJQFNlpsud', 100170);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100207, 'QQIyNJwhabqkMvUIxDgfKJRKuTurPAIbEpPEBsVgERIwsaXsWZ', 'iZLBDduZjLgGTOiuFFkdtgjxnVsiuREnOljrILKrzfBPkgkliMzJSVMwcElBatDleNvYnKBKYjhWPYOUQlzvbLIucgUQyPxbTneu', 'yKOFYcUyHawmmJlKDLMoiJxKPRqNmTdPrFCaSUjFXvojeyllwOQVkefAPDmGPRLyrJijzPSKUVyHYQWMEVGEmNYBBescGkbVdOQQ', 'hAJdjATdMWIPnftCFgifDjLTCXtgPLEoPQqnXVOLSMUrsmYTGn', 100263);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100208, 'yqlfryeQaNFcjRPosgsFbEHdanjvdazYdOYueKaPoYyzUcCpWD', 'qyYeNIGjEqwxuiHqmWpFzuIOYwSjSbSNsIlKgpbnSnBwyETkJokcVJsdcAcdnhyAudJfvJvjolgKZOiFQkQxGbvyxyAvilpmtUOF', 'sdNHpCESeuGycsAPVwwGODRIJNhOaYvZbRrIbKHBxGeyshxklXsNdmMXUAJVfnoXMoqeHgrqtEqdfjTFkYLWrPGnANgKYZbVrXPm', 'LkFqmtBoGwIAyzZmTPeRyXGEWDaPvmbaMGyAXQTdsgczfquJdr', 100337);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100209, 'aKnfWaqrQlAKlPOJJRfybcxCUNkztbYSdEGLHAXveKiWVzzMbD', 'ojwePzVJvoVmNDUXBfiXWrRWHUTzQKgOTQYLrYBteGYnhKpjdqcrDNgKDnhxMZqodSMvpaNwDYIjtyxheDtBBtJWGRtINfgjgfiA', 'yagSGtrcBmNoBenBzkaeNbvLNqvvXecMoDfrXtEgcscppUXtciWETGnKkVQmGaDMIJeVaKCyfJBSxzYGozwvtuctOXkgYFGivlBR', 'luuiHAtZjAbLMmuqysTiHsyieeCDPgtHyCkODEwxDBHgQWbsty', 100392);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100210, 'KgFVypERgcDQCXhUQajylBtMckXxLZCpnZZIeeRckkXtHqctAD', 'jKuigaDzOuNIATqdoOdjIhzenzePmPKtnZzauxGkMgQQhnYMlnXsLQoxAcviUdqpkrzGkNcsLJCxMqOZBYQuWdVdiLzAIVEiReup', 'YBZcqjkPBLIBSnWsfahxxuHPxpwhaEmuMVwspJlyRiEnZdPVraDDDwPdyuFHyQdUSKUzoDizMpuItvflqrGjOZtxvdIFZurWOfod', 'YYITBobORndiwGzRPYHUvNYhQiRposbBbyiryJrboWwhRVaXOj', 100014);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100211, 'vicDuBtefbOXhMvUOwfxJNMonWwdumCFjBUQMCZUilRuUVhdnA', 'JCDWseqfiBxIraHDzqycmsgltZYlDkzNaUIsXSIJuxYLysRnwOpERRcihYIkFAsYMLeEbTgYJgrlskYpgMLwojDUlxoGJLPPnsGX', 'PiZMmVFaqrrqbvtaPhCHmJPukgIichleyPVhYWTQioeDFpVXqCSRskvSkAjZliHKyjnoyntSfUpbpnYtrlaifCfYWZqDoCBOgOgv', 'zLogXfCwYoNHVpriLPPyZDdjYDgGNflpiWnydxLdkfyPIsoVLG', 100204);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100212, 'qOlxKdUyADjwgsnXmHGjpVKSvPfaXgLfCgrjfHzXcNMDLNwRIO', 'XjvINDEVaJVgBofhrDiuJRMsprxgaObtIxMKkOwPGsWOgPLRVjkfKtkdDeBGWOdvzkYnTZiAASyHfwmXJvgWrfcTirrRjAPbLnNK', 'amHoIhFmJivZrFeEvPQnzbFGpOOCAHXIFGsMStClYRoJrVdgYNwEUUljmvWltSVSOyPxlWTmdneTUjrNkkNLmpJbxTkEujuuknpC', 'VGRAszYGUbFBLJwWQTJRENdIyqAsfzzPWZUmyTCBMXNHGrqemG', 100314);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100213, 'rsTnHmgeEpNUHKjcqlmCuvxdLZqxYhUNgDlEDTYoGbecgPApzw', 'FIlCDnHTHRmCJfFRsLBIapiCUZKeocElrFMaIAHgsKibzmnTimEqJWxMDcSfxTdCOeMidIpKwHiaiKkPTsSbtejdmiIPSKgCowif', 'hBiXiMqWuDLPaPllJmgrZzmwQyNdrOcBKoPDeePCGoXlbBUUqhixvClMBzNnjaCamAkHUUHgSVimOkmikpNHHRctMbNrfFndUYtM', 'cChjaTPsKNbwjnJNIuhJZFzIIfxttgpFeaGEhgUaoaXLRCaekZ', 100176);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100214, 'jUmuNoScCcjMOdeuiArXAFeThoMkWDrYxlxWYNkuqWlfOhNEJY', 'CrtTRdEoKhBsgBIvlvzpTAYFlgjxHgtUGgXKqBLrfhwDRpnktASxBtitpSgBupCHvwWsYmQAeQUmedrrtoOBjCxAkUgLUUXeKppF', 'ecNHsZmJkdQBbgeCClZbORrhDVwxnmdjthYizdmIAsgjKWFuxpiOZfKyfCEFfkKyKiZFIHdQxxXhrNZeDeTplHXgBcbBvlrpMYom', 'ZpYaYjimPUiJxpMsnKKZHARqXHXacJoIwALITpOFVmiDGMUvOJ', 100100);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100215, 'tQWCNTdaDQfkDfNIZXdzgIHJoPHJpYZfvpOVKagjcQHOYvCETJ', 'TiCxPEkchDyWkhxRlaomWHZDoAhmkllxxZngDZRLzlvVIAKsDJtsuuCIKYQOVcZdMpvYWJLjHwFLcYSrctJqjlcgAnPtxOjBUjVg', 'eVvcXcKNqWDkLQKEiyFoLIlKaecXUukOTEsFWodiYfyXaPZORCOskIWtSiEgWpFtbIWYjtpefQoZqteldXCaidCXNHdFdtzimQAr', 'UPohAsxcQqkJuBNyXlFXNCvcOWAhBBZkGmXyZNnXzlJlhwyoVu', 100308);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100216, 'JktcjawCUGvXichRyOLlrficHsVvZSBpWmZcfcqeXizNjbRyxA', 'JVRoEiGTurnFtYbePgAIXtrLaCgyvZhupnSHLsHkszqKsJYqXgjDaMvbjBBQhppHyxpvfoUdrXlcXcpIQRJjEPQtZwtSwcnHYXmr', 'TRswtEzQDIVNSZjjGueoEfdGxlSKmcASYQVEqHcsgHpBofVxGNcEnSpFPkwuQRDgDGWVJdzfyGYSJuFsLgdvnITdPaMRKOQioWPQ', 'RvQJMpsIskuRieEbEptqrqLeRfOFnvzMLgaNHRbQSbGmxQLHXt', 100376);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100217, 'BsOCInxjUbHsoIBFZITVgJwYRbAaelETHSqExVrJGvDKLKLJAp', 'iHptEPgRpnSXEdSYOIwmumvzdefYdpSCzLljJdAzgBbIQgGmcfYIRvoXdlirKbilopddWYwYOSVzaiiTrrjWEzZBMmJxOxdfTLbs', 'FwNnvzxrnoEqDnOYppXeFHjqpjJMupKqNxnasTiEvVdMysZdfzjQRRamecJutsAoLejZtkMVERzHYEAYreCfpubxfmXrpCLWrtSM', 'ZlAXAyLVdelkCiqxzQELGiFRkpbiIczwokPqxTUYZVDFbjCYdb', 100268);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100218, 'ccWhQOkmKiYgOGvKniCtnqdnYfgnJmoBCmKNbIjFxxlsdIkVdV', 'pQjkRiWrjDZSDyqXWOAIWIwVXIlDFMgdZGVYVDcBwAWoUsGZBGeDQyuCKzUCwnGNZtQkZxiCArEFKMFjyWeQRXQthTAuPIUNmkad', 'FJDCdrpaPFVXrHiPcTWUuHgeFpGMloEsvlEPcqdfRCVLrZtoGmrYyQdRrBaBxaRtIWDgJFatVvvfZeHHJFTfKMEviEZoWQWDhtDi', 'ZXmCcQcvFckLHjRLimUtSuyQzpCWrhGxFSGKAWHIeNtauMfEcZ', 100394);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100219, 'ogBzyGOYQtkDMwfRGYSyMFZubsFJikItejxAfHYsRKhJLOdCqu', 'dEAPSqmMTVsZzkDdDqcltoHPapOqWPhGvhPJOyCJwFhkgYlRPDSiAPfUYtlhCpsxUaXQhyJYulZKsgGUgmeQByDatLIWGymtOoqb', 'AhkdSuyFCLuvXlxnfisvseSsGKrKGZzoHjwJVIuvEyRREYYlEgAWwzJIawqeYDaHfhAPGpgCyKoVfwgoMMbvLXgaVClVBYGKPLiJ', 'deYZkKupAjZjyBocHmFRqsAlcDkLTIUcCTpVxwnOxFkGHxFKub', 100358);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100220, 'EYluyYLcJoUBJNFKIJTgxVZKbZoMoZJOUWWTLoIJzQEHMAADbo', 'ZqMiCnHWPHaRFMcIxvRWqvmAuYghfjAEOqKSazoHIcRYVwCRYhFqbxOGumWVOmtwfoIPbIOVQdtdDeZzGRbCmXvJifuNUPePQCKo', 'ZPywtuezBrSkUrrzesYgAtRVffSDCUhlqbUVrdJtIUgOjITULxmFQbxHnMdYTBmChbIdpLOzgNVwZQZorSjkUbUHqJjJCdnhryfz', 'gbHoBhOFdtciXPfzBwDsgrYTewhJDRNPaYwLxFPdYzEBDPHXju', 100074);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100221, 'hMXvSxBuNWuzhEkHEwgQOGSnIenGNsIYWCLnIwylcpSEqboPiL', 'OaYOVQXqvOZvpZTfJkVsLFNKnVkggpVoeJIDWHFZVXsSRhtGYaCsTqZzIXKmXMYEgjVzljgdfeViQFHeBbIzudrnOGHLqBxOTVqc', 'gUMJBrqCaASGDHGtOKadsUSkUSRTyAuWmBoqxJCjAckyKaNLCXNlfOlKvxNFNEVXvJqyVhUXuZydHPypTYMIkYdcJFBSfUUGJVpk', 'yxshbaneIsRWNVYpJoLKDQKdcPIRlySaHUAMmlIVauEkLrgwzW', 100241);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100222, 'YAnUleIpDDjDYDWQqbNsQFZJBqMZwYMIdqMtggMDTKonygjCrg', 'cWSjNNGLrMIfDNQaUpNXRtHqqfunYswbgGJQfHaXmlxGjbLFTHrwHgaGaSdvmtGTjNZnewpnWoKYYvsMEgvgZhJgoeMXQNrGBHZk', 'VsQJDfGRTjbNctOgoUbIrtUpPUNxzSljrjmEIlJUQiddVXPdLpWACLimmzrepRuMacLaubrfdmyfsCyNFRwQDZRNNKikkvFHXawO', 'ldZmTEokQsoqinuLuzXPZRARBxayGXgjxkZToqGYPkzrPJePzQ', 100031);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100223, 'WgDgmXYTbBmIifPHZRFEGUuSZPkvFIYkHaaDCRiEARVZxEDaWA', 'RuFClNCJYEQuxIrkXiUYPhJuoPDYtxedUjbhttuxpervvUmagBysmqvDgzeXuVErtEgnvdcdDUrscgvASpqRcbFDdDJLnpiCwKKD', 'QSQCeCwZySSEcRlddPiovKDtBswrGMfTfpaaMFSgBCiizxBgOjJTQKJWOuDmpyFnpAyEFXgCJQVXihxqopAgrFuUAkSCjLwIFbuQ', 'SbBjDeDkPpyHtAoRMtRXyDKoJRFFNpVQpAYJQFpCpwgcwYXJhH', 100049);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100224, 'SgEsUpqaGnrzeQAGTEeJGTAlTVaFonGDnuGIOzuVtGMhPZDfVw', 'zWIBGaQOOCvRQEULuoRWNZynMaarGFfHPsyOUobFqUQheSzVxJJakTpeTFAOaKpIathThfFQdaOnsmrOuDvRhUHUnikRNWuRZPId', 'SkmohIRaWSbBHAlpWFCrsgfXsHJGIdGJILFwZTDQzMYkXyvoBTSyGpCxXUimaxnywIeqAqGzgicBUbNdCzTmfRKnAGBblIbUgrmx', 'qbuDdKZZcwEcCxeasWPIwEsqTGkMhFOedIAAogQDvzqXIIenRF', 100135);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100225, 'sSlciXcEJIOOMtqiZIVWzgbgmLludSyQiInsJYVCNVFLlVjGlc', 'cLcbterfkyEptabxUdlRcmDVkgBhnPLeeAfZlnPsNrVOIiGaehSTlqCZNAFPrXeqymbMsWNfuAyOYReDrQrRovFRwKMzjRXOZLMh', 'spxEBNeoxLzFugzJWSCQlpDGeYwpgVMNYedHCPNnbeRgeDafnAtlQlnBMdLJYKjDeBhvtcemKwUbcnckhBqEsCMVWORiFiBdFGrO', 'aJYHjWOKGTKiGSkpqPZMeOoCrspqyeZmaUMEPFSYjQVUhBuQVi', 100328);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100226, 'eAuVlrLYWFwncgDTdzLvKcKZlJthozMTiBpJEZHDWYJalVGQYO', 'fjIipeLfKTAluZaaFzSkuMXvhqIQvFooGtiCjPyzgTETptXcGzctwxgbvuxVyKVmPPpOtkVvXZAUVsVwVWMXdKAMBHpVBglPzNLF', 'vUoIymMupGTUhnKYosMWsMhfmQgLDzSkkyvWvlMUTTFyFbjdYDkcXNKJyWWiIVhiVuVNPdIUZKEVuIzZOhgWzCYrhHEfHcxLINKS', 'npUuomlFjWCVHhsMxlQVUoPZsNgOUKAedFTfXZpyFQqSDIJKYh', 100161);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100227, 'GfahpejysqDenwbgBuYlBfwOBCXaEvlpGOpPmwLuHoAiasSyOB', 'TXWOkTmptTcyrETYgBrortXTrwzeJMStOxMxFHHIEvSQwYwoekwliWMFpgVYLroQerzBgcIEHllqjTcuXQhcSroiVohUpXYYkeUG', 'lxWsCQPwnkWbAntfSrfkKsBprNxAvFMsHKdiwQdlprsonmADTJZjBQvdrxpyTQOytbjqSZHVSyidPOTrfygaXAiGoNswlxyxDaij', 'UrpTkAyoaRwZGAADFeZIKbDSoGJfVAuGXAKpMwxBWldSKBcNeF', 100383);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100228, 'krRMEhxzEfcZrvQBJRlNvZgiIJeukQuFtAaqirHomRFlWQFYEv', 'rxPnLQFpzoJsDgGRPaAJtuQvyHfeavlWdwGItSynxViQiaFbKuJnwvniLfApPDQajzfPWOOEGHVwZTGFtVTKRujlZOyciPEHwdxr', 'YONtLWJqtQMSQgwkOIhGfKnghkspDmQefrFtLFSjHHBymidRQxzKobOgiqfYcDfteQxrsRGJbQLlVvhKNOMdHXsBPFgRLJaACraG', 'nBnGTBlWNpcVMuPaGsRZhIlFQMxGxYPwZeoGjmkShvFQCHRKiD', 100311);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100229, 'WwHBsUtgGmfhlBWOdQsBAaQfYYMSORQdLWcUGIIyIhIsSVvQEu', 'AbAntTEYbywYBhSnpEehOzxHZchfNJHvyRNXgLPwNqjiipacnAerJBGLugrnWbSLbWTyXrmKaMuexerJqsSpRCCokQNhIErYYccr', 'JgDiTNnHIBkcUuRQUyzGllmgeGpsqaRYyDcRwWMUqXzGJfbwcUBhYpxGDiJteFVnyQUGkeDsnKErownyuRsTsNyFXxjrByFqBSAd', 'EpekgYWmUYHAXjspyIDVyKyXRkklAFMRpVCJtkelaDkPxbbjvy', 100222);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100230, 'ZKvgROPvZpcvXtUaFHuHnRtLoAxhOrVbVsbkiGfMPeXVqoTULw', 'nprPGbWHMcDOcbpitLPeToXobFbbCgUsAWajkUjRIUvjdyEebrqueupVfDkzzHkaoQnrgzzLRQLdIPqyALtxWtVJqvQfhaYhKehC', 'tleLZkHcPbQkEJlWiHfyZDqWSoHrwQSAXOnUVgsBpbQipVYlwqvXMKobEWeBOvHdVORqmibqcfhkyWatrGmDdlteOAARIeibMnGI', 'aTLszYJEofcYSQspcVTySUxnWEEAXRaZVePsHIfcsKMPMNbLcv', 100197);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100231, 'sQoMnyPSLSqNmCNvIEqjjkAZiFyxUaribzWunRIQzYzInTIHTw', 'gSFdMwEIVHoOfgDtrFTpooGBFmQgztHPQRBPGkRzuCRAmCvBSJFqrcUkWboCeIxwisBtdHwGlhazUvflgvVwrwfocYagMEXQjPgJ', 'jHBoXlHIdVKonLZXDmQWdGTIyPBaUCTodxMrcSsioZtOQEtSxBaydXgBpdotSXsMWNIZGxzAwvejIyeapueMgbvsJsUmBlGaktns', 'EfZhJflJydSzfrahRAznWcLfEVhJocWXlPwKNkrMcKKOnySOfM', 100153);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100232, 'GZGyrWpFzENLiqYhxgLGdwaxIOtXNEMQjhtdZBBZQKRxhPhBsC', 'adTdkpCXxqLnpHrzsKRXbpIXZWUoAVlXNOQhDwYtixColvStsWePIFDvxabCRIlIeUWbfHsNWprIkGVVwpETBdYQkmqCyoMNPgMi', 'AGrjlgdhiaoLndcegcfqIYTjikmkoqFiDoBbCLICzvAFnQagrexFZxrCdAJaMVDsWhATCzJPnyMRpTvOeeHCaaPZNHzZLPPNltRJ', 'UdPAwyrpXHVsZthwPutzwselLldmWEPkQzRNXjaYvxJesuhDhC', 100041);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100233, 'gYGTGMPiDzYIHWnvZqPaGOLuXpDQSzamNpamkTfcayOKuNoyEa', 'RBfdWQvQnbgDLyjcNuHHCgJssWAyTbJxUjWJwZhkomQlHviHThmbMrJWCIUaFNrDqpxQfDNDKoGZhrbodVrvOYWMeNTIEauHTVkm', 'oYVEUEaKKjPhLfIZrOuapZzGmrnkAdFDnuSxfwJyHrGtfGBvTFOIOAMgbmkzFEOhsxWApsfHbFWMSncSjhgWilmEGFkLVohARxnh', 'dPKRPgmXZuBwqfbFZlUepaevSGsCVXaiICbzKDWkFltNtnJqXD', 100127);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100234, 'CutVkKvyhphlewomwNfPSgpfzYaXIbtvzJTkjBJTXTgxhopJsu', 'CRvhqaRAtzGkXWjnNIMvLWebadZCluGMlubUdVWWmqFrBZyVvjajCZhMcjcFPFaqrotdxCUrjOSwLvSWFSrRbzKWLtnOllbqjkHZ', 'mqSqTYJfDVExkGbobxOOQupsQwWaSAWqdrQYAdixGyJmBJPzRrFYdNBbruhlSzJymaQSfheqLVZXCFFjGIcXbjMBXTGCbXFuoslO', 'udCyJpRIofcxBIkDokxdlhysDGWEHudTylaKUmTuGPWXaaEjJS', 100192);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100235, 'QluJnhkYiNAhHsnbtRWJXftTXkvKgitpsGRoTgqrIFYyqcSrJR', 'hUWzisWrTWFbxxCSQxFJjlmvNhOmoHJMFqAwfThcnqfuspDTasstaLLrvfRcOYiVUfmfkhNwmgMOyveHLXjLmnCBUoCesihgReOI', 'BUbdntgIkALvtCfBFZLzSUQwWvOVeCbOQbIAEbYTIUNueaLorvxEVKaOXyVMnAKjJsmXCPYHKPYBDDXlGSoLHJNGVNvMKVwadCMI', 'yActhmACRbpLbkmCXmfjlsgZHXvGhhZYGQvLbmvwnVAicSWPAs', 100189);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100236, 'jGvXrrVQmjLnxliUtMWAKvCgkzyEDPnOUmznWhaNhWRnJWifpP', 'cocNxeGpKyjRRcRbzXaMNyQtczYjExrtgnrPPQskQsZSrcGnGBKXXvKqxhVLEPjCJOxbRpIXfqbBQSxMPInLDUAEdBxjDGVmuesz', 'tHjWECqnQvVeXbEABlSfSXwluLnjfUeSPmVkJLUjuwQZkNfsMVWRQiVOimwHlvRlHjUNlGgEoqyiUgQekwrlAyiTGxLqwRjBnbpE', 'jIEbjiicmAVyuoJpVWFJLeibneOhqkJFwnGCcVoPwpEfPMGXdP', 100213);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100237, 'NLGhxBosGQDOINPYncZbiWvrbIVvBDpJXOBynuYLrnXNFYbKad', 'XlyMYUSiWhkMucEOLgCWgFNqMOJKNMTQWyHQyEFcmyhKNNVEVCUOOyQyyydlwbOsWKqmvUMomtQzQEHTeDabWHiXUXQCPcRRjnwT', 'dOHquEyVNozKnQEJhorevpeFDFTvvHSJcHXMUqUTNFNZKPuOLAIVVgrMBrxeWCukIYpezrDLvuOwWsoBDZEujbhqAezvXCpexPvr', 'kyKgNxKdtgsbwnbZEtWWUNcbiMVdXNGamSUqzSfNyxtiqunihk', 100148);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100238, 'nSQMiIQfNfSRWmTjHoFlNPYksxpmzRVvrRevobHkRGNPHqkjzp', 'WtJxkKZfdCDPAUCjPvOOIhYFuZUDOOgnPHXYtkOJJNPCCFjLvMyqbEMzGLktQYcmQrLaaTCxJvEuAFcCpmnCkkZAHKboHfpLYFxi', 'SQFNhivPTqJwyrViZrDnuLzllBSSNRLTeVYkzcXaAAiLuUecsallQhysBqHXKPoFVabWiSUmCidrbJckDsIWWaHDUfNuFVazMtMf', 'yAsiobNKKQIcbiMPggilidoQnKvipRiIXMFMSaiKUEyKLOSjEB', 100096);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100239, 'QFxOZdTmmYFLRWfkETMKzSCHZJnSAcapzzOiuPDsAXpzgvJxFs', 'ehAKEgLPvHfwgwjjpfadHmRqMYJajTOzYEVpLKvwwysBmmDGUiEEBKYOFaUvPrlRSqcqUudTHSosUfwtzsSRSJDcElxKRtzkyFuR', 'MGXCMTjoprVhwoGSSIdhMnzQOSiQrOFXFqmVPaudjnLcQNSVFSOzJGFEDrSyfaNRxNzlXeGzyorNXkKUPqBhwjODHHWLapJNZzMR', 'WkeDIcbRrnALUzGccmmGdtChUkpyFJPLqLsHMRwZzngVeMWpVL', 100314);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100240, 'PyWelXVDzXHpSZhJWEcPNMFqhmBrDKkENRhiBXSKBBsoxaKTDH', 'ETWhfTDCpxeAzEGXiBLhTHdaCADpzuypcdfxyuAyypisqmSPcFFedRZXJLZrNrYPQImBVzVPBveCbplTqRVKBdbvzYESlpvRbEGi', 'gOSydyeXohlSsnUNOaCADAjqfAscuCAMlZDSITSuUlxltXxTqrxzCLAaTHXwyvYOCHuHvUiMbUaxQcjoPShQdZnQXUJvHPrxHKkA', 'kdaxOlrAGIQbMDUVSwxJZeHYYevfGDhYfmvpHFbxSZrNcEedUS', 100220);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100241, 'XDcnsQxdoqnZgDhWcEjvBzhCITodEwJKMrTNalaebXlJHJGlnW', 'NAtLGODiRVLcaykykqKjbBRDQmkNYShpKgohWIgsyNlLBgHLlwCciWuJzHHbwlDArKBipQiKlonqEAMWTAebvTPAdjGRNVkCMBAA', 'krtrEtKIhKqavSMUfEKIFGxxHZcbLEotvDsOqHDakDFLCCgwOIDamaZskKwyOMrLwVCJuwfDWrzMhdRMoDhgMeuySRWHIiUzgwhJ', 'YJMFEHIbMSWdZFCwHtNoJWKyfgxmpLIOmvwXTkYABpdZSeNwxl', 100365);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100242, 'rnSpyLNHuFkgtkMGQFseGnAaLzTAXlXPTCJTTAmheUdYMzOIni', 'TAmLbeXoAnNjyXqmLPIIXoQQknYVYGIAgXZIQntCknRxcHCgcFMbuVsMxMHJPLCepTAnORkPmplbsxEbwYvVMQydMqVTvRDJWYXB', 'JgcRxnEdrxRwRwOVCwvvEySAByJaneAeZdsZbibgvaSQBEKdotojZGnUglFTzRFvjplasKeWoTUuZMxuefHJBQLTKIaVcGWPMCvo', 'OODIVXHuzyfVRBVXEmjyNVvJUNVeUdaAcUheruuRdYWjiWRqiS', 100086);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100243, 'GNFQPuKPnfNwPSbAVNVVzCElNMXBlJcpMrmJZLQCnFGkyFQfDD', 'stPgbJeZsekaaDxIfhuHrehlbKkwKeJIVDpXkYgaMXRCMaxHtcmnrAWyOQWJDRYZjmDSGwqZotFoYfNpsSsfVigGSSVpulRqgKoQ', 'yrLTtXRqwDcIICjuLDuiLLbykCiHAmjSvPqzpeNyAehiNXJpVWEIjeiQOiQeJHAeTpdhpMHxzIdEgeazSkbtKYoDDyJvQuyFtUEH', 'ikVPMCGxGfVUZHKoSJHdwoIdiWBJuTImGlEhsGkjJDXmvyCiCc', 100049);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100244, 'EndGFPRbzlAkVsSIcQfAsrRpGNSXJNbXUovGZrAYUUKeQfqrOg', 'sBgnUYlHtYAHMmRGLLunpcJXTqIXVIMvLBHApTljVMKLXVtqhzBjYKeBDwaCgWtjwkNtkkwwYBPJKvNFLnavfQCMFJIpdWmbuPGK', 'pCOMeZfpxkKoYmqppXFNtGkYuFjYCYjnczzwktbDOVVASVKwaJUzyNRBrCLOXSYUnYQYSeiaUEwauBgrWeiwNQOWTkldYzlsKkvG', 'ZjYIYGfggybMNmirYadmxtnZOKCeqBoZHZTxZmvEDsJnLnbtjE', 100263);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100245, 'dNTVEiSubAFiQRKilcrFiFXWeYAoQFFytNOHUNfviOFTpGnNYH', 'MoBCxrgklCSkAUUHzUkUZqlkpKRihIygKXSaQqxuxfuzehPWFGEwsWOVIqrvmIeZkqaxSqokrSKNFZGnKXkTqQbWpKFpamTUDRGs', 'OLzJqvdbfMpnPLMzbolbhxKlkXGCltbUpYWtQcZtjrIEiVrTfoRJncjYCjJeKWuCWeMKkgZZjARBfIPXLcHPTMTwOybbmtWWgrLF', 'OdzdovIPejLlORPRsngPfabVZeuGLrmGeakVJxHiMQrScZiqMn', 100109);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100246, 'hGyADcNtvFHkHcalyrqkBEGlrkmBDszUShsBLWFKXwliDOtFOD', 'LxjsJpenMNWlLLsTVzNbfNIeJRuQmjDmMefdejcCQtOLQqXdDRcZlEBIOcOcaUgSihzgezGZVEFsDOjxnQcqoqGwHIZYNnOqwzWO', 'JqwAjOQhjragrbEQiKYKdUIpgCSdHHKnNMTGbfWnaZCSkCiIHuxIrHbamVKhymPEHfpeursUkpMsUZNmzTekwIEFKYKSusRAuyIN', 'ycfIosrtTfogKMHZZwOUrxpbyKKcpDpOCBBlEbzmeQNbCtagiM', 100324);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100247, 'stUavDrGKFKUaIhLQFfQgcygUeHfCvSxgqgftgPyrNhaLWDCKd', 'XmdUcnCqQVhBGHDRucHBPWnqbENJVcTafAyyyyxATEkNpLEIjAhflLwctaCRTjQIHpUHtIPXPPzKHDlKwrdMiDuptWXSpUUkQOly', 'SUdZllWuVEVYbHrcAoPtsWkbCBqlsACrizvmqpqLEyytnkMvAsNYPxCRrnzPxdHAJgwsHaXAKDcPEDOYoiTguHNbWresENnstxTv', 'vDjhCaYimHpornECUKapQqUlBuolGFRjqauZLlRkLVvJLNlgbq', 100394);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100248, 'CKHoEdOuiobbxOMBywxQSJHDhZylMMcXIvLrCbjinxzvmXCEyw', 'KfFzMIsqGylnbuGDiortLyWkkpunFsaFNQsDhkVOtUPvRBBhqnhVsBptbVENSLnwuXspmIiKrcqmqTCNsLjqQtbPzTbKBaORAJkN', 'ZzumOccTvGYBigqaNFhweybpuAtOynqFprYdWQVqtVLRFqLgYzdpwtWufdrZyXGYHQNXcnyllCMCdAjywcGlglodFMvthfiDRKtc', 'gacufSpLFpotBhJgLxZdAAMmAHLsRqYrJpzIeinlaeXAFFjEFh', 100259);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100249, 'SKqYGdGRRJCsHzhQxrgrlupgzhjfaEtWnzWxfsGhXAiQIxcAdq', 'ikHsSOstuUfTGMhPmYnPnyLPYgTaBRankkWJWLeRkKLLUipxzwLbvXLACDfspWhVONZsHCcAdXqbOeFsAERXapdrIMQjgWoDbJam', 'DXsJxXcnNpzkYQDlVPjrtrYboIagxdLZqBljiIJlWWOfBaNjWALjwNZjfQzlYEqCoXOIeloFUvRITAXzFXflwaBNhcOEOwUdIfMO', 'VRPgonwDNukDVgJwBJqmqVLCquRTOGmQGgyMObvLwCMpzvRUoK', 100396);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100250, 'RjoiChdUvKjTmsDRVDGlpBHBowwZyOQYtdSgwmHIGHiqkkJDhp', 'JIdRKmExKzgwRdIsMncGffaXwuStaLmyauBaNSidOduGmkDqYBdxMrHHXaBYcYvXZlebQxDTaYgTJOkzBSKRbVAIpgnCedqmXrGp', 'wqezhtKMEhxEiCfWNPpnsSSylIGYDgGqjevGumwgOdSUTUQhVOMnsRPXMMtHrOJnOeGQfTecgePVVgQFhoHSvJIwFFrYpPpYWesP', 'jXrjzTCFIgKyqFZJIBtXIYNGdsXycaqUsjLzEitbrIoHhMrBmx', 100301);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100251, 'AkxWltjWVDUedFTCfLvdnSRGJeidRbnsdPsNBndfxLxAYTCXDX', 'CCzHTpbbZUoFfRSuKksgAGxYmagtbVsJohOyeHEGaawUHiUfrAoZBDyNaqIcwsgZUHyhIHxxMlZaMKWsjHqaWnjrYMHyEfVvTQSd', 'bvJNrMXPNnvTpqMizANndBwekjjxWYeAmHDNdEikVirQiFizUJJVsogZlmmwldYMxwVchDoLaqIIazyqqUZVKfPdNaPsIvfSuobE', 'KSfhyQSqrgkKwcNzZWWuetgmEftcIBOmSuePblWSWwKuMDhxmj', 100265);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100252, 'rFkbTnPINUdcOvrstgYHVThwhPKPyyPmJOoOKxVHtCUGZdVyUf', 'aArZccwqSQfaMvFSCctWOxdEdlsyPGWJhVdCvzRpVaIMwuVOMeZWikSXExGvxnOneyJclgtboiyNNpUJxkPmukFPoPgJRnwzdmxu', 'jARemXFnkxkhyKFzAJCwsHUMCglsfznqugvBjkjNKrstmgPkNHaIAArcSXnDGAUsgNuZSLwLtiSFIkneVvTdwzndOqeSwCxHtRpY', 'fERAchjjLxodjAzZQnlivfryDSFRHyDcbtrKqiewQPPbUYhWxb', 100333);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100253, 'PsyRLmLZiChHeBJPnWqAgfeoUmfaWBskrmrxmQWHkWGYTMLWtR', 'rTrcvIXKungKviJVWlRNIlzujDUZhBCynbYHjzdGvKXKSwJLIjNaqgTOTEpMTNlniEafBRhpCLhIvywduuwdFzwLfpAbpTLQtKkP', 'uzdFTvFiIMvKdeBNFMXMYysmSYFaUqXNbqVhJCSFLIAzJJBJJrcnYXGspkvHfJKrqDcRaTxfemFBYyOIKsdpjzyaNDzMCoDuAsxm', 'kcsiBxVkneTODqfAsGiuyyhOGeqFwrjEWojFBSAsuZNFVZDURK', 100031);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100254, 'bYtRouxTQsyOwQobzgabmAwDUFZFozUmdGRwvxRTVCcZhYpNcp', 'JEadUxmHcMhLuvzepAUauBJFebeCySfZjQcHrKlqKmhYRAopdefhdpJrUgUhysuJsgQHbWSLNGBRQGshrqIqPOOOEwKXdOYAaQVo', 'UjPUGgnpEJkZZQvtdAoKeVsrYCuHHQPujzcQxdzVIVhLAZCVpEcPYTomqihLbsiOrOJYwbloDIKEZNCvXzQKhEaTYCGsEJnYgayW', 'DpdiFjTLqugrzzeqyPPbaIoBJzAggSiluQrludCcbZegaTRmff', 100356);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100255, 'BxHNkARYqsARZRMYBFlUoxnpvAHQELSTbuFKQNmEbtBSLfbCsC', 'yjcxaywYiKmtuaFFxjxrdMkPTgnggDxVuaeeiiSWNUwyOxDCJXIFAogGxxICOlsoJJnzOeqRtJpQJQPwcgOpXKIKPNPpXKQAyVvP', 'hMNEPbNfbuXkMXbhoWZlzVfxgEHDVeiyZXmPSEDuLxtLWtErNTnnEjoyUXyQZUAhtoiHGaJuojVzrMoHGBnzniqcaSQdrlPsfLrT', 'LhEsvQKcsvOzHUrvdLZDpvfLQPfCfTfEQCkrHClWDWJsVdkkHy', 100202);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100256, 'aEOzedlyrBeqZcTfIbeIIipCXxCRNkxmftMCsLvMvFMQnOVCxY', 'bXQjMMkhSsNyIpGvXhnDsVOyTjcneRVNCTZygRAItdocKnlZxSoIxjyYzhBWlCealAErRRwjgUYpEcolXArOpULejrEtGAVwmvKJ', 'JaQDdZOmoVBLKdRAAenASJyxVtlyxvOQsIBGySVDgBovcQcJGAlztpVHmhTjlIzsTaIhfBWpGXmcjEVhmPCZeUeqhcfMeaAPNVzB', 'eKfeGDidTzVGbYDRAdPjHqQEROnyiaGuVzVTJWicvGVAVUbNCq', 100027);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100257, 'uVvhSjbPBOBycmACILaBdjexZOXQlHNDFiqnhBSgrRITWREYAE', 'AGpXXrGrBLUMFJUmMOzkYzlFuifSaAUrWxRLybHbvGNqRChscpHYVwufeZulKgZQBWfeEvihIVMLkvfUifrLjJxjcWNaPVuNAxEG', 'vOQGtUUYzVITwXmdGPnvpPliNiLBiFXaciTVsApJdWegYOcqBFHwSQQDyjjuhwZucoOAeCuSrmROAvVAuiTlwtmtfjxxdhscvHAw', 'OhaBnSjwrBUQcGWRNiMFnEGYyLTlFByxSAdHHXYNCVtGwwHQjS', 100318);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100258, 'vjIvQowINgIBavPujwLPfBngKueLEAHyQwozSQIbKJgMgJcUuk', 'BGDAcvKjrHQzLjnZYrjhamYaoiPfLtxeInxKnmPiIZucdFDlonGmZQGIgSMbkKMpUlqZqdSeDHReNFfflscSLYuGyBvehzJUumPN', 'sTRxoxGoSoFidAflJngSqwwYoMnneSWYapFKqEbCPRZuDPGEbZkcIHvWQbRbamRyGChzGbXCqHyIAwYgJbWoQXruTQNrOWdMTTWW', 'ySsfimLIXpqkGnIvbpuuRafqSDwhgldFWeLqgktGltbPnhttjE', 100053);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100259, 'yzFcaHSgypvlUFOwZPFfKbREqsCqULSKwXWekumUDIJWuXeTXT', 'jCIGanDqHGWEMqrIFNRkodrnZwYHcQALfowaLGcwoKEdrBKPRnKaWWiwBOtgjiHJtBpJLUJNOBqJhGIykFPEwLFWrXrRwVnyZTAx', 'SkvtSvyAQpjEDghdyGTpdvFSvTHTOtpZjjzqzDZMVsJSggKRxZQvxcMjyUtHRJqvkQbOifdPCQyuQzWPlDcjLROUjrNfifXsEyCb', 'kYjpaagzQZeEljQttkAnqhKSOOyBHizlgRxlwojOKWufthRhWL', 100263);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100260, 'NlsNjtHBqhdYHMokvgUTaWvqclwoUxxxoxbBEWssexDAXyJQcn', 'WbwIRJBokarLqYamaGiPGLYHGDDQifgaWMtaXFqoFWLCsxBCGoLKbPSGcBxaWZkSwybpBvClYaNVPLNazeMCfmDgcDQgCMcCmsuo', 'lsaLQIDTUMwHjdXwJgXOMxDtOcdxAlFctJRfxpELqrEVECVvCqlZPcUteRxzVCxFPCuWkyWFXqjVMNHjWJErhjiPGzBEsEzLThvA', 'scBnvgWdvZelfVxKBVpijjXnFWjrqtEKODYfDYVuEMQDsDhbYc', 100306);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100261, 'pnEyFMoGyNgTYHvlKEBckQuuStNCBroQHKaHRUXDdVjOKifvIp', 'kCNGVVdHqQxuMdYZfJsHMFgXUkIabSLmQPbZwILrTNIiBbQuJAPWVjjmqWGMBciatWYToCQKAvCOdoHOuuuePHIOrjhCrhBVaoWD', 'TRiixdLnbMMKKIEOgcrbWrXLfMHOJfdJlnfjUZavTRmDYtRJYYaqqWhSRFwjpeGXTEWfdsSekmihHcGAwsYGLmNrVkggeBJIGCRp', 'YWFbHtvfCSXaIRppxCJhXmZEPaUJUHLnAnYnaLTLcDCogMYsTT', 100019);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100262, 'rJhXjOKqeCdanNKaNLXLnswfRWTxCgVDGQGBFfPWnHSuhfhEYD', 'xIAOwCmultmjWJMKYYtKNnjJnkwzAFRCbAAmXvqbzXQRAJlMOLtBKAkNBGYuVWUcBwskayRrrPmLNgXzysDdrwCFYdXHpYPbyHTx', 'LDqHfJTMpMxzwElZZLdvABErYkljFBQJpiPEDSZhwlNQkEUpEuBaufryUWQUiZupBSCRTdEKMuxgfxKlSoJIhpLHpsihhDNAlwSv', 'pPuTKbgGmfgXCszdbYleCeGUqoCzPRjfJPzuhqjltyvHeuvlED', 100372);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100263, 'HXMPdtUJqMGqgVSzBJQPmafzJbBBUbVSZpybkbSMEEWkkLJCaB', 'WrUGIJftuJHmbUKIIssEGjPAQOTZjmmAqXAQvMvEtfhuYbrrwHeQmhNdHZMYKyrhCOuJffMNmNUbEbOGGARFqVqEwdJYjehwjZGl', 'ScQwAVQlwFvzquhcAEANvMHPFGCHBxVtngvapnqPTCoDIrfEcFBVQosjgbtwDNlxUKupCGyFXeAlsydTVrGRtISBVlyGFKEhmMaQ', 'zxXGGuSLvRWVHJHnYlzORQOmSpgrswdXDOFOICibchKUZaLuhm', 100312);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100264, 'pGdlurAHrlFQmqFhRkWRosSgsiVnsEXdwboKDSbrzotnZpyXcJ', 'gciEwtcdOWXogMOAZCTxIwtWNPxDCFwQJyGyeOvpqbDLKjUVbFSGREbdIrMRGPVNJPwtCkeVQvrwdzLilWIBOYBqkokuKPZJgvWM', 'VJaDakSoOjTEvOEdVquGIZLMKIBnhnPYWvciJDmcEcVFroirLfTobBrKjZbTeWPnbBGYLTOfkkSSYqoCYajEeycUiBuaShFGoUKP', 'uinfCtGqqEFBfdnaaOqJpLXmDKhliDUwYSrfXZJLBhXvZvJajo', 100348);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100265, 'ZFnYYtIRnPfWxePnebnhDNSpVvAuEAPxVzdpKRqMBSzAlkVGrx', 'ZUBhyXPDiBIWfZgLtwflAkIAbueFSKklSzTefnqPSGSVbetygCEcCtCUSdttAJuDaZhDXqUyHIwQmKHpIdvIjYETZsTkhTqiFniW', 'urDSYzweGQtgjIXghRbGipRumYqstYuTNItNHHpmhXtafqFSSSCaBrsfbnOQpYoXitcPNcPeEDXnghpxZegLqiRxAtLFnTVKckic', 'aYUxRDdEUKEzthaYoIQiwYrDrrEEZRSKRxzvQcoiLNzquhQejM', 100346);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100266, 'MvgDWYJHjuTixNHvpEeybvBWVcxmFtSHCLJtYtJQyaQnQjGfRo', 'wLSItngLACmDHzfLsISJcaUmXHaimqsNMrzhmDCrkywAChwPpnweXESqDMJWUehFeaVELYcNmTLGxMkfGtwEnWuyEiBtUGYWTIPa', 'IRpjIWLdXFwpXuHmJilhtXmFhlVYPABESTcFhxXAvlsedWfmGpKzPEElxUGTheGQOUJQicJfedyefSrXNyNTaZzcDuXQXcpbgLCQ', 'ljkbekXNYQbSqbxhFaYrBjdsLdADWSRePoPSzIomybUeImJhyK', 100089);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100267, 'YQkSRVobCQrJSbrocOjewcclZhtMJsykiotgPhDqZpMqiGAzAz', 'gExTKnLuoWqDYBeDwgVkNYJtCbZWZPMmaMpnDQAAOHJodxJJJgXFVMriseCIddcqdFmuqXupZINvQJeCDrnhDeuCnrpHymgXDhAP', 'RBjLlcIutinwJTVqdaIpBzxeKoPxBMjchiGAsKrkMmFadPJanDPGYGCEeSbXkWoWuPQqxeXjWbBqVNSOMOBWUnhJsXdrZPbgPvYk', 'kkAzAFeQufSNedpFsdqtIkEozKCKeNiiSeXYoGRqUMrSWiMxJz', 100353);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100268, 'WntSdBlExNVCEHYrsXRbmHHEzvTNYCSHsaTWMeQESDLsVYiRms', 'DWwIbMPSwKhtGBQkrBYGVlAnUqymzkvqdNKPjIFttAASwMTUrdswaMCpMQkHkQcnRuVqnGaQYpaEagnvBtNCXbqondUIwiyQLmSY', 'mxLZuCtUjGBWSoMdrnfhGbFmVGcrWHMhKklLOYOgwdXbpVjSswrArwUnwpitcUsLIGLEEoPvjwsaSbISFSuiMlVMXTibzOgVOoBh', 'tDoMaFoVzPuzeKnTVBuzWrUxmGovDOzpYEDPgCcDLdKZFEkZTQ', 100083);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100269, 'IQdBbAZjREogKOSqkpspkEMuQZMmddQTEHMvwiSotEpTOkFYeo', 'MxhGsbtuaYJelpmzkXjYuwFUwBPuDYUsWinrCyeciZQAGvoBvtbFVTfxKLNdJmgWDkKkzfXqTZWNwhSAQSirzHwNcKavuJvlfkaA', 'AqVnUBFiuDaEgUngRiaeWksQNnBQluKPOubIlReEvtCWTnyvZwzxxccraRYtwZortqWHfyVtnzcFdBXWAGCzTeTSfRXAcEhIynNG', 'QxuzIwVfwlYMxHingsJybiDxkJURkesjWdGtHHMBvOlPeyjqsK', 100175);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100270, 'nqksplFAwuCaUidFmLtPJRPpHeLTlIqfULirwrRphjULveAuwE', 'SZOJEWBmrHRWDYwuXMuXvKeXiRzqHkhDzfWYKgimLYzvqAHwTEUFCBSLoIvuipvFgQekcouSJPqcwjopJcKgLbgWOUcGNQHHwqtC', 'xBTPufRSYxZuAEXESaYJbTIwQoHreLAjUblqHKPmFzjuTcAezvXUCoepfwZmqODekUudpwySwOUUJilOqhOpJkFuXwhrFNGGhCmE', 'VpLRxVUlAQFIdjOsUWfRnZbVNGpWaEzmItSmyVAUDEiJnWiZhG', 100219);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100271, 'RpbrwXovRGrrfKsNXrsPsvzTymgJCMJKQzSNaiKnSAboXWaxMx', 'XHzknCbPFQLpoqzRNntuaWGOiYMYQSJjFDOpazeTqNkTTBPCcbqWnfMOVJdbKSiXEMohjokXQIxeqmZUvOSCpWxROMiIywRbxkgg', 'VjzmexmlWGQVTMRlcQhxDFzQJdcymQZrIoZcdNxdWYvsDBDDchvNSSCdJyRIjHJShPWYvGvWtnRLUxEJARdnfyZRdSTPhtDZfGaF', 'wMoLVdsxTrnUUqdeAHioEIpjxVDYMIwtzZLCnStvVXoZzYYPmY', 100363);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100272, 'CnIUSiZRsQnXbvlSEtNsUaxuXGPbJbbfmkcaQpUHpejfUvBOHt', 'mUufvlQqjCSTePSmCubcKArzYMCjgQRiFQoYmWKuXiSfKuNOsyvdgoLvjFjyKUMVghFpFLNQMLJPBuUwmoZzxMrLMuTJXlRPTqKf', 'iTnUSCMiFfzHZHkeikMYiPAQYfRghRHtlAmNnbVjDZBkMaDohdHKfLtuSVqdUPBkyDIburOudTFZEdlMKDbxOjmaFnREgkSbxvLi', 'eBtZxnxwNyPVxFlwFAUxvddbtynFPtUicxizGinEnMdqnHekeT', 100160);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100273, 'TgEStdCZaEkeWkiRgvBgbpbEmJDFBBFmDuSMvaAvywCkuFPzrO', 'aVolIpRpAJoHzasWorMGFWDvgOkcAsSslJLGTHmKphmgKSLJPQEjVVUsytMXkrMZIVsvVKdktIXkhlCHvkhYOIahGeymMAiajTfK', 'QBQeIqgGEwVbuVjQgqGDndodOzLqDVUQFVMauxokySkVZaNeYzezayaBDhcPyNtNFokLZyMZAOAGsuWEnJJdNXeKUtoSAiyqKHLA', 'HnorSpPvHabZuGAmNcYOpkxIsDerVdNcNpblmbtQcKPcyqFFAj', 100331);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100274, 'liGqeiTVWBcxSnFqbpVzLQsyLYkXJJDcThJnnCHQYeilYlYOyJ', 'CxgjjAtchyHvEBBCZTSvAjjWtcwSQgFatvdPdLUIGfEPBGzQTsTufrgfGXZqSQAIoGrCsLTJJzRGESOTKYSKGeYjLWumDvcXvHUV', 'qVndNWzaIwPfiTgJSMvhdHSEBLHrWNHrqTjCRJVCXkEsTVCZcxxdqoARXeWYcyJXrYCIgGqJuBKluLblJlMZdtjfperrhLTFoIXd', 'rmEZwHBecGufOYEVEvjcnZqrbINjJogdyNXafgtjneialcgTuB', 100148);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100275, 'mcNwfeRtPqFiXSZcsYjvqLuMLLUdHkxJCybOCeqUJKtwGMMmgJ', 'NhDtlfcwvprNCTMIiAYOOhyIwXiwWPjSvLiBdlrTmJVJPtpzPZiwsbMmVuGZGddoBbiJLIywvOvxtyZzdKYdokfxBhcVPIpZuiQi', 'qIuzQIGjUjAocVISAUeMSzqPttGxHSfIzqAvvosbMVNbzyvMlrSURpLocMFbidRSXXuDpKWqegPehBcQMZeWWlarDaPHjbDbGgmF', 'lXJbQgRnOfRhdayraUYFVwvUgwlNKqdNBWZHFJQZvcXVqbSwlG', 100373);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100276, 'OYlcWCZMAMnINaPinNFCUVHZmdNoDOnrjSaGBrbsJhKTabRizB', 'XVhERrfTpNFcGzocTUnfdlkFlUjtmuuYShqXnFOvrbHVlUiuWSZJZvftVDCPMxOUvkKvnowPFCcaVCvGJtDzbXeYwMOBVJuYWNcE', 'JfWYZSYANkWzEyBEhMSDgKqaErnQhttSvJGNFfNYNVdZBmsfWwnfVeapDtjpjwGYOPxyqBWpcdaldKgWbssOWPVEOiSVtCMyvHet', 'SyaYoKjjAFgAFWMExpnBJKHLCvZoyRriThQphFOhGRdVaLtOWu', 100346);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100277, 'KahszTgOhazdGbKEUVYFrFYtSlrcIULcynYcUJdJgrhCgREJPv', 'xqziBQnYlNPeektZTYYGcYqyiTtSoAyKeqLSgOkVvYuvwsthbeSdFtaQTnojvQzcBqlRFdOJOeAgwaBWxxSXVAsRLvECzNJPUCzY', 'ycnFUKCAobSzpoNnEPwxqkXWErfIbMFFTLSRmxwhaXSOUCESAqkOkotPdRJSObflhUVwutHDbPZYJpLxrGoTllIpoakVDUyeVbAW', 'DYyPgfxGlCviOciLlEwhSpECrYmwijRUjWhZQhMaFyypFZdhRp', 100187);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100278, 'MpVqQzbmnUVwJSLatDnpagZUIWyPyxnQCZviqhDUyvCXGISfLE', 'xTiRXBGSEqepRSjpcwsKnIJtQaZcuiSztcSqmcGnUKuxROHNncCFTYcVQZaXttXMjSVoeDkJYnEaJAtXCzMdsczhdArrWngrBDIA', 'OuOClhYLSFnPGCfNDzbnOOQpqMaqRjUrOktApeFVYcBffBaNhTXRXWRvTWDplDMUQYKlIGJOJYpHTodgqLzBrpoGiyHUNyBHNWUy', 'viGYumtzplFQfIXqgDabuGNWsqwoZkEPxHkfMzIJQoYloqwSPY', 100178);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100279, 'WiEkgSmaXbzmLbYGUApJIZlUaPdGxoUudreXYxNygHVcRCtcEn', 'kMwQlHYSqXrNmZRorcNCGQXUxMEbeYbcWERufaTJpnhQfZKGMYbKebKPywJoyBpZVUmyvSqRmUpwDfGDaSiYBHlWHltWUgqycXKI', 'onUfvzixQFISSsTJusVnLCaxeChVNrEcJSXFRHSmVeulTRafGlHVxnCOqghXUfbTRjTuDlBbzPPCFizGRcVZnHdSVJrjmELKwRiF', 'cLURrlXCbZgEllZLIFVBYNJdWZaXIvbTDmwOofTvCHyMUOFStp', 100201);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100280, 'eRmhxlGGMjBOWqTvEjeBdOiYGqgmPuzLZabQqzsDgKThOWMVtq', 'yRYLIrXGlvglbOvGbKDArIthhNTmkklpxwqJZqYczipgfewClHzsqTleCaRMScXeSHnkuyiUYOIrSfyoowUBAMRFnnJlDNiVNbAd', 'UXYvucTKNpYCyclwXssaXKBoerQJvugUSvzohlZLAJuaxkNfPGvPLAwFaGiLWvKoYFAAAfePaOVfsXzFKZKDnqONlQOAYJxfEbyw', 'ffMPoqDvtPppOiQFaqTeJhnRopirmWQcPQPYMXYPMnIWXhxEyp', 100238);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100281, 'wXnTinNKLLqLTZmNKgZlmvRHWJOFlSgQjZJkuObEIwOTxaWXup', 'BfRTdiVFJjUCTdXzycYpXtEfOCUTPJiPxHazrRqrPGaCsjEUAOIfUSURjgvDzziIVObqczHUyZcDqrZrDKotJaMGgOuDMIbllQjI', 'NCJDNMHTjjCtsyDggGIlwPYuMPDuwkgpiTBAbHDLbaHzYWwLySITCXMjtSKHbOtwURADJIwwELyqWSgQOFtsuDCoMPAQOZSrDTwX', 'vfUCngbDYYesPJrADPJURdnkFwCjdYIAVdVWyZlKXkwEtibtgg', 100116);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100282, 'zxifeJSizFnaApmuUFZtDwwEIEcVVTbPeBufceUqncXVuExOHv', 'nFZYodkhTiFlSLEsCuyHFmNYBhSRnZZIAkaahvEpSRBzRAqqgCaNjMnBhvFNoivLDYUJtezogXvjdhoftPliWreJTQWEWzOQfadO', 'SrgfIOPibsxfVoozgCNuiVvzWVInCXjKsBDBibLhYWpxTxlEbFYmTUCaEgaKRTbaizEYtULqJPXcWEbkefGbeQyQADngKgfDmTTc', 'hzmpNlldPnVjUZocPmmxvOxkZrdXdbSIDhUKXxPbJJrlgDcNZt', 100134);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100283, 'GfcqtzsZfbnIkVRAgwGohVDDZjWobQzaLawOCaFiFRvCasCYve', 'jElHRwmAlTjyFvxnJPtHcKJUFAwTKOOnckWHypCWLAiqwHcleyuYdIlpszIIibfPGENVnyWUNFhFTJppjjERlIceBWkFNRWELSiX', 'tnTLjwwLvNSLfYdCgZGcGyATVjeqZIyizQzqUkKXbLflfLsGGeJurKOWqEWVCuPsrgmWGsZvOQekqYIMhVIQhdQVnEoKNwMzVIRt', 'pWpLtNnSECGSTMIbGgfDzxaEBIcCWMXRCRfHgNXyMeStXzdVIR', 100360);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100284, 'hPhyQNAAdGvFgvXcpRtaSSQJoXzETIyJFwcwWMnaMGOPfJLCSY', 'WGwOFkLzGDjSphpVjHicNdtYMGsbjVpKelrSGQxUNfZpBzEiUcanqMqdYxGbYRhIkzyddEsebpkCSTTfSLoBPoFRZmhXGkjpxPVi', 'gRTbosPUXPjAwLyOhKsXoDmuQArLvlhlGbMpFfqSEqgwlhWLFXxgReDrnGQyyyABqSRNNMqlJqKPoZZowovCgKOSZlAXcGmuBxYO', 'AXBQzyYxmRwfVqazwpiFASSznvPPxPZVPKuGMcnhaRPSGSuZUz', 100331);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100285, 'GKJveYTAoljkiipThNMfGuElTAkfwrLYAfZoKHjYtsRlOfiXyF', 'aGbdSRYhdqnxqoEXoedeZVdSMOpEFmKguMpyPHhuCLfRrZVIzExTzhfKDkUwslSGtFIVPPhokzxVxRKoRsQzRmavJZvNgVFMjvEO', 'QRLteQBgSwQbAMMzKWoPUzoqRMWKkhemjhiOFAgpaFFIoyLglOATvjGikhXvQPKLYHoAVXtxiFKUkyBGQQQzBoeEoGbKMykjdEMR', 'tWNWlvnaXbEkLANHiUVpnWclIECWyhUiYmYzmIYZXzeeMEDwCf', 100203);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100286, 'kdTFZojlxAIcjkLcPsReAVUrwWnwTlTqolGRxPTTgrQQgsIvkm', 'ZULgUSSaDPxnvSKWUFUAniaNNJfpOZgMckilLCLQgozlJJMxrkIBibBxeWlRxpLPxwcmEMMpZluvLEkfYkwDLyHMlleSoFWCgNjq', 'vOYXXGeOPXhkEbfOOXwkidetdFJyxlXparpOrSIUnCNXvOmGEJOEKxTtggvYOLikRnwHWuKsHlDunfazIQpNlAOfjEVndXUuzflX', 'ObYQPqDVvectEpEnsVBbmZlaWUdxSfBQtgVEvMuCMaSefWvoLn', 100371);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100287, 'eJiWNNGXdFrFteBZWFlIDvOpQNRqiYBtuuPTfJqzVUhjwJJThR', 'VBmvEvXSLZLilNvuoRNtFuhUyxoUVMjtFpxANaAkGIZmNdfssCwuVXwlHDLAiTgCevhYKEAIzJlewmQsOcBdBWhGnAEkekFfDSLG', 'RGWwxIqhZvDquDiuSLFGMWWqDunujvnBITqkYuWwlynerVQeMncvKIQQqbuwrkOQVhdcuGYgMxgRFvnOVYiPWtRPFBNNtZvEXnaH', 'mqJAFrLiXqxCwvnRxlAUlQZotgFIoeEjvSmhzsUyUQhJoGbijV', 100025);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100288, 'lmEzjAdRoEAKLiegXUlotpPpvYIWFOpvDGarDeaHYQCulVCNas', 'KpVdJuyqRqGynUFPUVMipeJQkiUkLOoiiKPYDeWZIjirqTKvTiNEdeaVLsxkqfffXzwWXLvaranSAxntMSIKOOBbtPzESenuWNpc', 'GvGspSpmgImLAOIjOVjHPDkPslJRwWCYcYeOrncGCQJexGSFyNaMcZCTOCObKhmdISoJRXElPaQreipfmXisoBXuGkFvmEytWCng', 'JsXWdhQpNczvwJShlepCAnqNZuZcTHaOTMuwBaDKAqAjFCeRZB', 100399);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100289, 'fEkAhEIFVEahgczOSMjGjIAsAhdPSOskynJLzBUTzewhdeAios', 'SvhZcsKJmJSqYWIJhJOKySxguHhClyXBBGDMGGdHnGiuGyfTQPHyCNoNPLEMwlSvpOKEqiBkmtmIxbkTEYkIxmuUxSmFhrqQCxaC', 'kdAKCkiAduqDlEULVojCWsFlJbReyqvOXwVSQmxpCCQYADfpSIpyrmlEPfupVlRMEyuBBINbLjZUpxSAHyTPLqfODySmffAwiBtx', 'QbpYNqcIDbdYOtkxSULuxYAPzvMrWcQqJaOPHZvrwsesPTPahC', 100056);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100290, 'EIzBpDieGdNcUlMVAWdkDCdoShOEMegUrdqBiqlYgFUnWAYYfC', 'ZIPIuGIxyKgSzpnUzuntBIFLdoDoahlkjqPQFhqiVMKKxCXNjkdjCrYSaeYbzAKjenPGfbxCTCPoAqBcFnLNhaMBMvFNAJUGGzzW', 'AjNrtNPvAXYZGEDTFdSzMmIcazTcvwGRZnugFokkeWXWKtFVSBCNjDhdgSkhrNPwicylzfJXvwAXieUVZXuDEEauQFTXUHifGFOK', 'JKHBQHCIrAONoTHtDgmWlvxqEDFATwDuFkgiryQWYzDGrilDDZ', 100363);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100291, 'oYjiEjdwLLgZiUiadtuevjaZbPHTmaoDRLyeiqLbRNwnKkchSX', 'LfmTUigYWJZpRDrsslbZEfEuLSNsSvMbNYvHfcmqjxlUgoijzACFYLzpWXTaxdSdBHCXXCqvKlJwFwCMwrTYseVVatiYZVuERQeB', 'ivaqlZdUUhlbMtLIykcmGEkgpFGWVjlJvrNnfpkBpjWXpEcLJGvVzFsaOoYrycjPEksvCSOZAlnOKgwMPABZOefceehzpYbIjnBo', 'tJhsxUxHtMlZNywdlDPPUyRAAbBAEvdxVARlpFHAyzCxYUpQMj', 100155);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100292, 'rNecOgEKhKLlrRBudAIoCswgunUHHbYMHQZuNXPELQgCEMEhWg', 'dkrOrUDIcTYAFyPUOOpLbTJTfJTvtzEraWxyQBuzRJQGSWNVWlNRedBUDzsVHfVBmOKHOOLoeLFmaDVbIbEYrqjLLVrYTbVrkcZE', 'RRGriEpNkEBBVfmtQyMyYduuTcXWRsWrCAeYfFZWjrtvoRHXjhAUsjsRifHTMFruMuFtPtsWVxAfnmtGeadYtSbTwOCSVcffehSv', 'yElKibGxjhPGpCZtyGymoBpGMLAyAQPinEfpUGxYIqlwhaZSTR', 100054);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100293, 'XYsBITRnALfpAeItkchezSiaLroMDASiLqzfZmoePgqfHThhUJ', 'SFWMIaLGBoFyvVosMCleMsLGIcCILZmnPwDDlWUNZsNJQcXsalKTeAkuIafHqhPjwaTCfWaSeBcWellnqePMduTqItVjPfrkPJmN', 'XiZqVRNuDJgvAISgCOICRzhBMrtAcPKpTPcGVNJjCdVweNJAOSXlwaZgYRLLWjrolIpmoyAgHOHaJgMjzKFFNkZpzGXwXdmsLYtA', 'PbzLSTTJimRToHYcxeuuydeISNpjdxLzRgaJtImACcUvhRxxDD', 100178);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100294, 'ERhLTFKCKaKBRKzgyscpLgcJcEpmKScUJeVaZgSqIFWjgFOeAg', 'OKSIyRMAlynQshyYeUoCqvOmqUKSeoegMOhINPwNheHfXUyHywXEnqIjWrcZNfUDCHWOhAFCPSAXkvVzhkdFQSNZtPyQSuFmOJpC', 'hYpKMccusuQyvnoMUJYHMDmrUVwuaRmmRzSyJTKEOoPnUofFapzTTflcQRiFkuyaDnStesTqWBdRjJBrOWpnJjllyeyVPcGBzSGY', 'NJhqdjCubKDWkgeLhffYHNGAVhFmUXoXUZPlwkXdUVvqJNUGqQ', 100268);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100295, 'QVshwKIdlTOXKdnayAvkHWAkdAkdQpzicmHQvosiEkhRPEtAEz', 'DwVswhtkmlJGwFXSPkzzdooaSDEEzPLHVBGPchxsdvpQeGwzrDIoNSzOJZHMmFEPeVLfKyxNrQfOHiJWgmKTNUzYEJZqhAdzPkWZ', 'WQtAYKlqLGJnDjUdDwQHhrQikqZZTepoHOKcSdIGXIYwMmlZYrdQXsocdYBOUkxUHMxaGrRBBYQrElMchNhnEthSsevlzSrOyQpT', 'YbWAEvnDWUAIClUXAZQvXrppAvPHvvzmTODWuawSWWnWywyFwB', 100211);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100296, 'tMPiPKXNLzXXnxvscXXFtxKTPdWBqbEyGSCpZkOyFKBuAvXpmS', 'hvfzXmhdEStRThxACdnVwRLOxFxkSXHNNKDEhOcnbidMWVqrlGgQntRpafWcJjYXzjxsSLEMaMpBmgyJsDuRLDYMUROdJEztfyjA', 'dIUpgPMXSAAsnBBADPrHmUABJGAiipWMTiYWLRTCScMCGXbqKMvAESjXJzScdpKVuqwkVzHihHMmTIlubfBrgXVymACCAkAkAdqM', 'LSogORJowCytwomyIoaDrZaraLUwrreAgWtgxXaJaqEraXlhgN', 100137);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100297, 'JtNCFFjHHJpgnWPNWMFdmkxHFHMldzOoGOXEaPBXTMyuzRoDFb', 'ENACjwdHdDRpdMPCqeLmRJomsWZwHLSJaHfOrIdNoQzxCcrdbgySKrSzpmWKUHkqcRwEyYJoCedoqzjMzaacFxmDlLRUzkffYpix', 'qrnUElLiMIwxHsgVUnaMVeTZbFYQHwLrTrVZzGaQpkbUdMZcMDqMkNSheVQWMnLzHsniGHrRQymCKTwZvwUfOtBPxvIKQPLoofIB', 'zzGwYTRbZknurEuRsxUtAOnmspSBuZHtyCCbcTgHmpjtXXNwas', 100111);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100298, 'XdclKwagDvGVzzRoWgkVWYdZpFyXeyRjBdEgOEltUEYiaITSDS', 'fldENCQqYMgYWYIqLhrxtfsrnWbZiDwdxjAOPecbEDPUEiSllwGztdMNoQQawTkQJFDtEkwZSXSYafUGDjrJCTJBpcDnCZfqJmsB', 'bGAkytEyQnoZUkAynvcXWNfFXxNJUysdtqWQipubwEWyRvnftiKYpLxrKpuAKHvNrGUTXjfRYuIPnFShkRsElSoievZLVQJPigDZ', 'DeXHSokHqOQlnQLURtnuYBknAXFOFKPLJSpadMOJUnGpXwvmkE', 100029);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100299, 'CucZdWfPUalHSRWKsRwFVdpVGkwnrDwylLRAQbjCVFegIooDZm', 'JZwprDdtdmUVCFjaYdHWCkJEwyczdhGLXokMMhpYKPKTGptkMCNHnLFMqzVwQoiPYYymhKuUamZooBVqQpehDvALLtDZdSwmwrLT', 'ANRzVJhulXOuzMGKIbwUXZTSDuABUXCUCjyhkjcXLEXIItKmzyiaEIgxqnQhnQWVcoryLTFfCXtUNCTjrTUVYTgOFQGBStXtzcjh', 'poNwRRQDVHEqdQcpZhcaplRxBeyXfctTIZhpKzlCEksmcuybMg', 100232);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100300, 'BCFbWiHDzIzzhXsqForEkgtnngKPcocssvkDpHlWGMfwxAASVD', 'tNSpKhhlQQSfwDqzLHAAahKZdYLaGDHAfDjYPajnlDmfyTvtOHaeZjrWIXzCaMcwwMBtMzaCrhtFKmKnuXbLkXrncKPojGGuIwoS', 'JpRoBzWQbBoHybrWYUvNLLIRloVrwNejVTaUYSRsKAyWnoYTGOpGrIxtcaxQRBYKnzkuMLfTuCdYsyPLCjncjbbwHQZIJBSrcpcL', 'HtkvgtDSDTSUZKViAtxUsnqDmEGEuYRDWDEEGjIMwHmENfHutT', 100024);
commit;
prompt 300 records committed...
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100301, 'oGHSCtcnHqxIhaTXVhoupSdBBfoeVTkNOKBCNmQknbmEWfLTdU', 'rttbROZoZZMWthKTtHJLCiHAwcTemqmCsmrjkBbmGPFfODwPgLVZPuwIhPWmrPhUStZgcNzKoxjNRUQxRcAzplMegMIphgBnlwaH', 'TkVJuOvSmugbNtDxtajwGdEXAYpxbTgodvwADPkDaFjQOTDWADHRBJcSNQMIdhGWXbquLSQoPZjpgwRrIWQXoimhmsChUYCykhvv', 'tRhTMckdtwnNIqnQjfKkwtBJsJNjfqPjefosDTubHdCSHAxrrN', 100273);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100302, 'ibLKnxepzDudHaDhJpkXZHNmvVotbzfrRADFfjnxPPpawGcviF', 'InjnlKngCloxsppkfyRtfwjnPzSeDKqmVfMhtUerOHdhUAkQErhgaJhMvitUZwWWQPfwCxHvOMIgbymEhdUuCdNtcWZgKsuctUsb', 'kcZFwXHsCWlxJhPANvFocnYMKunQkhRBHSucQVfklVhUbBNBiKLnHiuciTVNTolbRIroAxqkUAIXNBYgKKNXBtTRYQorGSkFvEfG', 'AedOAHZQCVnMkngXWegGrOiTrjdpbqOfOtbZqYnuUtWqupVVul', 100155);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100303, 'mifMAzviuwzGIlUIVdxSFuCXsnubqFPZVfDCmytHNKCQBZFSRQ', 'MpUKkxXxhJQTheQYDCibgYwWZnsYDkIPwOvSSHHcOQUSpFvhaDyPDTGXjiGugnkkIRYbGjBlhtBRLyNCOYZbRFhJfGAUEdUNCDJn', 'arMutdrVJsOLeCCcoYIrcyZnqzgUfzTtGmmawLxMytHvFkGjdYxGdOZUaVBqgsqsKhhTqqssurqKRoIWQvwXYocweEYPuPjrZePN', 'kSlwcPPupWIvcUHBfmKeeshqmvowGmcagNeyMAfcQmUmfrGzye', 100163);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100304, 'pmPlhvzDlrTCQzndkXulpufhxwKLQtBkOcvHOIvzcaNaSLyhuL', 'VeHUUsiChrVlJbLAmdOBCkmVDqMnPxjBlGAphPGDDqpVobxfBetCOLYQQQzrTEDErQrJSADHBfvrjKuLRsHYcvkZywgqAhZCULTu', 'cGibbRrZvulDnQeFPyxVUBFDoPZLtOjEgkPgrnfkukxRpfAownipymIRqchPfmhrefBXmrdVcnIZLFPqlZoHaQcGJTMyZwkDdlja', 'LmigPaEPTBKQLkMvqHQpMfDQnsuErYqRIOLfFisNfhpoccpzHd', 100137);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100305, 'wvheWaOtGySJlITdLEGwElNkVHYlMEjffUeqkEJWQuqPHEJQST', 'YOEUANvFWaHbyekdOOvTlNdgpSJEXVUxhCHaawHmPeXIKBtvZYigseitujiMVZFRAVOVUTzKXCmDvynpBjvNYEOBpCcXMRMbNqMM', 'VobPiOoLbdmnbquBfMVxWcEOWVjqkiIJuTDXcWHXsKiVYVmnZtKDVmHxJFEUbcToactlSzcwdOZvlXPYvodGpATBtkrnXPhOgOAT', 'WCIzsNJtVpjjfQQZihGoyOFaKYMFbmUYJtxGwMuTqyUyggdZSa', 100132);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100306, 'ldTWUFEuJUscWqGVVdrPqOWqcIDtkccvRpvoQDmWtMnTvNLizn', 'HfUlRiTHbPBscsIjqNCayqRAdhjJvBPVwEVTJgopMudNfLwkZBxxVOJMSuZgPISVnPyXUQZOSuoGdPdWbCJsjIbZtkdecGFRMtcs', 'LSSZZOFBAOBoiFNxNyeTkOPpPoXipVONalajYUYwDnmZWDFPUFUIgSfxgFNFaLaJrkzqDCQDYizFhkdsxBZZVokUrTOWXUpLOiAx', 'JZNsFDDvMRjwWlSDpsZUaqxSffagNJYCsDDagJspNRNYvPVsIN', 100383);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100307, 'GArclbwhGJbBwEuMIKwkvmcPUiweJIbrZPXxDCbtAQbpMQRbDL', 'VYzszbEdEGyMMOLjOUXGXnyegTknWQspWrCQSsGifiwstKepWdfgtyKUoucjQAXzqsibfvCeRcSIMFmOcQfCWjLjDcjyGusnFKlk', 'gcQVtGLNMgsILkYfjupywyyLmeKLTDYIwFLisoepNpyqXYIYilRopIxvICVnznwdGulgNWiylpXHkiYuKeuvWXbGRBuAaChBjGxH', 'NIGoDAmOvuBafYsHDldnZQOoLNXQAVHzfIWsPvMASovrhZinGC', 100384);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100308, 'fdZzDtKYrnnkEJCNdOHUdFANvlFSATKOFVqhElZwxDvLvEgzcq', 'gvHurnlbXdlRmguEvXIncdFLsgCFlrdZPLTxlmPCNDLnBhMjaWljXMBdtQBppUNdzRwMZSEhDeRrHmJfnMnyptSkSkwoQEUEgiAx', 'IdgywWjPQYluxOYjRHSGVUKTkZpzweIwXQUpztHQplpuDFRdqUMAHOWyUoRNCFSCYVXdkSqwxiGEKRwvypFCcuUvscfJWAGepeIL', 'DAFIWKGPXEjWaetBRwSlgJfcMEkOCgtYwOXFBkKEztUskFJUyw', 100341);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100309, 'SyxhpghXmEUEQZMwgAvwuByzsyKDzNUATLfTGHQxzKHPezPtUM', 'CkwCrDBcAMfEDjglQzYQvgULVeyNLIXjgJSbmWgaxsDfpeXjScDdIlrgsHIiXYceGtoEHDlSlqqyscgmukVdYZYnVEDPJYNiFGDR', 'tczkjGkVffQwgPYFlGygYxAhMTkEMbCyEgKUpaUPatzvKququhWzwMJmpgxObdGXbYVObJOqyLOtbUpfsnnKRrfCaTezkKaNhefZ', 'BFDiYfFZhIBgzfySKKHCFdPQtWtSJCgVjzEqHThjXGbhLpUodY', 100175);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100310, 'TxXOSwvAYzmnEQgvbFDfnwSspRrpFJtvOXHBUrKRFwtZLDGqyh', 'ijbVzYSfLHoNAmGnbTfrELKBnmoNDgjTVAebRnkyKKfqKtclmyLgpfNXGLwHYrzsetCACiLFTGfPPIHsTpUdCTCXNdXzvPjfGjpP', 'lexZbkaKdIVOCgRxWonhNFTMvhsgohmUzeSrkPxejIBuqYBmhJiojwrdKCBxzEqTcZNlvKWOAVGTGVApAgQlqaVWJnImqNtMXRpe', 'MWiwiOKGjtheIMpTRMBKwVxKezKZOdSTNrLKNrMNLYRnOYGxyI', 100055);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100311, 'TYLVHdpqVIBdugXYXBsQGRiWtbKtgOVrFIWkvFBkvyABcMYicp', 'bIyrhuQRvrhUXOsayIcxpIAsekeeWLqIgFeClGUAUAVUlOEaeEmWUqAkyieccczmyzdsuXQVNpfjzHSlhLbwfqrBanYJjfcLxygK', 'BOCIrdFKkEXSRLulwuFuzqIXDSldadWDjUMOwYyPTPRbocEGJcwykXXJUfKOSJfzwNCpVHQcCBxWiMJbtXhuaSysSvMiDHaZOxMa', 'yhqgsJxjmFSvQZtclRbytHKXJxLQfirKvoyzdepKxdtUIiUscj', 100298);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100312, 'XuFcPXlghreATVJsgoNxMFpdMJXwdmifVnkRYSlhQkHlETNTim', 'bRDbVTEKwkZskHCzHzBZrKVWrYfHADKeAnkTIZrYJHDqgszezBLcPVLLxftmINVflBNzDxXfwJVCNiCSFCGfgiMJKyAKeCLkpnmz', 'CvPZkJFqSZVCqlVSNpNXbfgqfsKzqnCprTdLjuDcwGaPFkcTTDTimRfzKsQnkIdClvBPNpnbANEIkAgtEeTZiRqaTMNcpLNcsopd', 'cPzcvVxEOjsZUMlgDIezuPzqSpLEVAWpxrmdrKpzZwHTrftPTD', 100247);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100313, 'DbvhvUicIYZmAUSpnNvPfeeWHdmcTeEuKDBkDLpzIfASmgmgqc', 'HnXJDhvoyzAkGhwLCYyZNOFnVjPoQKkjRVkZsZMLzxArTWbotmCoeWzkXvdeKcVMlFSkXPgxRikKoRShWTMZkstuGYfCAuiLvyMV', 'dQFuNgLMMYZxqLPrhBLrpqXSjOWZYGSdznmIBhBcBFZzZZkBvoQWmtxsgbTfxCYGnDmnrDvigySAhaANuRUBpJBxORNuVkogauSh', 'MaawmBRzqtxGJTuLMNmgxEtvzBfroGrEutzwKTlJXbtpAFfJzv', 100254);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100314, 'hmhiJUvmdyYTerorMJArdLjYgJNImHRVCTuXOHbHtAQGjBEMlj', 'BOpNprYfgPcrdIcsYTpRUhCKdcVACicGCdhifCLXKsKNBCtUCfSiHBOwNHqulXiNanIlBdNtbHQixHANXyFbtolZieVptlmjpaDP', 'TBWrESwIxhxLoSKzURbobsqwdrEWLMRpNMquncVBmBjfAvcHhRHbnnpbwTKJwVqgwxEpxZXidKjkQtqMZoBntoIYAJYHBJtWikMc', 'gWigOHFyVYhHNcdozXUWQSfwirsOwmpWWwfkDYVEPcKasjnJOQ', 100208);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100315, 'fvYtepxtFlEdDPNahGZCdObDRWxZNXAXugEKyAHdFsVTvCzzMZ', 'fFyKbFDnrUWTmccOqJQgcDUBoSzTxTzkNBOkmiPetHjEgkosFqhDQpPlaSiMNRELPiykwIqqTQWDOumELlTHdWYrIFnTLjLtibsZ', 'vzazeAlzleRTIatpSjygHFNvpigbYJRMMriXPlcRdqrUEVKOAJIeDcNgeEABGNefFhqkisOJQPPuQVAvBuFUgGSUjaLytwqQtuXH', 'QybefjRqSFOIfITbIZclCsYKrfSlLGBLMTpIWfuGoGWsPxGytT', 100200);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100316, 'MwrhDgoxkulVNGNYjvIIDRIOeDcFFuSUWcocIRWlFnvZLyoPso', 'YVKTftQtBGOQozLJzdFiiZCKuDsfsCcWuAaUtrEognfAAaDPlUsitXUebjLsTTJmUuknPgeZzMEfgGCnQWahqMIrrArJEuxFJeyL', 'xVAeZKqbOkfmWNfRPvACmQnUxuvrAlabfbDstPIueREoJjcKTxpXyLMcydqXuFBBhWIoVALNkHXEYNghyGINFAEaXAFtoZaQlbeu', 'dggBGoCMBVyBmduVmzJyVJjqszdVhobBZWtaulKVpCatGqBgVN', 100019);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100317, 'rWWtbopiiAHbhUDJwFnDGxLlxwfTejzZOTZbZqRUQLeXKBZiiw', 'HdilHhovvIUQwuiuNZBAoJyQDzlrJNVxZVPIREtpsKOXEAyKFZuboCaoXlEdzQqmzEwvHjBzMoWMugsEqTtcbBNqpTqSgZRdXVGz', 'StWLlCjGhudKAddDYFouoEYURtiyzNItVkyODurnWuCMjrbsDwmwGSxdjOxMcswjwYDnJUWuSHLnPbIajoUWHnazTWqFblpMHvUw', 'IAopGaGCsbtrKHNavHRbHuWWpNeoCymApEDIlxCkerVIyppWLn', 100122);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100318, 'pkkIiWeSDGPQmabouGWiUdgTbVQVftTczRIePWbkXQGrKErlwv', 'acPTDrUgZlLVSEuIvRLYyLhqNsimobIlPYrmMifaZbQPJOpCzrNccjmKCZDEnpqxCPXGjFRTRVAbltpusCOudVpSbumJUAXVEPFl', 'pFxQfsflqIyHvKIAzykLVjFLGkAcUtPHjwrqUCiHJlEPJgtyleiNWFSpsJgklhNTQZMroqRdTPaIGYbdEIceVKuzfekBJUnhIOVE', 'HauczpvkmaQKvQnNyIPWyGgGltDJdbVjaUZybXgQGNrZNaEJgc', 100048);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100319, 'ASTUtccjARaIKaxtkwZRNKiyAoKtfTfhXoqycoexTHNEkXOkAM', 'KVHbTeIELwrBkvIKDVVcuWBslfFiQdlRxznPUlhcgUpFpDfrMhIxXLsinLsrreHFLIxvKGbSagPZDvhvKXtrbOaGAyYpMEpqWGKN', 'oKmlJBoCBdkMOqtZQVEeufGGhJcmPYXqdSkFVzscLLowqSRMeqJNKtxDjMbjAPcNZGOvjskSjVzExSgviNEphvRIeqMBGcGpTeRM', 'VejYwYeECqFDEqOIocCltYIuJsGiRScKpfpgpMJIbDfvUQFQgl', 100020);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100320, 'WzyVEOIrVDbYKhWnqEltFDfiRPQoHnivgDiOiusCYHlTclxlHq', 'wEoCLJzHmOFHBkCwdkVylhZQrrkRFRBwjWrbYXDrHtIkHfqGpAamRyGFyShoxZUiGtEjRFruuWPkxHjvrSzlMJUwFGYWxwTaZIlA', 'NRIFEXWYQukqyjWDIspXjgHNvRplIVAwrAiCSBsaydXLtBwxmHzcFEzXxKlQygcgnKDYmVksqSUgNIRCGbXKvjDODjTmlxZVfgFm', 'LMGWytngcrBikaZzVzfLYStkhaCkWwoqYHdPpffgdnqXOGqRcK', 100224);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100321, 'ZbkgEBKyMZijrAwIgnjCtudvvPFLJWOsahNbkPyPPBlDFEdeWb', 'sPFCmxairOeTGQwoXBBcyoOIbtRQFjqZmocJWaYKnkTmaxLNOXbFoWgYcooMTNXgkmbNVlpLnjsrrdtcFdzBCapepQCDZRtrTPmK', 'ahxsbopxJaMkdYRdcrqAaZLGssbzcnUNqyrZWhfWkMEqVqncjlhTJETAnXjWyCfIuzKHLfqUtHDlKsrFNXggGYzDvzbumvepeEJv', 'qpasVGLkunBQPhEymIyVaxDwjzGSfhmkRKxSJWbCwfiLDCzwtk', 100388);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100322, 'QrEMQVkphgpTzBhWCEyDPfbScXSaxTxEMmtpgobRLOxQDhkMst', 'BHaONUUwrgQHzrgYKMQDbiJJumUmGDQEtaoLevwdliGhXAQsXURkLElDayCiWbIgeKjZfIKZCcBgbaSdrIohDYuhfcCigTFeeycG', 'DKPDgWDzfnvyUnSRXpbMWPtgYHmXjsKSQPUhChQdYAirCeuKgjKaFUtWvwcLdoCcbWBYomQYXHpmjnmyvByyqmKPFMkmfuIPyrhB', 'BLVROyxUgXNqCisZwuNgeJwhvLaBaPeatCShVnsqPzcsLFjUhJ', 100247);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100323, 'bCpzkGzYvkYDEUgrvgeuTylqpxHqArThBfGkfIclYyRaZRTOuP', 'POzrPXCMhfbWahDoJdgymkMORDnxgUpGMvNvOrwpCwpsoLWaXRGcTPaRWCIqvEVwqydiWxIIxdWLzUPrEChHxVmHNpxlcGTZVufd', 'EljWpeVsISgAYLXsJSigsIRZGiTybnqrYBuIkrHsOmIgyhgKVkKEqabzyxOICjBIJYjOiuhiIwJGNBKVpBNRlKmQOhSBnWaQyqDS', 'GtLVvtKAxfzVIHCtpLVtfWvLaUzmFQmrcJtNFfPYRSqdVjEBcY', 100301);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100324, 'MCkQLDMRocIzuMgFFBGMgKVvCJPVeGMHhMaRWhcCEOTSGlFUiq', 'aOsxGYAfUCZdFaarJElFDjjTxdJrOulOfdjmPrpdogyRLjOGHhtyDvvBsRobpFBJYockEYlzLkmNcVcYKBjSlYsrHSpuLcvKSqMi', 'mIAAYdMnlpQiZDynoTEGQvtfdjDWmvFFlacmvjigFeFeFQegkTfFoqJtEEXbIpizQNxVMkIKygKqZcDYAzlKdyBMnaUuJXvElVzq', 'JMhYYutVZedFsGhNVtVtrECWuIXRmfmIjszNJVsteKulwEBgEy', 100378);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100325, 'MRetbeswZjTOxTCIACPOLcKOuTgHEKUiOpjRbSwvLehrdMbxUh', 'OECqojWbzFmlsLabsPtYnzONUzldzNHIzAxRkAZCVnKZCyaRJLzzaHtbLLfaOQQcLuocgAvrJfKoZNspQWZOiCsnRKwFnPpMiPhu', 'ODdxLMQMsDIEgrtSZsXgrXAelZymxOkoDUnngqhrzOittkGPCivNQtmqXHhjLsMEsuSPLxoGPdtnZZLzxAdFPplilSOeHKVnGGeL', 'pUojBPltbYzVbEwAJLGuYLjCuKYDQmSJDQpfyzmseKNpGNDTzY', 100348);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100326, 'fXziNlzmBJMqisplemjbIquuXMBrGVJfepcdpKrrWghupwxBfw', 'BKUjEeHTSVmLzGqfpjwGNXymGBbnjlCKMbQutAOXRLClUtyZDtHGadkKAwWMyeSPusWZoPxDhPsCycIYDSuDXzZgfKivgiMOKnyT', 'axJGRPJxDNVxacWWSVQeWagQSNbKHoXHVuhPzMbPpHsfXukpUPoeAylDMZougBcigrApSRhDtYNrpcJJLXSwSlkMDhqwoFDvXTvA', 'gngipRpZRWPBHliKEBJwRbHoWrKYXipXQqIrTJiqdAOXoeqgdS', 100138);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100327, 'UGqeGCuYEVqzfgJJNrBTMhLNimCQyRnAKubcYfOOokSmbsswWm', 'EpLKzwELjjDbHnImhWvqjEUCavSlxDoZuwPuwfVqvgWmpSfBGtkeNejdrACZpWmhesBkSiqRLVFAHfIxcANKTDMACcwUQePsHHCI', 'nkIdMNKuElwBsmCxZHITzaCsLfqslMViZzdgBlclnwdCNiWqqdwYqJjuNqpJccTrpwnmQTpFulAfhInVNjjLsziYLGNhrfNjjnIs', 'snoaSRwqoDdpCvlWljtGAUpDjzVIanoNMdnIplvwyuAcSoBasD', 100272);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100328, 'zSrPAWqoZeoisseqUJzacTkoPWOvShuLWWfirGyuXCfRUINIrw', 'qSoOofSsSJTLfWRahUrDZPQIAVYiSkYaMEkQsvfJZlRHHCKDhfsKbgdwzmbOrMVLEYtEvbDnfjadrzcsboJYcIAXmdlNPzHdnLds', 'oNlrerYJcgIlbbQsyWFJJwPkeuCDINKCGAJljVOpuCYxDhcUIdbNRlmShedkvYkfllifrKmpQyGwWDKzKYvuCwmWRDtNLpWsMIQn', 'WHBBPSHaNHMhUKJiAKiQwXQaCjhTcxLMRHvnwMKOvFxjNvYSsR', 100158);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100329, 'ixwFyceYlIswdLwwOfNjSywZlwISXHfoMsQPFzkdalwHoTsfbE', 'RnXYuzjcxZagyJIPxlYtqbNrsplKRksamfnlywAWAXEvhnMTpYgPLMCWWkUeBLeIQEdiQDTQEuBZpsMTjdrBKwsCwfDmCnLtfBSR', 'VVdBiDaItdNgFkbToMeOqAzfUKTYktRPsScdofYhddEYeTHNwNeNNeFEXGHRErHdYVpsNjVdcstyiUslrPUxNVjwvPzhSfWruLwS', 'qyRQCPzhRnUewmumdjIqRfflhdgRzYKcIbgljlWhtdcbMDTMnU', 100047);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100330, 'OFuVEBufmYNTjQuqHyQpiWnjqMFDVLfRMDqalXeqisHRaMGeCc', 'tIANNnmXImxjWfoUvbsEyiSWCZOYkmqaZfrTFjfPrzUjjKRYMFBWBchVDXIiJxHWSubWHgDCoASBNoDXDfzcmBvCzqCrNBmWdziu', 'JznwWjDSfGgVOWcFZcxNfnfxkmCbsnGBrlhdCVSoHXJShZnmkAdRKFuHvuAUOWcfOBOoIgkjTOueaurFlkqJMZbzGsSaviFHBcEo', 'vuihzKnrGsJLSycdxHVrAFEOmFKEzpUSTwvluvgdiFsVVaTCpC', 100135);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100331, 'TINffYXmcGWGnfAaDNCwiZIZhKLgHlvjejqoTotfeyJNZajGzi', 'oPvuoCGDZzGlOHyBaGRCsShEmzvlNsvOdhISvAKPVIXtRkaSezXdwSInOPjrymPbyEPFLUgoLcueeOlxpOmwOdqkSmtfICzEsjHC', 'RDSrlMpbXTtzwvFwxHIgfaGvkHlzbLszprpFYXtDJjFhxwbeFTOwtBRioJIhxjQbJfxDASlIWPfWngIlayriRjWCFpYeLPwGAdvJ', 'EdvodAyUiUKMIyDUcIoEpACEsJNLpdbmJCgJGDBmXcYyylWVmI', 100275);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100332, 'JAVlZjVgenVXOPHfsxwoGXyPWtJSmIfunhXntWHfRtFmpVVLmX', 'ooQwMXQitZJyWiCPxicamLcAAyHhnnGAmqtcuxgAiZzcfVZoKJtxPoNSyjIDIyffrezKxdSJmoESfVCDontCMyouXbjaiPsHaVnQ', 'wuQUagVSWfWALoNZwywbRHdFYZtvMubCMGLladWPlExmrhecrZIxndGjPRamXNAFbiDiXObvvMuDlEzgwGBvYfPUcBTVsSgtiMhW', 'REoBPyASHjnoAevnBPZEvQpWVErsAPnRFEyGuyLWDYXcwYmAbq', 100364);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100333, 'UlmqUUlLwadYuFYqavObmHVxAvlyFZPmlhwESswQIAvVvxHKvT', 'JJRUcYJRBELUcmyBsMhULOatgFBOlFVSdTihXlJrLCagbUIHAhFFdBwEIbMHlJqrhobEmujxYfqXmdsCmWbSWUcVTUSTxVXwrhDV', 'bISejguLOHBxzNcxHSLxpsoNHBVQrqZFNvLZavinkNrsdHWVhUPCUPyEmVQIfqApnibQMSvKRmUOQihyxgImmOlUiGFwKLUkZNIc', 'mDuGqwQKfIztfQmPJkOhqEokaLtvNNpbFjiTeaPYwqFnoHMbHe', 100323);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100334, 'JFxLPXfHBsJynFNnTOxZlhplIQiiIJVMmfvQkVGxnhFgIhwOOp', 'OtpbBPREZPsmAgpwPxYvKULhbMZzFPcaWyWlZxguQaTcqFRkCBbsRnkMbmSKMcVqydXqCEivaJOfLxTbSslKtdjLoqSbhYPXgUHo', 'umaqBXCBxXGPYsevdskqhVyDXznCVNBXPMhaTSlwaprBOLtgvfgseTaCDHMwSixkbnnVbEBsspqOfoDJwHziUHcsMyPHZHWxSdKm', 'TtSLWYlgFuMyzyKxkZQHkDPpMyzouDFtGIYQVmiOUzuNJJPYty', 100093);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100335, 'iWTDZXICGYBumOIrpvVRVVDsbUAqKCzgYyYOvXNcqMoxhfaqRg', 'JrdQrNQzAcDBFRvfZCYmfHIuhuJqCIJjbIJtuKwoSlkzfGKfJDRPOghPWNSLyZEzTieglgMCILNTUicyTKuecCLDmxESYkwicgLy', 'gKOgXsBVkoeEAdDtYWtZvvuiqAJtzbxSVCyjSKKlJLKNRKPNGvycnZBGeouHnrtZVcWZEyjUGXdKqlPgprcEksiIUOMDyroEWOIm', 'jmsnIIHlYpkNLXaqaYKEAvYFVuvzrpdldpLlvyFtDTZhTTAQQW', 100246);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100336, 'SSGCDKOlVJjzbTekECIjQfkHWycLkziwRRbIxVhrQAFhAZlVTD', 'jLyOuVFDMSQAwjitdQodtAYfDrBRUciklXkaDTjTRWAVCaxsEhCsFmOElYDgxTWOhWYswbdqMDiAwhbragoHNEoWIdtjXhyiWbaV', 'wcCZHJoDVQdOfkLCYbZDfackURVsfcPZHSwriltTepMigIFpzozkCeWutiNMEcuOdbtcTfQhSYwOEenGRHrcmgOpeQMcQiixntHg', 'ccsZgnnbswAWMWAVyKvZdUKJKssGUrTbHucoINZjWelucmDWrN', 100299);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100337, 'ooZuLKAWMwjtfjdMjTTPcvqVJXFuJtdIYcABScbLlEfLzBSaXj', 'mNDapvmvgPCuIyuuHetRTdbTCPIvvvKsaErJivMPsvqhdMgpakVgsGjNZvXOVhhKuAEaRBoHozvOtXuhqNRrWhIEhcoIoRqpGmZR', 'xKQYbxNYxOirVTpAehPIPdrHQWIRzcaxgrrxKRMMYjLakyhqgchIcFIwebGRZBYFVySiZDvgIePTMhDXJZCBafnnagpXGxAHWbAT', 'ATLnxYikmIwVXbBJfYaiCZSTjTnUxfghnsAszrlcRxMXLqWIRm', 100317);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100338, 'noRSQWBTMrGBDmhASyXbDGjnAVtHlMQZVzQoITHiANAWRIDigF', 'VWVmaTRdYTtFWuzIyRwNSgcdPCUvGMSppxhOzhMDznVGUXktSidJqXPcClsrfPCDxoSMQnggkCaiQeUQOULVLmveNgTUARxKjJNq', 'BKYaYeQbzeocKRQBKJvJykhWteQCInOgxcMfIwXdptvoOzlFKcijMuNnNKBhxfUilcBiaapMPfATzIwFfMEiaAWilaLGTvCxQBJX', 'cPBqMHAPzcxLkaEvsuiSEzzRiyyUfqdeWhTLzUcrpSQOycnOMJ', 100125);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100339, 'wxMCDeRUhDXCKlPebYXCJuPevXUYmxCPNwgERNyAAKKAsbFDFv', 'wamvILopeLfgiVBMbtlgeKBLXyWVQcXEOFKjkkvkxmmQozphnihxWXzgnvKrAdJMrTeJrVHhWWWmXxvUmNcoLVNXxFSDUcqHOlgn', 'rzmtkMlWTrOmTMAhmwXDFwOAEmLfPYzXfQmEGEBllyKkeygsOsjJYJpAvgPQSwDKLJtCSRdwLpnaNwABJqQsYkWuRzHQfgbOedND', 'nZrqdzikOOwAoXlxdKIOzhxWrtZHrykPMAXZobcsHTYkJGxbMO', 100357);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100340, 'fFyoIDuZcFQgKANNsOBFMtyukjRcSyppIcFovXHNZgVxvMCRNe', 'TYxNTZrsjQHtSEbshibbBvnVcKEhPWfVFypRsTCiqdyxvZRHHAYnQLoXSRmhjKMGnFRLzNCvaalPMKmWgbcGOECfMjbxnGCllyKl', 'FmcdhMswMmelfjBwYcGpOMtnKfSDGsaQduhHVHlvjHiAXNHTLRXbodYleZjQChtlVdUYnBtLHWXAWDhnynppwdxgzWBvOXqMPvPq', 'czIDcAAIHWBlszydLcxaJwhzQNxrRVXDDtJfTAiAhXZpeLziYp', 100083);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100341, 'MKyKqEoVHmywpSHnzWXSWrVCzPzqoUwBFXeucxCbFEvfMSlLld', 'BzEnztBMoHujIljVczDvzmCTewzIoKvUDNuPbIPqBEfXVsVYCwpnGKPBhXUnTMLzVtfLQrQmQgcCSMjTllnZzLHMsdahkUUUXQCP', 'GklplErHapiBUTqstNxgwnIWULMwwJZkvFfmuJvyMgvuCBLpbnHTRClmNHnXbgcSPAdDPpFOwdQgsPxYZGpjicusGxyPnmPUDnkO', 'QRudLARxyPJApIxfjFPMossJBTepdbbPAiKlKHlOzqOdfWAlFq', 100338);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100342, 'ryqAVkvVaWOkNeCpmrdCYrrgyRWSQjkuGHtWsDnyIfVijyjefW', 'BiUypeCwHUFzMtHtbqXSmJTUgEXILlbHcYBojLlBaPSQkxrJMZHJjLUzcFXWGYihunedSUzLYYfCqQcCdZImWvggLdTxSiCpEICE', 'pzlPhobvFFxDkutoWpdvzvMPkxyiWPJxcCdzalKagCbexOlrSOOyiDWHyxhdDYpiOHVPJghxpmxPbwNOQQlcHkElXlDPyFDHjTIe', 'iITqobDbKkabcNrsIWNwaqsTTcHOwxlgrhGSiTDjrudKcMwTys', 100006);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100343, 'MOYNbdvBlXAAzfqxMUvnKnNimBUUKMmcVhuUAoIzKAJakzBWPb', 'PymqqckVJdFSXNYJNhRhvITSpEerihqrHUPrSxxweOXQnTveIoVSvONMLtTfziDfTdfPYDOgFHKCnCibnImgTXCWeshbxTMKocMT', 'wbzOQoJLeRatjMqKSKTDIJxvdHtqXHGYQcFujCKTyXFeWdwjZSaapeKgDvvVrumAATcovFgPezcKWSiDXtLpKSfaUUFtWxPPOcXw', 'grWoIoTgPhkkPyrVZoOTcZIDLvnSNIDpmaYXvUjDqxMCYfQzBc', 100159);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100344, 'xEmMqnvzTfzqFLptDcPfIIZRHkmdvzAZaKzaLeAaYaXzrjbpNh', 'GuMcLadzuXAGhULGNOVXSIUtJAkdsAuCQQRQgPDKzFoFqlIyQBaMasIaUJmhBvhCdzgkRnMZWGGUWZxMNbnWemkYooMxhtNAqivn', 'yHetwpRvNTkEprLPhCaCFAAhvaXSFHvmvkfMPgJHfFSIOjRQrVjgbHzDcanYwmOrJfrIicmcTVqRcSHOUauGUwnujmpxriEkLzeV', 'BzEHWszGbHtJKhTCXorIfAUpDoegCCHBlSvptJOgToMgClriZi', 100205);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100345, 'evOuFMemRJwAaEwYfwBwYaCGAXpzArpzVHtZOvRBOTMoOIQQTD', 'ZCcyijwdqeBxaBDplOUWwZsBjebPiAaPmuDgwIfeBrRQzXhtspyUOZcxrnQdYPmyfMxfoKcDLJVRfVYuRyJOhLCGCVTQEWmaTZXA', 'zaOLCeOhtcFzDCZcPiOnBSASnuJXjaCinZyIwjLIxgzUxAHcluSDvXxVtZNmZAOyfitKpszSxEXlqvSdCCBGaSlXNiYSpdkcQlXm', 'AVBQflqsRrmMVXgwLYUOaLWbPeVqsXvgWylTrdAWSUfabLwlGM', 100329);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100346, 'qHJaaUOfYiQzIjHgJefYDgIoXewMygwGlmTIHswWajiETkuHEr', 'VHHtlXpsbbpJkKftKENFtJXFJGcXOQZcVkFABZAQuYnbjpOxjKIewsLAoctcwNPuxIWJAfBrhTCRdlGzBmvpGgXvVGNFrFNgLYuz', 'QEVlsduZVtVUwlLRSpZSduiAcYnXUqjHDTNhTdwzEtJBxVyDSNjfQBvokRyzQKnDhctTXyIMGggMqENkpcvycupgcGfNZYtPbgBq', 'zzfFcpAPQISSXKHiqklMMMTDguktoVfJFtzWIOrBcOKoxpAxGE', 100202);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100347, 'ktvdxEAiQsAuARNCBvafTFrIHGGFWaowXIjoarlQStAxhIvWic', 'fWoTtETWBYulPUrMwtwtpKoOfCVHSAkWjenMmlGxUUWnYKdJvNihAkmWidqejwRFfbPyVKNfiowLJjLntAiflTRMVDNLkafZmgjl', 'OgZrTPXIhtHIoqMOujyifbOypnKjtoyhNPMYaHNPyOxwmeOfCEpAlvmAdIOodDbeykknzjgQtkArdSTmHlqjBeBXrpVZIqeKySsM', 'XquewbgwvpXJhnpkIVXhVhxKVRpzFtooSzkcxbKblplCHjijzz', 100118);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100348, 'yMDhiZuxMGHLNEunjfRJLmblRgnwIKSFaezyFxMnceBqVtmgfG', 'fhlUWQYAalMajcwtDMsQBYoCbmpEWLRWKfqnqsegGQMDwpEDshyljxtQFusrwqMAGUInUsDhdDpirpKFdNpRQDmkCmFOkOPXvJWz', 'SjQrbyUhYVGNcwVVTyNuJZJTCAhTSjsbUpXZiMwbvokRcaHWPUaprrMFZxHiAXANudHKvThtstcfteqWbkNxYYkyuVTHZtAwzRmY', 'PTlqZgTyeRhhihjyeswhLocukJdIfiXuYVToXvZylpREpfVBYm', 100264);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100349, 'MlmKRepfKJtxmdUaUFrSmrxwlujxHQcKgGLAEChtTzvIUbHQmN', 'rVTINAHoQbmiKVbDkhjZMQjkrTjEkODHgjlYaVRGnhExbwNBlssTCaVaToVPvmgTUpghOwxjDxazZIDmsxFwkMDGmtQBZDTRKSAh', 'zftbwqUzcvmxmUySlyxabAQntYcpOWgqfcBSseFaVRzTxLitUVAiUWddnqHdVQpZQZNerrbzzmZrtgyJrCeWDyFIujZDRVnDyJVT', 'iGBMjpxfpXAiiZwYCoiZnRnmirVeUpqNdaWgtFdyOJSNXOakQI', 100215);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100350, 'EfFahOTEdlIyYktKIngjDHkXrJQROGNlOqaAJDIumphMHNWhJA', 'qYKAMrVLjtRBjuhSFfSgErREeRzzmpjaHwrRkWGgsSXrRkISSknskjRkophOpTZFadkhJIiPnajlmioGdEskAwHdWTGrzXJoVgrN', 'wKBUPCQCuxFEOKFmBxiYRrcidsrTZDCxWtrxsNXFGEYIfQOUOggXhhsNIdKXCxwAcirWdmXATyZPHybDikSuPStZDKWsWFJAGwQv', 'iyPhEsGvyfwhBUmScLkCaetjJOHQhaAdpRymZRGacjOFQvaVYQ', 100295);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100351, 'TowPUMTrXTCqYSvKHtMUjTnplhUKFxCJGKfOkvxQBqWujXmIBm', 'XFkbLkCgOPGcccGGOzXqMLgYumGeEfoNJOFQLvtOjaEjqMJOgxecjXUFWxaGNOKQNhMuClxZAQkHFqyXFTmSuzRPXWkxfRXzTzyd', 'kEwcRQWvqIqvSaJJxqeXkbMuhvewodcGIBvxYCDSAhHjkuwpbQIRZQGgEYSWHjZsViWXosSoYgWuCSJgnLgnxETjydztDKyHZCMN', 'bkUaisxwhAjuVMRVZAiaCDrMQfMFhPpdxjKZzcdAHRwaIlWfqN', 100192);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100352, 'aqDfdWACZmCqavJTXpCLJfQgXGeVlPDmoiKkdtEOSlTPzAkvnu', 'BTzZGuOCBxcrIrfFLHMOiWoMoCQIiGBndeIiOtxSTgcjWSkJoVCeZLvAFOMNhwNLsmzCprxAaMJxmqFQrTBemcxRUmdJsNpxoFap', 'hWCyWCfEPvbpHAalqFzVgxIzaxzaiJdovyGkBQGuBUMNGUlLpKDAsLeffQjWoOYixeAxAHibWCHEGrXIBachvrMEDgWlexiqgWIx', 'jtkMCOoGQtHIpdgMsUBAaMQBJisaPYyDiclSEtKNyWxTKKGnRg', 100311);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100353, 'qtyXSIffmKffIBuqnrouQcsaulqdUHKspVMokUXeNoKqqtLMGJ', 'rpbtaRhlpDFXVYCKphDeANJsjDLuvMgPEshYpWyGCPUUzutDuoSGXdsbDzesaiLysifdJDYcHvVVwobnNDOIoPqgiIGFwbpVcNDq', 'NWHKwLBukWLHOHYzOPYYSjCLoJCxRRtfLVRqZICcUrSRBZDMUGsRyTEtvaiymZTpyEgUIcwxvrbBowsLVwBrjVOuSQAaiujacZcN', 'NGPSEDsrPsHrJsLkXjpMwtELPfpNjVQBPmeLUKAuYfNMopLavu', 100078);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100354, 'nIhwgXQahBpHtjOmjIqXJbJuHlbqUEkBcLyOpfjSvisfajNjOM', 'PEwolfQwcgEygISLUOREClDEsTxXTxJtleNyHPNBBtxdGsIQDtPmhpfnPjoseATUmovoSqpEJxIOnoNFWUXXMpSPtwJmZSHKNskm', 'fRUipAYSmVnVOxoLNKcMpuowUQgDpdVxttizDsCjXXfXEsutIgyJhpEevJDbIOHFVuSsnIIShqqIhcmXJMnNoUUyoYsWymCoUTon', 'soadRkmeUoogAayQiVKipwUlOnUEnLiJjIfqVfnfitzDdStxki', 100357);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100355, 'HYyBLJritkVSnrVbwOLElsXlrHWtapYHbliJCnkjixcMiVjsnn', 'nZAjmsXPwUQiFpLVOUIzpIoXPTLjcrGUpcoqhDyLkOKEGsASmkovQXCWjfEiGodggiGRLRfCrOtlUiKjsHURlrRSfcURFBubuJii', 'ojpRgVFoRYwhhPKkeuQZaorjzqGDXJpvzYgRsGYcxYBIIdyZhZoPDgPZPgEBFNykHdguyDKjPdRuXWrNkokvSniiSiLtryVpzmvC', 'gmkcbhooSSxTilgHKSeWQTtJbnQzGfZICHgehImhCZMMWzIhSK', 100026);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100356, 'vCbKttojmbZIObhCnRVJeCeotrCKsXSWSMUQruecvGZxmrMyho', 'oTGdmXHopHyMQlzWvpOgnyIqkYtUOYjrkGWSnzXBbsCMHumJFTAmrvHFtRQIZEgFmGLPTyyVZwSLSBFOERkHCoPmrhjQNOmfUvPm', 'KFtwqcuHpHwWkEUcoZQEVcGEkptJWNyYhpHpGuVCXRHSmXUvKcWDYHAnVJAsTIqxJBSVqTxNcZghcnrYQyKepAqQRubVAoRQZihA', 'iGYmMERowerOnTzqBvwxvCjbxuqBhIlsXoVaaUCySCGObtTyoh', 100221);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100357, 'ONCfkUnnovHDKdPEtKblpstwgdlGaefJrfFeXJFCqcsSDiRdKE', 'PbiJATVakCypZajJpkbgroWTxeVqueBHULpFPKwnpQfNEkxUOlXnOXLdTKkShdfKUVtiQmOFhzoSvutgKiFUPHWWEztIabbxiVDw', 'bnvtfTNbFrBJSPjqjSnxIduVaoNxOJRUIFPPYcblsuJcmVJTZGGRbcxTLErXkvjgzTMxmMSaFMfpDhiVrRIsMtQYBnyGwRnyVFEG', 'anfvqttMUuaYlHmqhRfhEAHzNadSJssOYpSQrdsncGSEfrztVI', 100170);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100358, 'GNqbLDRnTEVAybGcIHYZzzDGuPDYOpcyiGqBWzVcBIIUuBmkYM', 'NuqHKNLNPpcxSxkHDreGNsxBFSFUbfkKvKfzbDuqRKeKfcrweZKTxNVwowBgOSFNUGndXdBztnAVXLysKQSKhbPtYsvPnNwcPRwa', 'CItrfUfrraDKHzAgRzKLweTseuNiaQuOCbhCSUWkwPMUxSdyrDhIaEzdHyRmSYChMlhGkQrrdyvtIhaUxkBMgyKyWczjDOKwuich', 'SsPciGNxFNFCAfnBwkibRANcIGDXjBiEfTMantkWKQlSLXAdos', 100347);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100359, 'qntLcSCKEKENBWesokSzSKreSltwkwpsCNUxMawUCXxRSwFjbv', 'tcfdMXWoNRdzMXtLnlKcLUItPzamtnhEEDITsAhIeHzLRbasbIhxyNbfaIPrSMGgrQguvnUxhGpicPBhTwcoSFgqMiiahFzeIltD', 'QEAWqHbAdVYBwFghmPxhFhIsOlFIjmFGFQraafMTfUFpogneglhsgUESCDJTlMFljYhOrNyiRjTDxjtlEJAduIOAJofIGTWaMVjh', 'tPyRkIJNUAHnpkOqpafTPncRMzjHAwbtWImjzQvRTKyXMkDITA', 100353);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100360, 'UcOjguSpOWXHyzjQNphYgkfTictAHuiNmHkiuLnQEiJdaDfhXF', 'HPVfSeClfINYaaQDGDgfvhusxYPAbnQDWnrETAXwbHZcJjxXQmswPQTHqkIKBsAPnGbekOzSCjqOCSLAsSNWmCqTtHZVUblTMBZD', 'kvOXzyECnXZHFFggYEJUgAQHGmhSKPAUEaCOakWywtTtXKPqqLBBirLYuLcAFbosNlSizjaqabJgMvBOIfadhHjbchFYlGQYvDkX', 'BQFrRTteghetwczovzaQMFZTwhZdREWmSpGBylxiQgFFAiQaXN', 100377);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100361, 'VFeEewypqIbKsCtecqjRkpvtYrRxJuBWOnTKLSiuQJMfnTYDjp', 'QFQarOGTLNsEQDNuNBoxtTJXLozntQUcuxXVmrremSmwSKQCqIURKemoJixYXedefDSPwWIlruAAUzrEBiXWYbjUOdDOaMtMwMGx', 'DPBcdfaVNuPXthtMHDJjjWRVnabnikJOVeUlHwOubLNiNXkvYyhfaFsxzApWFYyDlHEAeCYrDURMFEWGfrQkrDPCCLdIiLMGiRum', 'DVxmAHbHfCJumJeTnLSJavrhRwVwriHsOeXaQzivKMYixolMaV', 100321);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100362, 'RjxikdjXREgbDEQcoAbQrSioXRZjLoqirvRvkJncePVqusnQdd', 'qbfrYeVMbBGJIbcXMFBQqgOtazCixAqmMzrUJxAhzCjFCQcEEzcZzBuLNlDqDOqEWNrmZilJKlpGRApxqZPcOowczFEyDSzRBJMl', 'dwYPNybLsHxxKkKaEMhyRzuOabasEamhAltrkXTZJLYUueFdmpDrmchsYeEujYIOjmiLwYPWrjGIaXkIHoUEqhgNgnlxYYGCLdzk', 'tajkpOlfuQpddZzwFbLqmDlecmgqfEZyFNiungUleeSLchEpKS', 100004);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100363, 'IdZtHoLZfWyirTPKXhuIrsOgwKzIPqSRUnTTruaFsWNjKIIZZX', 'BRxbCToTJPkJmZhZGruiJeJsqFXWLbnfNjQRFddyVVYjGGdzsCHUDEOxcDPCfNazBfxeeCWhmVyTxSqvyCAFVyTaarHfVBCAmCEx', 'mHTxZaJdNdNZPxMUXqWpjhosxPpIeakrZzhEdFSghBtTGAwmoYZuMqFvIlShGonzGdEWOhJLOeNjtjDEEmxjAWjyoNYBNCPlQeWs', 'zBZqoSqRZdPdCUlsZCuIvyXxZLJsnExNhzHQxvPAkHOYFSmMUg', 100371);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100364, 'pjoBbhOUIkKnjViPNDrhSTzFwAUQCSacjfnVqusfVUJygjMxHS', 'jWwMrPZFAwrjPExrJDXKIFIWCzznIhyviLZOhOGZEAfJpaLKivSkHEZlTTJXAiaOFTtiWgrLgJWtCNfLlYItEtURnLVJFIDReVmU', 'qAoqOptCLjXszwOSIAQUHHLlhUsgooIgPzKFwcPdJKFSOAjRURpkGmJNroumHyzHiuBfRLRjkDnTznchBCrdAjEZKgPpKCGmyEoG', 'vswHorSDOjlojzUWyJhoftXagBpwkhKMAhZufDcQSTQZEWoDXo', 100228);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100365, 'KRpoCKPrwnYGhtxEyXNTrEmsZkMFDXnYWrJcDoSiYdziANQrxF', 'haUSjmwKBwjGysoVpxLcKcDyraTWPNMoryqLYZuodIeFFBFjmpFRXSXKmyzlGIuvhEzlNixTLZmvlcjNwvWrDLWKbZKmkfwrkXsk', 'ivdLkEdMEWROHMbJxETgXsvskbvZmgBonKHTNjwhYmRTXpkFPtgYjOfaXYCscETWhFDOzThyPNUCIdoKTZAgjYpShgfHrnXtsGAH', 'VOrnAnXJrLvnRjfWPGdidTOWYZHqmmvlitVHBPijkNcKnXrdYO', 100382);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100366, 'DowXBlYiWZLXaIDXRTLMqDmqWTTyuJkkKXuYqBuBSREdeBaaBQ', 'jlOBTNAFaLuAKKtenLuEvdIZVAypstyaqrBzzlNmpvTAUNYRPLzrYRQxanBXWTQIRisEaiQUarNsGwfUAimSEPxLLjpRbOWJffik', 'sjIdIsSBWKiPYBbGqsQSggJdGKEMIbNchjlvltsFBlkelxQPvJpmxSUBrEdUcoqseqmIoIcrhcsGhSdoEgFaZVonXfYsAJIAAIUp', 'EnGRwyhkvDJbgerPGvcdjzoRfcRycjTVllPxsAcavIMLmooTzo', 100039);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100367, 'kuZahgjMZKZxfHBGAFyamoaWHwvOmyetSITkPwFDrCnGIRjYnz', 'MierrEbFpvGAVoUUlJypFsBUZrLjqtFPinmBrjvGcilxVMOmDhMNTRkThndbPaHjyGnmNhCPfXRYVFJqrzDoRdkHdHJMcVTeANsD', 'OzjDHYYARdWOmOzOwdOABwaqJAYEtMDijPzxKMxLRsGXHfBLQPCsxgLWpMlNFJezJKmIbBfBHMhFWQpwPdcaUsAbKHbKLSzXzDVw', 'wDvVdXzTGAjNIkNUGeIdRZlmJyTIUojJTrRreugfzFOSGkAvHj', 100051);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100368, 'NZmqwmXIFxRGMjXEdSAigrLCYiCjNAmmUMSxuhlcpWyIjiWNxG', 'VpEbuPcIiTsChJifQMYVlvlRVwhPZcOJiDFRPkWPLvBCMrHRxxhtVzVJacqKRFtjvFxXbdEHRjLcdHJtMoHbKBavyoGpomNrKcXE', 'eJJVIYkDeGgmZxhzJdJOJTfpZSGeQEzaBOkFtOePpMsODHJaFDtcOIrXLxJZjnayCYehgBXLXrPVGLefNqZOPfEnfocngoFYnmnc', 'KFezRASBcmDeyduaSYjHywXEhlDMpxCjAOdPfZmWbSWsYwJfgz', 100141);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100369, 'bABmXFpwvtUfYKlSGWxVOKmlsUxtHhFNVUiTZlxwNTcRdBDEUV', 'hjiweEWMNVveYxMwGFkFsmPyAqokyvUlreCHUgSESNmUCmCLcXlunzduWHQAvZXmEjkkpgherYdCuPiFHQVbmAEfuIPxyjOcZRZR', 'wEdUElWkvuxcRpKZSTitqczfKPtCzBUeTQTCqnaKmqZsgAeDQakgRoavRCIGvxgtJNdoLXakwNZUDEgmRUENHRyjoikrzOwJdLqp', 'ZziIcMgrFBjkEZAFseOOgzYFynsxmrVeIxldeuadsaTPxRYUxC', 100116);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100370, 'iOINjWHZWopdcCNVpawTiIFjjyqynJsdWodRAdLPRMfzsmxbCQ', 'AfgXDsgvXOYFUDRaJgFYonvdEpGlfRSqbiHeRQkfEKUVMLmxCSBPYhTYArjHLZdCXZCaKAztOdhRGErQWjElabdupyaGROVrvgmJ', 'VuvUjFhizmfeqjTqnShHfnQhgHLqvsUSYuTKRqRDjUlkmoKmGoKXiWysVApXhegwCxYOTVqCqttFiWNTDyZGUwfBauwcvfiXmZIo', 'GXhswFSmQDaYQazTgRQSymOujEoezlMPsWNASDAuvDbLnRBmOY', 100335);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100371, 'cJxsZgnXQBPdgRNKPYzOHFvTRFnojKwfrTKktHBZhTgvvwYAiZ', 'ZAQjCHICwrILrtmKjdVyWmwKsCSRzMEHatjwUtzrGxUXysVcqRoxuxtKrkEmtextyfZdovtaeMZrZgdvELbfoOqReEWpEcuUZjFy', 'wThIqtLnuPWGuPsxTwCbotOzBCxUuPlbCyBmBdRZNfQvCDZtLqrplAGNFwPXSvMJLYpujIQRfWmfXJLNZfEzWmsrwPVMcXoRzDqO', 'TErZIPWlLrKvamCefzZeZtXZuGLWprnlBSpIgWBflinrMOEkaQ', 100045);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100372, 'tIyNJXPuBANuNvSgkfdcKoRNBiEVkkNgmyAdvccZbcULKvBjlZ', 'yYfTMEwixUJnCISgRLkWYuVKiegHFfrtIalJQWOwYHVerfYjrtKsxXfCWeYyuiXGKhKnLSEQAkooCHypZGeqIJPcXXxXfmSdhWBh', 'zgOEuitKAXNdXqxCmknvMaVpDcQuVxjVsJUvAFojbhIXcCfuRGVGiGppLuykzGRJNxUlnFFutrfaAjtOsPLelqnLbNIjeygtwSMa', 'sccMmKHeGpvlhHOVCJxwKEzzmVFTiiQZBEGZwNDkdZxJeaxkxm', 100399);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100373, 'BYOElucQyrnRfrOoYBcCHbwJwaIVVdSSNasIANKTKaruKFXTvI', 'IKNMyRKiVKHCzCUPgDtQAlzVOxlZvTsjrGnFejXgDNiEaUrZvNUxcMYzDzWgOmVaaPaQFVZhwLNyjoyVgJiWIwIgUsiiUmSXAmyE', 'yIfJJjKfjGWtoSSCsnOYqVEyTFbfyjbKfOMpLCKmiwjoOyfXxzOnFtbPnnNZhHsFrtcCLyyhjljZFwRXgPdUqVhowbXqeonGgYbC', 'VUZbEJLddGVBZLwKtkHUEFLgivSDMEEeVXtoNqxQWeUSMMNMLX', 100208);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100374, 'ftZFqnSLiGIdvtGBGDKduBUjgZpAIRFDDMekjlTcFxOzWrZlVK', 'eXHSFCyWwmUUNRGPIZJtrqbcpFWdEwjOsbMQvPQcoSHfOXitMdiUajeqhboRBOIueXiskrsUdwEAfHJFacioPAXnUwlRLoqZRAGq', 'zlgUVufRzRDmndLbbgkeAZMrhchRmCQunANZFlGMcIaUInhdYRSxPQzuhaweOepEJaYLiZOhkPSZhzCnCKrqmZwEwaFIXJPFWxxX', 'PHUoKkccGXgjfYiyYWcQXCYqzsczLwVYuKCQjmNfnBxZLRdqNm', 100305);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100375, 'ZzXrgCYkPdrHYhCdaXFHKNQrVOVqPriEwMLhlWzhtzUsxWfZiR', 'QXecQXIVMZhWlRJYXFaiNnnceutLwZYudlxVAEKvwXudBdniVqHkPQGuvyQLaAeRHZiyIoUALjyfozDtCPMBBvidGcZeenkLuyMj', 'JScGyYxZqcdBnBokkHxGqyUkTDrqJvqqkdjDGXEmiglKFAANrVdLOPBmqpUsnqPUADmoVDGoKifDISAdfLkMHrYfHUtmxApZhHYC', 'kJTxQDalzgOmfXGodBdzaZCnHbqZvGqnxrfVnUCEDDfNToMZth', 100282);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100376, 'wvuXgWMjUhZnvlROvvxeTsbsoCukobAWrrHBSYSHdfhouDNicL', 'lssEPxITvaELmhFeuFPYCEJjlpsQptdAqIBMrYmMMclOCGinRFBHEmynDbHHTgPpByFNSrLRycoAsIvrzYoDkMXJIDKfesSSUKxC', 'EmRtVDFOKrbIkmiWfhAInjYGNtPDnIrvEHFvvhihbcVgLAkMHfDpTsCDEojFyPEZLFVTLGZmAMkUbmjsZqDIlzMGpHnbGxxYjUgN', 'bBEBPXFGWPkTEFHyRktFzpDqIFyuyqxeBoViuQeHIiNqNlOQZn', 100223);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100377, 'pMgqccudiRLHrhMEuZRrbyazyZbuxyLmkjAguFkMHPbPNCpxEm', 'yxqOXMIrYhbnGFfDALEXINnIrThyXCkpNMgKzXqDRctVCcEGSHyUWMISnojTPJVuuZpSRdsHOjWBMsbrzGtWuZXyFDLAewPtUmbX', 'ZBBlssWqVGyACnWPmiZdBLvaXiPgjWVBQAgdgpKFRRDIdnLOHoynGvUHpkwejNFUYmwNWgigPjDWAtuXOrJZzGfAcxfIVpsWWcTW', 'OXAJBEhVQiQMogsYfmFKeaiQQTdfqYiOKAHIgDDosjvBbcbTak', 100116);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100378, 'FzkePbQBovCuiDJmYSpeIiFDvXhcjlQVKsoCjyiyhjoqjGfSyD', 'RRkdupDFlcrDwcVNBVtLDNHXOQbWkBSkVuZWJqpMQaZPgdzmRwFbDPFKEjzrMCvphAJmKJyqejYBZTnLtfyZoIdYUxokZfeYPIHO', 'DeHKOkWLRdbJslxbbomUBbgCqScBKyHAYKVNmzLJFpqKNLuSIGUTWKJwjgZoMvYHVidISyLlWrDxXjsruNtEDpJYJyhbmEnMNLFZ', 'fJdXRPyCDrUIOqUpwinnFKsCDDCCCmMvYObcbdnSxUzusludML', 100041);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100379, 'TUUscQIXbQdcsErexJBntKukElQyAvlAUKXsyFXERrNlyulAJh', 'OUwkqTJWHKJNMlTZirNGNALvYmpOjzaVJePussCiofACrupUuiRAhFfZBmaTvvbyFoOQAqeSmKLrZURNisootnFLtYcIYCrNRRas', 'PRRYhENHLiNKlpDAAWYctqNOBKSVaTUydtfNFMJHXwPNPCVAWedvFIrHyPFCzZuvpcGjsrGcjWPwRMqUUdDpkKbTUawminSuyrzB', 'knAoRgCEdMMWdeHvgIMSDpOgLsclLraIRgwqIXkoxagJOJazfi', 100200);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100380, 'ZwomRAtmEuDzTAagfLqEOxIMewaZpxxcGFfDNHqSByBvWfHLfX', 'VrBowNwAgGKrtHsdchkDSqkzWgBgQeoWvUgHDHYnKfKJNGyqTVShpVTYFYJhSPPVanFLQrIWcBwqhDGTHXnbAqkUcAGAmRDHxXju', 'pXJAhikWVIVHKgruYWmuaHBfZXxPXQGKMvpOhXCrAtaWwRTqqczohaOYQuqXEIoAtyMxRzTcNaNseLixSGOrDDMEXRuUflbantMV', 'JkcPaWLbZtdtKeJPGnaBCjkoIEUAKNpCZqAiXwkoGHpPuBdLNK', 100028);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100381, 'ROfbwzbyMvTiRSXIoNjgsCvhmCRkUpSDYTfcFjBOgxhMgCDsPv', 'fSvDNBxQrNaAnOLrukCpOmLlRcOXnhzjIcWDrsjVxZMzTQEtcWhtENYpvPQaCmfXBvAirgkIvWMJEIgcCmApMKdGaJtlUntqbjpl', 'qPkkqAknQNiKyelopkkqkrpANRzNCvICTQliCNlVEGxMSCsAeuaKDOBzjRfxGpEkDmUOwXwGXYBwgFPUDGPMptmnLYdEtDsPSXJq', 'VFlKgUajoSKPBNLrhfXvcAZdbiUJKSwqiExUbAaDjvjNSBVuEG', 100158);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100382, 'YuGehziOWmiEiPGmxAKauTQuvvtRuDqzMCgXzvUCMjPvMHujwy', 'zcZcXrCGDLBMJaFevwEsLDmQHmCSKVdibCypXWtYhOBVbhFkrSlMuVXbNGoGHFKNxYSxhahmkoqpXJXhthTRtGOBBuWzDeSrmbYT', 'USbAfbJpKKKSJmSxJeHxkqgURxtjJGcYElikVPTCUyXMIANFLgLAvIFaWDaUJumWfhkMQfDWUySYGHGXcfHZOWaSpFGPsjIdEYxn', 'yaazWVtKhxIeymdUwWfxGSVpwthBgCGbmRYsYtaNXwCIgCOQZM', 100002);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100383, 'DqpZmurkCxIgoYvjNdRAEpFmQAIzfQgfVIBHxNfVXkkfaJycMw', 'khboYHIFlBxMMMhBCCjujNAFrciswzVkHYFURnkZwPRMpcJzLROyqYZAHUBgUmQepSBIAXrdeDUEmLpcSUXvsoycQLVleilSMnAQ', 'aYXJJILKZikmDMkPYfGJEKwqLMDGnvfabfYIcWhuQBiCGDtxGVtaIluxLtFZwHtyPcJYkteSFjwlYnvWZnyiiScRLgJLlHcKgrqg', 'VaQSHYOwkKHDXvLdsIkYawXEiRVOiUtUWUNaWLSOKiCCNpDkwt', 100299);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100384, 'RPclWOlcXtyTmNAIgcNKpQlvYVGluJwpHjImsuFMrkDjCqtkos', 'GUFjHqoUWgEcKmvfzVkjBGNOaNFRpAGHFkNjbEjdwBeLBhBrCsNIEehByGUumREcAheqCdRTZUOCqUTNepffcZUovjjrRKnffkda', 'TukIbvdzOCLQGYdAoOofZbEmYjGzLjEtQsyBGJwOZLygMxpKOzaONudfbsdNTNodmpcLjpSqPdDXFwlchtBcfTQtfjNAlBlIOMtI', 'SHfjQjNxBquwmMjZEFazkiELqPwyrQawiOBZfCAIBjBAuCcjjc', 100000);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100385, 'jaSomCuXOozaVmOiIsydUEmMYfeJfGVkuJWztmXPVlqKBrsaUI', 'umlkEhLLuEyULPiKDYTOcIWPldoOAWjMyvQoQEdKaTgRrtIzueUUFMpsOQORgZTaumGWmOCYUnWDSUIhIOsZegjgBUVGloBfVoAL', 'eMNDWfaSlUhMCjluIvUGJwlJwsHwFwVvbgoaqYMEkjBXHFBxLtlxOmWEfXIJWEdwniRJsCvuJsLyRiAFcqXLzNsRMYFxEMRyuDAT', 'ctDEkNzBIuKrPARQeHJipfIjeMoGCdbSoxKfYmLhYAMubVhsfH', 100095);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100386, 'ElgylBErmijiXmTjHnYtcwvXwOswIkqrYleXYbsWLTmsImYPSe', 'YrlGlNzIloHHWFrjRcoaBFVGNKNuktpyCzReplENkXjneZxDikCtXDaHHwReTohjNEFaCcOCNSrRoLcNwCfpFiVCDiIbZCGcXLuO', 'SlqkDIogjJifNIJlwPJyQGnCqybyexEoHjQNmrRDJkksXrqJRZYrbNwhJYHsUdSkIsoubcwWDeRMbIfiPNvFCCDIDLiWwgdvUWmY', 'aiLvlPKehhqCInEXDuzgioEaJqbzAIlUXvDDfKfRCfuGCgjPJE', 100050);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100387, 'lyiNRYEjZaAKMIVLbCAbtwmdXxBMGzfaPceAyYYzbbGedPDAyH', 'jbLMPNwwcrAlJEtcbecNvvVDIqfcrQdWNTQQhvbDDYsCoiMkdwHAcnfDjWnanIbUTXvEqkhTihqpstJPkwMxUeybUardyixebfzb', 'SBqcvJQiCVDrvJOMtzyJowpyoXLsKFRunucyUIlNdXcQORrciYYhSfCeKLPwdpZYUlfClHpZPyfCfxvtrpqOTyoSmYVlZHEaMvjH', 'pEtYFndUsHVGUEGWqsWsEuGlkWpGdFutXLTJJQHUujEXjYwXWY', 100180);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100388, 'CDxZoPXHaDOEurgDuMqNifcAAToQKyoXmYAEaDieWRJeVjghMe', 'TsVWbWPpPkRplKfrrugAsaewNKbOgiBanuqMOujovHJmKzFfESYZmKTbIDjtrNFVHaiamBQFybVciwUqYfNxxwGSGeWFNxnuIpew', 'TzYuYqKksHuMVKHMHGVbCkpMocuBnfNfxZfwoJqJDUKjGTXgimJzTYgevKoVDcxDwCTKqVmJrThJcvEXbZJdTYiajYNyQOwkVgLj', 'JsSmFwrTMiRUdTTfPjPVserLTPXuudduetAPgGvjRuPDlhaSLW', 100371);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100389, 'lNKaPHvDPsMkKtVxNJKFANILWxhuHyODMfxYnbTetBeUmzfVBo', 'mDlmZiBBJLtgGEIKIqAUGXYXPWwCpGDjXzufGaihRvJfEeSpgUWZiKfKbCPcGQjGhFTOQdrlYlsJxXOEjQVeZXNaiirhfnYpgowr', 'XDsLbWoddxSkMABbLKnDPPIondshPNPytVyjJNFJnFVqNcFwLoYiToevQookovkhWpTgLZHjzoxTVGqftmoAxsaUsZFRrwShqjap', 'GnmojSSrLxPwHcwQfqlGLZaKwBUTetNsugalkoVPLirJlmGywD', 100254);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100390, 'MhvBkGsYSWIyXiaCxZVCIVComClZIkAoopJyEbyQviCpknjHIY', 'KyYssLdvZceJZjVboCUeNJvzdkDsJIQODrUTITvnDEtrZMmfUmwMtxHjLLbIeGxOBSdrFZEGSTFKyBlktEwIAeUaEwBKJkNUyAso', 'HgCsYhIQVlkPYnOzbXIbPAwCWnhZVmpwuRSMKTPKbKNJtllmABCQtUMbNXQYpELWjUkzAHOBpVECMrGlbhWRmheFjhKPCYXmfqkk', 'bLbIQmeCCUwBRhwtNEPvafnGKyjikICopLFlVuXXcOyZPGzZWC', 100138);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100391, 'xgCaUQBiHCEeNyOUIFbLmAGfajNJfJwSbCozoVdqAGwwczyMDU', 'zsZFxXWPvUBxgdfqUvhYnjHrdhkWldxDercUiSywYUFKymKEfzCuXULYBrONVruXmsXJOkRTcaPVtFSioJNPYrqmVRItJbGdLDKK', 'RKTxhHffnxmYPwaPjEFsWqGZekoigrrHyPsRZJjhHGpWHkNJqcxpgmhRSmDwUgPAmSEhZUIFKqHpyLdxsMpFcMIgGWinvIsTntdd', 'ctcnkctEnemXKoCTUzlJVtLDhxGaQePnWlcTdKLcJPFNqaYhGX', 100219);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100392, 'ogfkopfAQZmjbScTbOBGCaBfktMkZdnuotnpdBTMyHgEGKNqCE', 'XMgnEzflxmcYqyvFDeDWRlaItGEkzCsPQkqIodobRmThysBrCGfWdOrszpNxbYSklkSBTzIVQpufdejyXxHfpYlmxvlWoUeEyiSj', 'ilhKRyMzHPZxqUVpqvIbezeAcDFrAZByFabAYzjGZWOcPDGtnLbEpAOvFMMyoDTvjprFlXkIqzxfapdsrevEZfOEiVzFwaypbMUI', 'NfceCGwrNhVYmFiYnThPbBsOlugBYxvzoChEfnNvVeasNMVEPV', 100253);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100393, 'dNlftNyQlRyLJyGRSFWuRFfpTfvFXQBfTmkBkLFwnjwLnQBCOK', 'rhcvdluAVzTgylOMaTsfOtdgidggSKiUkwSSrLkwYNjLfiVxdCLTxAJdApwCSXIQAKIrpIpuxICzWRgVzGRhGNDNyWNPCScAuQtn', 'bgNchRdMFDdlZlvXnBAftFVTXqHxwPnSFQlMADWjjnUBgGCEXXIlANDfKOdZLBvWSavexpvUhLJaKlPqGaVflUbdQtjidrjnQocq', 'ZcUOpSUORhyvglaqFjZvQXwIVSsfFmdVApALNKYIlSMPJImTRr', 100231);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100394, 'lrJNwnCxmJUlVJjKbIrYdXomeNmVKKUrCALggweILcuEelcGxo', 'amiqRpnlOztsSguLBFMZplgfsDPEetFPyqICmIkzfBVgeYZRLgOBASPRNJLBNShgFpLOzmvjJTMZQUHbkFOyNLdaxmMSAPvIuhRL', 'oTEnyDwdWmDiUKDrtfCxcWBWYmmuhZcCarPdokqyoKFMDbHjgjsscATDBZgPvyKrEvEuuWTEuNETphNRERNjLYSFeluGRNIwNCAg', 'BoNfrEHzgPXOZkABKckIkvoMmgqaamIchWCkyPWahIiMdPBRJp', 100215);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100395, 'UTpCDBuyOedzgGvVzxXKTeqCMrIvPXNdLkLRFdpQfVCIZtnvrA', 'jNbFoSsSeGfFhZeToagSsCeArMZpRJmxeSbuIVqtbFTdjnAGYkmpMlqeUVGqxCKuLnvGZDMLICaOwIyMDVVrlbwlvefSAVlaHRFH', 'XeiZVnLsEPeUfSrumIAtYOkGXvbTRcjnykXvXpPzcKczekIMRGjeGFiVJjtYlEFJhMQubhFmzBhOEcIfKOTvNBOAGxCOpiWpIaDb', 'cyAkXUXFEUNftOJCfKuGzPzMWcenHUILEXJrBgdPDAeXDwYvcQ', 100096);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100396, 'YxWhaTwScbPMVsIUczvrtBipbhJklvNTrcKfQcFUOvnDHKWMMV', 'TOoVOTeeemyvqDRQiQHCTdgrFQNFiZoVkibdEbgRqLvJjqLljBpQWEHWrVPnHgbOIaKYUxQxVMuPKqUEgwIJdrpuGNEMZsjTxCuC', 'tebIbymOwcNrNtgDGsvhlvfnVEJQtThsmTCHQiqfvvjtMFDHpxqCVazuOWRXYJrkNoFlIPNFPxNzpekdhmEExbYDCwjyZdZcfGMm', 'eHnANufIJRLdqAoeNTMKKnjdaQqpTXzQGtVyaQHOpJqkFwGuqz', 100254);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100397, 'GcyBJoUVJDFQEPQYnlLnPXYCZfIsHYlyjGgUQElufwkkCFFErH', 'iIHlfSHZdPrpVpWxNCJBMNDAFLPvtNrajMXgnYqTzzfvlVeVXLtuFfJQWgmxhNioowyBzOuJHTNqofdWQwVRfbXvmiRUElTEcbOz', 'aYhPgDtptltHgLtBAdkWHMVaNMsyFnytAazxySDxebeyoClOKmwYBIrbTvhQGhQEnwboTpYBMluOrHcnFbfbZLzuhcTCJbtjsfxh', 'IyxclptPtrQtprOqcuAQqrHiNtrLHCqkHkbBvgctJDqiPlpVWZ', 100073);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100398, 'eXXuMjcCAuEZxzilTRbobvyGByQOuCrSYdpSljKNHUAIRVKjOt', 'HJNhDoaembpkNJuJsWHGkbIFYgNUiKuDtsstEiFVdPfKmGMdGqQUlTZjBGJtGrTLtzlDLjCXIbhHXowUBfSyKBwrVNcfGwWqveZL', 'kUbKNpBjdZNhlSHDyybRaIqDYYQgVquTdnUbcXiaNfObCiCRaYvAGyIIewnqjzjSvDzNHqvSUGZTFygrjlwwujhvtoGPgVuSYVKj', 'UgDDKJKUPHJZIfoOKYSsGXHbxjrqaRkzjysbzOdbVlQyXLDixZ', 100048);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100399, 'DahabBFFuIWkXZPLGTBYQbFvavQTGQBqwToWmkvYwBnlVAQniM', 'BUKcDeOlMAaCEJQBqNkUnxDoHFeyqRrwwlDvQcXegCtDqgAgvAQtZubWSmmATrkrOqhiBNpbLLJDMLVVwZMlDNcqmrKFiXLYJEgv', 'rUMfOsqSYVJxjoEursBdomFcGcnGKEFuEPCqXeWOCHxSXilwnInbTWdvefbXNVULifJuebEwWrKQnEHshxopfHHLZhyLRLifvVWK', 'QoUQXnEqxxvcKBVwlGEuzpciUsdNfqJoJxahtamPMwIyrtaksJ', 100356);
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100400, 'YlJUrJqMWiJcCQVRoXbifZAtcdBykFpKSCgPJdNmfTHwwNEmoK', 'EzKiFMGhkUtFXjlVHjIqyKHtZdNeqLefBHkWkzTLCBYcZbjbwAmblHGRxzKULLUnwFFwhasFxIWJKXhlHajxGGFvDkvAJBgBXIDG', 'YvhvpbRBkfBrTbvYfiEMwZHUuciWHDJFwwGTOhMnbrCJLzXTBigzjNwZlLsmLsDieREzDSyLHtbqMVzvXHjpSFhtrhZpzWZIbvOj', 'JOXNKBMSmiqsIvWOizBxckQjIMQsIOfkKSBDxIMsZhyZjFKfzr', 100001);
commit;
prompt 400 records committed...
insert into MEDICALRECORD (medical_record_id, diagnosis, prescribed_treatments, test_results, allergies, patient_id)
values (100000, 'trOSEZQIpTfJNVIQndWPvjvPQjYCxlUTTAiWrKILKNSGMoDJmz', 'fCeOknYnCxTnhZsWnFtUMmwvXSdPaQKMRxCuExUIGEgdDpRVGCrHDdCukeQIatPndzyMMNsgQkIVYdEHeThZKoNWnstXONloJRNJ', 'wEnlpVFutmSgFBOUlnwAIJLJtAilbiXoFHzwuKpkqUShLupEZOuHxvSDCTNiAoiBKLCaLTIkDGMQUPWmJlapXUtXFqmErkLDOMBH', 'mOogwssAlSyTIlAnycelkzYjNOafPolgZKQoPJopnwRUcRRVIb', 100212);
commit;
prompt 401 records loaded
prompt Loading TREATMENT...
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100001, 3310, 'sqwxVMvWfdIwcBZMaFcEiUzhVXjPJZ', 'jfpgbdIGDIbUvzvZkEBPoevrhwawQXICYiWtiQmfPBOQYTIDyhcWBKNmfaKyKThTiQLqhTROhwhBGNaiFifFYAbIFDhmJpGwTGCC', 100215);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100002, 3939, 'YbReXxJOAYhplObDcLHrZitpEgUVqg', 'BdboxpfypvKQfwcptyyNaVaMNdUVihiwyKTtkidbWpTDmmbTiouftDMwRYENiBGuGiNvpTIQZvUdHZihZZVQogJiqLNPBVEWGsjX', 100014);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100003, 3878, 'yIquvDMNGWeaUtIkpXCONaILahcPCH', 'TKsxLILQoMsOYDeOXwXwrgBBarlTsZLPCMyMriKXJSExyMIoRracNzYkQAKolbdXLjevNWoYsuNcSoSAPCtGFGYNheYovDFcoBlp', 100385);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100004, 2424, 'sXjTvvvbHgHNSZMUKUaMuryBPzYmBx', 'fcrVIQqZDVMejBgvKwxcfdncJFmWZHlKNWsmTZYcaHgAcSWQeEZRIPgOxQVKStfcDQpXbHodlLrjpyPMFktaTakGswjpwqkpHoRp', 100213);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100005, 4744, 'SpBFkPISdXSaEmWVyHWOIrORfnPKAS', 'SrJXTmRSwKEGPidhDvNkMQqCtrfNLgBoITQWnbkReDGDkwekoMgfsAJUhOpvIfgIJFntjJdtnnGxCCsuahQstMBSMCZHhmQGmcZu', 100051);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100006, 1189, 'PvRyjnkiUoUzFlAMewsswJDFVrhFWd', 'pEHxQRWrHOgeKRXsvGSpjEQWaQcGhrrxjzooLGpbGWzHcjrBEokNCPXAPVeOEbBvDCLWJZURaIlhYFeoxUBkmoTtdibVkpsvcVjP', 100132);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100007, 2327, 'UbGQycqHhbOOobWPrlGvCcorrcZuPy', 'AWxEGbSymeTxLIvJUIgSNLcfbGbaYLXoTMfHPbmHHOWPTzIaQCRUfRUcUcEaoVLwJOzmHKvarmYTdGZlqIODSxZfKCysDNITPGfC', 100127);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100008, 1180, 'KZzsYJBIkmeaOkPKlLDOXckOXzyjMu', 'igmkuLqTzAcmsIHzLzunlQgTwFuBShdQRUdhredSZhGisSQohWrqjEsysEPtYZHokCOvkMiXxKZXnCrkfDxIXPVmdzpPDpMpLnJr', 100301);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100009, 3751, 'HAyZJPtiyPvKzVfIpyZpgFfULwdrWi', 'oXHBEcEfeKCGqEnomXvfsyzUehOREPYqrBIQJwgydmPjYvXTTiJNZretLhEBLAxjqiUORFOfDaHeiKiCbZdzebOPMebNkRHfEmHv', 100041);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100010, 2305, 'OdZokAdYgkRwulGnTYmKCmNXLWzpLA', 'aVkjrYWIFOukVlqdatiIbaesCAGHsCWTbabdunKhQJPXqnoNjkKIQSiSrjLfwelAdvOvTAuTvWzgJHzvCzdMPFvpKblrsUQUOZPU', 100386);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100011, 198, 'NZpszqgOSspUkOqUAKhaKJBzhluHTe', 'bYYaAhSAmslqUjKLnSTVmGDEEQgkoAOlCuUQDlbvgbjVviHOaBnHdrvlWZJjmNxEzevZQqxbhxvfWSgECWZPBBuWAUugLMZAOlnc', 100106);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100012, 2417, 'PxuSdwroxFHxiTOzphZbeIyUnEizNB', 'FjCGrkiOUgDzdwvMhNtcGzWgRzueFumEyDtaNDcEGRmSFXcgupCmjXDZRlkFyxNdtCqIyTABoBrGFGHhCHxySaEjiCJDazXCTdVV', 100217);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100013, 3242, 'dZOZLyJORvqKACYHkxGpqZWvfrRdYf', 'IPNFVmWJjMOcFGthVRVhPRzEhQEKxSSLozgFtIqkxhYUYvOvEOvGnHmiATHWYoMThadHHaSmQdkNWauvjNaLHwbAtdqJydZEcslf', 100114);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100014, 4992, 'NAvceGGRgruMqsuXZieMzGixPcFqTR', 'tJPeHIcwlXWniqlngrJFaFwhvxmogKjlVmKECChDHuzFpdIXsRIkpBYYVtGQWVyYRnouXWivzojWNQrVTjxxHApRJSiyBEZuVlKH', 100395);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100015, 2763, 'nEsPtkyTZNzhqZTogEHyhigerQCZhw', 'xvsDKCBPTpwLSvaoWLqfcCjFhjZGwkZYXIuxIhzZkOQwuwvuUpcTnqmMuAynQuxfPLamcITjsKVmNDSvBXtjHzOHwSyUycBOuRJJ', 100238);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100016, 1981, 'yTOXjrGWiBheFkZQPUtgLFggzUaDLW', 'GOdIEarsvuQzUjsBheIVyomdyJQnplvcTFPXPAFshLIfrwJPlaOlKjClrKMbUVXjdjPgbRrDHgFoQEkbYafDZbPoLzsMoBKkgzhK', 100366);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100017, 1348, 'JoVieszBHyIerUZLwGSoQQSkLulXnx', 'ydRwzfjIBvozZyDZUWTOkXsBFaPDORVDNLiulMjyvfQYSakXhDlNyXxAaFpxwuWwOjlYwrXxGnBvcNsPEzdANulFfgHkgewaMpHG', 100254);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100018, 1516, 'JxObHmcIWbTZMAnNzsSfRMRdmSOYNF', 'ZAncrmlbZpCbOPzZUNEAvoOSokCphEjwvmfaGnXFAqvbcEOLZIWOHzoyLnQrYJyBSyXfIUwjvqWIYabgFCNEwDhiZqpXjbjShKBe', 100146);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100019, 3554, 'JsOKmFpbaiHMTlWPsLGPEVeqSHVoNK', 'nrkAXGhAECqfkAELMyRGkUzZGgkTCiMkvMDfjczVJmOlIGlfpQpRHGJVBlMTHhmvkyvSKrXlDWVccEYtSRvCYaezrRPbQUyZIczf', 100270);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100020, 3643, 'HsLEJbXgAWtjKyRsBSPbfNRPFXxtOR', 'qsdxCpoTRXspTweOlQiUOxOfFTxCQqClrqBNXuizDqPzflDptykCEPQuVdbrpPeMhGjoiJSxltuLiHYZjmMtQwsKrZHaTdxYhlye', 100257);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100021, 4623, 'rxkvBAhYvetFCvnlGEunUrYnYVKYIq', 'DnCZvNwaoWGMtmqfcfXOIaoYUqshKrkdpAUudTodYjKdUFBYTbpmSkYIRNhNecJUkFYbycZqOZvgjJFAtbFTJgZHOXJAUfVwRnWw', 100371);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100022, 3523, 'BJeUhcJxJWjRQBVVHEdfDrShtMfnYq', 'HufSTEpZGgQZyXfyaIxgRRymXgaTuiiSYYpJkVEIctYPeQjzTPXRJyWTHjeyPmMGRwffTWHYMwuEBbfwHohrHzjFyPqgTOWtQCWJ', 100285);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100023, 890, 'WaiOusFThigdBDrjbhkupbeNifXNqM', 'YVTGczHopvlkcelUCIqWFIBgMTnCgPpBPnSXGUzNWZDVZEIMDHoeauhXExzDiQthsovhpXWmVRvLnJPbIGSVzjYQgnoYJpUoEysD', 100011);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100024, 174, 'ZmKkIzkHNfrMMOxZyMVBsBDahBSyuU', 'sFfEuXiOQobiyaHyphHehNoPTrgQrmQGTeQrBTuuysaUAKLeJoPaQtWPhMtUHSszAubgSZasIVAAXKpwvfhnUTqODuUfNcqUTYal', 100117);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100025, 3107, 'dmPiLQSUwIQTaHBPqSxOyflFyQrHuy', 'QuCRUTWLOtfboMYzjZUFmalmCgDGfTotRYLxSyQrXXTrKHQRazYwiYVomzRngWVfwYOBYgSKXchNRQHwZXmWkNjSBCoSpTMgqsTF', 100117);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100026, 4546, 'nUQhxJYooOkBtTpcTgbDEKKfAFwNSm', 'gVyQcdYYHGbGDLLaNJjnagcWcdnaRmLptnXHWgNKGKdXfMLBQXpZPDKIosboKmyzYTiLfoMDVMFtLMxkjRzRGvkNjVWccueJILnI', 100365);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100027, 3041, 'EmTstlglYouZpQQygWbNTTPeoUsGaC', 'ucPVitMdogqDImaRJcWFVbCjrWGzWFXCELhnWlwhAdufEunVKKdRxYsFKwWuvoJdieXUMaiCJcSSbZvUvtbxciyDceQltndiOvUm', 100121);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100028, 389, 'FRdRwExbtoVhngtwdpwGgunUjFiZKX', 'icouYByrLtZCeTqyyLxfqccKRSCZzKGNVvOiRMSryuuEvVmFXtzPjDtfvEtrClqLcrAMYJNvheUgyklUYYqDHdRVOouxqvQHtSCN', 100250);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100029, 3266, 'uigiBDUShnbGvXrORRYoVclweyTecS', 'kDgUGMVOXYyDIvomEqllsQlfYKJKOLTrkFvaHBGDvrIYCcFqgHagqNvAVaQlYQtHjDsLaWylJFBgHxdPKNdDekXvxsejLDnDpBtQ', 100104);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100030, 2872, 'jWRQVmeWschJOBXAuFfDVwoTBxQJrz', 'vnGuhHkvMvXNMLbcKTdQKRVGmFsBXGczBFEUEdWLfsiXqDqEIRWOnsMnbrHWoFuXMIyutyADQoygENkreHSWWZUcFLHKQgkUuBBa', 100329);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100031, 229, 'CnzIdRMgKbNVsrIgNzpgDnqOcZOOGb', 'QrwoNMMxImHDlGwKdtXHqRnXdwGRolyvLDxdnZCZUbaixJSDsYFFHpTlaIGlWgwSBUgFOlVXuIvVhmDKsrjJhvZCtcMspvKviyCQ', 100010);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100032, 4250, 'DickRxWLCzwFybBrAWnkbwnIosJSmT', 'qhGnqSOCpHkSGCOxblzCLBgbXJPnwCcpKndKodKFItHGYyKuTLNyKaJBKloQvOpvugsVYKJonDXKTqDQLWMsyUaXmMrTSkcxTYmK', 100293);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100033, 169, 'lGrCkkRdzXahbhvKVfSarVeLoTqHDH', 'KyesbJQKiZjJMzIdCRYbTIgcUpwUvFcraJbwxCWxVuJbhkkyMnJEiHMTKXhqRlouOktplAdNqNvJxVZqsWqlCaVRLFOdKVmQLeFZ', 100197);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100034, 1686, 'pdOFlaaRwuMexTLicEipEYmhzSDXBe', 'frBfdiGcirKmIGFVwhxVehuGtuIDfKLwttRHBhTwQKXHMwPRBFfuvYflsdcslxkcstkFnPSCMPKIXggcfJrSpXHQVvaoGzFKcxip', 100207);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100035, 3680, 'xrcGFryrQqydEMZNMeEmWjcUwnvcFO', 'ujIkcQaIAsplMfoRPWYzrYeFNTRlFkEaHBcFMnnTgiwZvXoadLHjWNczHWfhZNXZfPkDtRaEljuhfBwcEQSqQCZNAeLxhztvhWMu', 100100);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100036, 1162, 'cskgbbFfoffvxNEHYHECFaDoGMxvQA', 'ZcDbcbmkmtezTKGmfOoBBcHwQhraxYzdNwqcTJGHdNcKgBOKiwPiGWdbaHtWICYqaJtXwouniAYEteAVXWNZaGAqvNOjJByqOrIR', 100397);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100037, 3945, 'jkqEdexKsDIygRqHEfaUSnltWvbqgJ', 'JWGlpreApYASmiurUXntpFtPjcvrVppvxiRZOephCBDJIfpGjhAnywFEcYHizICeJsqQlnRHjSiLXRQjPGkzBbRXHhYzOvOtGQqi', 100138);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100038, 2416, 'OFuHIGxYXrWbrVetKIfjZOBeyOegKR', 'BNRYoiLpQmcvnpeHDExiSxJDyqppiOFkUDtlflyUxnZzEheMjhUCbasQXYaTkaTGNWjNPWGOHqvpwAyodkckSruyVCwHTinRhlbv', 100152);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100039, 3950, 'gLpiBtLLmEfSToVLvKNkbdmaVjHVJz', 'XJGtNpjUPfjFHjWldQWTebhXKaOgrKriDGbrPfOBiafXuOdnfOxsKlQrLhjkBkgvNUzBYXCqsjpHINUnewjwuUTJopdcFRloJKWO', 100238);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100040, 870, 'KGLYvRDcufmemCbolczTVoIHhDvipt', 'zIgHirCdSVAbflelYKwmxtWbBKGPdVPkfmduAruSWYtsXtzIDHWtJEwrDcrJjvloTdQOfdcRAAXglPGSFrOqVDircfMATrQlYBlH', 100387);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100041, 751, 'jnIZQoaSKkGgPreHBXfQNzYHrviTYp', 'YdRYbChdpPHCBgxxEeZTUmTNqpfEXmCNwqArvDPsbTQKnOeFRpAXxVwLwBtHvltirPiKNVzOweNZUPttgGICERfduabfhaNFoJHn', 100287);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100042, 4315, 'oGvfZfkbrutesqjCFHgtRgGuZElgoX', 'XPiSBqRFCKkppVGPGzcHaXTXvAEUyudlFffFacDwTYLDoUCWCXjXtWXSqtMBtqYsjxEtpPHZDuRdojeTIakvUAddrUpnamuRAqUY', 100135);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100043, 1318, 'fNWuajCLfSsTvgzUOuTNGCTifPNwWZ', 'OXnEuHdZtvVYTiYjKYVztWLoysElWUqejeSRMhAmkufwdbRCoDbtfKVAsdXvpJGIKAiBaHQcgNplEOsWfOQacYwsOxOtmaluTIOC', 100191);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100044, 4276, 'NyvtVAMckumwskmbrdYVMsRVODnwNE', 'sPSDNCKBedwpasmPKqBIZJVfoAbLTQEayaOGcnCqggpXykDVYdjEIrLsNstopTqAeUIuUrTbhrJyMffraomjcFKLNeGQRvrimBoV', 100140);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100045, 4619, 'dFDCOqIPCMzEBebnNLSLcXojgLZfFj', 'LujThljRBsrDAjwOymzzLFHXWxRQdyXRwIsRHpMXKcRrulcwarOXWbhlfNQKvbiDgXLuzYGZVIJgVJoUvVkEqgwOWbOcfwlzgaYx', 100283);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100046, 2362, 'lvhldqzmmvGNUxvkTZuAeJddENPKYh', 'ZQvTYksPFbTemBNzZdZBswmuMeHBmQnjovCpLOayQYLBSLYYHOkmuGXSwtRTbVrJvOMVKVtLtCQDFnxOkjFAlanjEZZNXZfqmnGd', 100288);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100047, 2754, 'WwXdwSqbFfbQfLOhfwsgEQXqVIpGCv', 'YidtiCspZQyVdpemZAXZmzwYzfjrHoBoFzCkrPJLQYyQQFEbPYORmMYlkpNOIvnGvpSQzjZMmBYfpABvDaHXgSeYvdnRrecJMDme', 100370);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100048, 3526, 'NMrCbqjMGPTESiJuOaIUWRXDoUYUjn', 'ctHUahfnmVHOpPbZhuRdFWLVuIbTcUGQiNXnMnUpplIaVCBDeHcWxnTbrcIaxTdEsZkvxezJROXITkNMHTrANmydmPNvRIzlZFBB', 100323);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100049, 4650, 'AKfSTddAaJaURkmMGUvjnqAtCeBvvu', 'txoyRBVrLUTSlTuNEWwMwkyMrmqQvPJPMokRqfAIycThViCHzBBPgGtCkptGdDFelxRcymCEPsmscjgSsYZXsVRYbekWyYAXdlCK', 100062);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100050, 3315, 'cwpZYbFwEiRxdCsrcazOfSpzleUYpW', 'CzVbUscMqAupOMvVmKVQYKLjuDoFZMDShddmCMmEKcnlvCdZRoceambrwgMxiWNVCDZEAqpURaBTTHMmqCGKpIPhVtLaSCMMhXpo', 100345);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100051, 3983, 'ZFlgtoHshPHEdijxxPhzTdBaUcXPDw', 'JYTkwLkqRpHBklCZyyJLbwhkhHvcyADbZfIQCvEuHCOHWsJIgbQRJgXiLslqvCfFQrSqzWmxJaKHubzidpRPtaVzGirImSiCmNVJ', 100122);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100052, 2353, 'QBTZUNAdDOaJTqYIthRXuGyDzGOWOA', 'wQBVcSuCtlLwXKQrgfnhUxRYKLoCgQLwTZpnHkoVLmiMgSUCzeriQrQiEfnvVQylepUEuvIXhJLgiSFaHVNhydYtjipQTgdIdjic', 100030);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100053, 4665, 'dxIeSemiBHyhXBZQaIMoXmBfZGmnly', 'FHISbgsNmucuHNefdJKQrXCqhEoeecIQicUngKdvaqnmbWqDlAgojMzYHMyrlafulPVZnoQTxLZESdAqMFjqXevCBNbvpgiTtGLz', 100244);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100054, 608, 'lLcjwkfjEGazWfSjWEOnCHsOaJzmSE', 'ddbucZSorzTATasXAzrtezPFGtlyBrYhIFdeegKJkAemRdPseZthtqOYNovBELzMqfIWRYeDpCnMATJVoqsdSNwdcOUOXKAeXbMe', 100296);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100055, 4064, 'tFhexZGXiTgroWQRHutxNXfSkQcyKK', 'tIhviQkSJNeEoCcFYOabbZuPMPwTNlGzsYesKZcTpAExNTYVAmaGppCdpbYOXPXZLqepvlGurDrNysspxNVNpQrciVmtijLIARvu', 100089);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100056, 822, 'bWMWwQHtwxhgfjUBFYzqqrABpRPLmH', 'FqSHEnbmRdTUylnxrEwJylzDNnfdoQJQjrzLRJDyQNJkHzmXDqXDxUSaAtcjaJkCMJjNSkKuMfGvJSXdwjWrutYRDqVTbgSTAacb', 100140);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100057, 4884, 'EkplsWuqihktzZtWRwhNufkLWBRrvm', 'tMvZunQZLijYpvOceFaQVNitDRBHhiLLxdobfmUnTilXDyfVdZiFOSChKqnJPDggSetEQYgaKrVSBxvnyuRWKCxAbiaBkraGYmFe', 100024);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100058, 1308, 'nyesDRiWqGfYUOyxqZIMCtGcWCpcjX', 'kcJWzHxMzmfxGfwZZIsjCCuCWdTMqjwwIoOFNiYzLSiGmxIdIobdlljcfPOASQbYGPucOUYLwAxxXSUQVSOjuUiipKjaHDnXbVqJ', 100259);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100059, 2056, 'hrwRKbIaEBcaUgVawKebkgJAcYpbrH', 'QcpXufitLtmnIMSWwhdkWsUVjEFRSXRGOofxDqStozzlOgixjdwfsrFJaJnkFcrvdKRsppDaECbZMiQxrMmyBRBbVFuRqNBArFyR', 100179);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100060, 1414, 'eDkMrhOlFWWlcPwIOxSJDxnsyZyakj', 'fQvMRLHDjgYUUBnNFRHSEJSnEgssoAIPtkqacfMgvDfMAVMxmvNXOgJQpNDHyVSkRApagkecvioHmDnseyiODZaxlmlLCTnTApMk', 100381);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100061, 4704, 'gMfQeNwoWjDxyoZtMbPcPwnGztnmSL', 'nBHHXFYDJTsmneqoShvQiZHpRpbARHoGLhBeJrXwZPdyaJxJQWiCJUSzoJbpzlPLdtHXLFGrQSWObmDVLqpcneXJXebJvqhTEuXu', 100327);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100062, 2525, 'JUfmUreTDvhebQjWBOOOvYeAGQxoSE', 'wBtiYxCNQIaaSGBlPEgfQaqBvdcpzhuBmMjnPiKQZqXiRKnwTAiTfrjFUAfrAwGOUboDtpUakZWVtbbTaTVjNqtuUXxvqvpuJLHh', 100313);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100063, 2734, 'yhSnPVsISlKrrcjfQqaJdvmPXaeAik', 'GgUBeUaSaECgZlHJZFeYtDNYHqfwqlRYIoMxVUyfZHsKsIoMlGDJmSxjYoAAMaysbxqYaePmkizTJTUnPYiGdwNlBYLdjTrXRbgL', 100312);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100064, 223, 'kKxzXELbfQrDmPMZAgrSCKjIlCpaLf', 'CFUqDjxIURLPHoRgFuuRGXgttjtisPkvajufYaWYBQmPzPWblMFrCNgcHhpClhabQwvGBduIeHxxGjhLskeDKNxplVfBIGWbvThA', 100139);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100065, 2079, 'VgIvhQhvSohZAkmSupCFLcfQKwVdEv', 'UuiuayWvOFcrhJDElQeUAupPjihUOZKuJxHaTsiCreRHmvXnONQhJqvfQzEUlhtNLzoTPmPtwDlJRzhBxxemDnzenWrgeoynNCpy', 100242);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100066, 4253, 'ahsmhQWIRhUtsCHufUqbeZrrfxBeVt', 'qWkZihxBqRyiKFmidNqWBRRSKNUAPYPAOhBnyTXckRibbKFJiMYXedlSxfrdDDQDrnVwnYKIfOusRWwjhEFIyuxmhJeyvnLenMxN', 100159);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100067, 230, 'wUFlevMCfiypAXKQkuraakOooSxLHD', 'KAHNKFdXeMMLtCpDidwKbRbgZqsqLantNwFsRwVhUzBBvMiHWwaVtkCmxwHKuvDtFZhUswVPkhcbiWEDxwzFYgcztifJSrvZvsgX', 100372);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100068, 1184, 'azeerygWhYQEZqAZCZDZeKjHLkPiSn', 'NEyEZCNekgzoENcFIlRlCEPKGiTEOIILZLSZCMyNvYkMlevcSfDFlXDWNddXOOihVfXQuHBwKxzAqmxUchrgOsIwlleGQFbtdLRV', 100025);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100069, 1513, 'EheUKuDeQBwLJPyMslVHzkvwSRznmv', 'bLgUNEQjiIocicRhKFqxJnAidiDJoaPskGHAXJqVGSZVTLlGszsnXRqABMtYkDngMKlKwoYbpFHLnkwPPEYwCPLrYqaKtzDsrYqs', 100297);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100070, 2243, 'zRdjuMVZesLqApnylqQZxEwAYTRvNH', 'WovyWGABdwBGLIzbSaohyCOBkDESmUmVVPGxKFhNvkiERtqEhNluckrsMZqbBuawTomOMbixstJvhAfophulyMZMTUXsQPmfonVh', 100041);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100071, 3517, 'LqUQptBORxmoZtfSaXeVUmpdVvEKvY', 'UybYraWBCvvLnwveYuGCVETEpRBfnihykMLfUtHPdIsCpVJeLwPnSQfUHpEOjDRmBVmeUBytUNBhgnhzICskxUqsRKFWlafeXUOe', 100305);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100072, 4260, 'LlgFOYwyHUJZWqUZNvsHRBnwsmcBbb', 'QbYEjLXMyYtIIiKhkRGQqUBTyJGutDlfffjAwnofqqwKKpfkvgzdFQKzXEnaMDskjSszVBeQVJJDWrePGQlqYkzUjIsZgdhTTZMn', 100046);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100073, 1529, 'fIieZXUwpuiMxUqAnEEGwdmrJGrcde', 'RrGbYpzsQGXICeGYaBvoARBWwIysDsKoXDjhIVlzPCLWwBVCweCNplgVLiUeWuNBFgYUYWxRmyoZXSumirgBgHfZkWatqeNNMhLi', 100379);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100074, 1209, 'KqZzZWjaayyJuZEhoNvsmKRndYllGs', 'vOsUZirTpWDIhXRyCGmaILiVmCOwRlUqDAQbDwAtdoYYGfRgINnyEKzAcnPlzLTyIBRbqKeplUzaxXKrQXDisOhHCtGBRnUpOJHI', 100176);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100075, 2065, 'mxIECuYnrWUjYhAhstFFUZfnqLfvgI', 'basFWueQXkaIgMwUqalyWgkInYAuaWXzcBjEbsMeVIPmGdoiaVNIAbmjOhdolGktgIyqYhreIJIEgAuWdKTenrtNouRwiVuirLoD', 100018);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100076, 1342, 'DIebpDsiZhbPRWBqDSCPCUbmFGZVZE', 'NLRDuziTaYskiDreHhfNaQvTvXoDrucWEbMiqyOpynFpBzrGRLAHugUmlwqSMPQLJzEWzTuoqUssYAHMyEBsswDbsUBfYeDsYQqw', 100103);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100077, 3909, 'JWPNqpYsAziVTlMwDKBTaZcgXfloXW', 'npJNwRWdzhAmxJrWgRxAjbBWTWHaQDXdDmmewFUYgUPYXvpCwBzNYhKxvDUwzwlTNhpmTYxekzXeAsQRyFzIYoPoebypulNgEnuv', 100209);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100078, 58, 'bZOpRJRylcIUdgrzjskPdpARHjSomX', 'YZxPyhDqWGhxwEKXpzUyDdVKDXOJSnmVWMawMJWwpeVxbWyOsjkDsbaYjsGWdESQbZMWIFqKVPBRFKhEmlNtfpMnXXAGyvLBEVaJ', 100314);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100079, 3823, 'BjVfNlTNuKGwjfsZBWGDMiwavfRavE', 'ulQkPWLqAgPmGvhNchxtOSHRltTcepsSVZQaxCrEkDOlvmxxSEeEczqUFddpLsvdOdpFvGSzNVcLipKnfHxmsjTahDpENqOtaHGz', 100254);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100080, 1871, 'xGsDPSLnveTwEGWFOHyuKGTpFWqMgr', 'LdiHDrimwZXicPZveYZslUUPewNKRyXwwvYVZbIPKFkkuYhwCPjCbhqRUOVbQVldjGMUdnFsRvbIPLrSupTmlGKrVlPWqdZGhNsy', 100042);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100081, 1295, 'enaEJrnSxanLRXTovgECSjwfPRXXNW', 'fGTfGhaqZfCKFBUKoiKQXiJkndgPqXyMiPOoBdWhRCHfkmPZLKnOiKTsMwxoIEbOoUEJsZnxdmvBwjFuAUNqIycVOkiIaXgzEPCV', 100207);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100082, 138, 'YOSgHUOkMzMtkaurWYRLsASVedQhfz', 'mYPrJnLMlJhzLEwuDpHprlLeLYCzzisAJxJsEnsMsKlyzkHAOhKaCotZnGbcVsmdEBMNLQAZMibTfSleWToDOoSYnshAEAkVXbBy', 100258);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100083, 1483, 'lCJIBxxbxpixdVwJrTyFzEttyOYpXW', 'RrYqrVjfGilRwLZosVSCwVibojzCJGkuWYrMfYvEPGBdAEwDhZEDGXDUOjBNiVjmYUiVCSdDDopHyUoMjzdwiLjXKSubRKNvzxMQ', 100106);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100084, 1552, 'phNKTuWosZRMjmIhJFUbMUDvsIyBiK', 'JHBRealamIJeuuOoVCZkVJsQbGaJHnLdVbvKDTdkgvgeKRFuLByCnUVKvKMxZbxDNjuXCTgdSeIodETNNwYaiwrdccOEtwEBYGPR', 100100);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100085, 2843, 'qRFMcbanaopctLFzLMKIuuyygjgcrG', 'kPRbvmIIyPGhhVXsArciITrNRFOaijBOPAExsSywXwQuprVqVVOITWoDMRmKVMBZgWNnfldcLAcSVSjrgWzJVBcdfjwFAVCHAAAO', 100074);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100086, 3060, 'HlqhsvKvBlPrtMTsPLmMrfsIsExNas', 'IfnTiWsOFXJOGEWyiksIvGATLLoLqWgwbuGDverjSdjkDyjucpogSGoOdwydyRYvycvrIwBRdLpaCTbsifPIMvCxxSSDFFGvyYHW', 100367);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100087, 2636, 'UKyqllGyVFXzTaIsyQCrXchGVoZomy', 'OfAHqPhOUluLVUXpSbveCngkairheTJaGQOupNMxeCuCiumnMdATJtkYwrMIcqYIuGSwvCGSbxAvbSRfWLfKCOWXbPeoTdhOgVCK', 100390);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100088, 2623, 'IjstKLnMbrTWApTMPSzuvNHSeyCXUa', 'CFymTeNwfIZUxFCGBktqaQlMfcByXSNHBUmkHdlJIUGmLEIbYdAVGKpztYmSlIBkKcdHJmkRRhApdnBVdRHjhUlUCeakZttlZoCZ', 100069);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100089, 1316, 'kukfvoGDvzXwvYgjmcQLdyZglzQkkP', 'wSygloyEVxsmZTuBQzJZNDMwjKepDrKjgpOGZnEZKxyaJSiJdbNKJsqxOsqbmbKQQMydBCXPVDtgscptYPGkFtLbgmrdzCUuhkHD', 100185);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100090, 533, 'DQDBxjCaGjtoLgBpYCcEFeawPkcfWx', 'EKCbRgjaLKAcHVcbuOrSAcKNrDCoqlwoRckRIRFdFXnORgUbLbJKCfeRpqmkYgqBBZDAtvihBtWPsXLJmhzvFLTRtKPTJNDoAYRK', 100028);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100091, 571, 'JDKEiuMgxCONssgojTkDYbPEfdsdZQ', 'lGaTOoyWpxhpzyqqGrBykfhvndScAbAbPJXHZoBWwwkbswkOBTKLOkEuZgbRJGGcqsCGSbXlvIvesZCzYuHPsNbVyebpbSwwdXcp', 100398);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100092, 2221, 'VJUWmthAiTcORJldOMVDUhSHremQoW', 'iwzImiEqJEIhEtvoplqdeodyGUFdGpmwZLnFXjrIeZzOuBMsmoUkyaKhYojAxvzdJeeCXYJrIjuukUcoxTujveuOPlWvehITPRbC', 100121);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100093, 1945, 'JinkvFNKBGOuFelPtXEVObZmPGmInH', 'kZDbJQXIcryYKwCYkEiBOliiVYprZaUNNOTGDuqtzmGipjARqAABBxVCxJKvutwyTmtroErkNvoDcVOrJGdbObQlwfhkAaWhrTOB', 100261);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100094, 1950, 'VOGdMddaOuUWLaOXCQwezBlcGHKimE', 'wiVvLLGtsuoQGPGJllBFqMDBSQiAHpBDrjiMrioXvXkKXWyaaqOJtKhqjpyvGLqOQfQWYnDDiPdziWgicLQSTOoRiegFQtqwOQar', 100096);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100095, 1338, 'ABllAGfxpvJyKzptjideSgkdZMhtpq', 'gnDBkoIwphYTuVRygCGtHwKMuKZBgXZDkMVAcSLdliVhAEfgnhtKhWZtEFjPGFLedxMnaZjvNHJdzwNqIoUJPuggxBzfsyZrZyMC', 100297);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100096, 4735, 'tPofZbUZGPqTTBYZqzFGvnLeMPgDob', 'jkYAZHWdMlBqSbsWvVrLDuPdDnHBNZxCSRpwLbSnfoAbAbQTyOAXzorgrvZGqSpXjLWTYsnAxvZKdFsvmAkzQGjGnGzuXNqSQynq', 100121);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100097, 2757, 'zxroYoRxoKJxkZbmeiffexYYFAPSsG', 'BfqIUosgjcDJDtRVGvMIDPBXvKpwuHjCMsLKefAyCbRSigifxaHeRGsRSHupCWseZlPwPUBRgfcmTEeTlYbUfEBCrczvfiUNhGxY', 100276);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100098, 4742, 'nzNfhKFQoDwvukIsiTMZYOqiVJveGe', 'qzYZQWDluBkviGZBriXooKNnoqttJLTUNHWGfBbHuINsxafWcDLpKzylpsMXfdTDtwTkNoeIsjSzmrbEKRPchcjiUgGyDwwKybRy', 100254);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100099, 1382, 'OBGaaKUslaPdnVxTONTEEszRTpfwoA', 'YqdIAynsrWKWGKTUvLhejplVkGMZsZKkKvXhLpBLGUYqqNtZDwOAgTpVRTNRHZTZsMSaNkFAdssEzzfJvNIsABxGufdSOTQejZRi', 100193);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100100, 4448, 'LJfJoWjMsxbkUOzjmVatLUNPoNWESX', 'xBPuwZCoTCOlLHmDPPozqChYnMAbtfoLwBItjGOBUnUPwVSWVvGySBAUHmurAZDYfOWKdLXGxHlqYHAsggKRMpRvuscPmxSpxxSl', 100046);
commit;
prompt 100 records committed...
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100101, 4824, 'eKYmvYfujjGDXjlXaNtBjLqwrtVciB', 'YaJsTCIOlrHPZFNWVmDlQUwWXUlILOqMrhTxerTPPKkljPfhUeQLSZuOiqTUQBSshxZnZRaDObvcFldKWGWHNePwtARJtpHGWNvo', 100180);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100102, 1598, 'XNbBhLLODsmPATWFXllMoUnWshGlGK', 'DLsSzJPNkqJfwPaMVYVlpVNIGBSCrQafaWEpRWzVJcbiLuVeVJKrYILswkDxxBFNNtJnwHzQsVtpTUiGmGNOmTujovHAzNhpFmzV', 100355);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100103, 3371, 'PHuqUImmQSQzdIZDgrMvkQABXMCjFb', 'VdTTCwFMteVGJvRwrygrjznjryDCaNetXnXRLfRoTjelBPkAOSlXsHwJAnXHUbQGqoavxXbfVVadCKvjzVbbqaDLzEdJbLCMMQFe', 100000);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100104, 3882, 'OeozfXRNnlkWVXwaxTSySzgkDAKwqW', 'bvXQDuWZrXnBgqyLYtnkXTypxmZNXeCrQAiHLiCrzmwRJayUdVoKXLTiNhnqmoIZcFbcTkwhKgMZuIMMKkGFmKviHkekBKceyNCf', 100311);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100105, 3472, 'WrtSuCAYqkeZySMvZiqziPfJHzKiBp', 'HEoyPteBSrbFWnQhFpgQNjYaMriwWQzfNiKBmzuIkToFeNJIGOabNKXzBefAqbpVilxGsWjAyrlDwYQpKoUlngaopZnpAnrZXwXa', 100277);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100106, 4064, 'ptXJgvjXvxrPiUjoTXvKZcUWMvVORM', 'whyQvYQbuatgUrixgPIWwHcxPKTOPYlatBlSBwANnfDkVIUElDcKnqEgbDzbBssLYEQusYOqhhohFGzeUDcgvLvAiwbzpnZPFNks', 100372);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100107, 3942, 'myvREUVSKxpbBedlYQxFeFNuYMmSbM', 'wQUSAibdhPriwNOnkQrgvJdvZBhxTIgoOmQbAsWFrcGObTXNIqoljsVwDiTfWuSnrvSHCbfsOoMryyFYUslkMtsZyjLXqvGXMMkk', 100148);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100108, 3663, 'SurJhKXIhtZBqcDjrLwYcMtdRrHZWb', 'xcDknQahmznYCsShwDBAzVeKKVlHNOLFTXEVlVpjzvLMoobvRKwiZvQwyJSVXJmeMJiedeHqACIcsZRXtnMhdmaLakpabPCAgxSk', 100189);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100109, 4031, 'wolMyssYSkPLjRLKCqRcysKeXZOQGw', 'HxHQGBSwoDcVozRvBPqBwYZhFNrGITJMSOwGpcpvmpBXIDoMVoPyVXpEuNoNKnXbBHZAOftgesjeFEohXXpmTfIMQoaeYUXMuZIE', 100237);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100110, 905, 'dNGAroAYiargRgaBRZhOzYHoewgOnE', 'NJksMTXzYEpFXRWOAhlOMbhxKuLGtKWgPnKamGzaaownjKPsGffVupOAVOpOasFKlcCquZDkXRyRKxgXVixmSAePSRcLmBXjMAvj', 100044);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100111, 1383, 'MOPnmZPdKoschdndPTtGpEZISliToA', 'cKFDLEAhebkVcvToGDbpoggbyyDfevJnlIlxgpRDJYfmGUMCUtFFCheJYUcVMHZjeyDFpMlglyXsKZfuFZXJuhhkkWqtZLCWbVGY', 100264);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100112, 1631, 'pgpxHeuSxpYxzMXjrPorVZWqsNaowe', 'IEXNCRXrnRzagPaQhcHZRHOIMKifbwjyrohbFXumaSEBByldDTxgHXCdNMzjAISAiMgreRROhbJWAphOkIgUGHrheGpLNKseAfHL', 100353);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100113, 4164, 'tKkZEmXEBWXzPiEZafTkbBsxSRqEyp', 'GXLPEuGweGQQcKaEyooKzbMChIVLscYwUJIfLRGevvgapeMpHgDltynGgqyeKRSKbaDpGAjUBvqDDPvQxurQKPbgumpRDZanWWAg', 100296);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100114, 1827, 'zRRTEGcTInjlgWzBuKUaddykqPsgXP', 'ijAagGnYXQLyIicNUZjcsmAZnjVZuVNCGyDseVgPOSfcxMgEgXCfZoXHcdMMQJRRqfgAWoKPHhamUlScyNFYavMLokspuwtwknCT', 100197);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100115, 1481, 'lahXOrLEjuJFGttKcTbNuJegKfSwkZ', 'iRQhYOdGQhSpzCFmmwZRwexACPosrCZgsobDZVepuFCFBqZAhRZXbepioznQUWEMiXNQHAFOgGQaUtMnsSnfcCgnKdNzPfdMYwPi', 100133);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100116, 1565, 'TlbghRoGcRjmnoJeFUffsvqMxAXJEx', 'OJtPRiKBhtjZTuFRfWnNttKzHRqYNNRTchiCbHnLehKQsZtYKRZysevTZMtNliMgZNaoGNhVOkYHBYJpfdeHQZriwZNQrHHCVuqm', 100249);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100117, 3657, 'kvPrAJZeMJHWcVgEQdDvpDntoEcdWF', 'PEjCaBAqQEhgPvhromWVmvNyVyjJBDxwfCyCAVWxESVWsyOqcrsAaJVCSTfLPJRsBjCvLwxEXcEbdaDFGVyJlSDARVwLjvfiDnyk', 100097);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100118, 2924, 'WBaxejbNgsQZktViDQAOXoKbsyyfHc', 'sveikeAgtFMHeFylStdBSONYVjUirkGmqeusDDJXLaaixwhmaTyBjxHsaMTVhrWAJMqAwTaaMwluVsorKacsmjIAYelJhFKebuTi', 100395);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100119, 2403, 'augJHFHvmpqZkvYXpFtulwDszOttGQ', 'ihNlLpDgJkVuYNEGniSLDxXFyZHUyPskRlDHEpYVmZPDjLGgeihoPXkYwUMhshzCDANBtChxsfTosdqEDXRPwmFBcPkcldrylOot', 100093);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100120, 2930, 'yBpumpzwICDQzIDVdDkUtekLNImaJn', 'tKqFofBzSQPpXvetQJFpVJuQBYWYkyvVxanlNDmfMEVNobwplPetnWWEhdGUhVMpHoldDRnHlAQsdsCIwoCgYMeEKEGvNIAvweYF', 100112);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100121, 3284, 'cveoJPYJxguELOLPMTCqcIFQfOLzgO', 'ZXHuFWtLgkNNchLBBIuuWradpVWLAUqjEBYzQTceAjquezIwuINMMHeVTDzIZpZJzqxoctuxrEGWUIOqVKinxfmTWKHzCeOjHgRV', 100198);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100122, 1124, 'ssLlGODvazrPvzFkYNWBfZWnSPRUTL', 'YYeAwrujtwnBHLQyDSvUlgmCeQZrPTkVvQWCNyMhdNeTuKRsJFIkgdDEPNfiiBNJhVomuHIdyjNBJQtHobgDdlHOkUejtDNHyVet', 100263);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100123, 3035, 'VSCqAAswGTOpOJzqwUsQTZXMUvKZml', 'FzWrlJEzIQNuTirVBzcLbmnTXSNNXwocOfkkBRtrCufnTZrCqbAuHMcliwIKpNujvRlhQdxcCDConkaYRuejDFrESnpCfQLlfMHS', 100130);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100124, 2013, 'HRziofnjwUitiLBfhzxzMeqHhrmmNx', 'SAcljOXeIlpVTrZyZuFUWeQclIuPTrRireHZUFddmQYnPykPCXzDGSXqqNORifsOamWffzRUSVhNKBdwNDPrRFqqdlZJEfJNqDPB', 100323);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100125, 514, 'QZSeMXJnWztdPhsYOvrhSMCkQtxxxQ', 'ZlHdxovAtHsWddDMAQhlvcwIqsmxAmDEqgPbvxhmijhmAEREZymbmlkndlvKXAQFsGbTMqkJPGZzmJQsFaxvfseNBGzrnxhvCETJ', 100067);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100126, 3675, 'jBXAHJiVSQIQrcgCcQPXXcoVZtBTxk', 'dnyhRODBlKNNCbcOqOcrfPurrvpKfcSAjyQgpFYjDmVRYkxvYkgMZlhPXIcNsekpneaOFlyqXgfECWIHsrIpHKVJlWiLbZcBLYVf', 100320);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100127, 936, 'WbHderCWLJGTjxcDuQnlmqtqJvpjDk', 'euaoubaJiTSgoGKnJfZiJfBrfmzmTwIdCmSQGWlHUMmalIzQAJKJEsCxzhvFpWxjqGDLjjwDtvwFnwUmczTOOkTMVVKwBqMvXNVl', 100284);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100128, 963, 'gmuiwIEFbUWmMqiUdIcKbPfMHUdwsm', 'BApwRjohxCeSyqYVVBjdRPQxISYaoETTboDWiVyuKaaiQFjEeFGqjDiZrNxmumpDqjquDPpWPiCLPgzYCaybQBhnIccPKBRmFzHd', 100266);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100129, 4403, 'wvMyCtBApemoKaIQivUPVHYheJEDTR', 'fGoZYlHqlnNTcFmnxPyREYEDRhRHoIrfFrUfvKiGWGnVMuMkREDlxtrMUjtnZxmweBUyoaEhFfjJNwNvuZczAMbZjCWvfhPlHPZO', 100247);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100130, 1870, 'pZuqPQtCSEbaSceSRvUYGdsaNltxZV', 'ADFnfwceAFfIgCCKDkoUYYmBXvcrJYEYZsSJHjJQsvbRDZtQdMaBjEMuKCrqZWwDoFMOhINSmCwLFfjoeaFvQFUFGztYnTNxwxJP', 100145);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100131, 721, 'EzPDSWWvRFXRexMzculBKIgkpAasgk', 'rNWvvhSKsUMxJbCDfgasvfhGoDyYHtyuGLNBzBVLCUzyHNeJQbWAfXjNeCcxkdjOEOkArrPmjgfVAZARDoTpptSxpMxkjNZsJcHi', 100034);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100132, 1674, 'pSlRAFWtsCuEvhWfHJVoMUpeKMzUyZ', 'ETnbCwroWMbidSbdSODjhNMTNkPosjpmSHSSgWFDYKnAyUHHPURKlsZVnJAspBzayGHZRarDSgxIGXkzSurWLAYkbaMuZDvAiyHs', 100081);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100133, 2081, 'zvhAfMbZvZhegPihbOIoqGWVMlqWXT', 'RUimEWxJpNPvAKOQqhFwyATpOahGJwDAtptjAtqztCcyslIKdjehjBYpJOAlbLPVoHczxwJXsMfuinFsSmYiWFqXvnlLrEknedOD', 100105);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100134, 2669, 'UzovWliUTdWscjCjpBFWTXUmsdQDDw', 'olvjBnlGEdnaTPWcieVYrggpSLlaztfHONCwalSrqOUvaxIeckTNikNoEOILCnHWOeisByvtnMSNiNrcVqdVFDrwnKnoUYtzHQzd', 100053);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100135, 2011, 'AXlxxyQiTzVUzOOviHewDsHUoceDwe', 'lcoDbbogVFxLBccDQvhpzHYFvRiWzmMKVgbaFtIICiIcqrZrPUhzxJChhZEpaJfzYbaqIWahntHZJHggcPQzPownoLqhsrosHmiF', 100342);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100136, 281, 'iEBYDTFiqCOcysKQLizCHfjuUcGBeY', 'zibjMCReidkLzMcoaShSspcOGnwaWarYMIMCyLEvcWMmeWZorKmJIBVSLkJWWfDipAmIxygCuUfPRqgEjuiyMqHPCDhmYpeUpozt', 100339);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100137, 1465, 'qBPZAzmOBJQcajkbmkZpZvfGuRsUuk', 'JVcvktGrUxLcZdNxGFuBZnQBqwmIzgQCqaXagRAxNnWYCvnesOTbeLEaaOtgaKYHTnzSZPasYGgSPlqHitcuXUJDfcKVIInhIUGA', 100130);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100138, 1791, 'HKGzsmKjGBIAoRfRnvxZvZqNnHAHQu', 'haNnhtmvnqwrcUtOWaGxnxsgvCvvQvxMECJXRxTdbbjnfTRnDJuygvERDXtZvJtdOQQxmLZFbDChFUhxIrldTwnZRjDJTmpSUmIo', 100003);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100139, 2445, 'lGDXyfikwNBYxmVZShMYNiiTrAdAwW', 'GQjmQwoRqqLLCpLwELuOLNqZnkFfZbtaixWIAINVHSASQkGdjRYEBYFGhlxvclySfiGiXpRwRWVXJPvExCgKXohkngVXZBopskiT', 100175);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100140, 3789, 'nXYPbUGrrGrsKazrmjHdhrDWBsmajA', 'QSokrKdNqjXijDbGfFfJxvXdDIWCraUoDVSItzZfyFeWwrvlQMqHTjtrvkfIbaepERfnXSRxTwZJQoRmgBXxEKyupBWKwgovzcwq', 100069);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100141, 3618, 'vpPeiJzQZlgeFJIEBPwkzeLiWJclbD', 'RIYsMWZUvtMPizAmEDwBTkeEKpFyPDgbIxXveNfzrDPUejhdHLGlDKLwyFvxnLPsLXgbCnoIqvEmKLpGUQrvfHEYqqnyzQqFWnBA', 100364);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100142, 2788, 'bdsbRnbUtxUCoOpwyDvMcaoaTjSVUl', 'kBeeqPxQOddVHPizucDXKnKVyGJGZimFSzyENeLIciGnbLKShdyoJLGGZwvUeysPxKGwvBVpOKwRxxgJcomxrtGXMvDVBkNZijhY', 100009);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100143, 2403, 'pgjDiBPRCnlqJcUdhyDYHGICvCVToP', 'LwQCSjIOXQVPmztQQShzzTyXNLuFNPGsilIAViprkaVtPjgShfulQvwgIZrFOQaeEWcHEsagyfoqgWMMGmraCQqkgLjHmXrSxZay', 100315);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100144, 2693, 'xIlpiYFCQNugFhtxfoqaXpwooZGteZ', 'tZhQqllUpjGZNkgyPvTShsXfTCwHMVzxSlwYAfMBepXZztvoctUpAGHTJCaUibFqpAwWQtIPjlsXkPhCJvvYKvFunGfQbodiOiJy', 100351);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100145, 2589, 'tbnZRofudInIFgfrhtQvINRPsvBfBS', 'tXJwGmJmIdmgYgPHgJmNmwbrGllIxnDWcBNwaHWMUJKWyvslGLMQhQlgTvQTUSYwpJhWjImWXpxVJVAqeHquhiaoWcMcZkkaZlZk', 100202);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100146, 1078, 'ArvKZYazZtBOokOfKSFCcFlHkiTJzg', 'FsBcHJrwMFlUIEhmTMoigupZWbGzONLccFeKNOyxwYJWaYWHFQcdofGekLmzQCqBQocLPcYbpjxWTFHsKTCOSOeYaiHfcmXQDuuw', 100136);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100147, 2482, 'HEYFwkNmcpfgUCllgqKPRMypIYaKRf', 'VnwxbCrkClSZIJoToFiVKkkBAOVjrPgEAHihaKlQjYjikiVkhSrHDgKDilVlXXMtbtwjZfDXvYcxJXXtnxuxKYjUdmMFEDoXIump', 100140);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100148, 2834, 'ZIoELzSXCTgFTIUpWFSxlbalneQJYi', 'aOKgDMXHElggXrzjcRCpWbFbXiyjwcPudlroLjPOGMuSEcoHFmSwHCjaEboZwrYJuzSTzRpYlvttZqrJhuNFuaUMdKWjuGHNzKBW', 100178);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100149, 3558, 'cVkCnaIqDqysbxbqviyBrUNjrYnhlG', 'gEazpGZWxMFOHtngQwCLmlxEssQAKumkgJzoiuDbGEJWcUlvmxljfMwpqRtavBOBpRzostUzaIhZPABblwvuwANDZlHYOEAItdAF', 100107);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100150, 2388, 'fbFjgWBhyVusVshRxYyTLTvmkfIQWe', 'bJyYKqxDvmlYWTtfhSdSvXyRBarlQoppNmhnaKbRYrKGCGLKUBzjljkvyYnWEbjbiSaEmriHHFRepjqMGlxGVcJQTfrhZYqcQvCl', 100331);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100151, 2244, 'BxSiBnxtTDHRTyCgqIzWfDSmdOsxdW', 'DQibmeUUcwgpozQVVnDSNZSJxhqayxjKpFNiPtiaroDWzBLJbqNHJMsJlYOrvyypPpDrtLUwCPvkujpSyWsBOxQwisbndxCWqUDh', 100395);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100152, 4157, 'sFkmanzVnayQHnWjwCZMKyYtoLRoFH', 'VPyswlDXkvNQSWnwowzrceZixZRPuolNPpnZLegrOjSkYKtXPIYrXaqhVcMCyNoMpHEhzKCIFtTTRPgugtTDGVwIkFvApSaOSckV', 100338);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100153, 4936, 'gGVwPcAMUWztdrdxwJHszuhIqcjlyW', 'YIMIcOSYAmOgQbtvFOijgNGbCDEcFutHZASlVSYDjttUxKYOhrhTOGaPiKBQtJTHQxhPPstZDAwpViqgAyfefCCcQwoSBNSBuiMP', 100237);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100154, 3411, 'gpsNVFfakQxbsGNSBusrRqvcSxZwbS', 'pSoyDUHSEBwQuoQlnZQvkOLDlpwjOkQFvxmWUPXsuFtzsleyxLGNmMsNLQsWGsXcNbFBOpGBZZqZRrpbnQobyaLUVDyuLQydYeiQ', 100345);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100155, 474, 'hCrmAJAAokuzsaZBRLZeKbEJOzLsJP', 'uBZMYnTiMIfrumaBBTrKyeBZzFpQdDYEbBhuFokVUwAWCnfNsHwoXcQqDjgDLpNSCWQRGNvrbDucmJHJESSgKsByKORaVzXNYrbb', 100094);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100156, 4565, 'SXOYsuUKTFcRCmQkTqNCTxSOZUnMub', 'VaZHOykPrbRCIzHWQBMYtRzRoSwchfyQZtClkNCMUcItFQASGJQDLgPIUFMkLYZxVeVMMWHZQdgAesPgTGgACCSlnpqmVHnUuOdG', 100099);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100157, 3402, 'SfYYdsZpquIpZiFrnLRiEQxIPXGScS', 'pUZhMMKcQzAKNNknMgdEnKYrGNFlFVRABIFkUhfrkKRoVjJQpIduNYsjKdplUebwNzfOUNeQPsunygoXjonnoJHtzEFIYgppoQbT', 100133);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100158, 2736, 'LRiNZnnoEmlDhKXXyVzkIJAmRvtFRF', 'cWOBDWLFhlfjyDLXxSqNYTDxntAAqJpArriMXZLjAVPglmeSfLGWKTEmCAKbeqCuIXqAnwueppnstFcBKgFHZCGpCnXLbSlWBkZy', 100358);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100159, 1764, 'xWitLGRNDhyzYffVenRYWGKqXtRGsb', 'riCyJuAGYXmpCbSJhQACJyzbZgLqRymkjXXoHVaZbtehfZnUusgTdTtgwAreIGkSaqeYaipenPfGPTyJkGiWYRIyOmLoRrJOyxqe', 100294);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100160, 4992, 'NTiGbFXxuoKUvqDOQqcsWkYpJaOSrF', 'kTQSSKKHTfvAAZQDsMrRsPJSBKEfSTEEOldFysJmPvxUsEFbXghPoOMJvbJugMAwzBASPglfwMMnuWwEFRzGPvdrKonqqjgjvJMV', 100224);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100161, 3814, 'BhSxfBEoGUZLyqqdRkrwzbXUwflqly', 'MaNblIfVuytDXTlDQpVnsKNqHRUFbYFFCUXePOTLGGfKrWmUOStcvucvoiTBXxHLEJHUhgEImVqNUCwczlodtAboBgthErUrDsCa', 100163);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100162, 3439, 'xKxClTSbROePdYlbIbagYLtCSZzgIO', 'tTRMThayFVkHcMjXheUcOEVLugDfHnUFcIzOIdWaNAfJWIjAUghbcWgbCTYapiBYufPLTXMJNnQwHPXKaXpducEVcHHnkQYQmqQc', 100267);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100163, 3495, 'tBkFSGSqcoltczpzwSssgJUJwxWgDu', 'xKpwEwPdyAeGvTjSQOzumTyYcxtVUbktyMpJntCehHwcmNMtWUfAozNakekxgpwnhAAoMXWXRdNgDlWwGWcOkSVBYELIiBjdOhlw', 100133);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100164, 2078, 'vkdwvESkCLBVrtHtppQvInYjWnQyin', 'NQQozBUEaCHQjbfGLJNhfZZHbCinIilCclasqpadxdptbLozHJmHzjtmxBnpcvhkOXSHUKgXRwmqVJdLLhleZToRXfZFEjyjeDGO', 100137);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100165, 3800, 'LvdMfAAxLTzBCRpBYzzdSBLzUmgCAq', 'VbctwMBLpeyeaEgWrCAEdMfPvlrKtcdsLUnkaiUmWFBHDqFcbrsOkmJGSTKARdeMUnsoRUNPUlEblJGfMcUkcEbmIjtlSaDvzCCu', 100176);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100166, 1481, 'HgHwdwNCLzonnWyjFjTbPzAgAFZQYs', 'qRCSHDoomrEgzaMfexYYUxIcmGnyRWcCkSRqxiyjnoidgFFyBzoXRdKgRXFQcuhgTLLEInNsaTsIHhTNoJXDtojhvyCzzBWYAAFW', 100018);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100167, 3546, 'FESjPTpNiLebsCCHDLXKtHnODjeygr', 'FeVNWJyeiTWHgKAUBESfAqcOBhDNRanSvTSIepqANtPQRrbodROVPjyJIVBxsBDsSTtCJUStQbmIEJxjQgPelsDensWWgylNxBfH', 100139);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100168, 571, 'TAKnXgHgqkVNVbxOATNlmfFtjNWWSO', 'HeKFUjrhcgsfbwiPnmMlEzwIskcdNBulnHcQZHcFqeGDtGMHViFIhmaeieGYmsZmgkMJRDvrZTXjJUCaYZOShoLwnvwICKxKhSiE', 100081);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100000, 1244, 'POxcsLYCTLerisIESWrfOvsLAbmEPz', 'iyaixyoJNBjwTZiFuywftfysDMOlTWPmaQHnwZpbCBrVPZvZdsXsjRZPsKdvOlCcUtBfqXncIKuQmVUPVbSZYEKIvrfIwAqjzeue', 100218);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100169, 1968, 'mgwlTlJzPfzxixCSARshlvWFtiFacv', 'cFQbdXRLXasVZpKIvstsvOgTETsgxUsgRSJDLRVDwiMbBxcnochlmfjxXBBRStTNXgwwIQmeHyPLPobGuqsXGreGiLCbkHFrrrDk', 100074);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100170, 1315, 'DnfTAMlQSHtMrBCHLwvstxTveOGiXx', 'QjMtRZvZIEhOGcBefEfqIKddZdlbfTdYNjrwbZiLFUYtxkVEybycDfXvezTyLPpkhizDLMFUnmoPeLJEwVRcpcijSbvZXSRoZHyt', 100298);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100171, 3620, 'hcmvGjmJOjwdyqaRJgNmtuOFZalekk', 'rrpJjsvrAeiGfgcEVmQhOwZpjKquIENhwDfXAiavSYNhLhLLssueTFInWdxJPHIppmFsIGpXczDOyzOqtSMOXOLOcyzzIUkKkXrD', 100294);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100172, 855, 'cDUkGGDELuCIsClIGjKICORFAVveeQ', 'whGzovLbTVbOaxUPuwbUimUxYsLbvyNsoLdfrcvUsqBkmdRBUDKZgRTNtNiTlFqoJiixTeEKYNTlQYKNwlJqgdnpVzLVJBfqSbvG', 100043);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100173, 4065, 'nPVOhksVOeHUbXEUEaxbgPGqpJQLtz', 'cZpVcbNNUxZZhMlHyRxoAYeppoLrBayTCXgVMHWcnfGgLsxQoiqMhXmUOoWyutzItVfByzCEsIaxynfPmopbAymjVeSdDgOfGciR', 100055);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100174, 2346, 'ecUXVbRKhEHwkzIfAzteTQbBTFzcwS', 'ZXiYbIPecyMnzrLAQqmNZwHnNUcmXPXYZCNQyGAMLHvFEXzxfkBfQQbabQuyOArsJnvtNZAWrWiIIVKPJQyQgcftwCrfwCkWBRmO', 100095);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100175, 2746, 'XdlZIbQMpCPznktsYTfIAjhhcHkYZR', 'XYSKDvsbQzdbekobvHzOHdsSPWGRNWumYYRMgsQmazAkgRQHIjUKrZVMxKySkJWAquxVQekynzwoDuGIAhIATvRIaAfzkYoPfrVg', 100356);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100176, 3312, 'SDdVpDhjQsrAIsImTBublokvbqEweR', 'lfgzzzFdINWsADSaXIgVacbIesLFqashmpgkbJRuHATZVLsCQeWowxdZwreaMgfJhIqbYcpOZipHTWkiEixTGdjUDtShsqznJCOC', 100027);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100177, 3274, 'GwTKZJUsqzkFeWWqsrZyBnPGsIMqSt', 'GUiCmBjHMMoDSCMvdFcINyhMGQgDcSeSGHIZZOvcRokNQhcFEwTpZTyiPICfGoQhdicAhpGNlPNLNIRrtxzSYQrpXUPMpKDRbkUh', 100193);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100178, 160, 'sLAhbMfgaOSeEeJzaWCMdrexTdJKkM', 'qtOimXQFrhrzBkFWgEbAMXviNOxkNKIHVQJAsWYCSdEpZnClAXHUEjMhEGryZWAODOGsEBlFMJoTTSrqYFNYETgztfusvBzfPMLL', 100225);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100179, 4033, 'NazMKiDSORSLbPkXNRmoTjokyHXjEv', 'EfcuDQeXCpcjhafGyLpKkvZHURfQFLGsrUynLScHevpuvsIhsZiCrKhDMySRqKjbdYbOxhblGdLUnuEaQsyKmeHDBwhzwPiOnpUv', 100269);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100180, 1037, 'AKVAtaTBrHCHcXtGkcoOHZQBISHVEV', 'YFMuDhSYeTOLsmdouvcPlEXrwpNlwYqRqJcQpyeuYGtmjniVSWoMwybVoTRdozhmsuObPTHuRzSuzgSqNuCrLcCJHDydmwIvcqcY', 100041);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100181, 295, 'tFbvzCRIyXinHrNGcvaYEFNGvdGckR', 'iixByKGZFDGZwARiKTlvOAwVIRsyHzWnVyxXNbDkoKHXKUkFUfzeFxxpZKUbbWbFjGVhOePtEOetyvPYshVYWGPsicwTkhKWnIeD', 100039);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100182, 1980, 'xwgyZeVOwTHAtMdKGHQLhSynFtvSPn', 'IYycQcigJRjUFcoQkVAbgQfGlmAVAuZSXMIKkNIkEFbCBCTfwkqHMBbEAGXUGrBmLMXDVTPLiaHwNWHhDpKbwhlUzQoHFVBPtopR', 100205);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100183, 2011, 'AmzpolQopgXuuONlaXQpTOLbDxyrqe', 'MHzCfkCTrOWkhNrRwrkiZAdiStswoVnCUFEXRPIObBxmdxPwMuJQWwGltmnJtaYefsooqJzrGCwnUrwQhyKPdPMzzbcxNjrXkvFk', 100177);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100184, 894, 'FpVIoGeyUXfDKAcSDQjaonyMIuexgi', 'AaicnmzhOYdpeEGbVcazzjUSrzPhWybekuQkWZiulVkRpbjaXuUWSWrtEsLgGaOnNSTliAsLLMJBeywHHVdGUwpdwBwsOVPsQTNT', 100346);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100185, 3737, 'zanrHVVMNBXZXZKsGtWkPrtlCObsbW', 'yFOpstAoilKqHqCNZfKxppmNXfLDwhJDRCRCbhSyVCbXEoOFWvzYUqRgNlUiswpCHugDHNnEGjERIBZILxLLdskuRCwlFnrgcPfY', 100368);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100186, 2017, 'HzjLzVaWwHsgdUmDfJrRZahBXzFnhy', 'tSBlWDSiwFpJHbfgVxUCVtSGXGoEGCmkNkQdJoQpdHABkmsoWxACMfxKeRfKtFyfseCtaQyFWqxHFBUJgawqNFsXiFmJxDRyhvwu', 100298);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100187, 3401, 'xCYMauzutxRCBlbfmkwOWGXHXbwLoM', 'FFNIiDUKFiWBOhSvgsAFOOjGaPlxTxuOcNBHaKJZnWMFdWncAkTZSTowgSzcLLUAFojwxxQVYcRecaiqeMaQZVGJBrvBKwuWinbe', 100201);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100188, 4479, 'hDmEKTqNkjGUArfjEsHCpGyfdAYZUR', 'IxZUxPJcNvQoBJXJWemXjrXobAyBDzlIaWmTWJEVJuuEfqdgXkpGIhwCXxaNqHiLiGYAvJghSKyPdEtdLPeCmjyVKfgwCTCWhFYX', 100256);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100189, 239, 'YWCGmBSVuhDUjybcyCAVpZOYRAhaeU', 'lkUTevnZOicaQYUCFSWzopPDOZdmSSJutkZQtLajFBYSjbJvmwuJUbmqcjDkmcvcHxyshWutQoQZFkUqhAccsjhlGeKCfpZsOmiG', 100122);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100190, 2603, 'yKwtNVapsUVVYclGDEPIjlARpkViXa', 'IBOnSMiLWPDXtPtVCzpfdYdJSSYahVXfvRBZDOiJysMtpgxtjmXKKyCVmCbFCnHQtmqZplpWWZGqoRVHDvfOQEDZBCmLZsUwNbMF', 100365);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100191, 2859, 'WlrSTxtVsvinyQPXZMVwPEjzHzktRa', 'kqgQHeAGtxcbSGphrubokwhRLiRLrCmFTnxAjlXfUnPwXPXnKeGAcYJbczFnjzsxNOLpqoWEvTjnmNcdxAlipHsXCTFdNmgPKiTA', 100007);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100192, 3149, 'MdlBZzEHskhRoAYVqiKkszBbkLheOX', 'jtbCtdpwQsIAuJqmKhjfnJTNWWlyRpkAdXEpIsTiOaPsgWKpKxWFCBhtgpOEQqqLGiOAAtOKoVaALnUzpjzdfdlaSaudwzzHvryr', 100007);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100193, 2988, 'JpTKpjfEMdwoSXQKTdQCjYsnTEDgCx', 'HEviNqsisvXQCRzVnOlvuomcykGtydvftzxxHZKlzRXVhACLDgvVHBxXnCbBKPRpRzKdpbNIaJnwwmXoYNGLRISCChNdheaxGwrH', 100261);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100194, 1683, 'IaJNzijITswAghpXPmGysJoiKtEvxh', 'qGEobYuHkqoNcvdJHqEzykexXSxrYbGDIKTaMofIdtdAUcsuAzppmSLOMQFDkLAaPvQWLDUDaRRfbpLbWbGKSvignNqvZjKjkIaf', 100316);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100195, 694, 'KrLyDUbfviidFMAjWwKBVRCToFznHS', 'OGXeLOspczKkOrJGVReGSJyQVzNgexxXyirfTwyOiiOFXEnyjNbmHlvGPiLtreiRDJZfCNTCRmCiVccUvxZuKUoyzyFWsAqAeaJs', 100163);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100196, 2959, 'OFGTDZBQoCfadRwgWxzohWFkbuUTkk', 'WVMSJgJkGurJwmIOjFYjZCgiqmaITmtkVcguOQouCPIjLJSboLiRJfLMnLmUhsPivrNpROCTXQDTFBHNPDDKvjPANPhFpWhJIvbY', 100261);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100197, 292, 'gyggoZqxcSkwrXMKVpXuzSWrfnbGsp', 'PtyJQiEGxPfLmjQRZRBESILibDooSqjlQPfFnRmgtJSbuJkHtSWqJXuLAXVNLNgfQTMkBZOlSGeDegDVkrxjWNSgbsTGpbCCBDYz', 100340);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100198, 4918, 'fROfyXdXfhTWuImVMysIUzIKZwREvZ', 'syJHPgJmXTBxTocIKoQAOKozNYgxroOIWNXVzKBGGHKVxRJTCVlrydRtBriRaIKXxKqrjZcCQGdYEAjnLrVMRTVTgaoCqURbVgML', 100389);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100199, 1623, 'AWGeToeYIVWpPNPqqVFfPwQGouxPbT', 'IGvhEtWJQkoBPLRMEPYxCzDBvyBcApXXKZrKwfHtJsBoNzzNbWnyMNMYIdRrFsmJMnvVcvWLSLYlXxnFYMGcCWOcMdYHtFHpOYkn', 100055);
commit;
prompt 200 records committed...
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100200, 977, 'yiEyfcVrNPckvPKHGYjfLdvNKjNFea', 'zWNBZIPrZHxVpKzOwPHpxfRqjawvYwwNqeRpmQJFqAMhyNYTMlWViLdNAiCKIPnoZWnqbGTVMVJGEiwrsfROvvsOazfMgWgfTcMG', 100306);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100201, 2545, 'cDjQKIkUikFIfkHXhdjNrahWlXiWmt', 'mpwDURHxUwaPTvybwQlTMdMSMKgHAwZqKMBXOhTbBMjKPKpNUsChCDeVlfXYkzCkePASVxqvFLbEApzyLNhPBEnUDenbKdNPZDnz', 100206);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100202, 1708, 'xGfBqjtlsnasIwAzCbOJdNKVNSeWNH', 'nwXnHLXjWOVyurYJJPuXOlapPINMatYnHMTGUiOCcUWfovLEHGUnKNYdrpXTYmksMXvimRrkhAJCQQidmBDbGokgeZmBllFIhXGz', 100033);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100203, 3585, 'GfFLfFuuOaBUMcmNwvcqWgJhiwmIHr', 'QNxMrLnmPlsZQIMoQzGUiWcUXcggrbjEhaPAxpSihgUPfpuhvGQlWHxfilFKGIutLcDpENLZkziOqJZPlqfOqKstLEovDBLkWyuD', 100342);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100204, 631, 'SNrzhcMhguHdveslQLnHaOtuNSkIaN', 'gCXCEEUJrxAEdKQWdIFdcHQqrfQXsuPTbbUdsYXgdhLBSbPMQrcwiQYMQfHgCNSGwgtfGhLHhbthkVoWttzWHANwOKxnonTYnnoy', 100039);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100205, 2047, 'uSpQgyNtQsqkhSxkiauyWDPdzephXV', 'JSlwFeDwFiyfPrsQlINHlREKCBhOEbdEiYUytuVEdGOBGNCIzGDSGbHrWUOSabcqHepbjWKBImUDqvkzTcbRTHQHwGDyKsxnQLfM', 100000);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100206, 2993, 'AcIuiGLdYSKbLEaCaxemBoutGobfml', 'OpQBNwzfwkPcDfTlPyIPJJYmxtDsfVZDHmYtHTvHlBbgPmuIKXufXzEBQkdOUOPJmQxXXTSxqaWSzNDxZhuQYJgGFnOIPDSvLLTb', 100016);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100207, 2848, 'PppSdGgkqbKSSGofYBwQVqPfIyPxIh', 'ZnqkPvKEwazEajyUmiOxxwuTGlOPpTVflEaEcHVkotttMqKOZeeXzxZDzGbzkopCGWYYIDPgHTOrtOJqNuqiaVvecxFdlJNDtEoY', 100196);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100208, 2601, 'diqYloVERceDQmzqgMJFBEDHjmsSED', 'uukViAyoMzXtKhnXfPAlaBNTgURaednnfteVbgiKhOWcpNrAAxMVGQmCBQWKUGRtbQmKktIZgYfYyvVVWEQeZJJCZaKiIIROLBPg', 100009);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100209, 4274, 'ZTWLauuLNxSdTcOhWQReNwBJdmasFw', 'KldAFbkWInNyGvXgIVlHuXqXRrNVPdzaOhpfQMHlvTnWGhZBPRVnVRormckRJTVsTrIjRKYMPBAifoHQQOJKzMnxuoafNtIJNlxB', 100359);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100210, 2109, 'CKhXJXpeiHBXmOaKpONTHzmKncSQWe', 'RJOtoXPaTjXtOtnWuWREPgFDsIHyukkNVmGaZMnQhYQpPXIaQQRWhdDBOwvZCBHhJEiVWskaOBViYKTwbBaYWXnxaeZrXbqTNHte', 100119);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100211, 3709, 'DlxYKqrWMLCVzLrXcpMndyBMqhuFBU', 'dMdWaDuQQWBmzhnmCCZEeEUxADGzLEGuuNtiTGLzCzkIUbUXMHNrOQnjqZIdBBVYCCQAXYguYSroBoKMkqiHhMRZvCEyrBbvcZHm', 100387);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100212, 3507, 'IbolUNnjBStSKxUJsCENRFZfMCejdp', 'FezREEGQgPXfznjIHSgZtUEEgKjDlLPGIMtPFIckrXxvKZiYYGMOsuqtQxeWcLiftTXpVBesBQJpTVBbSkKuWfQfikcGhtuIXHKZ', 100338);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100213, 435, 'rUiRAVSvNqPmAHvrVnljOsssyiAevZ', 'zKnZTOyxvbWTZePAdBRCnqgAuJfRDhiZwwgBIqkywlvcICgyXaXtXYDOLpQWdHKuBAUAsZDdUsCAxTWEQeSdiJKyQDcptjQMlFie', 100318);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100214, 3631, 'JRTnmwZvFKcwKEpFiZVYfYVBHTtCTv', 'OxBpwHXTDNhhZIvrTXlSvZYesImbjHMgnOKuavRuQWHhOnemTXxtWSRKBCWcHYDvrVnvmgHCNIGVSulJlowEjeGCTzVDMewmImaS', 100267);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100215, 3215, 'oixKFjBYpbdVYqDXYoVBJeysNlHTAj', 'LgtDCbrZFsYgVWiMWXPpyJelUmKJoTXxrzdaWIhkVZSaIIqqZyXsOtjYwrJtWQCSJzVcjNeotMVVLyAglgeKFVkzPMvnNBFkSjuH', 100249);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100216, 3433, 'pOHvcceMvfXXPnwnkZnpxXBMVwNDUL', 'KhKhIFNaHUJgyrDYlvuLicBtdYnMydlcyNwTtgCMbkBPKrOibEplTRwwriHRyXAoKYAkkkcvCqPRoxCVeSjxVJWWNemmNRUnffmU', 100305);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100217, 4108, 'HPZRJRRMqIUrzqLNLJAOctIlxwMXxT', 'YZNBJRSRMnoIhkeEdkIaWFzntFojChaWlyCkrQTXPLWUlEHRvQDwqVbyZHoHbSNEdoajckxloHCZvUKjzRetkUjJfUquoRJkJkFe', 100175);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100218, 1065, 'gFromaEXbFeqbOQfycwPYdPGCSkrxk', 'TMEzDKHJVxkzVCOkeJfBIQEykBvtPExuNDbcpLdfAkBxeHMZGbqwLwpbDtAubkXYNnHncDeaafyHybFCZWaurUHcNzfMvdKniChN', 100340);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100219, 2311, 'NUVYcUowUmJVEMkjriTVxULZohgyRn', 'kjylmpdooblxDYQVEhbmZffnlQalkUrMaIyNcvgjRZdzYbNcuOcnDfpQLQjcqudXiykDbbXFFVfqTXPONwWrapigLDQMkXJqNiTa', 100293);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100220, 3346, 'XymsRLzDbHZRrzCNzSuGYbOhiGuUaW', 'UZgcYaWwaNIafsYfsBHeVpJbGsIsWZbDIMJHzNuTtFsaOTFxUguubIMSkGWIEicDUAJaHLmLszDIDcxfsCaveypnlGPMVvGQADkv', 100295);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100221, 561, 'fqHGkwdgeKjkRXDUNbOMEVflAEnJsY', 'ODgwSdtMKHrmcJGYbZRrzZybXfAdMHmcaqxdqjgTJqxatbnxEZtELsZOmqlIWvduRQJxXfhYUZrcAfqOslgGibmbidVFpgpUjTtO', 100113);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100222, 418, 'oIOIgrPtzGqReygvjZRxzAiABAzQyB', 'OhWxOnVyMKclBuOYYkOKkeBcLBnozsJBrAUaIadHeHkzdkgVrOTWnwBuYJWctcATLFFYkJqHQcUhnOsglRXRcHFZOruVcQzARGTf', 100247);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100223, 3448, 'sbCWSRxPWxLFoSHIumTeFVfnBdYfuY', 'KaTuxKPqYJWkcFLtZctdYUrXatxQnpFUFzaaDiDcWRCPvwnXnUKtFruIAUSCoJCdJNVdxUePDNntlmcEsGKXvmHRfpYnCmivBHzi', 100255);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100224, 4237, 'lYHSbRGMLgyMDnztIFMNfgUrYACfZd', 'zxnQqvfTGesXEhKVtKcaIMOilZaVzHKMsqfBUlYPZLeouNhmLkmZnihFvnCAqeYcLxmMebnunsNNgtClouupKWXHUMrxRwgyWjbj', 100065);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100225, 2452, 'VCvbpJgGCzarJpJPfvlVGNLBBLnmSX', 'rCPfAXTfFbfiRmDxFgHxqLSCiYgHiLqFVgvBiASAOHWOjQezsSKrMqRWwxPHLyLFgJCqdpfVcjlUYVmCQxxpWerMSwgJEVBcCZIC', 100309);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100226, 3680, 'cJneCcTmTDzmvNVnpsWHKtXGHzbkXe', 'ASYVuVwvShSZWFvbxxQLmYTdTEfjjhkesXzrcEZwzOKXLGTAVZUgaqlczgNvzQmtEQxVcEbFoDlrvydTShewVOrfsYUWrwEyPLQy', 100003);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100227, 1630, 'CrcuehiVuqOcvARWRZroYERizLxfCX', 'IiWNVDqgaBNjzcPMHURQnrYrbWqcwtfSaLnaabwgKakzTQTjiPVSOtkNmWWWinggOQXNRWFpvDjPmRNMjnFTOrNvVpHbPXKLpTaB', 100140);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100228, 621, 'NBZcfPSiRjBywwRizvkTEfUaRJLilT', 'zMHUpoivwyrZzOoHhWJcyXhlqsnBCbfOZckNvXglCKRqIyoxVEcLSBzJojaKEXuzkkbAUhiJhqzUyneBypbvvOzrFNBBDUAXheeZ', 100275);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100229, 1586, 'IqQBImkvBfdYSEkFbebUymVFLYDSOG', 'KONhzfmvjUDonSWDLlxscLCwSRHKWqexVGoBasWxONRuxQjquuhbTzCRJiXCxMIfxldTdSQuYojqQNsQpITGinzZltRsoSXYnKJe', 100182);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100230, 2838, 'TIdjMShLiewVoWCaBpVfjbPAjgqiHO', 'SUZJTVdELGFeWTkXppqxMWehXlfDUJpaTfDJdKXjIqUOSMivPGBdyCXYcXVJlXSHUhZQnvcsSqAWLvUmhRRdkZwLtgIXOgoOMGFN', 100098);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100231, 1892, 'coSOrdXvpjRuWdTvMKUfuoDeMUyTNZ', 'nxsKUBFWxmAimnhLKwiiXvbofPrAtIzmkYUAniiaAzBElvkPzNXETwVOGhtXjgQPgRKyovgwMaixsmlWgxIqTlHCVHDlGMcPkMuu', 100096);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100232, 4537, 'pfLYmyXNGypGyaCfuxnrnvTclHEpRh', 'ZKsJgCtTohXXNpaSzhJamUpulQyoLJkAclPHLknHYHrvDuVWbfkAjWJPjqastYizWbwFdUrnzblwKAkqpGEsRKDTVxjLtocQgcAm', 100104);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100233, 2876, 'aecWtyvykFqMijFUtyXdCHPoZxaHtl', 'kdllfqywFuOqrNngtYrqSweZbjwaCBfkagVDtmATrxGUBfQrgwkfYtoQaEYpLlrvExGgnuDYqILxnIrAReCXDsRPUqzWcanxGYVd', 100101);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100234, 2544, 'XKpfLGrieONGbsGUvfYuViDSEhwghj', 'KGEUpKYkKvIqJDRuvubrxAevDfzhusoWOXbPyuYmVrpVWnGZOFRvmLXmxrpzfdJvBNFHqvbKpVOGHebRxoNdefGVWTWWzGhaejzP', 100024);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100235, 4487, 'UgmjiVdJncwlEsLkhvJDVLzExApLcM', 'OePRacvxjNviKaofVikYmTrDCLTplHkJeAobgGuERvHxnOUeoroxbDHDWWfAkqBLCxSHixAZLAKQuYaDHpphkjMOKoQyzEAfKSfW', 100324);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100236, 4285, 'nkJUAXwCGCfWEdEVMVCuBreintfqjo', 'mMXOdMzJbFAABVMBzXleLtNzIQciwfnAXoJGDMHAwusvfjtbJBjwEVFNThSZLHVAMtyFnvMmwpNUJOQIqfXZJlDbfLwVwQzoBfrD', 100266);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100237, 3264, 'oASzzNEaPzRknPqqLQuKJHJMNwpjtT', 'tPvoQOPLjOVpCZOIHbyFAaNIePoIkxAatsVWZuVDuqazFWOKRlUsEZAJptofCVnQUqMhXisFaDVFahpwwyZUwowsomiwIoNTDTbY', 100171);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100238, 4640, 'fLGZpivuczJvWqNgOLLjUITkGCUZHV', 'dzzgGTQGKnfIyZRimrKMsUQYtmIOoFbNTcOjDFPORuNgQbVwGiQZWYImLoiQKpcDnBlLtcUdUzCYRLhZvwUPCXYoGTIFPIjoPdYv', 100132);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100239, 2012, 'DpklTjiOAAIKmAKxVryVFspJVzWVPK', 'ntjOMrcDGeLhmPkClXfNxVGfiBCAPBWTMbyBmmMursBmNZINyjrnHfFnEvjWgMiFkUYyYVJIFtywFSJbSansIiUjWBzZszUEhlcD', 100249);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100240, 2803, 'ZKANOmVwiZHbErYLcUWmsUMVYJaxKZ', 'wtEsNXrfBjjahAcSNlseRjrvvoQfBfHQduapVcAeAPKZfKIQbcGXTBnOgUfnqnBBkydNkEqUrvhCCjNozQIenkVvvJIxEISuDaOO', 100353);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100241, 4908, 'IADvqCQzgbYlUZuxdvRvCrOYwYkvza', 'jXZDbbxuHivqgVSIJDnIdEkhISCbtGBzyBcFAZPpnGqYcecqtwqqyZbhUcttcLKFxCiCymEICzRUoEXlUoTlVPFVNanaEcqcPuJz', 100194);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100242, 823, 'UcwWdZwicUsbolOfXdTTfTQsXyDlFL', 'GaDyYNdQTxVBHiRtizCyAARFuIueAIPelHcipYuypzSYewIYUWrwnFrCDFlLmRXPpabriXsbPMSdOUqJJIpumTGYYKFvkoQbDXWr', 100129);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100243, 2459, 'hYDJLYiPteRAciDRpSCwGaORgtNXWW', 'uqZSGkdmIwMXPHJapqOBJpeBKmaRZfiPcYHqInbOnsTyjmmbwsvuRZoswOfkUGDeCpgsmkUQEISxgxdeUyUQRgUBudOnwOCdqDcI', 100011);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100244, 3987, 'CDMXpuqOIWngUTFLTHVNaIbZhGiQzx', 'ZsxEfBQeFdEtiIslJgeQdBziXlktNLDHgWCUDKIVKWTyveLFseriHENBjOabpOVcMmOTOhWouydSIWXvJtRbdRvzjZiEvCVfUfKq', 100300);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100245, 2786, 'QgoonjFtxeeDvyOuNXZneqUMcvvKQp', 'medXSzXBHalGEuqIqnPrMHsfupQoLDjqrqfpUFXYIWDpJHiHUQCWUTPrCBThNQCPNHnuXRjIGHozktjyeUrYNTaptShpIGYVOmms', 100252);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100246, 1959, 'kuxMIZIOdvmmgArfldhjNYkiYPshQL', 'TkSDNzzIePTEDRifhUmNjgPDPvkppbSKkpGuFbtzdKSOIqxBEOIDvhvezjZobQbpomvhOpoDIQPrDzzQCQQcOugmytLYDLVUdodu', 100073);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100247, 3057, 'DwvVopzlXIYfGptSdSpsaSCuzygwSW', 'GhPySxzIlnnInZmVpQxVYzGuzvKLnvJdBnMgnxGuOLYWwcShlzfraFCiLJCRNxaleTmztvjLfCPUnbJZRFQDzdjUzmvNarlnflGG', 100325);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100248, 3245, 'YSjSdyraFtbJODNULKBEJVlYsdXsTt', 'bRmoyLvNzwHvaiIlkRpgutxctOAsvXFGHxPGVqqCIrUHnhlpWRfrrYzywNPgSOjzKpDHSAdtnvmisDVffSsehPAfHVrvuAbgfKMh', 100290);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100249, 1636, 'IydHfucLhffJljYrZkGZnjhTXQvZEJ', 'yMNWcUoahSSMNbkzaqkCAfXJsTyLGjQvwAyUtXBuCdnUpccgjintuEVnrRlAeOEaLFcLoMQJRZFkhiBQunLKpkkeRutuljCeQqsU', 100264);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100250, 3615, 'zurYKMCgBKdfGBimCMRAeFhiJuaSIO', 'WdpGbgClMdgrULjLWFctYWUMNwMSaFTeYlJwBxOlCgsjWAGIeKLdFUVUhzAdfmuSSKBSkLpiniOWoFxdfklLsNohpwPnBAGXbiil', 100259);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100251, 1825, 'UfUHtLnJMxwhZZAWdWthJCRogDYysK', 'zYHJwjdYmlhFrVBYjzlEahewYLywYtEVHZFlbBcXcdnoQWrXpZdbBVVznYWcOoyhrhAzqHlhQzVSoiGRtoDaTPWySHsIgIqpJfBP', 100337);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100252, 712, 'dLLoUJpISCScXkDIUEEPYmDGGjywyx', 'iEGSShHlCnvZyObDvfLWrQJPNyRlKHLJufWKNsCIrDQRdpnrwvaECDoyoiiXWUmiQDlNEZkujjtEBeVMMpaiXlfldpVfnZDVDalU', 100112);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100253, 1853, 'peNXDsfHuxOfGaiUOsKEFnTWAOWEQG', 'WlOAPYDbGNPYFvxyOsnIKgvmcunWTuLvstIpmntrmtfnGZndxoLwEPCEdkJCBfHhfIqUutCIAWDFtirPheyNUzVcCZCqgdaFgtXL', 100354);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100254, 3338, 'PinphMihGosPKaHGDHfTreLxXfbvyl', 'XPQMZTNHyMwSFkNtzZdcGNJwDcbcpSVeQsKpDUVmQEyepMTqsGNTbocmmCpbWZaqXqapPZSPKCJmqfxQQWMCZopDFtLLMJEHiVLn', 100341);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100255, 4831, 'fVZsgTJjBcGPGTarYAGeMyGFIbTNzG', 'AUvkPOBRrxfnMVvkrFkOudPSVZWbQtcyWOfXRLmQpvmtagcLHDueBskhcDLunoaofVKZjdiSmJbTfXJWoeengzmZaJQmIxpQJbCt', 100074);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100256, 1217, 'rAicyijNtAeUzMgDJuvoKjozUcQLsZ', 'QVNKhKKZjPLtPOUhxdzVduXaFFlJysWNOuUbhReRHJBYgOOvLOywNAOmBOCGgTdCRRQVWfTIeJuKijiGwuSPCBhWFQAyGKQIGEVq', 100179);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100257, 818, 'ApaJFSqCVbWeSejAeeZVrssMgNUfDZ', 'DpjDVZprpJrczZtcMgrYfGODhPGHCmnkoSVVErziLeQzCbUsiliimamlKhkpasRxUyuczoUHboYxLwjApYDDQTvQZuNIEeOJysFd', 100126);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100258, 4646, 'LqeBuCFJuXnwCIYkndLhumXSHXLnMA', 'kVpUqdfqRhFoybHpzdVkgecgPxtEtyyWCpFdWhFmbrYlOfZDEaRlMuzWCPZRywXxhEykVbYmzZECJksuzgiAlOZGUYDAYimUrEAW', 100069);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100259, 3003, 'juIRDxkXAzhfYxPYlbQkGKHWPzgBTE', 'JhiIVpJQCbtfTdwsnvFsrnUSlSJuIRCrcjETdPodyeQIzuombZtkoBhGKNlODBkuTGOjKRcQAXZbnGslaOmOsmVOlkqcMqvhwjZO', 100273);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100260, 2779, 'QBePLICbqqFYkHgtGPcyUapNqhMdGF', 'ZodhIkSMtcRYPQahqAfnyoiNyZfAHrouMnBFkZSUpsudDEIcwSMmNObVEuyoZuaAkgmrBlHNljhbOGHDokgCAHktXKCVCIhDkdrD', 100299);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100261, 4913, 'otoFQgRiQQZhfMrVeSiJQPgTcgJtQA', 'JkMQFgKsUHuQdiaIOZyQwqXEIgGZJIPmqPjzTSrKvWGvVEpjcUhNnPrQSmfmdEzfRVprDcfEJPpIEJmOGdyQByVaXsTPXSuhgSdo', 100297);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100262, 4144, 'ZyCDPZWFklLardKleedaFUvLxgZWOv', 'lJbUdQKbThLBZieCcHbYofzLhWTQHwmLlCElbGkYATxoUyskaPooIlujHkuTwhCcLxwhzRvKSFUOXjAnhkhsaXdMEuEoOpmPyawB', 100320);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100263, 290, 'wScGHAQdLAufDUKfqfBnqehDMtUksw', 'JfJCezcCPJquTmTEYgAhEzsGeWRAnyqNPtZkLgESLIeHevCCXAJUfJfmkbaGmQrfeOSrZMRgFnKfjqRadUpaxEfNjBHsesufZhyR', 100248);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100264, 916, 'zTNXYDrMpVGjuqCZnyhZGhirMbMlFz', 'qwYHAAGoXaZcmdhBbGolnvGZObrXzIKKcUjOizoMcNxouZIFvZbsbaEquoBxXGQXObxwfoKHWersUAYWULGSWQHOEeBPaAjaswgg', 100051);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100265, 3279, 'qicnGciMnzKvfBZNLodEPVbgmggVnl', 'VqlajPstmktlWxmTkDtNRUQConSfXGlCPeFIGOYxGGBNiRgOtfTanTjcwoimixTJgWfaNSwsuHjLBPOZHPBLVTSHNvVYLkEJuVEv', 100212);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100266, 3370, 'bvTHXLNKWxAsxrZetRXEYIGWyIMSIa', 'CbtqddWpdoUtZGuWQRQUkTfLKxTdDiCmRljpwZEdGPKoPYFThxqdEWCvlABKnSlGGmENYnQoENpeOLPTHwGvlpPuHnSPswrLPtDL', 100118);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100267, 4605, 'FaaoehYqrmsOOJubGNkRgtqcDCwpQs', 'hUDRqhojEmhlbAFbdRkmXrCPdVzGfFXFEAGguSKNAPmjZoMJcpNfeKRZvquMQTzDIWDAWxuFngKlJWqtAGYTvRgwDCzCeRdQPoCJ', 100127);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100268, 2495, 'bwuyxabqlCTtELPOKDUpgOkuZtfZVV', 'netCwhpbTXeHBzHbcxRVcRihWEjeUGjpeGJayiksuGpyzMMdmHDBbxseKqKnZWarsmpMqimVbZPVefkwtARslFHoqMQuKosKiqZf', 100297);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100269, 4306, 'VXjGvlglBOOBvMsCwlSoYTNSkjnaZu', 'sQJkrzboKtNRiOmBdDjKivKBOwOUTHmDdZbtTTBGyVMPPilPImVARyFmtnxkRHDEHbmQVkbGVUcOSDWoxVuvOKctJEjfibKMEuJn', 100395);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100270, 1392, 'wbDzVbwlSuwXlpSQVisQygpSDKPxlR', 'snfEqGpntLkhTTMYGWMPXVVtGlPhzngAJRfwMwkLzAbKsMqWHeJbJGVJMOexbhORICEHenKTKOBuGlvOAWgExxUZddZkGnRMWsWX', 100008);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100271, 3422, 'cGufpifnTCsBiQnFHPMRdtCxNqYwjO', 'SEVolBxWkSqYccvNGtiYRnvtJnxiaygHKzlWXauxktCXlecyGmMxpnbXpBEqIBoFjmziObWyKeBIikPbUSaPkeXPRKxUnkRtVhqR', 100198);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100272, 2210, 'CpiDEgFUPzAMUutvTdKSsxeSnwJyAe', 'HNmOFLxGTymvpOTfBpOMcrcXjQunWoRZFNvOchGyHgILNgmyAWtdksjQeDkZpYjGOGXYPmMHXOxbMfulYiHjphDBKaqiXdVuaRdV', 100129);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100273, 929, 'mxVGSKtCUjxsfBXRlZNqddsBFeWOMO', 'VZXkRFNclTaeEzwyJnAvwoawDCJzzLcxtEkPwPUbuCZaYSSFARqDdvhLeGCJbjjNhffHrQOHlWvGVPndSfWCpvZdtKQhtrcdoTST', 100206);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100274, 2966, 'qxAKKDDQAhTRoNszfGMotDkGyBEzDl', 'yRQBuVVqtwBEBqKkdLkmbKNxRzQOzFiDJwjpAYvSxVbPfJUELQAZuOwxqMhcyZbFvheetvcMnQxgPwHadvOkQrmIjRnkbVHeoMmL', 100222);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100275, 469, 'nhLZHFEsrbizlyYjOJkNeWmaNqRyRX', 'VUyFkgSTJRcGixFWbXjwonpmltYqMAXgVZGlJgdAVktbQSAAAoPTLTUIdQhvnNKasSJIkvfcqGsalFFoxUuFDTSDlWGNwaufPuxJ', 100039);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100276, 1265, 'hoYeqacvcVhqtBuyZqMQHvXWSykUEA', 'RghNHUHrQPoqxcMxWPohTgiVaozrQuleWFKBxUgcBgKGDNOYhHzgonMiuhUXJEqyhqaMmtxopivzeoxKKwDZSOXUbuxwKlQNQZPz', 100134);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100277, 1193, 'pLomSnXapnqlRyUOwqfpfkqoGZDonF', 'utGxIDwVQGRnmsdYlcDaooDkSWkiNuOrgaEuoYuMuRXJVYdGeHmJqycQfsGgUqlCSvnuVkZBaKxZSegINZTcfTKFxOWGqrYpzKSv', 100067);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100278, 4400, 'rKFHsqsTvmZqMIMDkDMnrMuMUEuAaq', 'zrKXixFaJWzawYAAgeSuGRpGEirHsioGeCVpUnOHQoNesSWwYHuXDwxUYxAsqgcvCCZRdLxkMmOrRYjLVwROSdQaKdjRPYXuHLtb', 100345);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100279, 1422, 'sbIqCnOwMHLPPLMzkkCfqgycuwbrcG', 'YdbXcvaEJTncaQqDQXcnwmsMnBXPxppcYGIOKwkwYIdHESyQnqdzSYqVWLySMhzXijPFZTztUpLfPFSAWggWhPGjqmUreGsIThEk', 100213);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100280, 253, 'PZuwcBYWoXOKWBrWKBKlgmWgyjnqVh', 'ALSEgdsysJhrIKiVzIprzHIftvMoQWQZNFRUOLirvYQoevnoiADDDuZFTrNFApJKopZRoRcIytqdsmWozHQTUTXBluWjNcrjBOeG', 100047);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100281, 4123, 'rgAhwcqLtQIjbLzviUFinpLZznzQAJ', 'QQhUvrLJqgaLxKCZbVDIlTwZGTZhFkeAzoieIdjgYusockDWVLlDSSpgPaPQszzZxmjwpqepaAeewIzrgQYnsQVkLpdkEcFIvplu', 100293);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100282, 488, 'XwJjFIrJXppMaQpJVPqYLuoUDsKoPd', 'jMvyEyRORhGpogTHMlAciosOgRyZwbNenEtrTBQNHEYgLrmxjZNyBgZpiLTZIuGJyOZkqVgbwsRxsMngEaxrotQAjtBLutmiRjzX', 100241);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100283, 2141, 'LCFtbrJPgfKZjFUKWRoPyfURobgjwI', 'uBYsqWLHmlXPMcLtiAJOclaHiRAOoLbQwvOBYHhCAWCrbQXnevBcgPNHgqhqiXOMgFXZqzMPlFcWRsjymFkIJuiRvntOuSGWzLgj', 100169);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100284, 4975, 'WXSPBcHTurwOQzvbTwhHcqXzORfYkX', 'IYSFDYvExrqBfrrlOXbkaJqjhjXgJQLvyaTdbVbmJkRrwxnWQKXnxgyHnMPYHJKVBBrwcdOSYfXAIEQKcaUxXsPPvvBFnaBYiLcr', 100369);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100285, 1169, 'oAmycvLsDtohYipXyrUchaYPQcOIIr', 'ljJEhCSiffWDjJpaPWCQPglSBfpZmTgrqPKAQozUrWPuqYGqtarzMdMdilFNOjoEMDmhiXlfFjIKlmTQRcbGKKrQZqGUBSsohGfU', 100272);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100286, 4577, 'nXiuKBqXpxPZvzBxUSuypAfUafUlIz', 'BbGvRnjaGyOhoJboMGIyoDnoPUnzXKSFMbLUPgeaXUDvDizPOxZAFBRZDnzOzRXmnxZFayoyuOTCtkyfGLAgzoCwcyJeCdQAtrPn', 100329);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100287, 1208, 'vUZnILHMahpcXWKxpYTslvjwgsEhGz', 'IgDiQxqUuCZhAdHnoIhzJJgnkLYMVUkwkrDSDqLJHNPvxPckWPuOuOHEVvLRPeLWvgDpNGTXdhtjVtyADSAovDeNxJHuQIeQqqhw', 100216);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100288, 552, 'CBCSJNkhKxpbvJKIYOCBXhDDhvbRlP', 'iEtWhbhsuOHJvQCfbHMnBJqezhWsgaOpTVHeOezNLsWzQOpnmyszXZkxYWbowztWoQZtDwgnEHKxlrvBIHWiavNeNKBXUubuYbwD', 100398);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100289, 4973, 'TjbaKwgPXsuqGXpxEUfmRpJPDPydlU', 'feEXCpJWzjpxpHwUBWgwGjCeNwCObDTKjlYGKAUBZXrykhJabneapnilnOmRCmFfWTeekKWZmBlvMVveXmERjkTQvFEwCqIRCjQH', 100291);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100290, 2158, 'eUzpydhxjEHZPiYqPPnKRFHNGjxiKr', 'YVScoIKxXOIoXHYsKwCWRVxzZlRxqBxyTPcpzSrATUUOfTlUykmBHcQENKGLEqYOEJWvEuMvwqomhomxNmsKmlljAKFhwktsrdlt', 100387);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100291, 3961, 'kGYRhYkoaUQJaDjTEvcDKXBdPdSnxJ', 'jQdAjSKOiWfSVXNuSgHZaYONXmIRqFGYHifdlGoqYRmexEsWHVVVaUYBStETHkEINGHoLlxoBiJjQpqYMhEWJHKEOaTZFMeSmUfw', 100069);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100292, 1785, 'utAzuOWZNiXMJUITaUzQYUOtSltzxu', 'HisfmwXiMJUpIgZzmotmlezeyfGobIZeKAHEniZEExJfqaOFTksiEYcMJuCjXlzylyFdgxOOnMXeHPXrJXaXUYMdQbrljEiePIEz', 100250);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100293, 966, 'AzsnHDYnRXQVixbTCSUWTSPhHbZmVF', 'mPbMfDXCqbAVWzluTnLHQYzzCMERFZddZyhZEjOqtyRVuonbPKvNJCsSBlvIziGOzyIHSPkvZThCVhCsTWpnlmNaksFGOIzNcTLB', 100046);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100294, 2454, 'HOPukXwTmMrbJMXfIFANtBeFjvcrlD', 'jBaMYGJWRFErKVNAaXQHmpYFrYoUmJDbvaoQEWABCsNcZLlboeOURqYtVGosgBfiMBWwEPGsqIWwXkHUMxbJiSrrmNFKcxPrNjQG', 100349);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100295, 2202, 'cChbSRGjpuRBnAAuPpHpLpVBWCDqyJ', 'IbivMEYKSXUasKEXpulyXwPhwSqrwJTopHZQwFMKAvKqBzSjDhtgRAqvDBsMpZUdGUgnvmmVoIGiSPIcNLLHmZYMZVOnelAEtNvg', 100303);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100296, 2594, 'QSOMwmfBZdrGcKbnqNOgEXEuQyNVNb', 'BsWxgyyhKwwCVOADnDYLjJPSFWNiOSBIYUSakAEFJsuxvyfQrxZXoNPpJZstBoKDUUphBVgAezjKNnrWebWGmKpCjgrvXxarAuIJ', 100245);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100297, 1256, 'hueBoSpwLAVffczpcqFIAZBKZblwNo', 'FBAUEinEsqukjmGVkbgjoGJBeHmOhVvIGtjJPUgioOpOVqjCPAWGmOVbkXoKItLtNvSksLLOKeQVkbLWVBpBUZahjUiviVUMunzY', 100234);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100298, 3832, 'yVzDAIUBgSyTOVtsZcxJTQdtIftkne', 'eYOxZGWfbLWjJALeWDRWnxWEtSrBmPjPfgNaqCnsOSqTEixXISBWDkrkkCyZsBKerPYvZoDnJiAgpUnIGaJgCNYTgnWFwlHydled', 100303);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100299, 4585, 'DjbErwCsWUNQHRdlSIGsNZIwerUFOo', 'ukVixPeoGwgkGEwVazGVsnithvJcUzkRGTzHxwfTJXWjPjZZdBZffCazmjoCYCVwFiWOPRffvqfnGfsGkSakRCIDeYawOcgLCDmD', 100336);
commit;
prompt 300 records committed...
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100300, 4870, 'rCsYUpTHBgHmdvRkYOPOokaDytlYuR', 'MFnpELyTrTwwXtopcMcNPbRVoSGldJennBWvjaCaOULjixEfcOAzMeUQuUQFCGrMZgsBFGelcHsIAqKcmuVpsoxxOXUEtihjsWYB', 100386);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100301, 3627, 'mqRMCgjGMUcdXvfxBPsRzwVjzmldyg', 'TfCYokFEOqjUXLHaNygmCvmTJmfDodghvTMTXraHdamKlsgiwFbLKrjfeYQWCnfJOGTQQUDOBIezsYOzLLOtDrzHDDjHINXUEAcc', 100304);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100302, 3897, 'sXpUpdlVXvQQubcIiefcIMwVMLIQkG', 'QcpSyglyviptdxHuqLaOJgVZILtgYaZReuIaKWpDtHTtFresDBCzkEXExYRmKdbTndTDptbtyesnrsSPMOXIgcwWcvzVRYVRDgMy', 100343);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100303, 2724, 'ycKyyKEyKuBMmIheJlPpdSQGaaFTWf', 'auTnijJmmFOjlszkLsLNoDuaKgDfhXZmsCduwTgzTeTHXHJNfcIHNgucqGwUQmeffkjHUnYISiIGhpjTRPiNmNSLhLNmZGFneUAw', 100207);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100304, 4603, 'CVzaOwcIfoPpkKnPbjZYasvAWNGWMh', 'FDdKeKGJQhdKhmmmnzbUurwcowvuPSvCNDakCMKrkFDkxNqjzVgocCJgGDOXaHwhBgPBqaQjxFiKmhIocCzOzzTzEMgLCiqFUJZk', 100040);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100305, 4713, 'kwKTrRXrSIKIEMRgiFoOzMKtIUKkUY', 'bSnFKQYsndFVIlukKGmFRQqkdOcdNXwClMvkcdAsSVDzeFymwCMepbElKBKMZbldBdBPtfrDtIUzeKmhUvVhNuLqpKkuYyEssIIj', 100354);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100306, 2925, 'OIHyvuAxeOtbzFWOBtZWuDqbFhfcpl', 'DWWTApYkWdffncbDMVDNLoXpYnrjXrkrjlvDqkxgdblQCBMOHXnarJciZfrEjpGJjSCFLDBJwiAoDhAtQrzQQTVNsmnUFIfCIuzB', 100213);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100307, 2220, 'XjdSHKlJEUhjeywEFqOwDSfhvIBmIS', 'rFzvWJBxIOkoVzMpgQsOkUZRPslyuNNyqfKYBybnPCOfWlPmprjTQstKCXgIsNKGQMoIdPcwJIjnDMBfmjnSDrHJnEhSNEkWEVmr', 100030);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100308, 671, 'FBYLSctpnAfToilOTmqhMZnnMjniHM', 'wSMQJfalVzYfvGHsviQBAzViIPaNwgbKEULwJFdHvDzYidMyWOGOpkDQtMkOXTKLvWWgyfnlfmsdlAgtcOkairaGdXtmFNMaqpXh', 100130);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100309, 3155, 'oDjygNIjNqrEXgtNdHeeONPuYqXsKb', 'VPebvoqwONkyHdQuGfdbsBCbFhgDYYpvcLWgcPLSKuZfBLRgBwscEuBVFmErmeYrcezXKwLaGRCRTkcAEunYVVCNGhlYdAWMPKBK', 100066);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100310, 4265, 'mFruaZFBzdjOCbMQqgdbzDxNSJDTer', 'SlqmVzfmBULrjfGdxdTvCEjkEqOkEFzxybodkcKnWvAtPDIUXMWCKBaHtIkdIbqKaULcBlYydiRUneSHUATaeIlaAsNVnJLdYmYw', 100341);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100311, 2715, 'bwkJZQrEXZJSUckNRIHxWtOxxEeAfX', 'IuwuzwomcUYNZWejiFreSUWsyEEtodZVQhHbcTuElvqOeKiGQmmgjhBLCYxqulYStqhVFPtIlhivRHSuXwBkALwqVCaTnpdrxWHK', 100314);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100312, 426, 'uDEEvQpDdcDjIFWWVqJAEVuNGsNwGC', 'LPGIJLoJVZHembubhdBERPCYjJMgSeFDywUXWkKvedbcvCXsOTneQNdyAJdJOEUWGOgIzijOZdYEcRZcOSPhuEbzJDaFoHvTHkEc', 100262);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100313, 4022, 'CbiJnaFGDFIhbBMAGgvyQTyFjBnkLz', 'hFEZYQxIWALTlnGeUHegODTrSqDjDqMQXbnehgFqKPupCnclDCCsFeYtxuWMFWMzvhGvfWdQaMRSuAyzQJxWvnyVEWzHHTILiruq', 100019);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100314, 467, 'qKzLGCwJWYuaiUsaelzvqWsZvBKezb', 'sLVnFIVpRHGxqyonUOrKhXXxYqqromXzxHXwwIIHrcmXyRVfWXhfQRfcqDaOibBBeaosEDqnxESqzzKOwLYgemkuiaSqYmLrUfBY', 100171);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100315, 3966, 'CEvXPfLMEWMwHQwHBrjaAlcibiDbPt', 'gauOfpmOdJOLAUwmsFeXqUAUNCZbSaysOkGkTAQakHPqkZTezkWXdHfpvbSakuepJWyWStbeEbbsWnkarPxKxTmWIiNllWrFYNFR', 100168);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100316, 4122, 'ZcABFWilotoFDetKQywBWNZnPqWSMz', 'wSIwvgWZlzgrAfYzvrzvFfIsqsbvgbNorutfVIIjSAbZSRPMfQfJAReorkCGhPMmJGLLefVggjZUCNhwuesmsBErVNtzMzhdQnjT', 100186);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100317, 1919, 'MnbOkmbASJnTFBoxtTWVTrIJzaZMTs', 'JeBRiGoMGDxwsihLVTxqlTxzjIrLMrFstVFszTbXuJmxEFQpWwXbuUQObdOFDrBlDXLUuEXzTgRDSdbEpxdAYFLFxDxuNZVlQFsK', 100160);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100318, 1078, 'tGSPithRWVPjvsUbHMVdCHxnNInxEU', 'UHpJoWCYjhKOJbxHWMbKSKGkoIpEeWHuqZXDfdgRLZcnNnesQYnCpztrHAFClgzqjPPKABMDcbeowmFaojmCxJHvtJPTlWFSFKqY', 100051);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100319, 1152, 'yoIFWrjQEVHwmLdLJWjKglmpSevbZz', 'DGtPgjrvJxiszRPBbhvCURUqhikNNpLGfxyQYFsEScXvHNqaYXUXLmEcjPFOkRmDHaxufRjeNADkrzknRKHURSlTblkGDYtYAgyM', 100081);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100320, 4744, 'lrHuOmnobaFVrQKHRwSKdOpzpBCJjZ', 'iMYOZuzxsNFFLoqOzbpCdDyylWgFEoRjZtEHIsMRQdHJwWIfMSRVnMXGBECMispTarjzRUAeGowzzZznhuogpWHEzKetBgJdBvBa', 100164);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100321, 3148, 'dhYRrWsWOKPocxBxKqckKXapWpPyvI', 'UZicAisdZDVlPOgWyXMuUFMUBYnGHSWnWPJXbQxOxgGfzRnIqveIlColJkDXozlWlTZAmirtyLwtvQUbQfdbmNEwjrjaQnmBreWL', 100316);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100322, 2564, 'hhxeQFgunclEszTVXnaInzEsJVMCej', 'KsvRkcGAOTtBSiJGnIbmpgSAsQeRfDPpQdnBgMxwJAEwDUWTUuXtxVTNmGIHyoYBCgnwbHTDfldOCxFuNjGdjKqrvHjixrbuqiXW', 100065);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100323, 1845, 'HVRxELveTMZYrHutnmrPTKmEoNTYeL', 'hrJdMjwKaRcNSIUliGHyrYUVRiOJRfUoNRCYTjvFKbDRDoDsUjhYjCcBMQqumHWcoDWcOzjqCXpbUeLYkSbsEAHltHbwuIvhNIfi', 100020);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100324, 4191, 'EupSkLjCTTXzLjJrQuAIDEDdOGHWAC', 'mdAOHmSPQmfRkWgfConJAoscfQbYRfmqvpFOWsIKOnhskayjlbrtCeWsVAsCNPHIByGDcGdJwMXYrSJYsnGRlPbTduyjVlbwsROu', 100027);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100325, 2533, 'UbjMHOPZHqqBkHTdZQTeBSvAmyDWsK', 'KJruNrrlizOVsYmyGCcHYrkNLeJxTcBtvJmGPkFDdoVUAGvisXzqZwMFArdfCodeDJztqIVLhHNteUWLSwYNGfyufKqGYvGqtBFq', 100135);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100326, 4877, 'WTRXWBwsVKonDJTfuWhdxpdAlKpYgS', 'aKUwLHyFZYAigZhPQcJrLajuNwlwpSYVycDmVBRkIYyKXisDuubNpVUpGUavrOxsFTjQHEmFCdtDCUDwYHXcKrkLpmKUwVxHZJjP', 100018);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100327, 2029, 'mLXURKpbPiFUfiUNbyBHFXeTfEzesD', 'mppTaazjhtcToxnAvFdIXlMFPmRjavyIgDIjLsUFOaNYyYUSbXUUedaBBXUsCXglanjrKBYeYxwQkGEuOXBvlCPwKSfKhDuYDIVL', 100242);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100328, 1116, 'aLuHEYcDQuqHEZSiPutiappSFTFxHR', 'ZIvTLCdlFhOeRAJWdXooEvKMAYSuqeZYGpGgdshFOFUEJKUDEqAMrNfNWUhGrmAfRXzPTFRhaGyfWQUFLKVDwMirgJcjimMbDvyH', 100117);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100329, 3313, 'POwTTwFBXVsbTpGNgjfgcQTPprgHOj', 'gZDRLKoUOcaigaPXRcuGLHKljRsKfEyWMwmVOKWYQkECPSspThlctlfGbhJrolkYhDRagEqNbEXOvpeiBwlCphwqZUJuplOoQFSo', 100097);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100330, 370, 'ngGsDMQMqIugkzaocydAMCmmErLMTW', 'CSYYWmizzarrcMyarFIYVGcpsRZeBeEYLZqdNvfZDHUouRZxjWzgmMjfpqXCJkjVQHRAmDLVxCGPzpSewMWfaNkXUqYahJdFeYYb', 100242);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100331, 4732, 'uSUvsWmNQfhkVGHamlzchwCyhhKthN', 'xeLltLgYkDExrkExAiVvZgIQrNfNqGSjEOvknNGbyKsdoYAKQPcIQBeIjgYIJbaJYhgXGWSalluCocnOKEHWmttpiomDpBNTXvqe', 100047);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100332, 457, 'phWPDHnJTQbXAQaVEKaRQwEtfDuigV', 'GzhjlmYYAgCHDuFFdqkVKzIXodABahdensZLazlRIfTcwFbzWuSrxxtzRZprmFQGttdAmbdpITxBmRDxHpklQOcBNEnNVERiAoOB', 100208);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100333, 530, 'ISYFdZhsUOnArFhGzukLbfRoxDrqoX', 'PaERMTMceJRODYSTzrQRmxwNLMVeOWNQutUhvqZrYbgfLaVVrOmXWlEIiFtSNpcCYfYJQLmhQCsPcvCIafEmTfZpVxgAkHVLlNUP', 100145);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100334, 3451, 'kqceLfrpuTzPbBVnRKtXnrMpsflijJ', 'ApMKhKwdjuMApCsqbQaQGVJDGINfAXunArwiOZHoopcUmBoUMEnxBjktRxslkqpYYGjneoVPkGvZSNIQlPJlgarjAnlYosMcYLLV', 100140);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100335, 4603, 'XawbpoKLTAqaTZmOXMgFcZawTRIgvj', 'dfBOoFclvtaqTtFEhfslYWkXrkWLBvfXDoqeaaQlKfOkzKXEFsZwUfgIIkcApIhIYgNfiEWkmXPbMmEmyhoehDtUKEgWWpXGGjTW', 100281);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100336, 835, 'XCHVUuDjfXUVnirmujZtqoOifposks', 'FhJGjUnONiOlbIfeqBawVJAdhknlfBuBlXHnXHSFYyjBJsMzPXVsZqWoEKTgGOFQrjEIblEeKxRbQmyxNdqdyvsTxRHbqjymdpDs', 100185);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100337, 4672, 'goxPQyekzcPPrBRFmZHGcFOOBCfPPS', 'ReYzgdFCYiWRYylpWhZpNgtdErQJmZWZOxFtPGdhISnVGiNhgonQXvQFyftIHTqcLPPYzOlocHDzobpgroekcqXAwjyPLEXQHmwU', 100058);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100338, 4008, 'kNFdcLnwpgPpiVMxECqWjRgtvMwFLi', 'qLJCrwVUzetYYcjPwgqZlddSwcmtgUxzGgVWvPMwipPeCJSkyljxcVorjaQkduJKQVRTQUbbFyucFBOyyVRCRshYhRwpPKkntUKZ', 100145);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100339, 308, 'CcxOojhyHtFqhcsYLtldkXhKpxtNGf', 'todsyivqlYiVUvXFGbvksVcVKvHfNyzJMUzCGFuncUPqqTWpAQxBzmHIoAVhWTyKAUApklIycKOzdYIRVlfmalZZQpwxBQpvpHGL', 100046);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100340, 4239, 'vZHQbyNxYOXMwEQbhpNdVRovhRbecq', 'bWpXDOGsuAVCPZQdLhxmlEkxvxVBqiWndtUIHFhBwMxkOslijEuHbuQhKiSzNKiXjEoEkxlxjkgXhAcTUAXcqDFObtEIgdfrWdkL', 100286);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100341, 3085, 'cNZmigGtDyknahUvdVYwVBwZqjUvHR', 'mmhdpmrHRNcziQBKkutjyiCJjvOaXYiEiMADbPNmjYZmoVCSuhUYTnosoETnWUTlvoYHuJOCMcboGOnHBXsRfSaYEptiVnFWXxnV', 100133);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100342, 559, 'aHmkWnXrpAkifivtaZPIZMlSCVWpGi', 'uunyaSjafSLZNrBRTRATkOyJKdvQLjPTgCUNYcYeoovtYoixbMkICBonjUzsGtTAOYoOdYGqERYvnCiPYyeqSvuWtiRMAOIfYsev', 100144);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100343, 4090, 'PrldLevIWNdpbrfkmEtPpOGuxASqKX', 'NPagBkBfCiqpAAHYGnbNpTonqZsRZtqFTCDXjkysevZxvnBYRENlCbUVMjNlPsDbLyzrjDyQCerOXNQVAKPioyxemEbidxZhhHxw', 100128);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100344, 1151, 'BOclFAChVDZvohyYNNnTWTAszBYzMa', 'tkykSiTytOieXinyKdwGGQJaExYAQTHUtszlYyqhkCwkoJoZGQtEvtyTcFsLGBNpClrxsctUxizUrMiqrgqAIwJNfdPqJrnLmBub', 100069);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100345, 2351, 'TjlbpHDrVIVkSzUDWPfisKuqQcCdLu', 'lfXVIQdOwFZgHVzOckwgxYkpuptDlBELIwqgCQkOMauTmsCwpByHydLtQAeKuSKzuaYxIPgfiFfQEXTVUHCqHnDcvUKRwgVuUVkN', 100199);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100346, 4029, 'UqjhyYkwLCcvnHfHXqytkefeXnaIQI', 'JBulTdOkKsiVihFWKOtLUiWblbZLvKOPUedVpbLcxPXxCLbEFQTcnMhJUqcGvWLIaVmhNzGkiKzEXvLYpPYTYuSCpJqdEGHWgbbv', 100159);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100347, 120, 'uBvTFPVupHzbHECTCJskhNsvAJrnTX', 'HUqAmROuRblZPSIYvpYWBamTqukukwsfPRvpYvJZOjvKxpGgOzuHXTnwwxZijNyoiuxALyLlHzLlQniGJySrQpoYjGKHPUvOkEZY', 100100);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100348, 388, 'zvjTZDMZYvaeCpDbTKUifDWdnxlcla', 'KEiZLjWEPwxqhMQyYzjhunaDzCLyMXxHNaESoeKCuWstXMpFDIdLfYsDAIIEFXRxDlMkZDWMArVRJYozkXdIeuDTfcWMbeKJZLLj', 100160);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100349, 1480, 'tFRHzGWaamtPIxYRguIvRkpSOhEetJ', 'PJbRAKAMcjWqMvtXeCeLXnXTSRFJpuNzGrIPdOwjzLjKRLKMlFuuPQmJGXPoLuDRgfpgsBQWPdyVsdnCAoaKiwyaPknAPMlPFIYC', 100367);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100350, 439, 'zJqDIDbXKKQauEBiDNfsCRvHaLvKNO', 'roLKLyQLdqRkrJrjiehXesqErqeLAXOMyoLPxOWTwyOqVBboNIOGnwGOoJgVldIuUfWVdDqZsLZeRydDJHyjWIOKnUbVyqSHqKFI', 100221);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100351, 3612, 'BSLhtPMIaygvVnymTQIAHCBUWQhLwY', 'zOAzHjURZVcVJNrDQvbiWNapUzMpYOFQWeDDHUfkgbrGOQjEnClDdHgqwMOGRMPXVZDfmaFZtDTSqPgoBqmCSITuqTLjOJxaMJth', 100216);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100352, 4227, 'MMkQfJiWRykDphdtvPhbAulOAaulHE', 'DkxpiMCCZIkPyjJryNxGdyPCYregyQchENeSUVQptkkXdsWkcgKYAJdgGAdZJAIazoLUuVAdcrLjFLTWgqUeJVHNpaclyWgniRyD', 100270);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100353, 3481, 'EoIVzKLHxUlAMrsopMmMnaioYzFKRu', 'dWHDmtMnQrIZoBhrZqyBGzUPufoHtnuPPBRbTPOIxqADjWgjsYcltyoTpwWoTPlxSbvWXYTEcfBWGHRuOQrwEcDnYAZLUXhyAfho', 100162);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100354, 458, 'TpQontVAAbJHmmQnXYyjzorbHjWXoh', 'PtpCyXTCrOnficfwVqnLHVbdAyOFRAmioHBvjOBBWgVLsshDDCJbKccZthtjVTHbczJtZHwAzLqCVLlPDsIFylFugmflkerKwDXj', 100386);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100355, 3308, 'hAXTPAOovZuaQIhmVDlwJWnQROXoLI', 'yEfDcvfzDLHSAyuyZcsSqKjjpDZhJAVhCTEsGwFNBCDDTQoOPabRrXmmjlCWIdXaSRHJYeiDjjFwcyoMXPZWSqlMXSmKkibiqHZe', 100089);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100356, 309, 'oVyzppStbkcWFJlcJpKCqomlNhgoqD', 'oWGKnQPWGMugJyfOMqtPErpszoSufCEbaFZPxLMaMoQkuiPrymIAdMJPYlutpSKKxSGTnJCOLkwowglWJPkbfeRPwRtKqjjsukUg', 100302);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100357, 2561, 'WptRyvhpaCpVFDRqAZemFazVtDapgD', 'NcjnYamUuzacfabGBewObMDbjUMJAEpjKVcZQBfJbWQlGrQXFMswSkjtgKycAuajgVzxFuuFQzXhlePaJDvuiXNrlDvvWiFLldCE', 100143);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100358, 213, 'iJunelltnvajDVDsEQMPZmDuWIxKcE', 'KzHJGJxYQzGZBSHByNPDYxvRlcmXthbSFBiqPpkvypkasmjoqueCdtBVYLyVpYTkkFFoRUeNQnGfEsytWIQWQHrnzqyNXannXmSg', 100083);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100359, 2324, 'dasyNARJLmWnSeHtakXWNdbQdfWKzX', 'YNOisUjTSSCfXDsBGvtpYdWGmZFSLBbpZxPNtsmTQWTsiJzHSwEKTOlAnWqivjSPfFyglAaaFSPTgsrgzCNIekfHoKrdnywoXOjh', 100153);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100360, 533, 'PHHrpmQLfytShCUiERhvKuYkGKkYDa', 'CwfzLDQNiEzEnmqIWfvKtHTxZBSJQJiKVCCvvQYHjdezofACpRBNcVPnTIZPQPWrmkDHvRPoiZQrbpzSiFpARHMXJvIxFiivvWHl', 100128);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100361, 2461, 'YuPWvtHVMaFwFjbFWWlYbwkNemwdur', 'VrfOwBDJTHONDNYErjUAGweojHSCrICnEMEYmvSFbjCkHbpSyZMOHeyXkOzuXreEWUlMXrAJyZEzuGsirPIkteZfGZBciGCkPDep', 100294);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100362, 2526, 'YEGrVFBbLYvbTKmMJKpYAcjweAtMjH', 'sIVBHgcBjsmJFltTtoEuFtlemYvHdKkZPpUetJqnHvhZlxXlnejNMkAlJlzlPEkzwzEqbdcvAlbtHfOtEkCKbfLhaoHzKoLmwoDu', 100007);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100363, 3030, 'HOVbBDnRMGMTBAYHKGnmAsairrAoZG', 'LsBpGztsKQjPhkSbbGaEPvlkTDMMSIsIgCYnhSoLcUcIxMLRWfffIQsyiiUaVSyEHUjTFJeRZtSERlHZiRlDFttebKUzNfbWiSfc', 100390);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100364, 772, 'PlowzkqjjNgCvNhPGaeNDODzkhkbAT', 'lbBbIoyUTxZGCDvTxuBvAbeQWDuHPViOAESLGAfksiTIufjPAbiXTtXUpGGEspFmudaiSVpImVgHYOTHgIcXbbNQAonhsPVvHYiN', 100266);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100365, 1805, 'hPgKXqThqQCFgOVQOSfxqQPNJCXiDN', 'JeHmpiVrEfxYfVjkcungSOjcWmmzjVOtfiKxeomyKoJLUxmyLMyKgyWrDmoHSKaygISvXaCIgfdQRKdEkaJeWeOzyavooEIpoEQR', 100126);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100366, 1215, 'ovxVmMtMaOQgOZTTOmUForWgpEeSrL', 'bxLWAXxAaKaxRsmnCAnVngsjxhgBUXLYqkKavafkXfSLFBwXoYFSCcESbYumDDsoaJStuFmvOAeqzbvaSjIrjOemaORBhIZOqRlP', 100274);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100367, 158, 'EpvWFeechYWpeTrjoFVPtOUOIGppFg', 'iwvztWXIeVdRtMgeQJRoFGwdXLFtxzBtYCCOtnjptMDGoDUhoUIHOfJtGyikZxjjEQgXRqLXGrZdvtauoqIGrNApWWMLBfHPlorV', 100003);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100368, 2291, 'DMkbykrmRGnOkkAYCHeIYTvmFhaWSK', 'dlHJfPDByzfmLFrmcrsXotEvUgBKKIfEqLjbhWYkzZICMDYtVdjghwaPGQzbbHfGCCzOeyViRGwmENQMfmTIgWDtddOYrlgiXDKV', 100265);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100369, 1398, 'jhoVYzrocfGURrBnWrTgLUICLvYnMZ', 'OvMIXbZWYUSrlKxwyrVjYPrpATLGJQBEQTpBwHmeHbOtqCXPSEZdQAzlOdDGuDVtexMOQghiOxGwklFsGkZUlwrHlUrCNiVqmmmQ', 100014);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100370, 3175, 'SeWkIXNsjuJSsGhjomVJbCGmoGdESo', 'uzAYpCYWrQxgisyBWiTazYzbDWmiTJjYNvYuJXQmlFzaBlqoKaBAKAwmIQKnLuuRQpshDowbPxujkTcqGGUDhhNjycFscbjGtiby', 100305);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100371, 2742, 'UPnFMrrqBQgurREcMexzkDcGGhuwpa', 'BmWgEBdeufELARDiFOYFFhIlaEYvfUjWXzyQklwftjefJUnbIVULatSGUvcmJGuWQykiAuAZQhJzviTwNRvzxRcXfkIPrXTMcdMq', 100299);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100372, 2547, 'jcsXbPSpfxugaSusanmdFuevYjbwnW', 'jeBlYKSuILDWbmPOlgMRtkBSVfAmPzfRickhMmDiiiLdFNMcyStIuJgWvvbrGIsRdaclVokwqxmLmdGInkzjEzmwmHVVLIqcsNqk', 100356);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100373, 2253, 'BBFgYkNpdrzornHpxrVIwktxUAJcLJ', 'gOmrpCmouBuBhVFRiNyePWlBjZQqKnlCwVmfIsMTvhjOsTRGsfBBEfvVTDPjJSWuikKMHZMySlLaogCmKriHsPQdnVLutJnwcVTT', 100204);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100374, 322, 'jZOhHoFCemNZhQURzSwsPKCqVfzcrQ', 'vfKQIQhNDuzwNhfhrBVayaRPEeAkdImsfQEAWFmsFOUmOpDirhvlSsyERqLXzZkLvJEACejagpgecJuRixmkmaiCCAhxvGMRfYSv', 100131);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100375, 609, 'BJkgzNhkCNddiWURKaYbhOWpUXociW', 'AsWeayDrBsXjEnWHboIODkLxTASvZacjmBlVwgLUycQpOLOmseklDWTmAhhLsfByXQWzhFsZPZCkIaUxGoSUjbXWcYrLoTILFgKv', 100169);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100376, 3130, 'rcrAjAyZlSecWnebAjkVSjOuzaihrz', 'cTBLFFuUODeTJCsWknnHHSFwrRsQyBDQYWBMQBwRVbucHDQBfUxWnymMQUsRXLMOHiYTsgkSIPrncOLKiUDnsPGkEaLbCMJlPnAq', 100386);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100377, 168, 'bfYdSJRUqzOdnvBlSlIcqHmrVonDxC', 'wMznwqapZpNNCVQIRavKoOJYAzKddQMfSdSQMlepMntEytmzaOUyBTtdobEOrjhzNdoYdHNPegFqlwDKJPoZjLDgStWpWvgFGErz', 100112);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100378, 473, 'kCRGGJrCaHpzpDELgLBvwvBWKRlPgG', 'BSpdzRPGwSCPDvfpjjTLKmwincaLuwwNlcrdgCqMMXQABsWcYrCdbKcEwMrkzhngoyhPnlcyeFHTujrEgSSCcPtwUZGyYVmIAIMB', 100248);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100379, 220, 'AJIdpGCFGesGUVVMvWjyprWTmzFOUy', 'AUlGqYYwtVDojQybbHzGzcvDAIfBxJqODPhnRmaOyMQZQLCOPjEbMMkAPecKZAfJOnTTzbOzhcsqTIsBmIsjBuWUeoVZLqwTrieh', 100341);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100380, 3318, 'DcvgoQGYjhmtOUmktxkdKUKKIzEhhA', 'ffNrJEPvSymFSAKiTklITSmfKljMQgBCwaOffjgsTNdGGeoutVxGXLxKQZrkEOHaHcXHBUJRBumEYWOSJtvZSgytuKplWvJNWUTs', 100358);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100381, 4577, 'hSUcBxiottYuMDAvyYIOQFSPoZryXu', 'IvufYwAqnJQtFsINKZAKvOGUMJHZrRphvcaOiYwBXtsBMgFfVjaGCrmwfprgKnmnjeHQmMCEjKfmmHOgvpjmahOTJcvWwCoAtbjL', 100170);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100382, 3258, 'gLmNsFeXFseXsxLhaHsSTviluFapEH', 'lNFtmCknvGypAvsYvHXzHUziKByntgvnkfxQfaxAOaKFHXwLSwEWdeUaopRZznRDZDEnUeakyFPImRBcWqnDWYNBgjfTFiPGprkp', 100285);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100383, 2637, 'cZjifayCRusfXpoUjbNGHWHqWzsbCr', 'qcUihuRgxspqIOeNRLDvMdFhdMqtmJHsTxuxwYRjBmtZzmVqpHJLbAUEjcuPYmPgflDptEMnGQHoKorUcIsFbFebBRlKeavWacvu', 100029);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100384, 2291, 'pjwcuNgtTrbVsXZTUfsBZrkLSnKInx', 'cwdHPPnpyWcwXMNaxnnqALmDndvbaqxYuMbJnlEKdoOUVTcrDniyHtBUJemcwfmPaYlLjYNkejdggALIjfixRsBFXogCxogbsuMD', 100004);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100385, 4472, 'QCTgdRZkludgjOqWWKIMErRCseqSyJ', 'DETSnpeKnSRPBPJwIblOlFsizXyNdHEbyQDnlczIZyWwHBWJEgEVsgUmbrgefdMldLGGFwXAXLoYErBfiKXXaMDBLIfurkYcJTFX', 100339);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100386, 169, 'iAKKNhLCgdVJuJHNmHtJFkAiEbigLg', 'SiwFDnnaNrOVLbEYqixinMSdfnZGUTANekLbVhWpmDqMvYzJYcCFPapEaBsHCNcnWtlQGuetvJqlxEosdUhUvamneuPrZBGnLpEm', 100303);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100387, 4818, 'WdcAflvrLBGTYVXYgawsVlrSFeRvpI', 'tannXXhGZGNFxHvqjllGNaaELLXFYrZWpZkiXEUFqcSVybfZSXHdEpKClzhwSbqNKAotrGqrIELjYvaqXMRdEqlzXVuiuhpsTyIj', 100052);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100388, 1770, 'vWUUOyNPmiTvVZuExikhkrejtKDVLv', 'FwjPjWzfQQjJEDmHuzKOImkYETNvqWZrzETxpatAGlwZEsJBdKVQrlkmweHAWyjqsPnDpGiJPCWJKWWjmgufnShyQyjswUtOOfNw', 100083);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100389, 3978, 'psfMnNAvrkoFmFTeFEDyxGndRtvdht', 'uGObaSXckSrrolfXMkeItKhCAAaTHpsoHeOPqwjGalYCgqupawRqIDpBXlojynXSFuWVtqVHbqEnGArdmXMPoQFrLtKgCBdEmDsS', 100158);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100390, 1957, 'MbYtHpEjaoTdGqlFqHqzBWZktFBCIK', 'BFJrGqwzyyYWUaOfvWtqjpiUsroVMVQkRvhDJPBsuuvoTaiskFSvzuSrhfNXGSKJqgYgvfhzMpthYRIrrqiDXQDPfLViheNDNuWA', 100338);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100391, 842, 'yyTsuaLgeqTClKMRycfokMXAYTmtXq', 'tJQckfSpryMBZvTYGulQiZpLKkOlFOuJstJcUVrvyhPMIcmiYrHyyYVhCmOheycraYakNgcpsohEFqHqoxzXXcFAnwYKXZApbeWq', 100283);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100392, 3869, 'zzATXAgJjIhjFzysPqgXnmczpcAWrg', 'RWMNAVezqQnWTKTSlvKmRLqcygSwRWJJBqIqzdsxXArnvzvFhpLZeqzBvggfsTgSAwawsHcnOXanYLafEOiSdRQmKhhusQIKMOBN', 100295);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100393, 2426, 'UkXoNPPAGAvJedjDHIYhlPPYHkrUmT', 'pHohEaLNDcUgibmaunauOhcPWFnLEPqWPClsWYdTyCtIiDtfdjsqUNRPLjmWzvYKWCWieDllPTQJzfOpyWYcrVALVFmCWffIxdCa', 100235);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100394, 2990, 'KzWeyecFHjPKBSDKxGnnHFOmVvjlUV', 'MoSoblOQpiVxdIvaFWahLliElLynRMjgXDFzuANUurhYGexbPXeZiEInWxFmajYBSPxASoTCGSAdIDkCEYISaPJNVxvKqIXmiZud', 100386);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100395, 970, 'YEVTXVVRajEVEPlKIJPWWegJzGncVt', 'OzHVSbNfKXcIfIkrSXKCgJVyHYtGvjZmxIPHvAcxgUnSVeoMHoSPGzTBJaKRURfNoYAdsTTXnApCquwDDnWNdQLQLcVfByUOTzNi', 100155);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100396, 846, 'ZjjrdnKrzHYTNTEMzWqZwCbDUtOahd', 'FtZrCMqjPVCsQprHJFHjCCHVoaNOMYmMRVKXPxHNHWbsKZdJgtDDFrpvzAxMSSGVnRxFzfQoUKgXViwwJYXUUDjCPnUPEcOgneeI', 100367);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100397, 1801, 'KoFFfGNINTtUEuYnpXuROksKVtgXKV', 'NdxNvxLqVKboIIXwHtCPUhMwivHmaCatVeNLqbYRHfYWgxpesvRBnRhqaDnxKDjiXYupPawszMbsjhjeqONNVVoitJXGAmWLHrkO', 100167);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100398, 4899, 'uUsIoudYWVEdFSGVEYcDCGReYpUQQk', 'WxWKZQPcEXvkkLNtQGwQchiYnodFefAUczojFVPXiiZIBEgiOBzQFVvbqLYzLyTKLeROrXuEYkAZmwphCFcrtLMSIJJGpABGCVEB', 100355);
insert into TREATMENT (treatment_id, treatment_cost, treatment_name, treatment_description, medical_record_id)
values (100399, 4171, 'cfINHTLSckyIldQZuWbCNCrgxOdEdw', 'mUXuzssCANklJmKVaKojPsqixlQSPyPQuGRkLsVQYDmdonAdZfSKiTITRuyIUrltYnfAxyvreuqNxXHjPstDSXyHVLPSLnQarGRE', 100318);
commit;
prompt 400 records loaded
prompt Loading BILLING...
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100000, 98631.35, 'No', 100352, 100296);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100001, 63302.09, 'Yes', 100230, 100284);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100002, 75536.47, 'Yes', 100169, 100013);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100003, 34493.36, 'No', 100284, 100169);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100004, 61553.74, 'No', 100091, 100279);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100005, 73642.39, 'Yes', 100049, 100311);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100006, 92701.79, 'Yes', 100014, 100309);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100007, 15009.28, 'Yes', 100200, 100197);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100008, 82532.81, 'Yes', 100306, 100370);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100009, 39895.6, 'No', 100137, 100180);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100010, 59894.89, 'No', 100371, 100345);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100011, 77895.38, 'Yes', 100214, 100203);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100012, 70792.31, 'No', 100386, 100013);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100013, 60114.82, 'No', 100385, 100244);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100014, 36714.67, 'No', 100266, 100255);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100015, 29360.77, 'Yes', 100084, 100086);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100016, 66934.76, 'No', 100248, 100392);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100017, 7797.98, 'No', 100118, 100016);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100018, 30775.14, 'No', 100303, 100043);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100019, 20075.03, 'No', 100193, 100041);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100020, 81343.49, 'Yes', 100373, 100307);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100021, 72919.1, 'No', 100065, 100041);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100022, 41236.72, 'Yes', 100235, 100271);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100023, 91199.41, 'No', 100314, 100034);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100024, 38213.82, 'No', 100181, 100046);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100025, 9459.5, 'No', 100339, 100174);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100026, 2837.45, 'Yes', 100139, 100324);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100027, 18918.13, 'Yes', 100390, 100074);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100028, 18084.32, 'Yes', 100003, 100062);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100029, 74439.08, 'No', 100009, 100250);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100030, 28424.25, 'No', 100396, 100290);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100031, 54469.59, 'No', 100109, 100094);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100032, 2868.08, 'Yes', 100259, 100047);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100033, 76447.59, 'No', 100274, 100366);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100034, 54484.21, 'No', 100059, 100035);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100035, 72177.66, 'Yes', 100079, 100221);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100036, 18883.98, 'Yes', 100231, 100008);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100037, 16175.81, 'Yes', 100042, 100350);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100038, 83675.77, 'Yes', 100033, 100276);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100039, 10982.9, 'No', 100199, 100254);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100040, 80887.86, 'Yes', 100040, 100141);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100041, 30446.89, 'No', 100301, 100038);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100042, 29360.02, 'No', 100248, 100057);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100043, 17473.81, 'Yes', 100039, 100335);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100044, 36603.86, 'Yes', 100219, 100308);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100045, 37747.51, 'No', 100096, 100350);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100046, 57631.95, 'Yes', 100035, 100224);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100047, 91418.1, 'Yes', 100015, 100031);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100048, 8255.63, 'No', 100090, 100308);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100049, 80259.21, 'No', 100105, 100365);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100050, 33851.66, 'No', 100099, 100099);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100051, 29793.94, 'Yes', 100159, 100200);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100052, 38097.55, 'Yes', 100137, 100155);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100053, 68889.59, 'Yes', 100210, 100392);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100054, 63675.66, 'No', 100097, 100159);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100055, 67321.16, 'Yes', 100098, 100074);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100056, 32446.05, 'Yes', 100382, 100355);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100057, 25803.57, 'Yes', 100277, 100253);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100058, 39088.1, 'Yes', 100210, 100305);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100059, 24492.59, 'No', 100230, 100330);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100060, 4210.81, 'Yes', 100359, 100175);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100061, 28454.65, 'Yes', 100127, 100348);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100062, 79931.98, 'No', 100321, 100140);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100063, 47605.23, 'Yes', 100095, 100164);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100064, 16926, 'No', 100292, 100323);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100065, 54116.15, 'Yes', 100315, 100340);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100066, 79940.48, 'Yes', 100386, 100047);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100067, 55291.52, 'No', 100352, 100370);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100068, 29281.59, 'Yes', 100267, 100022);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100069, 23412.47, 'Yes', 100100, 100222);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100070, 48768.15, 'Yes', 100014, 100256);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100071, 80550.63, 'No', 100356, 100011);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100072, 38154.52, 'Yes', 100206, 100084);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100073, 42850.34, 'No', 100223, 100196);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100074, 56022.16, 'No', 100037, 100329);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100075, 15779.65, 'No', 100130, 100298);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100076, 22640.02, 'No', 100247, 100385);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100077, 50350.05, 'Yes', 100084, 100148);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100078, 75793.6, 'Yes', 100090, 100227);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100079, 54304.89, 'Yes', 100341, 100060);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100080, 87082.83, 'Yes', 100315, 100141);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100081, 57776.71, 'No', 100111, 100322);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100082, 30188.67, 'Yes', 100181, 100188);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100083, 37413.1, 'Yes', 100276, 100022);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100084, 7108.44, 'No', 100095, 100182);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100085, 94971.52, 'Yes', 100143, 100393);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100086, 31859.96, 'Yes', 100270, 100203);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100087, 94882.73, 'No', 100215, 100282);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100088, 69154.36, 'Yes', 100214, 100027);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100089, 54283.01, 'Yes', 100196, 100148);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100090, 29537.71, 'Yes', 100241, 100289);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100091, 91515.17, 'Yes', 100208, 100182);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100092, 19501.36, 'Yes', 100209, 100162);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100093, 32598.26, 'Yes', 100046, 100155);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100094, 50561.04, 'Yes', 100280, 100367);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100095, 68666.03, 'Yes', 100049, 100185);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100096, 3304.72, 'Yes', 100107, 100309);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100097, 76374.18, 'Yes', 100000, 100039);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100098, 45409.2, 'No', 100046, 100133);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100099, 88776.35, 'Yes', 100050, 100149);
commit;
prompt 100 records committed...
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100100, 11125.48, 'No', 100396, 100107);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100101, 26168.78, 'No', 100070, 100361);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100102, 30732.83, 'Yes', 100252, 100134);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100103, 79903.88, 'Yes', 100219, 100004);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100104, 21961.7, 'Yes', 100003, 100183);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100105, 57672.37, 'No', 100351, 100088);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100106, 33385.23, 'No', 100234, 100047);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100107, 78254.31, 'Yes', 100233, 100025);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100108, 46779.69, 'Yes', 100268, 100028);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100109, 28738.83, 'Yes', 100195, 100072);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100110, 34453.54, 'Yes', 100327, 100148);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100111, 72712.55, 'No', 100210, 100307);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100112, 72545.28, 'Yes', 100118, 100276);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100113, 20416.88, 'No', 100186, 100122);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100114, 12790.07, 'No', 100245, 100392);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100115, 48373.94, 'No', 100292, 100242);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100116, 6255.06, 'Yes', 100044, 100170);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100117, 81981.31, 'No', 100112, 100079);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100118, 88043.51, 'No', 100249, 100286);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100119, 30075.51, 'Yes', 100212, 100393);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100120, 16967.64, 'Yes', 100074, 100248);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100121, 75464.22, 'Yes', 100144, 100095);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100122, 66690.2, 'No', 100328, 100361);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100123, 26427.26, 'Yes', 100072, 100367);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100124, 81834.87, 'Yes', 100149, 100208);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100125, 17686.31, 'No', 100012, 100104);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100126, 82565.33, 'Yes', 100169, 100054);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100127, 73343.39, 'Yes', 100319, 100292);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100128, 29633.13, 'No', 100098, 100389);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100129, 24288.09, 'No', 100175, 100098);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100130, 43394.27, 'Yes', 100337, 100377);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100131, 78573.54, 'No', 100120, 100294);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100132, 81794.56, 'Yes', 100014, 100046);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100133, 54761.14, 'Yes', 100199, 100002);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100134, 72323.74, 'Yes', 100246, 100193);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100135, 64234.05, 'No', 100135, 100366);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100136, 99938.3, 'Yes', 100226, 100021);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100137, 55479.37, 'Yes', 100332, 100349);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100138, 53953.11, 'No', 100135, 100094);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100139, 11339.2, 'No', 100093, 100250);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100140, 27401.77, 'No', 100077, 100222);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100141, 3230.26, 'Yes', 100278, 100156);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100142, 75865.66, 'Yes', 100243, 100272);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100143, 2832.48, 'No', 100369, 100108);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100144, 32271.88, 'Yes', 100297, 100297);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100145, 48246.13, 'No', 100374, 100398);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100146, 74159.78, 'No', 100387, 100398);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100147, 68117.84, 'Yes', 100353, 100395);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100148, 53416.32, 'No', 100181, 100306);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100149, 60235.34, 'No', 100363, 100284);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100150, 75980.24, 'Yes', 100331, 100292);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100151, 27590.91, 'Yes', 100034, 100140);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100152, 43014.79, 'Yes', 100359, 100200);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100153, 69913.62, 'No', 100169, 100328);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100154, 44049.46, 'Yes', 100167, 100205);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100155, 33670.28, 'Yes', 100367, 100017);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100156, 10090.25, 'Yes', 100376, 100096);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100157, 14035.23, 'Yes', 100273, 100232);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100158, 19698.77, 'Yes', 100287, 100286);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100159, 17328.74, 'No', 100052, 100220);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100160, 64040.15, 'Yes', 100265, 100147);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100161, 77424.28, 'Yes', 100088, 100351);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100162, 66899.59, 'Yes', 100156, 100064);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100163, 30124.51, 'Yes', 100309, 100338);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100164, 60167.73, 'No', 100119, 100024);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100165, 40005.96, 'Yes', 100334, 100379);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100166, 17294.75, 'Yes', 100292, 100318);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100167, 88732.54, 'Yes', 100051, 100032);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100168, 41213.24, 'Yes', 100073, 100384);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100169, 16837.76, 'No', 100211, 100012);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100170, 11229.74, 'No', 100238, 100155);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100171, 19475.71, 'Yes', 100260, 100109);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100172, 81885.17, 'Yes', 100272, 100351);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100173, 4140.76, 'Yes', 100178, 100035);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100174, 43783.88, 'Yes', 100136, 100083);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100175, 98856.09, 'Yes', 100363, 100396);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100176, 33891.54, 'No', 100050, 100188);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100177, 22330.86, 'No', 100323, 100187);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100178, 8301.69, 'No', 100305, 100288);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100179, 2586.23, 'Yes', 100206, 100014);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100180, 66971.13, 'Yes', 100303, 100372);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100181, 60050.04, 'Yes', 100343, 100241);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100182, 38424.03, 'Yes', 100014, 100107);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100183, 43120.35, 'Yes', 100029, 100059);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100184, 15924.74, 'No', 100267, 100270);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100185, 18197.6, 'No', 100316, 100281);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100186, 54119.42, 'Yes', 100257, 100305);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100187, 19185.63, 'Yes', 100041, 100268);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100188, 21146.4, 'Yes', 100288, 100012);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100189, 51961.41, 'Yes', 100274, 100171);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100190, 4215.25, 'No', 100129, 100148);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100191, 55313.46, 'Yes', 100395, 100102);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100192, 74654.68, 'No', 100202, 100368);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100193, 17349.16, 'Yes', 100186, 100233);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100194, 9429.07, 'Yes', 100398, 100079);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100195, 48370.67, 'Yes', 100363, 100216);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100196, 63623.9, 'No', 100108, 100225);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100197, 12219.64, 'No', 100322, 100326);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100198, 7899.8, 'Yes', 100286, 100394);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100199, 9590.77, 'Yes', 100312, 100337);
commit;
prompt 200 records committed...
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100200, 12915.41, 'No', 100340, 100056);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100201, 21813.94, 'No', 100037, 100113);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100202, 97219, 'Yes', 100239, 100315);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100203, 8605.25, 'Yes', 100078, 100336);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100204, 29108.8, 'Yes', 100249, 100200);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100205, 61786.72, 'Yes', 100143, 100143);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100206, 80462.11, 'Yes', 100302, 100266);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100207, 17974.78, 'Yes', 100141, 100105);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100208, 45533.17, 'Yes', 100172, 100335);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100209, 22737.49, 'No', 100081, 100121);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100210, 7219.72, 'Yes', 100096, 100148);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100211, 56220.5, 'Yes', 100398, 100235);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100212, 64798.4, 'No', 100207, 100154);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100213, 12241.81, 'Yes', 100300, 100387);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100214, 18128.8, 'Yes', 100395, 100015);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100215, 32355.22, 'No', 100144, 100283);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100216, 3326.37, 'No', 100193, 100040);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100217, 99882.58, 'Yes', 100232, 100188);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100218, 89903.96, 'Yes', 100294, 100346);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100219, 87914.72, 'No', 100040, 100253);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100220, 33382.23, 'No', 100081, 100139);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100221, 62281.26, 'Yes', 100264, 100356);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100222, 78868.69, 'Yes', 100392, 100323);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100223, 43488.98, 'No', 100094, 100073);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100224, 29605.63, 'Yes', 100308, 100236);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100225, 23629.14, 'No', 100115, 100378);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100226, 62986.63, 'No', 100362, 100106);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100227, 39253.41, 'Yes', 100030, 100262);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100228, 10541.98, 'Yes', 100176, 100034);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100229, 1718.6, 'Yes', 100010, 100278);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100230, 86892.78, 'Yes', 100127, 100305);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100231, 81000.14, 'No', 100067, 100213);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100232, 82673.73, 'No', 100225, 100221);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100233, 50974.31, 'Yes', 100256, 100086);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100234, 6424.8, 'Yes', 100235, 100258);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100235, 83669.23, 'Yes', 100096, 100064);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100236, 85951.56, 'Yes', 100207, 100352);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100237, 7484.56, 'Yes', 100019, 100114);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100238, 29654.24, 'Yes', 100237, 100305);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100239, 14379.97, 'No', 100048, 100171);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100240, 35325.66, 'No', 100260, 100321);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100241, 30032.42, 'Yes', 100093, 100035);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100242, 63917.77, 'Yes', 100257, 100062);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100243, 35462.07, 'Yes', 100276, 100191);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100244, 64777.02, 'No', 100090, 100236);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100245, 46627.05, 'Yes', 100081, 100354);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100246, 57848.46, 'No', 100169, 100299);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100247, 50486.94, 'No', 100326, 100146);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100248, 72848.6, 'No', 100136, 100296);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100249, 96534.95, 'No', 100366, 100284);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100250, 44907.01, 'Yes', 100375, 100012);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100251, 46298.96, 'Yes', 100113, 100308);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100252, 64676.64, 'No', 100351, 100262);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100253, 75311.18, 'Yes', 100089, 100022);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100254, 87413, 'Yes', 100174, 100296);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100255, 37046.69, 'No', 100296, 100268);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100256, 96021.9, 'Yes', 100179, 100136);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100257, 76830.62, 'Yes', 100322, 100221);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100258, 21576.15, 'No', 100143, 100229);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100259, 8214.15, 'No', 100255, 100011);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100260, 18300.88, 'No', 100122, 100035);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100261, 38819.23, 'No', 100044, 100270);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100262, 98027.59, 'Yes', 100109, 100335);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100263, 59652.05, 'No', 100063, 100197);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100264, 19617.1, 'No', 100124, 100063);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100265, 84885.29, 'Yes', 100115, 100164);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100266, 30351.06, 'Yes', 100324, 100068);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100267, 51109.07, 'No', 100059, 100028);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100268, 71292.36, 'Yes', 100340, 100192);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100269, 70550.67, 'Yes', 100053, 100383);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100270, 33614.19, 'Yes', 100239, 100084);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100271, 43763.05, 'Yes', 100032, 100328);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100272, 70897.94, 'No', 100313, 100130);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100273, 24782.04, 'Yes', 100007, 100164);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100274, 71899.75, 'No', 100084, 100115);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100275, 45252.33, 'No', 100387, 100216);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100276, 84785.91, 'Yes', 100148, 100002);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100277, 94022.17, 'Yes', 100331, 100178);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100278, 1336.91, 'Yes', 100035, 100045);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100279, 53206.9, 'No', 100121, 100184);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100280, 93120.34, 'No', 100091, 100221);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100281, 88221.13, 'No', 100362, 100004);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100282, 11632.45, 'No', 100196, 100187);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100283, 98779.74, 'Yes', 100004, 100366);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100284, 33408.55, 'Yes', 100097, 100165);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100285, 21867.58, 'No', 100395, 100002);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100286, 72602.06, 'Yes', 100171, 100352);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100287, 91178, 'No', 100149, 100020);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100288, 43032.4, 'No', 100211, 100051);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100289, 58020, 'No', 100054, 100395);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100290, 77201.56, 'No', 100240, 100132);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100291, 60194.29, 'No', 100387, 100198);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100292, 5279.49, 'Yes', 100142, 100012);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100293, 54337.94, 'No', 100272, 100335);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100294, 84058.15, 'Yes', 100132, 100368);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100295, 737.92, 'No', 100245, 100022);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100296, 90374.43, 'Yes', 100034, 100368);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100297, 4613.28, 'No', 100061, 100183);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100298, 62501.67, 'No', 100202, 100229);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100299, 15866.15, 'No', 100116, 100163);
commit;
prompt 300 records committed...
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100300, 3010.1, 'Yes', 100047, 100304);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100301, 82301.47, 'Yes', 100093, 100184);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100302, 35595.86, 'Yes', 100206, 100287);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100303, 61815.44, 'Yes', 100041, 100309);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100304, 20878.9, 'Yes', 100325, 100148);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100305, 87052.78, 'Yes', 100269, 100342);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100306, 24169.57, 'No', 100074, 100390);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100307, 91032.7, 'Yes', 100077, 100246);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100308, 43203.97, 'No', 100179, 100037);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100309, 85243.58, 'Yes', 100098, 100293);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100310, 90348.06, 'No', 100288, 100337);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100311, 95706.52, 'No', 100277, 100130);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100312, 32270.48, 'Yes', 100055, 100201);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100313, 55507.53, 'Yes', 100269, 100380);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100314, 82584.21, 'No', 100254, 100156);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100315, 51798.48, 'Yes', 100262, 100362);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100316, 56956.86, 'Yes', 100314, 100033);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100317, 31766.87, 'Yes', 100230, 100333);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100318, 77189.81, 'Yes', 100280, 100375);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100319, 62074.31, 'Yes', 100399, 100264);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100320, 37766.04, 'Yes', 100003, 100367);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100321, 47263.7, 'No', 100158, 100335);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100322, 23866.76, 'No', 100348, 100300);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100323, 1635.23, 'Yes', 100173, 100355);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100324, 88856.72, 'Yes', 100033, 100150);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100325, 78591.14, 'Yes', 100140, 100107);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100326, 87738.36, 'Yes', 100090, 100289);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100327, 58949.14, 'Yes', 100161, 100223);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100328, 64074.62, 'Yes', 100353, 100318);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100329, 89224.68, 'Yes', 100141, 100376);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100330, 95880.55, 'Yes', 100365, 100027);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100331, 82881.89, 'Yes', 100012, 100003);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100332, 97983.7, 'Yes', 100323, 100074);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100333, 73053.36, 'No', 100385, 100352);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100334, 78353.15, 'Yes', 100032, 100000);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100335, 24228.54, 'Yes', 100019, 100250);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100336, 52397.45, 'Yes', 100295, 100358);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100337, 97911.04, 'Yes', 100127, 100003);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100338, 13231.12, 'Yes', 100324, 100172);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100339, 78744.57, 'Yes', 100293, 100215);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100340, 57410.11, 'Yes', 100379, 100124);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100341, 50607.68, 'Yes', 100028, 100333);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100342, 69135.81, 'Yes', 100026, 100259);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100343, 34177.2, 'Yes', 100340, 100119);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100344, 57427.95, 'No', 100026, 100219);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100345, 78460.54, 'Yes', 100133, 100049);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100346, 51766.19, 'Yes', 100247, 100003);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100347, 10296.58, 'No', 100234, 100230);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100348, 53700.47, 'Yes', 100000, 100050);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100349, 35825.46, 'Yes', 100240, 100246);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100350, 44430.13, 'No', 100398, 100248);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100351, 4927.04, 'Yes', 100194, 100335);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100352, 48351.73, 'Yes', 100350, 100267);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100353, 25128.11, 'Yes', 100281, 100276);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100354, 53575.65, 'No', 100165, 100017);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100355, 36978.39, 'Yes', 100157, 100018);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100356, 87911.49, 'Yes', 100392, 100233);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100357, 42395.24, 'Yes', 100295, 100023);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100358, 52322.13, 'Yes', 100282, 100382);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100359, 90477.13, 'Yes', 100158, 100134);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100360, 8346.58, 'No', 100276, 100300);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100361, 20785.9, 'Yes', 100001, 100179);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100362, 23991.6, 'No', 100112, 100345);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100363, 58597.7, 'No', 100295, 100283);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100364, 75592.05, 'No', 100167, 100085);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100365, 73122.74, 'No', 100375, 100121);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100366, 5639.98, 'No', 100016, 100306);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100367, 85693.75, 'No', 100316, 100285);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100368, 34082.49, 'No', 100219, 100344);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100369, 37923.22, 'No', 100027, 100182);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100370, 32088.33, 'Yes', 100132, 100346);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100371, 13829.37, 'No', 100383, 100057);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100372, 45783.23, 'Yes', 100145, 100049);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100373, 20430.88, 'No', 100370, 100332);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100374, 79954.07, 'No', 100346, 100095);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100375, 23310.35, 'Yes', 100257, 100285);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100376, 37221.63, 'No', 100001, 100260);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100377, 38146.57, 'No', 100001, 100044);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100378, 11682.29, 'Yes', 100272, 100212);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100379, 79215.45, 'Yes', 100065, 100304);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100380, 41518.3, 'No', 100151, 100001);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100381, 64359.75, 'Yes', 100273, 100178);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100382, 17076.94, 'No', 100022, 100258);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100383, 74427.59, 'Yes', 100279, 100367);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100384, 42918.36, 'Yes', 100050, 100137);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100385, 71679.66, 'Yes', 100070, 100052);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100386, 59832.14, 'No', 100187, 100168);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100387, 72165.18, 'Yes', 100089, 100322);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100388, 20322.7, 'Yes', 100215, 100046);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100389, 75566.64, 'Yes', 100184, 100114);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100390, 20563.36, 'No', 100204, 100133);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100391, 51013.29, 'No', 100182, 100290);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100392, 90319.22, 'No', 100201, 100296);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100393, 78363.35, 'Yes', 100088, 100225);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100394, 38838.73, 'No', 100338, 100067);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100395, 47954.98, 'No', 100312, 100136);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100396, 53214.07, 'Yes', 100175, 100121);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100397, 13326.03, 'Yes', 100312, 100324);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100398, 59210.25, 'No', 100054, 100290);
insert into BILLING (billing_id, total_cost, payment_status, patient_id, treatment_id)
values (100399, 2902.49, 'No', 100076, 100147);
commit;
prompt 400 records loaded
prompt Loading DOCPAT...
insert into DOCPAT (patient_id, doctor_id)
values (100000, 100011);
insert into DOCPAT (patient_id, doctor_id)
values (100000, 100101);
insert into DOCPAT (patient_id, doctor_id)
values (100002, 100380);
insert into DOCPAT (patient_id, doctor_id)
values (100003, 100035);
insert into DOCPAT (patient_id, doctor_id)
values (100003, 100060);
insert into DOCPAT (patient_id, doctor_id)
values (100003, 100334);
insert into DOCPAT (patient_id, doctor_id)
values (100004, 100223);
insert into DOCPAT (patient_id, doctor_id)
values (100005, 100050);
insert into DOCPAT (patient_id, doctor_id)
values (100007, 100218);
insert into DOCPAT (patient_id, doctor_id)
values (100008, 100171);
insert into DOCPAT (patient_id, doctor_id)
values (100009, 100136);
insert into DOCPAT (patient_id, doctor_id)
values (100009, 100140);
insert into DOCPAT (patient_id, doctor_id)
values (100011, 100246);
insert into DOCPAT (patient_id, doctor_id)
values (100014, 100005);
insert into DOCPAT (patient_id, doctor_id)
values (100016, 100089);
insert into DOCPAT (patient_id, doctor_id)
values (100017, 100139);
insert into DOCPAT (patient_id, doctor_id)
values (100017, 100375);
insert into DOCPAT (patient_id, doctor_id)
values (100018, 100049);
insert into DOCPAT (patient_id, doctor_id)
values (100020, 100024);
insert into DOCPAT (patient_id, doctor_id)
values (100022, 100252);
insert into DOCPAT (patient_id, doctor_id)
values (100024, 100316);
insert into DOCPAT (patient_id, doctor_id)
values (100025, 100137);
insert into DOCPAT (patient_id, doctor_id)
values (100026, 100064);
insert into DOCPAT (patient_id, doctor_id)
values (100026, 100143);
insert into DOCPAT (patient_id, doctor_id)
values (100027, 100078);
insert into DOCPAT (patient_id, doctor_id)
values (100027, 100101);
insert into DOCPAT (patient_id, doctor_id)
values (100027, 100385);
insert into DOCPAT (patient_id, doctor_id)
values (100028, 100091);
insert into DOCPAT (patient_id, doctor_id)
values (100029, 100249);
insert into DOCPAT (patient_id, doctor_id)
values (100030, 100141);
insert into DOCPAT (patient_id, doctor_id)
values (100032, 100269);
insert into DOCPAT (patient_id, doctor_id)
values (100034, 100040);
insert into DOCPAT (patient_id, doctor_id)
values (100036, 100327);
insert into DOCPAT (patient_id, doctor_id)
values (100037, 100047);
insert into DOCPAT (patient_id, doctor_id)
values (100037, 100050);
insert into DOCPAT (patient_id, doctor_id)
values (100038, 100320);
insert into DOCPAT (patient_id, doctor_id)
values (100038, 100340);
insert into DOCPAT (patient_id, doctor_id)
values (100039, 100020);
insert into DOCPAT (patient_id, doctor_id)
values (100040, 100068);
insert into DOCPAT (patient_id, doctor_id)
values (100040, 100268);
insert into DOCPAT (patient_id, doctor_id)
values (100040, 100295);
insert into DOCPAT (patient_id, doctor_id)
values (100040, 100394);
insert into DOCPAT (patient_id, doctor_id)
values (100041, 100290);
insert into DOCPAT (patient_id, doctor_id)
values (100042, 100126);
insert into DOCPAT (patient_id, doctor_id)
values (100042, 100131);
insert into DOCPAT (patient_id, doctor_id)
values (100043, 100252);
insert into DOCPAT (patient_id, doctor_id)
values (100045, 100293);
insert into DOCPAT (patient_id, doctor_id)
values (100047, 100074);
insert into DOCPAT (patient_id, doctor_id)
values (100050, 100221);
insert into DOCPAT (patient_id, doctor_id)
values (100051, 100118);
insert into DOCPAT (patient_id, doctor_id)
values (100052, 100325);
insert into DOCPAT (patient_id, doctor_id)
values (100053, 100322);
insert into DOCPAT (patient_id, doctor_id)
values (100055, 100050);
insert into DOCPAT (patient_id, doctor_id)
values (100056, 100370);
insert into DOCPAT (patient_id, doctor_id)
values (100057, 100289);
insert into DOCPAT (patient_id, doctor_id)
values (100058, 100315);
insert into DOCPAT (patient_id, doctor_id)
values (100059, 100111);
insert into DOCPAT (patient_id, doctor_id)
values (100059, 100220);
insert into DOCPAT (patient_id, doctor_id)
values (100060, 100312);
insert into DOCPAT (patient_id, doctor_id)
values (100064, 100357);
insert into DOCPAT (patient_id, doctor_id)
values (100065, 100099);
insert into DOCPAT (patient_id, doctor_id)
values (100067, 100032);
insert into DOCPAT (patient_id, doctor_id)
values (100067, 100127);
insert into DOCPAT (patient_id, doctor_id)
values (100067, 100334);
insert into DOCPAT (patient_id, doctor_id)
values (100068, 100010);
insert into DOCPAT (patient_id, doctor_id)
values (100068, 100222);
insert into DOCPAT (patient_id, doctor_id)
values (100069, 100191);
insert into DOCPAT (patient_id, doctor_id)
values (100069, 100259);
insert into DOCPAT (patient_id, doctor_id)
values (100070, 100229);
insert into DOCPAT (patient_id, doctor_id)
values (100075, 100288);
insert into DOCPAT (patient_id, doctor_id)
values (100076, 100176);
insert into DOCPAT (patient_id, doctor_id)
values (100077, 100292);
insert into DOCPAT (patient_id, doctor_id)
values (100079, 100224);
insert into DOCPAT (patient_id, doctor_id)
values (100079, 100344);
insert into DOCPAT (patient_id, doctor_id)
values (100079, 100378);
insert into DOCPAT (patient_id, doctor_id)
values (100080, 100121);
insert into DOCPAT (patient_id, doctor_id)
values (100080, 100266);
insert into DOCPAT (patient_id, doctor_id)
values (100081, 100222);
insert into DOCPAT (patient_id, doctor_id)
values (100082, 100261);
insert into DOCPAT (patient_id, doctor_id)
values (100083, 100179);
insert into DOCPAT (patient_id, doctor_id)
values (100086, 100188);
insert into DOCPAT (patient_id, doctor_id)
values (100086, 100283);
insert into DOCPAT (patient_id, doctor_id)
values (100086, 100363);
insert into DOCPAT (patient_id, doctor_id)
values (100087, 100008);
insert into DOCPAT (patient_id, doctor_id)
values (100087, 100094);
insert into DOCPAT (patient_id, doctor_id)
values (100088, 100125);
insert into DOCPAT (patient_id, doctor_id)
values (100089, 100142);
insert into DOCPAT (patient_id, doctor_id)
values (100091, 100115);
insert into DOCPAT (patient_id, doctor_id)
values (100093, 100299);
insert into DOCPAT (patient_id, doctor_id)
values (100093, 100346);
insert into DOCPAT (patient_id, doctor_id)
values (100094, 100356);
insert into DOCPAT (patient_id, doctor_id)
values (100095, 100092);
insert into DOCPAT (patient_id, doctor_id)
values (100097, 100009);
insert into DOCPAT (patient_id, doctor_id)
values (100097, 100164);
insert into DOCPAT (patient_id, doctor_id)
values (100097, 100364);
insert into DOCPAT (patient_id, doctor_id)
values (100101, 100110);
insert into DOCPAT (patient_id, doctor_id)
values (100101, 100230);
insert into DOCPAT (patient_id, doctor_id)
values (100102, 100333);
insert into DOCPAT (patient_id, doctor_id)
values (100102, 100394);
insert into DOCPAT (patient_id, doctor_id)
values (100105, 100103);
commit;
prompt 100 records committed...
insert into DOCPAT (patient_id, doctor_id)
values (100105, 100348);
insert into DOCPAT (patient_id, doctor_id)
values (100105, 100393);
insert into DOCPAT (patient_id, doctor_id)
values (100107, 100119);
insert into DOCPAT (patient_id, doctor_id)
values (100107, 100210);
insert into DOCPAT (patient_id, doctor_id)
values (100108, 100066);
insert into DOCPAT (patient_id, doctor_id)
values (100108, 100148);
insert into DOCPAT (patient_id, doctor_id)
values (100108, 100153);
insert into DOCPAT (patient_id, doctor_id)
values (100108, 100256);
insert into DOCPAT (patient_id, doctor_id)
values (100111, 100262);
insert into DOCPAT (patient_id, doctor_id)
values (100112, 100321);
insert into DOCPAT (patient_id, doctor_id)
values (100112, 100376);
insert into DOCPAT (patient_id, doctor_id)
values (100113, 100258);
insert into DOCPAT (patient_id, doctor_id)
values (100115, 100142);
insert into DOCPAT (patient_id, doctor_id)
values (100116, 100380);
insert into DOCPAT (patient_id, doctor_id)
values (100117, 100365);
insert into DOCPAT (patient_id, doctor_id)
values (100118, 100169);
insert into DOCPAT (patient_id, doctor_id)
values (100119, 100376);
insert into DOCPAT (patient_id, doctor_id)
values (100120, 100151);
insert into DOCPAT (patient_id, doctor_id)
values (100120, 100264);
insert into DOCPAT (patient_id, doctor_id)
values (100121, 100342);
insert into DOCPAT (patient_id, doctor_id)
values (100124, 100083);
insert into DOCPAT (patient_id, doctor_id)
values (100124, 100269);
insert into DOCPAT (patient_id, doctor_id)
values (100128, 100212);
insert into DOCPAT (patient_id, doctor_id)
values (100130, 100008);
insert into DOCPAT (patient_id, doctor_id)
values (100130, 100073);
insert into DOCPAT (patient_id, doctor_id)
values (100131, 100219);
insert into DOCPAT (patient_id, doctor_id)
values (100132, 100255);
insert into DOCPAT (patient_id, doctor_id)
values (100133, 100060);
insert into DOCPAT (patient_id, doctor_id)
values (100136, 100354);
insert into DOCPAT (patient_id, doctor_id)
values (100138, 100143);
insert into DOCPAT (patient_id, doctor_id)
values (100140, 100099);
insert into DOCPAT (patient_id, doctor_id)
values (100140, 100161);
insert into DOCPAT (patient_id, doctor_id)
values (100140, 100317);
insert into DOCPAT (patient_id, doctor_id)
values (100140, 100347);
insert into DOCPAT (patient_id, doctor_id)
values (100141, 100074);
insert into DOCPAT (patient_id, doctor_id)
values (100143, 100016);
insert into DOCPAT (patient_id, doctor_id)
values (100143, 100251);
insert into DOCPAT (patient_id, doctor_id)
values (100145, 100162);
insert into DOCPAT (patient_id, doctor_id)
values (100146, 100202);
insert into DOCPAT (patient_id, doctor_id)
values (100146, 100375);
insert into DOCPAT (patient_id, doctor_id)
values (100148, 100196);
insert into DOCPAT (patient_id, doctor_id)
values (100148, 100378);
insert into DOCPAT (patient_id, doctor_id)
values (100149, 100082);
insert into DOCPAT (patient_id, doctor_id)
values (100150, 100259);
insert into DOCPAT (patient_id, doctor_id)
values (100151, 100050);
insert into DOCPAT (patient_id, doctor_id)
values (100154, 100050);
insert into DOCPAT (patient_id, doctor_id)
values (100156, 100008);
insert into DOCPAT (patient_id, doctor_id)
values (100156, 100247);
insert into DOCPAT (patient_id, doctor_id)
values (100157, 100203);
insert into DOCPAT (patient_id, doctor_id)
values (100163, 100137);
insert into DOCPAT (patient_id, doctor_id)
values (100163, 100150);
insert into DOCPAT (patient_id, doctor_id)
values (100163, 100250);
insert into DOCPAT (patient_id, doctor_id)
values (100163, 100323);
insert into DOCPAT (patient_id, doctor_id)
values (100164, 100166);
insert into DOCPAT (patient_id, doctor_id)
values (100165, 100184);
insert into DOCPAT (patient_id, doctor_id)
values (100165, 100277);
insert into DOCPAT (patient_id, doctor_id)
values (100166, 100156);
insert into DOCPAT (patient_id, doctor_id)
values (100167, 100174);
insert into DOCPAT (patient_id, doctor_id)
values (100167, 100233);
insert into DOCPAT (patient_id, doctor_id)
values (100168, 100124);
insert into DOCPAT (patient_id, doctor_id)
values (100168, 100144);
insert into DOCPAT (patient_id, doctor_id)
values (100169, 100391);
insert into DOCPAT (patient_id, doctor_id)
values (100172, 100035);
insert into DOCPAT (patient_id, doctor_id)
values (100175, 100161);
insert into DOCPAT (patient_id, doctor_id)
values (100175, 100259);
insert into DOCPAT (patient_id, doctor_id)
values (100175, 100316);
insert into DOCPAT (patient_id, doctor_id)
values (100176, 100077);
insert into DOCPAT (patient_id, doctor_id)
values (100177, 100164);
insert into DOCPAT (patient_id, doctor_id)
values (100180, 100011);
insert into DOCPAT (patient_id, doctor_id)
values (100181, 100299);
insert into DOCPAT (patient_id, doctor_id)
values (100183, 100242);
insert into DOCPAT (patient_id, doctor_id)
values (100184, 100330);
insert into DOCPAT (patient_id, doctor_id)
values (100186, 100048);
insert into DOCPAT (patient_id, doctor_id)
values (100187, 100192);
insert into DOCPAT (patient_id, doctor_id)
values (100187, 100220);
insert into DOCPAT (patient_id, doctor_id)
values (100187, 100352);
insert into DOCPAT (patient_id, doctor_id)
values (100188, 100124);
insert into DOCPAT (patient_id, doctor_id)
values (100188, 100138);
insert into DOCPAT (patient_id, doctor_id)
values (100190, 100240);
insert into DOCPAT (patient_id, doctor_id)
values (100190, 100326);
insert into DOCPAT (patient_id, doctor_id)
values (100191, 100033);
insert into DOCPAT (patient_id, doctor_id)
values (100191, 100233);
insert into DOCPAT (patient_id, doctor_id)
values (100194, 100304);
insert into DOCPAT (patient_id, doctor_id)
values (100195, 100002);
insert into DOCPAT (patient_id, doctor_id)
values (100195, 100140);
insert into DOCPAT (patient_id, doctor_id)
values (100195, 100153);
insert into DOCPAT (patient_id, doctor_id)
values (100198, 100330);
insert into DOCPAT (patient_id, doctor_id)
values (100200, 100041);
insert into DOCPAT (patient_id, doctor_id)
values (100200, 100218);
insert into DOCPAT (patient_id, doctor_id)
values (100201, 100337);
insert into DOCPAT (patient_id, doctor_id)
values (100202, 100109);
insert into DOCPAT (patient_id, doctor_id)
values (100202, 100123);
insert into DOCPAT (patient_id, doctor_id)
values (100202, 100378);
insert into DOCPAT (patient_id, doctor_id)
values (100205, 100184);
insert into DOCPAT (patient_id, doctor_id)
values (100206, 100301);
insert into DOCPAT (patient_id, doctor_id)
values (100206, 100371);
insert into DOCPAT (patient_id, doctor_id)
values (100207, 100375);
insert into DOCPAT (patient_id, doctor_id)
values (100208, 100125);
insert into DOCPAT (patient_id, doctor_id)
values (100208, 100136);
insert into DOCPAT (patient_id, doctor_id)
values (100208, 100379);
commit;
prompt 200 records committed...
insert into DOCPAT (patient_id, doctor_id)
values (100210, 100016);
insert into DOCPAT (patient_id, doctor_id)
values (100210, 100211);
insert into DOCPAT (patient_id, doctor_id)
values (100210, 100265);
insert into DOCPAT (patient_id, doctor_id)
values (100210, 100320);
insert into DOCPAT (patient_id, doctor_id)
values (100211, 100018);
insert into DOCPAT (patient_id, doctor_id)
values (100211, 100236);
insert into DOCPAT (patient_id, doctor_id)
values (100212, 100299);
insert into DOCPAT (patient_id, doctor_id)
values (100214, 100214);
insert into DOCPAT (patient_id, doctor_id)
values (100215, 100342);
insert into DOCPAT (patient_id, doctor_id)
values (100216, 100181);
insert into DOCPAT (patient_id, doctor_id)
values (100217, 100201);
insert into DOCPAT (patient_id, doctor_id)
values (100218, 100354);
insert into DOCPAT (patient_id, doctor_id)
values (100219, 100300);
insert into DOCPAT (patient_id, doctor_id)
values (100220, 100065);
insert into DOCPAT (patient_id, doctor_id)
values (100221, 100014);
insert into DOCPAT (patient_id, doctor_id)
values (100221, 100070);
insert into DOCPAT (patient_id, doctor_id)
values (100224, 100380);
insert into DOCPAT (patient_id, doctor_id)
values (100225, 100032);
insert into DOCPAT (patient_id, doctor_id)
values (100225, 100151);
insert into DOCPAT (patient_id, doctor_id)
values (100226, 100044);
insert into DOCPAT (patient_id, doctor_id)
values (100227, 100310);
insert into DOCPAT (patient_id, doctor_id)
values (100228, 100305);
insert into DOCPAT (patient_id, doctor_id)
values (100229, 100098);
insert into DOCPAT (patient_id, doctor_id)
values (100231, 100125);
insert into DOCPAT (patient_id, doctor_id)
values (100231, 100236);
insert into DOCPAT (patient_id, doctor_id)
values (100234, 100199);
insert into DOCPAT (patient_id, doctor_id)
values (100235, 100083);
insert into DOCPAT (patient_id, doctor_id)
values (100236, 100118);
insert into DOCPAT (patient_id, doctor_id)
values (100237, 100227);
insert into DOCPAT (patient_id, doctor_id)
values (100240, 100072);
insert into DOCPAT (patient_id, doctor_id)
values (100241, 100049);
insert into DOCPAT (patient_id, doctor_id)
values (100241, 100210);
insert into DOCPAT (patient_id, doctor_id)
values (100242, 100043);
insert into DOCPAT (patient_id, doctor_id)
values (100242, 100131);
insert into DOCPAT (patient_id, doctor_id)
values (100242, 100178);
insert into DOCPAT (patient_id, doctor_id)
values (100245, 100055);
insert into DOCPAT (patient_id, doctor_id)
values (100245, 100193);
insert into DOCPAT (patient_id, doctor_id)
values (100246, 100118);
insert into DOCPAT (patient_id, doctor_id)
values (100248, 100309);
insert into DOCPAT (patient_id, doctor_id)
values (100249, 100147);
insert into DOCPAT (patient_id, doctor_id)
values (100249, 100294);
insert into DOCPAT (patient_id, doctor_id)
values (100249, 100302);
insert into DOCPAT (patient_id, doctor_id)
values (100249, 100318);
insert into DOCPAT (patient_id, doctor_id)
values (100250, 100197);
insert into DOCPAT (patient_id, doctor_id)
values (100251, 100371);
insert into DOCPAT (patient_id, doctor_id)
values (100252, 100033);
insert into DOCPAT (patient_id, doctor_id)
values (100256, 100255);
insert into DOCPAT (patient_id, doctor_id)
values (100257, 100365);
insert into DOCPAT (patient_id, doctor_id)
values (100258, 100287);
insert into DOCPAT (patient_id, doctor_id)
values (100259, 100387);
insert into DOCPAT (patient_id, doctor_id)
values (100260, 100029);
insert into DOCPAT (patient_id, doctor_id)
values (100260, 100243);
insert into DOCPAT (patient_id, doctor_id)
values (100261, 100208);
insert into DOCPAT (patient_id, doctor_id)
values (100261, 100391);
insert into DOCPAT (patient_id, doctor_id)
values (100262, 100106);
insert into DOCPAT (patient_id, doctor_id)
values (100264, 100362);
insert into DOCPAT (patient_id, doctor_id)
values (100265, 100090);
insert into DOCPAT (patient_id, doctor_id)
values (100266, 100260);
insert into DOCPAT (patient_id, doctor_id)
values (100271, 100168);
insert into DOCPAT (patient_id, doctor_id)
values (100271, 100210);
insert into DOCPAT (patient_id, doctor_id)
values (100272, 100383);
insert into DOCPAT (patient_id, doctor_id)
values (100273, 100208);
insert into DOCPAT (patient_id, doctor_id)
values (100273, 100391);
insert into DOCPAT (patient_id, doctor_id)
values (100274, 100055);
insert into DOCPAT (patient_id, doctor_id)
values (100276, 100143);
insert into DOCPAT (patient_id, doctor_id)
values (100278, 100184);
insert into DOCPAT (patient_id, doctor_id)
values (100278, 100212);
insert into DOCPAT (patient_id, doctor_id)
values (100279, 100061);
insert into DOCPAT (patient_id, doctor_id)
values (100279, 100297);
insert into DOCPAT (patient_id, doctor_id)
values (100281, 100388);
insert into DOCPAT (patient_id, doctor_id)
values (100284, 100013);
insert into DOCPAT (patient_id, doctor_id)
values (100284, 100182);
insert into DOCPAT (patient_id, doctor_id)
values (100286, 100288);
insert into DOCPAT (patient_id, doctor_id)
values (100286, 100290);
insert into DOCPAT (patient_id, doctor_id)
values (100287, 100015);
insert into DOCPAT (patient_id, doctor_id)
values (100287, 100107);
insert into DOCPAT (patient_id, doctor_id)
values (100287, 100371);
insert into DOCPAT (patient_id, doctor_id)
values (100288, 100078);
insert into DOCPAT (patient_id, doctor_id)
values (100288, 100155);
insert into DOCPAT (patient_id, doctor_id)
values (100288, 100217);
insert into DOCPAT (patient_id, doctor_id)
values (100289, 100325);
insert into DOCPAT (patient_id, doctor_id)
values (100290, 100116);
insert into DOCPAT (patient_id, doctor_id)
values (100290, 100188);
insert into DOCPAT (patient_id, doctor_id)
values (100291, 100296);
insert into DOCPAT (patient_id, doctor_id)
values (100292, 100046);
insert into DOCPAT (patient_id, doctor_id)
values (100292, 100172);
insert into DOCPAT (patient_id, doctor_id)
values (100292, 100205);
insert into DOCPAT (patient_id, doctor_id)
values (100292, 100242);
insert into DOCPAT (patient_id, doctor_id)
values (100293, 100094);
insert into DOCPAT (patient_id, doctor_id)
values (100293, 100303);
insert into DOCPAT (patient_id, doctor_id)
values (100294, 100141);
insert into DOCPAT (patient_id, doctor_id)
values (100294, 100230);
insert into DOCPAT (patient_id, doctor_id)
values (100295, 100312);
insert into DOCPAT (patient_id, doctor_id)
values (100296, 100010);
insert into DOCPAT (patient_id, doctor_id)
values (100296, 100064);
insert into DOCPAT (patient_id, doctor_id)
values (100297, 100141);
insert into DOCPAT (patient_id, doctor_id)
values (100297, 100193);
insert into DOCPAT (patient_id, doctor_id)
values (100298, 100327);
insert into DOCPAT (patient_id, doctor_id)
values (100301, 100048);
insert into DOCPAT (patient_id, doctor_id)
values (100301, 100319);
commit;
prompt 300 records committed...
insert into DOCPAT (patient_id, doctor_id)
values (100302, 100347);
insert into DOCPAT (patient_id, doctor_id)
values (100303, 100191);
insert into DOCPAT (patient_id, doctor_id)
values (100303, 100381);
insert into DOCPAT (patient_id, doctor_id)
values (100304, 100365);
insert into DOCPAT (patient_id, doctor_id)
values (100304, 100393);
insert into DOCPAT (patient_id, doctor_id)
values (100305, 100217);
insert into DOCPAT (patient_id, doctor_id)
values (100306, 100304);
insert into DOCPAT (patient_id, doctor_id)
values (100307, 100132);
insert into DOCPAT (patient_id, doctor_id)
values (100308, 100056);
insert into DOCPAT (patient_id, doctor_id)
values (100309, 100312);
insert into DOCPAT (patient_id, doctor_id)
values (100309, 100318);
insert into DOCPAT (patient_id, doctor_id)
values (100310, 100055);
insert into DOCPAT (patient_id, doctor_id)
values (100310, 100213);
insert into DOCPAT (patient_id, doctor_id)
values (100310, 100298);
insert into DOCPAT (patient_id, doctor_id)
values (100311, 100048);
insert into DOCPAT (patient_id, doctor_id)
values (100311, 100121);
insert into DOCPAT (patient_id, doctor_id)
values (100312, 100241);
insert into DOCPAT (patient_id, doctor_id)
values (100312, 100278);
insert into DOCPAT (patient_id, doctor_id)
values (100313, 100041);
insert into DOCPAT (patient_id, doctor_id)
values (100313, 100294);
insert into DOCPAT (patient_id, doctor_id)
values (100314, 100075);
insert into DOCPAT (patient_id, doctor_id)
values (100314, 100100);
insert into DOCPAT (patient_id, doctor_id)
values (100317, 100096);
insert into DOCPAT (patient_id, doctor_id)
values (100325, 100263);
insert into DOCPAT (patient_id, doctor_id)
values (100327, 100238);
insert into DOCPAT (patient_id, doctor_id)
values (100327, 100341);
insert into DOCPAT (patient_id, doctor_id)
values (100328, 100052);
insert into DOCPAT (patient_id, doctor_id)
values (100328, 100153);
insert into DOCPAT (patient_id, doctor_id)
values (100328, 100336);
insert into DOCPAT (patient_id, doctor_id)
values (100331, 100020);
insert into DOCPAT (patient_id, doctor_id)
values (100331, 100097);
insert into DOCPAT (patient_id, doctor_id)
values (100331, 100117);
insert into DOCPAT (patient_id, doctor_id)
values (100331, 100256);
insert into DOCPAT (patient_id, doctor_id)
values (100332, 100069);
insert into DOCPAT (patient_id, doctor_id)
values (100332, 100267);
insert into DOCPAT (patient_id, doctor_id)
values (100335, 100201);
insert into DOCPAT (patient_id, doctor_id)
values (100339, 100053);
insert into DOCPAT (patient_id, doctor_id)
values (100339, 100259);
insert into DOCPAT (patient_id, doctor_id)
values (100340, 100197);
insert into DOCPAT (patient_id, doctor_id)
values (100340, 100263);
insert into DOCPAT (patient_id, doctor_id)
values (100340, 100305);
insert into DOCPAT (patient_id, doctor_id)
values (100343, 100008);
insert into DOCPAT (patient_id, doctor_id)
values (100343, 100206);
insert into DOCPAT (patient_id, doctor_id)
values (100345, 100018);
insert into DOCPAT (patient_id, doctor_id)
values (100346, 100280);
insert into DOCPAT (patient_id, doctor_id)
values (100347, 100293);
insert into DOCPAT (patient_id, doctor_id)
values (100348, 100351);
insert into DOCPAT (patient_id, doctor_id)
values (100349, 100134);
insert into DOCPAT (patient_id, doctor_id)
values (100350, 100015);
insert into DOCPAT (patient_id, doctor_id)
values (100351, 100150);
insert into DOCPAT (patient_id, doctor_id)
values (100351, 100298);
insert into DOCPAT (patient_id, doctor_id)
values (100354, 100012);
insert into DOCPAT (patient_id, doctor_id)
values (100354, 100128);
insert into DOCPAT (patient_id, doctor_id)
values (100356, 100204);
insert into DOCPAT (patient_id, doctor_id)
values (100357, 100050);
insert into DOCPAT (patient_id, doctor_id)
values (100357, 100350);
insert into DOCPAT (patient_id, doctor_id)
values (100358, 100185);
insert into DOCPAT (patient_id, doctor_id)
values (100358, 100265);
insert into DOCPAT (patient_id, doctor_id)
values (100358, 100334);
insert into DOCPAT (patient_id, doctor_id)
values (100359, 100271);
insert into DOCPAT (patient_id, doctor_id)
values (100359, 100339);
insert into DOCPAT (patient_id, doctor_id)
values (100362, 100067);
insert into DOCPAT (patient_id, doctor_id)
values (100363, 100155);
insert into DOCPAT (patient_id, doctor_id)
values (100363, 100265);
insert into DOCPAT (patient_id, doctor_id)
values (100364, 100034);
insert into DOCPAT (patient_id, doctor_id)
values (100364, 100145);
insert into DOCPAT (patient_id, doctor_id)
values (100364, 100157);
insert into DOCPAT (patient_id, doctor_id)
values (100364, 100301);
insert into DOCPAT (patient_id, doctor_id)
values (100366, 100189);
insert into DOCPAT (patient_id, doctor_id)
values (100366, 100294);
insert into DOCPAT (patient_id, doctor_id)
values (100367, 100183);
insert into DOCPAT (patient_id, doctor_id)
values (100368, 100092);
insert into DOCPAT (patient_id, doctor_id)
values (100371, 100037);
insert into DOCPAT (patient_id, doctor_id)
values (100372, 100074);
insert into DOCPAT (patient_id, doctor_id)
values (100374, 100090);
insert into DOCPAT (patient_id, doctor_id)
values (100375, 100065);
insert into DOCPAT (patient_id, doctor_id)
values (100375, 100081);
insert into DOCPAT (patient_id, doctor_id)
values (100375, 100364);
insert into DOCPAT (patient_id, doctor_id)
values (100377, 100077);
insert into DOCPAT (patient_id, doctor_id)
values (100380, 100151);
insert into DOCPAT (patient_id, doctor_id)
values (100381, 100315);
insert into DOCPAT (patient_id, doctor_id)
values (100383, 100338);
insert into DOCPAT (patient_id, doctor_id)
values (100384, 100311);
insert into DOCPAT (patient_id, doctor_id)
values (100385, 100007);
insert into DOCPAT (patient_id, doctor_id)
values (100385, 100137);
insert into DOCPAT (patient_id, doctor_id)
values (100386, 100101);
insert into DOCPAT (patient_id, doctor_id)
values (100386, 100281);
insert into DOCPAT (patient_id, doctor_id)
values (100389, 100001);
insert into DOCPAT (patient_id, doctor_id)
values (100390, 100076);
insert into DOCPAT (patient_id, doctor_id)
values (100391, 100320);
insert into DOCPAT (patient_id, doctor_id)
values (100392, 100328);
insert into DOCPAT (patient_id, doctor_id)
values (100393, 100069);
insert into DOCPAT (patient_id, doctor_id)
values (100393, 100237);
insert into DOCPAT (patient_id, doctor_id)
values (100396, 100085);
insert into DOCPAT (patient_id, doctor_id)
values (100396, 100098);
insert into DOCPAT (patient_id, doctor_id)
values (100397, 100026);
insert into DOCPAT (patient_id, doctor_id)
values (100397, 100234);
insert into DOCPAT (patient_id, doctor_id)
values (100397, 100292);
insert into DOCPAT (patient_id, doctor_id)
values (100399, 100174);
insert into DOCPAT (patient_id, doctor_id)
values (100399, 100257);
commit;
prompt 400 records loaded
prompt Enabling foreign key constraints for APPOINTMENT...
alter table APPOINTMENT enable constraint SYS_C008964;
alter table APPOINTMENT enable constraint SYS_C008965;
prompt Enabling foreign key constraints for MEDICALRECORD...
alter table MEDICALRECORD enable constraint SYS_C008973;
prompt Enabling foreign key constraints for TREATMENT...
alter table TREATMENT enable constraint SYS_C008985;
prompt Enabling foreign key constraints for BILLING...
alter table BILLING enable constraint SYS_C008992;
alter table BILLING enable constraint SYS_C008993;
prompt Enabling foreign key constraints for DOCPAT...
alter table DOCPAT enable constraint SYS_C008977;
alter table DOCPAT enable constraint SYS_C008978;
prompt Enabling triggers for DOCTORS...
alter table DOCTORS enable all triggers;
prompt Enabling triggers for PATIENTS...
alter table PATIENTS enable all triggers;
prompt Enabling triggers for APPOINTMENT...
alter table APPOINTMENT enable all triggers;
prompt Enabling triggers for MEDICALRECORD...
alter table MEDICALRECORD enable all triggers;
prompt Enabling triggers for TREATMENT...
alter table TREATMENT enable all triggers;
prompt Enabling triggers for BILLING...
alter table BILLING enable all triggers;
prompt Enabling triggers for DOCPAT...
alter table DOCPAT enable all triggers;

set feedback on
set define on
prompt Done
