SELECT *
FROM healthcare

-- Descriptive Analysis--

-- Determine the number of patients admitted per year regardless of their medical conditions -- 

SELECT EXTRACT(YEAR from date_of_admission) AS admission_date,
	SUM(CASE WHEN medical_condition = 'Diabetes' THEN 1 END) AS diabetes_patients,
	SUM(CASE WHEN medical_condition = 'Arthritis' THEN 1 END) AS arthritis_patients,
	SUM(CASE WHEN medical_condition = 'Cancer' THEN 1 END) AS cancer_patients,
	SUM(CASE WHEN medical_condition = 'Hypertension' THEN 1 END) AS hypertension_patients,
	SUM(CASE WHEN medical_condition = 'Obesity' THEN 1 END) AS obesity_patients,
	SUM(CASE WHEN medical_condition = 'Asthma' THEN 1 END) AS asthma_patients
FROM healthcare	
GROUP BY EXTRACT(YEAR from date_of_admission)
ORDER BY EXTRACT(YEAR from date_of_admission) ASC

-- Number of patients admitted based on gender --

SELECT gender AS gender_patients,
	SUM(CASE WHEN medical_condition = 'Diabetes' THEN 1 END) AS diabetes_patients,
	SUM(CASE WHEN medical_condition = 'Arthritis' THEN 1 END) AS arthritis_patients,
	SUM(CASE WHEN medical_condition = 'Cancer' THEN 1 END) AS cancer_patients,
	SUM(CASE WHEN medical_condition = 'Hypertension' THEN 1 END) AS hypertension_patients,
	SUM(CASE WHEN medical_condition = 'Obesity' THEN 1 END) AS obesity_patients,
	SUM(CASE WHEN medical_condition = 'Asthma' THEN 1 END) AS asthma_patients
FROM healthcare	
GROUP BY gender


-- Predicting benefits of certain drugs --

SELECT gender AS gender_patients,
	SUM(CASE WHEN medication = 'Aspirin' THEN 1 END) AS aspirin_users,
	SUM(CASE WHEN medication = 'Penicillin' THEN 1 END) AS penicillin_users,
	SUM(CASE WHEN medication = 'Paracetamol' THEN 1 END) AS paracetamol_users,
	SUM(CASE WHEN medication = 'Ibuprofen' THEN 1 END) AS ibuprofen_users,
	SUM(CASE WHEN medication = 'Lipitor' THEN 1 END) AS lipitor_users
FROM healthcare
GROUP BY gender

-- Number of patients in each insurance provider --

SELECT DISTINCT insurance_provider, COUNT(*) AS insurer
FROM healthcare
GROUP BY insurance_provider


-- Distribution of test results by age --

SELECT age,
	COUNT(CASE WHEN test_results = 'Normal' THEN 1 END) AS normal_results,
	COUNT(CASE WHEN test_results = 'Abnormal' THEN 1 END) AS abnormal_results,
	COUNT(CASE WHEN test_results = 'Inconclusive' THEN 1 END) AS inconclusive_results
FROM healthcare
GROUP BY age 
ORDER BY age ASC

-- Total billing amount per insurance provider --

SELECT insurance_provider, SUM(billing_amount)::NUMERIC(10,2)
FROM healthcare
GROUP BY insurance_provider
