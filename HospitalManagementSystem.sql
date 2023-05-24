Use `HospitalManagementSystem`;
CREATE TABLE DEPARTMENTS (
  DEPT_ID INT PRIMARY KEY,
  DEPT_LOCATION VARCHAR(50),
  DEPT_NAME VARCHAR(50)
);
CREATE TABLE DOCTORS (
  DOC_ID VARCHAR(50) PRIMARY KEY,
  DOC_NAME VARCHAR(50),
  SPECIALIZATION VARCHAR(50),
  ADDRESS VARCHAR(100),
  PHONE_NO VARCHAR(20),
  DEPT_NO INT,
  FOREIGN KEY (DEPT_NO) REFERENCES DEPARTMENTS(DEPT_ID)
);
CREATE TABLE DUTY_DOC (
  DOC_ID VARCHAR(50) PRIMARY KEY,
  DOC_NAME VARCHAR(50),
  SALARY FLOAT
);
CREATE TABLE DOCTOR_ON_CALL (
  DOC_ID VARCHAR(50) PRIMARY KEY,
  DOC_NAME VARCHAR(50),
  FEES_PER_CL FLOAT
);
CREATE TABLE PATIENT_ENTRY (
  PATIENT_ID VARCHAR(10) PRIMARY KEY,
  PATIENT_NAME VARCHAR(50),
  AGE INT,
  SEX VARCHAR(10),
  PHONE_NO VARCHAR(20),
  CHECKUP_DATE DATE,
  DEPT_ID INT,
  FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPT_ID)
);
CREATE TABLE PATIENT_DIAGNOSE (
  PATIENT_ID VARCHAR(10),
  DIAGNOSIS VARCHAR(100),
  TREATMENT_GIVEN VARCHAR(100),
  DOC_ID VARCHAR(50),
  DEPT_ID INT,
  FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT_ENTRY(PATIENT_ID),
  FOREIGN KEY (DOC_ID) REFERENCES DOCTORS(DOC_ID),
  FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPT_ID)
);
CREATE TABLE PATIENT_ADMIT (
  PATIENT_ID VARCHAR(10) PRIMARY KEY,
  ADVANCE_PYMT FLOAT,
  PAYMENT_MODE VARCHAR(20),
  DEPT_ID INT,
  ADMITTED_DATE DATE,
  DIAGNOSIS VARCHAR(100),
  ROOM_NO INT,
  FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT_ENTRY(PATIENT_ID),
  FOREIGN KEY (DEPT_ID) REFERENCES DEPARTMENTS(DEPT_ID)
);

CREATE TABLE PATIENT_OPERATED (
  PATIENT_ID VARCHAR(10),
  DATE_OF_OPERATION DATE,
  PATIENT_CONDITION VARCHAR(100),
  OPERATION_DURATION INT,
  MEDICINES VARCHAR(100),
  DIAGNOSIS VARCHAR(100),
  DOC_ID VARCHAR(50),
  FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT_ENTRY(PATIENT_ID)
  );
  
CREATE TABLE PATIENT_DISCHARGE (
  PATIENT_ID VARCHAR(10),
  DISCHARGE_DATE DATE,
  TREATMENT_GIVEN VARCHAR(100),
  MEDICINE VARCHAR(100),
  PAYMENT_MODE VARCHAR(20),
  FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT_ENTRY(PATIENT_ID)
);
CREATE TABLE PATIENT_REGULAR (
  PATIENT_ID VARCHAR(10),
  DATE_OF_VISIT DATE,
  DIAGNOSIS VARCHAR(100),
  TREATMENT_GIVEN VARCHAR(100),
  MEDICINE VARCHAR(100),
  MODE_OF_PAYMENT VARCHAR(20),
  DOC_ID VARCHAR(50),
  FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT_ENTRY(PATIENT_ID),
  FOREIGN KEY (DOC_ID) REFERENCES DOCTORS(DOC_ID)
);

-- CREATE TABLE INVOICE (
-- INVOICE_ID VARCHAR(10), 
-- PATIENT_ID VARCHAR(10),
-- FEES_AMOUNT FLOAT, 
-- ADVANCE_PYMT FLOAT,
-- MODE_OF_PAYMENT VARCHAR(20)
-- );

INSERT INTO DEPARTMENTS (DEPT_ID, DEPT_LOCATION, DEPT_NAME) 
VALUES 
(1, 'Floor2', 'Cardiology'),
(2, 'Floor2', 'Oncology'),
(3, 'Floor1', 'Neurology'),
(4, 'Floor3', 'Orthopedics'),
(5, 'Floor3', 'Dermatology'),
(6, 'Floor2', 'Gastroenterology'),
(7, 'Floor3', 'Psychiatry'),
(8, 'Floor3', 'Pediatrics'),
(9, 'Floor1', 'Radiology'),
(10, 'Floor3', 'Urology'),
(11, 'Floor1', 'Hematology'),
(12, 'Floor3', 'Nephrology'),
(13, 'Floor2 ', 'Pulmonology'),
(14, 'Floor3', 'Endocrinology'),
(15, 'Floor3', 'Ophthalmology');

INSERT INTO DOCTORS (DOC_ID, DOC_NAME, SPECIALIZATION, ADDRESS, PHONE_NO, DEPT_NO)
VALUES
  ('DOC001', 'Dr. John Smith', 'Cardiology', '123 Main St., Anytown, USA', '555-1234', 1),
  ('DOC002', 'Jane Doe', 'Pediatrics', '456 Elm St., Anytown, USA', '555-5678', 8),
  ('DOC003', 'Robert Johnson', 'Oncology', '789 Oak St., Anytown, USA', '555-9012', 2),
  ('DOC004', 'Emily Chen', 'Dermatology', '321 Maple St., Anytown, USA', '555-3456', 5),
  ('DOC005', 'David Kim', 'Neurology', '654 Pine St., Anytown, USA', '555-7890', 3),
  ('DOC006', 'Maria Rodriguez', 'Urology', '987 Cedar St., Anytown, USA', '555-2345', 10),
  ('DOC007', 'Michael Lee', 'Gastroenterology', '654 Birch St., Anytown, USA', '555-6789', 6),
  ('DOC008', 'Megan Taylor', 'Endocrinology', '321 Oak St., Anytown, USA', '555-0123', 14),
  ('DOC009', 'William Davis', 'Cardiology', '789 Maple St., Anytown, USA', '555-4567', 1),
  ('DOC010', 'Avery Adams', 'Pediatrics', '123 Pine St., Anytown, USA', '555-8901', 8),
  ('DOC011', 'Sophia Wilson', 'Oncology', '456 Cedar St., Anytown, USA', '555-2345', 2),
  ('DOC012', 'Ethan Garcia', 'Dermatology', '789 Birch St., Anytown, USA', '555-6789', 5),
  ('DOC013', 'Isabella Hernandez', 'Neurology', '321 Main St., Anytown, USA', '555-0123', 3),
  ('DOC014', 'Ryan Martin', 'Psychiatry', '654 Elm St., Anytown, USA', '555-4567', 7),
  ('DOC015', 'Nora Perez', 'Gastroenterology', '987 Oak St., Anytown, USA', '555-8901', 6),
  ('DOC016', 'Nicholas Anderson', 'Endocrinology', '123 Cedar St., Anytown, USA', '555-2345', 14),
  ('DOC017', 'Madison Hernandez', 'Pulmonology', '456 Birch St., Anytown, USA', '555-6789', 13),
  ('DOC018', 'Gabriel Green', 'Pulmonology', '789 Main St., Anytown, USA', '555-0123', 13),
  ('DOC019', 'Evelyn Rivera', 'Oncology', '321 Pine St., Anytown, USA', '555-4567', 2),
  ('DOC020', 'Alexander Scott', 'Dermatology', '654 Cedar St., Anytown, USA', '555-8901', 5),
  ('DOC021', 'Hazel Torres', 'Neurology', '987 Birch St., Anytown, USA', '555-2345',3),
  ('DOC022', 'Christian Flores', 'Psychiatry', '123 Oak St, Anytown, USA','555-9811' ,7) ,
  ('DOC023', 'Sarah Smith', 'Hematology', '123 Main St, Anytown USA', '555-1234', 11),
  ('DOC024', 'David Lee', 'Nephrology', '456 Oak St, Anytown USA', '555-5678', 12),
  ('DOC025', 'Maria Hernandez', 'Urology', '789 Maple St, Anytown USA', '555-9012', 10),
  ('DOC026', 'Sarah Flores', 'Ophthalmology', '123 Main St, Anytown USA', '555-1334', 15),
  ('DOC027', 'Alexander Malik', 'Orthopedics', '654 Cedar St., Anytown, USA', '555-8441', 4),
  ('DOC028', 'Christian Bale', 'Radiology', '123 Oak St, Anytown, USA','555-9851' ,9);
  
  
INSERT INTO DUTY_DOC (DOC_ID, DOC_NAME, SALARY)
 VALUES 
 ('DOC005', 'David Kim', 820000.00),
 ('DOC006', 'Maria Rodriguez', 760000.71),
 ('DOC007', 'Michael Lee', 820555.28),
 ('DOC008', 'Megan Taylor', 779870.98),
 ('DOC009', 'William Davis', 950700),
 ('DOC011', 'Sophia Wilson',650550),
 ('DOC012', 'Ethan Garcia', 855689),
 ('DOC013', 'Isabella Hernandez', 950000.43),
 ('DOC014', 'Ryan Martin', 667200.25),
 ('DOC015', 'Nora Perez', 895000.00),
 ('DOC021', 'Hazel Torres', 87000.45),
 ('DOC022', 'Christian Flores', 89000.70 ),
 ('DOC023', 'Sarah Smith', 779300),
 ('DOC024', 'David Lee', 89400.56),
 ('DOC025', 'Maria Hernandez',92000.85),
 ('DOC026', 'Sarah Flores', 792215),
 ('DOC027', 'Alexander Malik', 895000);
 
INSERT INTO DOCTOR_ON_CALL (DOC_ID,DOC_NAME,FEES_PER_CL)
 VALUES 
 ('DOC001', 'John Smith', 67786.65),
 ('DOC002', 'Jane Doe', 875980.89),
 ('DOC003', 'Robert Johnson', 957560.00),
 ('DOC004', 'Emily Chen', 876982.00),
 ('DOC010', 'Avery Adams', 800000),
 ('DOC016', 'Nicholas Anderson', 925000),
 ('DOC017', 'Madison Hernandez', 725000),
 ('DOC018', 'Gabriel Green', 825000),
 ('DOC019', 'Evelyn Rivera', 737250),
 ('DOC020', 'Alexander Scott', 850000),
 ('DOC024', 'David Lee', 897500),
 ('DOC025', 'Maria Hernandez', 852500),
 ('DOC028', 'Christian Bale',850000);
  
INSERT INTO PATIENT_ENTRY (PATIENT_ID, PATIENT_NAME, AGE, SEX, PHONE_NO, CHECKUP_DATE, DEPT_ID)
VALUES
('P0001', 'John Doe', 35, 'Male', '555-1234', '2023-03-17', 1),
('P0002', 'Jane Smith', 42, 'Female', '555-5678', '2023-03-17', 2),
('P0003', 'Cloudia Snow', 42, 'Female', '555-5678', '2023-03-17', 3),
('P0004', 'Alice Brown', 55, 'Female', '555-4321', '2023-03-18', 3),
('P0005', 'Sam Lee', 45, 'Male', '555-3456', '2023-03-19', 2),
('P0006', 'Emily Davis', 31, 'Female', '555-8765', '2023-03-19', 7),
('P0007', 'Tom Wilson', 50, 'Male', '555-1111', '2023-03-20', 8),
('P0008', 'Sara Kim', 23, 'Female', '555-2222', '2023-03-20', 9),
('P0009', 'Alex Chen', 38, 'Male', '555-3333', '2023-03-21', 10),
('P0010', 'Grace Lee', 27, 'Female', '555-4444', '2023-03-21', 11),
('P0011', 'Mike Smith', 47, 'Male', '555-5555', '2023-03-22', 12),
('P0012', 'Jenny Kim', 33, 'Female', '555-6666', '2023-03-22', 13),
('P0013', 'David Brown', 60, 'Male', '555-7777', '2023-03-23', 14),
('P0014', 'Jessica Lee', 25, 'Female', '555-8888', '2023-03-23', 15),
('P0015', 'Steve Wilson', 41, 'Male', '555-9999', '2023-03-24', 15),
('P0016', 'Eva Chen', 29, 'Female', '555-0011', '2023-03-24', 11),
('P0017', 'Jack Johnson', 52, 'Male', '555-1212', '2023-03-25', 1),
('P0018', 'Olivia Davis', 36, 'Female', '555-2323', '2023-03-25', 2),
('P0019', 'Luke Kim', 43, 'Male', '555-3434', '2023-03-26', 4),
('P0020', 'Sophia Lee', 30, 'Female', '555-4545', '2023-03-26', 5),
('P0021', 'Sophia Davis', 45, 'Male', '555-1234', '2023-03-17', 6),
('P0022', 'Kevin Blinders', 35, 'Female', '555-5078', '2023-03-18', 7),
('P0023', 'Bob Peaky', 60, 'Male', '555-9012', '2023-03-19', 8),
('P0024', 'Samantha Winters', 25, 'Female', '555-0456', '2023-03-20', 9),
('P0025', 'Michael Kirchoff', 50, 'Male', '555-0890', '2023-03-21', 10),
('P0026', 'Sarah Siddique', 30, 'Female', '555-0234', '2023-03-22',10),
('P0027', 'David Dawani', 40, 'Male', '555-5678', '2023-03-23', 2),
('P0028', 'Amanda Cerny', 55, 'Female', '555-9012', '2023-03-24', 4),
('P0029', 'Kevin Lee', 20, 'Male', '555-0456', '2023-03-25', 3),
('P0030', 'Emily Hernandez', 65, 'Female', '555-0890', '2023-03-26', 5),
('P0031', 'William Flanagan', 45, 'Male', '555-0234', '2023-03-27', 10),
('P0032', 'Olivia Blanc', 35, 'Female', '555-0678', '2023-03-28', 7),
('P0033', 'Daniel Wilson', 30, 'Male', '555-0012', '2023-03-29', 14),
('P0034', 'Lee Anderson', 50, 'Female', '555-0456', '2023-03-30', 12),
('P0035', 'Amanda Martin', 55, 'Female', '555-9011', '2023-03-24', 4);

INSERT INTO PATIENT_DIAGNOSE (PATIENT_ID, DIAGNOSIS, TREATMENT_GIVEN, DOC_ID, DEPT_ID)
VALUES
('P0001', 'Flu', 'Rest and fluids', 'DOC001', 1),
('P0002', 'High blood pressure', 'Prescription medication', 'DOC002', 2),
('P0003', 'Migraine', 'Painkillers', 'DOC003', 3),
('P0004', 'Asthma', 'Inhaler', 'DOC004', 3),
('P0005', 'Sprained ankle', 'Rest and ice', 'DOC003', 2),
('P0006', 'Depression', 'Therapy sessions', 'DOC006', 7),
('P0007', 'Heart disease', 'Surgery', 'DOC004', 8),
('P0008', 'Appendicitis', 'Surgery', 'DOC005', 9),
('P0009', 'Kidney stones', 'Painkillers and fluids', 'DOC009', 10),
('P0010', 'Depression', 'Counseling and medication', 'DOC006', 11),
('P0011', 'High cholesterol', 'Prescription medication', 'DOC007', 12),
('P0012', 'Insomnia', 'Prescription for sleep aid', 'DOC001', 1),
('P0013', 'Diabetes', 'Insulin injections', 'DOC008', 14),
('P0014', 'Common cold', 'Rest and fluids', 'DOC009', 15),
('P0015', 'Broken arm', 'Surgery and rehabilitation', 'DOC010', 15),
('P0016', 'Sinus infection', 'Antibiotics', 'DOC011', 3),
('P0017', 'Asthma', 'Inhaler', 'DOC012', 4),
('P0018', 'Anxiety', 'Counseling and medication', 'DOC013', 5),
('P0019', 'Skin rash', 'Topical ointment', 'DOC014', 6),
('P0020', 'Food poisoning', 'Rest and fluids', 'DOC015', 7),
('P0021', 'Back pain', 'Physical therapy', 'DOC002', 2),
('P0022', 'Urinary tract infection', 'Antibiotics', 'DOC016', 3),
('P0023', 'Broken leg', 'Surgery and rehabilitation', 'DOC010', 15),
('P0024', 'Pneumonia', 'Antibiotics', 'DOC017', 4),
('P0025', 'Cancer', 'Chemotherapy and radiation', 'DOC018', 5),
('P0026', 'Anxiety', 'Therapy and medication', 'DOC008', 8),
('P0027', 'Depression', 'Therapy and medication', 'DOC009', 9),
('P0028', 'Broken arm', 'Surgery and cast', 'DOC010', 10),
('P0029', 'Flu', 'Rest and fluids', 'DOC003', 3),
('P0030', 'Broken leg', 'Surgery and cast', 'DOC004', 4),
('P0031', 'Pneumonia', 'Antibiotics and rest', 'DOC002', 2),
('P0033', 'Heart disease', 'Medication and lifestyle changes', 'DOC005', 5),
('P0032', 'Migraine', 'Sumatriptan', 'DOC002', 11),
('P0034', 'Diabetes', 'Insulin and diet changes', 'DOC006', 6),
('P0035', 'Hypertension', 'Medication and exercise', 'DOC007', 7);

INSERT INTO PATIENT_ADMIT (PATIENT_ID, ADVANCE_PYMT, PAYMENT_MODE, DEPT_ID, ADMITTED_DATE, DIAGNOSIS, ROOM_NO)
VALUES 
-- ('P0001', '1000', 'Cash', '1', '2023-03-17', 'Flu',101),
-- ('P0002', 2000.00, 'Cash', 2, '2023-03-18', 'High blood pressure', 202), 
-- ('P0003', 1000.00, 'Debit Card', 3, '2023-03-18', 'Migraine', 303),
('P0004', 2500.00, 'Cash', 3, '2023-03-18', 'Asthma', 304),
('P0005', 3000.00, 'Credit Card', 2, '2023-03-20', 'Sprained ankle', 205),
('P0006', 4000.00, 'Cash', 7, '2023-03-20', 'Depression', 706),
('P0007', 5000.00, 'Insurance', 8, '2023-03-21', 'Heart disease', 807),
('P0008', 2500.00, 'Credit Card', 9, '2023-03-20', 'Appendicitis', 908),
('P0009', 1500.00, 'Insurance', 10, '2023-03-21', 'Kidney stones', 009),
('P0010', 3000.00, 'Debit Card', 11, '2023-03-21', 'Depression', 110),
-- ('P0011', 2500.00, 'Credit Card', 12, '2023-03-22', 'High cholesterol', 211),
('P0012', 2000.00, 'Cash', 1, '2023-03-22', 'Insomnia', 102),
-- ('P0013', 4500.00, 'Debit Card', 14, '2023-03-23', 'Diabetes', 314),
('P0015', 7500.00, 'Insurance', 15, '2023-03-24', 'Broken arm', 516),
('P0016', 3000.00, 'Cash', 3, '2023-03-24', 'Sinus infection', 017),
-- ('P0017', 2500.00, 'Credit Card', 4, '2023-03-25', 'Asthma', 018),
('P0018', 4000.00, 'Debit Card', 5, '2023-03-25', 'Anxiety', 119),
-- ('P0019', 1000, 'Cash', 6 , '2023-03-26', 'Skin Rash', 101),
('P0020', 2000.00, 'Credit Card', 7, '2023-03-25', 'Food poisoning', 121),
-- ('P0021', 2000.0, 'Cash', 2, '2023-03-18', 'Back pain', 102),
-- ('P0022', 1500, 'Debit card', 3, '2023-03-21', 'Urinary tract infection', 302),
('P0023', 10000, 'Cash', 15, '2023-03-22', 'Broken leg', 405),
('P0024', 8000, 'Credit card', 4, '2023-03-23', 'Pneumonia', 201),
('P0025', 150000, 'Insurance', 5, '2023-03-24', 'Cancer', 501),
('P0026', 5000, 'Cash', 8, '2023-03-25', 'Anxiety', 102),
('P0027', 7000, 'Debit card', 9, '2023-03-26', 'Depression', 303),
('P0028', 12000, 'Credit card', 10, '2023-03-27', 'Broken arm', 303),
('P0030', 8000, 'Credit card', 4, '2023-03-29', 'Broken leg', 405),
('P0031', 5000, 'Debit card', 1, '2023-03-30', 'Pneumonia', 203),
('P0032', 2000, 'Cash', 7,'2023-03-28', 'Migrane', 104),
('P0033', 15000, 'Insurance', 5, '2023-04-01', 'Heart disease', 401);
-- ('P0034', 12000, 'Debit card', 6, '2023-04-02', 'Diabetes', 202);

INSERT INTO PATIENT_OPERATED (PATIENT_ID, DATE_OF_OPERATION, PATIENT_CONDITION, OPERATION_DURATION, MEDICINES, DIAGNOSIS, DOC_ID)
VALUES
-- ('P0001', '2023-03-03', 'Stable', 120, 'Acetaminophen', 'Flu', 'DOC001'),
-- ('P0002', '2023-03-19', 'Stable', 180, 'Lisinopril', 'High blood pressure', 'DOC002'),
-- ('P0003', '2023-03-20', 'Stable', 60, 'Sumatriptan', 'Migraine', 'DOC003'),
('P0004', '2023-03-20', 'Stable', 90, 'Albuterol', 'Asthma', 'DOC004'),
('P0005', '2023-03-20', 'Stable', 45, 'Ibuprofen', 'Sprained ankle', 'DOC003'),
-- ('P0006', '2023-03-21', 'Stable', 60, 'Fluoxetine', 'Depression', 'DOC006'),
('P0007', '2023-03-23', 'Improving', 180, 'Coronary artery bypass', 'Heart disease', 'DOC004'),
('P0008', '2023-03-24', 'Stable', 120, 'Appendectomy', 'Appendicitis', 'DOC005'),
('P0009', '2023-03-22', 'Improving', 30, 'Ibuprofen and fluids', 'Kidney stones', 'DOC009'),
('P0010', '2023-03-22', 'Stable', 120, 'Sertraline and counseling', 'Depression', 'DOC006'),
-- ('P0011', '2023-03-23', 'Stable', 90, 'Atorvastatin', 'High cholesterol', 'DOC007'),
('P0012', '2023-03-23', 'Stable', 30, 'Zolpidem', 'Insomnia', 'DOC001'),
-- ('P0013', '2023-03-25', 'Stable', 120, 'Insulin injections', 'Diabetes', 'DOC008'),
-- ('P0014', '2023-02-27', 'Stable', 60, 'Rest and fluids', 'Common cold', 'DOC009'),
('P0015', '2023-03-29', 'Stable', 240, 'Surgery and rehabilitation', 'Broken arm', 'DOC010'),
('P0016', '2023-04-01', 'Stable', 60, 'Amoxicillin', 'Sinus infection', 'DOC011'),
-- ('P0017', '2023-05-03', 'Stable', 90, 'Albuterol', 'Asthma', 'DOC012'),
('P0018', '2023-06-05', 'Stable', 120, 'Counseling and medication', 'Anxiety', 'DOC013'),
-- ('P0019', '2023-07-07', 'Stable', 30, 'Topical ointment', 'Skin rash', 'DOC014'),
('P0020', '2023-07-10', 'Stable', 15, 'Rest and fluids', 'Food poisoning', 'DOC015'),
-- ('P0021', '2023-07-11', 'Improving', 45, 'Physical therapy', 'Back pain', 'DOC002'),
-- ('P0022', '2023-07-12', 'Stable', 10, 'Antibiotics', 'Urinary tract infection', 'DOC016'),
('P0023', '2023-07-13', 'Recovering', 60, 'Surgery and rehabilitation', 'Broken leg', 'DOC010'),
('P0024', '2023-07-14', 'Critical', 90, 'Antibiotics', 'Pneumonia', 'DOC017'),
('P0025', '2023-07-15', 'Serious', 120, 'Chemotherapy and radiation', 'Cancer', 'DOC018'),
-- ('P0026', '2023-07-10', 'Stable', 60, 'Therapy and medication', 'Anxiety', 'DOC008'),
('P0027', '2023-07-11', 'Critical', 120, 'Therapy and medication', 'Depression', 'DOC009'),
('P0028', '2023-07-12', 'Stable', 90, 'Surgery and cast', 'Broken arm', 'DOC010'),
-- ('P0029', '2023-07-13', 'Improving', 20, 'Rest and fluids', 'Flu', 'DOC003'),
('P0030', '2023-07-14', 'Critical', 120, 'Surgery and cast', 'Broken leg', 'DOC004'),
('P0031', '2023-07-15', 'Stable', 60, 'Antibiotics and rest', 'Pneumonia', 'DOC001'),
('P0032', '2023-07-16', 'Improving', 30, 'Painkillers and rest', 'Migraine', 'DOC002'),
('P0033', '2023-07-17', 'Critical', 90, 'Medication and lifestyle changes', 'Heart disease', 'DOC005');
-- ('P0034', '2023-07-18', 'Improving', 60, 'Insulin and diet changes', 'Diabetes', 'DOC006'),
-- ('P0035', '2023-07-19', 'Stable', 120, 'Medication and exercise', 'Hypertension', 'DOC007');


INSERT INTO PATIENT_DISCHARGE (PATIENT_ID, DISCHARGE_DATE, TREATMENT_GIVEN, MEDICINE, PAYMENT_MODE)
VALUES
-- ('P0002', '2023-03-22', 'Prescribed medication for high blood pressure', 'Amlodipine', 'Cash'),
-- ('P0003', '2023-03-20', 'Prescribed medication for migraine', 'Sumatriptan', 'Debit Card'),
('P0004', '2023-03-21', 'Prescribed medication for asthma', 'Albuterol', 'Cash'),
('P0005', '2023-03-23', 'Prescribed medication for sprained ankle', 'Ibuprofen', 'Credit Card'),
('P0006', '2023-03-24', 'Prescribed medication for depression', 'Sertraline', 'Cash'),
-- ('P0007', '2023-03-25', 'Prescribed medication for heart disease', 'Lisinopril', 'Insurance'),
-- ('P0008', '2023-03-24', 'Appendectomy', 'Painkillers', 'Credit Card'),
-- ('P0009', '2023-03-22', 'Prescribed medication for kidney stones', 'Oxycodone', 'Insurance'),
('P0010', '2023-03-23', 'Prescribed medication for depression', 'Fluoxetine', 'Debit Card'),
-- ('P0011', '2023-03-25', 'Prescribed medication for high cholesterol', 'Atorvastatin', 'Credit Card'),
('P0012', '2023-03-23', 'Prescribed medication for insomnia', 'Zolpidem', 'Cash'),
-- ('P0013', '2023-03-28', 'Prescribed medication for diabetes', 'Metformin', 'Debit Card'),
('P0015', '2023-03-30', 'Treatment for broken arm', 'Casting', 'Insurance'),
('P0016', '2023-03-26', 'Prescribed medication for sinus infection', 'Amoxicillin', 'Cash'),
-- ('P0017', '2023-03-28', 'Prescribed medication for asthma', 'Albuterol', 'Credit Card'),
('P0018', '2023-03-27', 'Prescribed medication for anxiety', 'Clonazepam', 'Debit Card'),
('P0020', '2023-03-29', 'Treatment for food poisoning', 'IV fluids', 'Credit Card'),
-- ('P0021', '2023-03-23', 'Prescribed medication for back pain', 'Naproxen', 'Cash'),
-- ('P0022', '2023-03-24', 'Prescribed medication for urinary tract infection', 'Ciprofloxacin', 'Debit Card'),
('P0023', '2023-03-28', 'Treatment for broken leg', 'Surgery', 'Cash'),
('P0024', '2023-03-27', 'Prescribed medication for pneumonia', 'Azithromycin', 'Credit Card'),
('P0025', '2023-03-31', 'Treatment for cancer', 'Chemotherapy', 'Insurance'),
('P0026', '2023-03-28', 'Prescribed medication for anxiety', 'Lorazepam', 'Cash'),
('P0027', '2023-04-01', 'Cognitive Behavioral Therapy', 'Zoloft', 'Debit card'),
('P0028', '2023-04-02', 'Casting', 'Painkillers', 'Credit card'),
('P0030', '2023-04-04', 'Surgery', 'Antibiotics', 'Credit card'),
('P0031', '2023-04-05', 'Oxygen therapy', 'Corticosteroids', 'Debit card'),
-- ('P0032', '2023-01-13', 'Painkillers and rest', 'Sumatriptan', 'Cash'),
('P0033', '2023-04-07', 'Coronary angioplasty', 'Beta blockers', 'Insurance');
-- ('P0034', '2023-04-08', 'Insulin therapy', 'Metformin', 'Debit card');
-- ('P0035', '2023-01-16',  'Medication and exercise', 'Losartan', 'Cash');


INSERT INTO PATIENT_REGULAR (PATIENT_ID, DATE_OF_VISIT, DIAGNOSIS, TREATMENT_GIVEN, MEDICINE, MODE_OF_PAYMENT, DOC_ID)
VALUES
('P0001', '2023-03-17', 'Flu', 'Rest and fluids', 'Paracetamol', 'Cash', 'DOC001'),
-- ('P0002', '2023-03-18', 'High blood pressure', 'Prescription medication', 'Lisinopril', 'Cash', 'DOC002'),
('P0003', '2023-03-18', 'Migraine', 'Painkillers', 'Ibuprofen', 'Debit Card', 'DOC003'),
('P0004', '2023-03-18', 'Asthma', 'Inhaler', 'Albuterol', 'Cash', 'DOC004'),
-- ('P0005', '2023-03-20', 'Sprained ankle', 'Rest and ice', 'Ibuprofen', 'Credit Card', 'DOC003'),
('P0006', '2023-03-20', 'Depression', 'Therapy sessions', 'Fluoxetine', 'Cash', 'DOC006'),
('P0007', '2023-03-21', 'Heart disease', 'Surgery', 'Aspirin', 'Insurance', 'DOC004'),
-- ('P0008', '2023-03-20', 'Appendicitis', 'Surgery', 'Morphine', 'Credit Card', 'DOC005'),
('P0009', '2023-03-21', 'Kidney stones', 'Painkillers and fluids', 'Oxycodone', 'Insurance', 'DOC009'),
('P0010', '2023-03-21', 'Depression', 'Counseling and medication', 'Citalopram', 'Debit Card', 'DOC006'),
('P0011', '2023-03-22', 'High cholesterol', 'Prescription medication', 'Atorvastatin', 'Credit Card', 'DOC007'),
('P0012', '2023-03-22', 'Insomnia', 'Prescription for sleep aid', 'Zolpidem', 'Cash', 'DOC001'),
('P0013', '2023-03-23', 'Diabetes', 'Insulin injections', 'Insulin', 'Debit Card', 'DOC008'),
-- ('P0014', '2023-03-24', 'Common cold', 'Rest and fluids', 'Paracetamol', 'Cash', 'DOC009'),
-- ('P0015', '2023-03-24', 'Broken arm', 'Surgery and rehabilitation', 'Codeine', 'Insurance', 'DOC010'),
-- ('P0016', '2023-03-25' 'Sinus infection', 'Antibiotics', 'Amoxicillin', 'Cash', 'DOC011'),
('P0017', '2023-03-25', 'Asthma', 'Inhaler', 'Albuterol', 'Credit Card', 'DOC012'),
('P0018', '2023-03-25', 'Anxiety', 'Counseling and medication', 'Diazepam', 'Debit Card', 'DOC013'),
-- ('P0019', '2023-03-18','Skin rash', 'Topical ointment', 'Hydrocortisone', 'Cash', 'DOC014'),
-- ('P0020', '2023-03-21', 'Food poisoning', 'Rest and fluids', 'Paracetamol', 'Credit Card', 'DOC015'),
('P0021', '2023-03-22', 'Back pain', 'Physical therapy', 'Ibuprofen', 'Cash', 'DOC002'),
('P0022', '2023-03-23', 'Urinary tract infection', 'Antibiotics', 'Amoxicillin', 'Insurance', 'DOC016'),
-- ('P0023', '2023-01-04', 'Broken leg', 'Surgery and rehabilitation', 'Oxycodone', 'Cash', 'DOC010'),
-- ('P0024', '2023-01-05', 'Pneumonia', 'Antibiotics', 'Azithromycin', 'Credit Card', 'DOC017'),
('P0025', '2023-01-06', 'Cancer', 'Chemotherapy and radiation', 'Paclitaxel', 'Insurance', 'DOC018'),
('P0026', '2023-01-07', 'Anxiety', 'Therapy and medication', 'Sertraline', 'Cash', 'DOC008'),
-- ('P0027', '2023-01-08', 'Depression', 'Therapy and medication', 'Fluoxetine', 'Debit Card', 'DOC009'),
('P0028', '2023-01-09', 'Broken arm', 'Surgery and cast', 'Tramadol', 'Credit Card', 'DOC010'),
('P0029', '2023-01-10', 'Flu', 'Rest and fluids', 'Acetaminophen', 'Cash', 'DOC003'),
-- ('P0030', '2023-01-11', 'Broken leg', 'Surgery and cast', 'Ibuprofen', 'Credit Card', 'DOC004'),
('P0031', '2023-01-12', 'Pneumonia', 'Antibiotics and rest', 'Ciprofloxacin', 'Debit Card', 'DOC001'),
('P0032', '2023-01-13', 'Migraine', 'Painkillers and rest', 'Sumatriptan', 'Cash', 'DOC002'),
('P0033', '2023-01-14', 'Heart disease', 'Medication and lifestyle changes', 'Atorvastatin', 'Insurance', 'DOC005'),
('P0034', '2023-01-15', 'Diabetes', 'Insulin and diet changes', 'Insulin glargine', 'Debit Card', 'DOC006'),
('P0035', '2023-01-16', 'Hypertension', 'Medication and exercise', 'Losartan', 'Cash', 'DOC007');

SET SQL_SAFE_UPDATES = 0;
UPDATE patient_regular
SET DATE_OF_VISIT =
(SELECT checkup_date
FROM patient_entry 
WHERE patient_entry.patient_id = patient_regular.patient_id)
WHERE DATE_OF_VISIT <= (SELECT checkup_date 
                        FROM patient_entry 
                      WHERE patient_entry.patient_id = patient_regular.patient_id);
                     
   

