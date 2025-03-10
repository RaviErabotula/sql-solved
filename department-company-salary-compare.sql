--Q: https://datalemur.com/questions/sql-department-company-salary-comparison

with department_salary as (
  SELECT 
    department_id, 
    TO_CHAR(payment_date, 'MM-YYYY') AS payment_date, 
    avg(slry.amount) as emp_avg_salary, 
    (
      select 
        avg(amount) 
      from 
        salary 
      where 
        to_char(payment_date, 'MM-YYYY')= '03-2024'
    ) as company_avg_salary 
  FROM 
    employee emp 
    inner JOIN salary slry on emp.employee_id = slry.employee_id 
    and to_char(payment_date, 'MM-YYYY')= '03-2024'
  group by 
    department_id, 
    payment_date
) 



select 
  department_id, 
  payment_date, 
  (
    case when round(emp_avg_salary)> round(company_avg_salary) then 'higher' 
         when round(emp_avg_salary)< round(company_avg_salary) then 'lower' 
         when round(emp_avg_salary)= round(company_avg_salary) then 'same' 
    end
  ) as comparison 
from 
  department_salary;
