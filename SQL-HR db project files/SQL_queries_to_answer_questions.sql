-- SQL QUESTIONS:

-- question 1:
select Emp_NM, job_title, department_nm
from employee e
join employee_role er on e.emp_id = er.emp_id
join department d on er.department_id = d.department_id


-- question 2:
INSERT INTO employee_role(job_title)
values('Web Programmer')

select title_id, job_title
from employee_role
where job_title = 'Web Programmer'


-- question 3:
UPDATE employee_role
SET job_title = 'Web Developer'
where job_title = 'Web Programmer'

select job_title
from employee_role
where job_title = 'Web Developer'

-- question 4:
DELETE FROM employee_role
WHERE job_title = 'Web Developer'

select job_title
from employee_role
where job_title = 'Web Developer'



-- QUESTION 5:

select department_nm, COUNT(*)
FROM department d
join employee_role er on d.department_id = er.department_id
group by 1
order by 2



-- Question 6:

select Emp_NM, job_title, manager_name, department_nm, start_dt, end_dt
from employee_role er
JOIN management m ON er.manager_id = m.manager_id
join employee e on er.emp_id = e.emp_id
join department d on d.department_id = er.department_id
where Emp_NM = 'Toni Lembeck'
