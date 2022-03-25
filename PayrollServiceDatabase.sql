--UC1 create and use database
use payroll_service;


--UC2 create employee payroll table
create table employee_payroll
(
employeeId int identity(1,1) primary key,
name varchar(20),
salary int,
starting_Date date,
);


--UC3 Create employee payroll data
insert into employee_payroll (name,salary,starting_Date)
values ('Astha','5000','01-03-2022');
insert into employee_payroll (name,salary,starting_Date)
values ('Asita','2000','01-01-2022');
insert into employee_payroll (name,salary,starting_Date)
values ('Akshata','10000','01-02-2021');
insert into employee_payroll (name,salary,starting_Date)
values ('Ashish','5000','01-02-2022');
insert into employee_payroll (name,salary,starting_Date)
values ('Ajit','7000','01-01-2021');
insert into employee_payroll (name,salary,starting_Date)
values ('Anand','20000','01-02-2020');


--UC4 Retrive data
select * from employee_payroll;
 

 --UC5 Retrive salary data of a particular person
 select salary from employee_payroll where name='Astha';
 select * from employee_payroll where starting_Date between cast('01-01-2022' as date) and cast('01-03-2022' as date);


 --UC6 Alter table to add gender
 alter  table employee_payroll
 add gender char;
 update employee_payroll set gender='F' where name='Astha' or name='Asita' or name='Akshata'; 
 update employee_payroll set gender='M' where name='Ashish' or name='Ajit' or name='Anand'; 


--UC7 Ability to find min ,max,sum and average
select sum(salary) from employee_payroll where gender='F' group by gender;
select sum(salary) from employee_payroll where gender='M' group by gender;
select avg(salary) from employee_payroll;
select min(salary) from employee_payroll;
select max(salary) from employee_payroll;
select count(gender) from employee_payroll where gender='F';
select count(gender) from employee_payroll where gender='M';

