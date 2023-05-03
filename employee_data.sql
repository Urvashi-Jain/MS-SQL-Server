select * from dbo.test$

/* Count the Gender */

select Gender, count(Gender) as G_Count
from dbo.test$
group by Gender

/* Job Count for Gender */

select Gender, JobRole, count(JobRole) as Job_Count
from dbo.test$
group by JobRole, Gender

/* Departments who travel frequently */

select Department, count(Department) as Dept_Count
from dbo.test$
where BusinessTravel='Travel_Frequently'
group by Department

/* Departments having Monthly Income greater than Avg Monthly Income Using Having */

select Department, MonthlyIncome
from dbo.test$
group by Department, MonthlyIncome
having MonthlyIncome>(select avg(MonthlyIncome) from dbo.test$)

/* Average Monthly Income */

select avg(MonthlyIncome) from dbo.test$

/* Departments having Monthly Income greater than Avg Monthly Income Using Where */

select Department, MonthlyIncome
from dbo.test$
where MonthlyIncome>(select avg(MonthlyIncome) from dbo.test$)
group by Department, MonthlyIncome

/* In Clause - Showing departments */

select Department, DistanceFromHome
from dbo.test$
where DistanceFromHome in ('15', '18', '24')

select Department, DistanceFromHome
from dbo.test$
where DistanceFromHome in ('15', '18', '24') and Department='Sales'

select Department, DistanceFromHome
from dbo.test$
where DistanceFromHome not in ('15', '18', '24') and Department='Sales'

/* Years at company > 5 */

select Age, Department, Gender, YearsAtCompany
from dbo.test$
where YearsAtCompany>5
order by YearsAtCompany desc

/* Monthly Income for each Department */

select Department, sum(MonthlyIncome) as Total_Dept_Income
from dbo.test$
group by Department
order by Total_Dept_Income desc

select Department, count(Department) as Dept
from dbo.test$
group by Department
