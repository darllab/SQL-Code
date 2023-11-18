DATASET from Kaggle: https://www.kaggle.com/datasets/tawfikelmetwally/employee-dataset

-- Display all rows with joining year from 2010 to 2020 -- 

SELECT * 
FROM Employee
WHERE joiningyear BETWEEN '2010' AND '2020'
GROUP BY joiningyear

-- Display all rows if underqualified or overqualified based on years of experience -- 

SELECT education, age,
CASE
WHEN experienceincurrentdomain > 5 THEN 'Overqualified'
WHEN experienceincurrentdomain < 5 THEN 'Underqualified'
ELSE experienceincurrentdomain
END as number_of_experiences
FROM Employee
GROUP BY age

-- Display all total numbers of experience based on education --

SELECT 
	SUM(CASE WHEN education = 'Bachelors' then 1 end) as bachelors_count,
    SUM(CASE WHEN education = 'Masters' then 1 end) as masters_count,
    SUM(CASE WHEN education = 'PHD' then 1 end) as PHD_count
FROM Employee    
    
 
-- Display how many female and male joined --

SELECT
	(SELECT count(*) from Employee where Gender = 'Male') as male_count,
    (SELECT count(*) from Employee where Gender = 'Female') as female_count;   
    
-- Show all columns for Employee table, most recent joining year --

SELECT *
FROM Employee
WHERE education in ('Bachelors', 'Masters', 'PHD')
ORDER BY joiningyear DESC
limit 1

-- Display their education and first and last joined year of the employee --

SELECT education,
	MIN(joiningyear) AS first_joining_year,
    MAX(joiningyear) as last_joining_year
FROM Employee    
GROUP BY education
 
-- Display all the total number of employee education -- 

SELECT education, COUNT (*) AS total_education
FROM Employee
GROUP by education
