--Q: https://datalemur.com/questions/sql-top-three-salaries


WITH top_employees
     AS (SELECT dp.department_name,
                emp.NAME,
                emp.salary,
                Dense_rank()
                  OVER(
                    partition BY dp.department_name
                    ORDER BY dp.department_name ASC, emp.salary DESC )
                salary_rank
         FROM   employee emp
                INNER JOIN department dp
                        ON emp.department_id = dp.department_id)
SELECT department_name,
       NAME,
       salary
FROM   top_employees
WHERE  salary_rank <= 3; 
