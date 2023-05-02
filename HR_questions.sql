-- QUESTIONS


-- 1. What is the gender breakdown of employees in the company?
SELECT gender,count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by gender;


-- 2. What is the race/ethnicity breakdown of employees in the company?
SELECT race,count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by race
order by count(*) desc;


-- 3. What is the age distribution of employees in the company?
select
min(age) as youngest,
max(age) as oldest
from hr
where age>=18 and termdate="0000-00-00";

select
case
when age>=18 and age<=27 then "18-27"
when age>=28 and age<=37 then "28-37"
when age>=38 and age<=47 then "38-47"
when age>=48 and age<=57 then "48-57"
else "57+"
end as age_group,
count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by age_group
order by age_group;


select
case
when age>=18 and age<=27 then "18-27"
when age>=28 and age<=37 then "28-37"
when age>=38 and age<=47 then "38-47"
when age>=48 and age<=57 then "48-57"
else "57+"
end as age_group,gender,
count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by age_group,gender
order by age_group,gender;


-- 4. How many employees work at headquarters versus remote locations?
select location, count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by location;


-- 5. What is the average length of employment for employees who have been terminated?
select 
round(avg(datediff(termdate,hire_date))/365) as avg_length_employment
from hr
where termdate<=curdate() and termdate<>"0000-00-00" and age>=18;


-- 6. How does the gender distribution vary across departments and job titles?
SELECT department,count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by department,gender
order by department;


-- 7. What is the distribution of job titles across the company?
SELECT jobtitle,count(*) as count
from hr
where age>=18 and termdate="0000-00-00"
group by jobtitle
order by jobtitle desc;


-- 8. What is the distribution of employees across locations by state?
SELECT location_state, COUNT(*) as count
FROM hr
WHERE age >= 18
GROUP BY location_state
ORDER BY count DESC;


    
