create table employee(
emp_id int not null,
emp_name varchar(20) not null,
salary int)

select * from dbo.employee

insert into employee
values(1, 'Abhishek', 90000),
(2, 'Urvashi', 50000),
(3, 'Kunj', 70000),
(4, 'Suraj', 80000),
(5, 'Shubham', 95000),
(6, 'Puja', 45000),
(7, 'Priyanka', 60000),
(8, 'Janhvi', 75000)

insert into employee values
(9, 'Raj', 60000)

create table employee_details(
emp_id int not null,
emp_dept varchar(30),
emp_role varchar(40),
emp_city varchar(20))

select * from dbo.employee_details

insert into employee_details values
(1, 'Data Analysis', 'Business Analyst', 'Imphal'),
(2, 'Data Analysis', 'Data Analyst', 'Jaipur'),
(3, 'Software Engineering', 'Software Engineer', 'Bangalore'),
(4, 'Data Analysis', 'Data Analyst', 'Bangalore'),
(5, 'Software Engineering', 'Software Engineer Lead', 'Bangalore'),
(6, 'Human Resources', 'Talent Acquisition Specialist', 'Gurgaon'),
(7, 'Sales', 'Sales Executive', 'Pune'),
(8, 'Data Analysis', 'Junior Data Analyst', 'Hyderabad')

/* Inner Join */

select *
from employee emp
inner join employee_details emp_det
on emp.emp_id=emp_det.emp_id

/* Left Outer Join */

select emp_name, salary, emp_dept
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id

select *
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id

/* Salary > Avg(Salary) */

select *
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
where salary>(select avg(salary) from employee)

/* Salary > 50000 */

select *
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
where salary>50000

/* Salary > 60000 */

select *
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
where salary>60000

/* Count Dept */

select count(emp.emp_id) as dept_id_count, emp_dept
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
group by emp_dept

/* Count Dept for Bangalore city*/

select count(emp.emp_id) as dept_id_count, emp_dept
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
where emp_city='Bangalore'
group by emp_dept

/* Count Dept for Bangalore, Jaipur city using in clause*/

select count(emp.emp_id) as dept_id_count, emp_dept
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
where emp_city in ('Bangalore', 'Jaipur')
group by emp_dept

/* Count Dept for Bangalore, Jaipur city having salary>avg salary*/

select count(emp.emp_id) as dept_id_count, emp_dept, salary
from employee emp
left join employee_details emp_det
on emp.emp_id=emp_det.emp_id
where emp_city in ('Bangalore', 'Jaipur')
group by emp_dept, salary
having salary>(select avg(salary) from employee)

/* Adding values to employee details table */

insert into employee_details values
(9, 'Operations', 'Senior Ops Analyst', 'Chennai'),
(10, 'Data Science', 'Sr Data Scientist', 'Hyderabad')

/* Right Join */

select *
from employee emp
right join employee_details ed
on emp.emp_id=ed.emp_id

select emp_name, emp_city
from employee emp
right join employee_details ed
on emp.emp_id=ed.emp_id
where ed.emp_city in ('Gurgaon', 'Bangalore', 'Pune', 'Chennai', 'Hyderabad')

/* Emp count (emp_id from Employee table) by Dept */

select count(em.emp_id) as Emp_Count, emp_dept
from employee em
right join employee_details ed
on em.emp_id=ed.emp_id
group by emp_dept

/* Emp count (emp_id from Employee Details table) by Dept */

select count(ed.emp_id) as Emp_Count, emp_dept
from employee em
right join employee_details ed
on em.emp_id=ed.emp_id
group by emp_dept

/* Top 2 salary employees */

select top 2 salary, emp_name, emp_dept
from employee em
right join employee_details ed
on em.emp_id=ed.emp_id
order by salary desc

/* salary>60000 or emp_dept in ('Data Analysis', 'Software Engineering', 'Data Science') */

select emp_name, salary, emp_dept, emp_role, emp_city
from employee em
right join employee_details ed
on em.emp_id=ed.emp_id
where salary>60000 or emp_dept in ('Data Analysis', 'Software Engineering', 'Data Science')