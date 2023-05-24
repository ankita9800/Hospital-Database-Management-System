# To get all the records from the PATIENT_ENTRY table who visited Hospital on 2023-03-20

SELECT * FROM PATIENT_ENTRY WHERE CHECKUP_DATE = '2023-03-20';

# Average age of male and female patients in each department of the hospital

SELECT DEPT_NAME, 
	max(Male) as Age_Male, 
    max(female) as Age_Female FROM (
SELECT DEPT_NAME, 
(CASE WHEN SEX = 'Male' THEN ROUND((AVG(AGE)),0) END) AS MALE,
(CASE WHEN SEX = 'Female' THEN ROUND((AVG(AGE)),0) END) AS FEMALE
FROM PATIENT_ENTRY
JOIN DEPARTMENTS ON PATIENT_ENTRY.DEPT_ID = DEPARTMENTS.DEPT_ID
GROUP BY DEPT_NAME, SEX
) as a 
GROUP BY DEPT_NAME;


# To get the list of patients who were admitted before a certain date and are still in the hospital

SELECT PE.PATIENT_NAME 
FROM PATIENT_ENTRY PE 
INNER JOIN PATIENT_ADMIT PA ON PA.PATIENT_ID = PE.PATIENT_ID 
WHERE PA.ADMITTED_DATE < '2023-03-25' 
AND PA.PATIENT_ID IN (SELECT PATIENT_ID FROM PATIENT_DISCHARGE);


# To get the list of doctors along with the number of patients they have treated, 
# we can use the following subquery in the SELECT clause
SELECT DOC_NAME, 
SPECIALIZATION, (SELECT COUNT(*) FROM PATIENT_DIAGNOSE PD WHERE PD.DOC_ID = D.DOC_ID) AS TOTAL_PATIENTS 
FROM DOCTORS D;

# To get the list of all doctors on duty and doctors on call 
SELECT *
FROM DUTY_DOC 
UNION 
SELECT DOC_ID, DOC_NAME, NULL 
FROM DOCTOR_ON_CALL;

# Patients who were discharged from the hospital before the end of their checkup date
SELECT patient_discharge.patient_id, checkup_date, DISCHARGE_DATE
FROM patient_entry , patient_discharge
WHERE patient_entry.patient_id = patient_discharge.patient_id 
	AND patient_entry.checkup_date < patient_discharge.DISCHARGE_DATE;

# Retrieve the Doctor names and their Phone Number and  of all doctors in the "Cardiology" department:

  
SELECT DOC_NAME, PHONE_NO
FROM DOCTORS
WHERE DEPT_NO = (SELECT DEPT_ID
                 FROM DEPARTMENTS
                 WHERE DEPT_NAME = 'Cardiology')
  AND DOC_ID IN (SELECT DOC_ID
                 FROM PATIENT_DIAGNOSE
                 WHERE DEPT_ID = (SELECT DEPT_ID
                                   FROM DEPARTMENTS
                                   WHERE DEPT_NAME = 'Cardiology'));
								
# Retrieve the names and phone numbers of all doctors who have treated patients with 
# the same diagnosis as patient with ID 'P0011'
                                   
SELECT DOC_ID, DOC_NAME, PHONE_NO
FROM DOCTORS
WHERE DOC_ID IN (SELECT DOC_ID
                 FROM PATIENT_DIAGNOSE
                 WHERE DIAGNOSIS = (SELECT DIAGNOSIS
                                    FROM PATIENT_DIAGNOSE
                                    WHERE PATIENT_ID = 'P0011'));


