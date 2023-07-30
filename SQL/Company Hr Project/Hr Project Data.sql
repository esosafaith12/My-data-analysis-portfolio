--- create database

--- create database companydb;

use companydb;

describe hr_data;

-- update '' to '/'
update hr_data set birthdate = replace(birthdate, '-', '/');
--- change column data type to date
update hr_date
set birthdate = str_to_date(birthdate, '%m/%d/%Y');

--- update '-' to '/'
update hr_data set hire_date = replace(hire_Date, '-', '/');
--- change column data type to date
update hr_data
set hire_date = str_to_date(hire_Date, '%m/%d/%Y');

----- 1 The breakdown of employee in the company
select *
from hr_data;

select gender,count(gender)
from hr_data
group by gender;

----- 2 The race/ethnicity breakdown of employee in the company

select race,count(race)
from hr_data
group by race;

alter table hr_data
rename column id to Employee_Id;

----- 3 The age distribution of employee in the company

select year(birthdate), timestampdiff(Year, birthdate, curdate()) as Age,count(Employee_Id) as number_of_employees
from hr_data
group by year(birthdate)
order by Age asc;
 
 -----  4 Employee work at the headquarters versus location

select location,count(location)
from hr_data
group by location;

   -------- 5 The gender distribution vary across department and job title

 select department, jobtitle,gender,count(birthdate) as count
 from hr_data
 group by jobtitle,department,gender
 order by department,jobtitle;

 -------- 6 Distribution of job title across the company

select jobtitle,count(department)
from hr_data
group by department;

 -------- 7 What department has the highest turn over rate
 
 select department, count(termdate) as number_of_employee
 from hr_data
 where termdate
 group by department
order by count(termdate) desc;

alter table hr_data
rename column id to employee_id;
 
 -------- 8 distribution of employee across location by state 

select location,count(location_state)
from hr_data
group by location;

--------  9 The company's employee count changed overtime based on hire and term date

select year(hire_date), year(termdate),count(Employee_Id)
from hr_data
group by year(hire_date),year(termdate)
order by termdate, hire_date;

----- 10 Tenure disribution for each department

select Employee_Id,count(department)
from hr_data
group by jobtitle

