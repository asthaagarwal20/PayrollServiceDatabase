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


--UC8 Add phone no,address and department in table
alter table employee_payroll
add phone varchar(12),department varchar(20) not null default 'Cse',address varchar(30)  default 'Kanpur';


--UC9 Add basic pay,Income tax,Net pay,Deductions,taxable pay
alter table employee_payroll
drop  column salary;
alter table employee_payroll
add basic_pay decimal,deduction decimal,taxable_pay decimal,income_tax decimal,net_pay decimal;


--UC10 Add Teresa in sales and marketing Department
insert into employee_payroll values('Teresa','2022-02-03','M','7007231604','sales','Gkp',50000,5000,45000,3000,42000);
insert into employee_payroll values('Teresa','2022-02-03','M','7007231604','marketing','Gkp',50000,5000,45000,3000,42000);


--UC11 ER Diagram
create table department_table
(
dapartment_id int identity(1,1) primary key,
department_name varchar(20),
);
alter table employee_payroll
drop column department;
create table Payroll
(
service_id int identity(1,1),
Employee_id int FOREIGN Key references employee_payroll(employeeId),
Department_id int FOREIGN Key references department_table(dapartment_id),
);
insert into department_table values('Sales');
insert into department_table values('marketing');
insert into department_table values('web development');
insert into department_table values('Software development');
select * from department_table;
select * from employee_payroll;
delete from employee_payroll where employeeId=8;
insert into payroll values(7,1);
insert into payroll values(7,2);
select * from payroll;
select Employee_Payroll.name,department_table.department_name from ((Payroll inner join Employee_Payroll on Payroll.Employee_id=Employee_Payroll.employeeId)inner join department_table on Payroll.Department_id=department_table.dapartment_id); 

 
