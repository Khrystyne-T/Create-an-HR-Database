
-- CREATE DATABASE employeetest1



create table employee (Emp_ID VARCHAR(8) PRIMARY KEY,
                       Emp_NM varchar(50),
  					   Email  varchar(100),
 					   hire_dt date,
 					   education_lvl varchar(50)
					   );
					   
--DROP TABLE department CASCADE
CREATE table department(department_id SERIAL PRIMARY KEY,
                        department_nm varchar(50)
);

--DROP TABLE management CASCADE
CREATE table management(manager_id SERIAL PRIMARY KEY,
                        manager_name varchar(50)
						
);
--DROP TABLE employee_role CASCADE
CREATE table employee_role(title_id SERIAL PRIMARY KEY,
                           job_title varchar(100),
						   start_dt date,
						   end_dt date NULL,
						   Emp_ID VARCHAR(8) REFERENCES employee(Emp_ID)
);
--DROP TABLE salary CASCADE
CREATE table salary(salary_id SERIAL PRIMARY KEY,
                    salary_amount DECIMAL (8, 2)
);
--DROP TABLE address CASCADE
CREATE table address(address_id SERIAL PRIMARY KEY,
                    address varchar(100)
);

CREATE table city(city_id SERIAL PRIMARY KEY,
                  city varchar(100)
);

CREATE table state(state_id SERIAL PRIMARY KEY,
                   state varchar(10)
);


CREATE table location(locaion_id SERIAL PRIMARY KEY,
                      location varchar(20)
);





--- INSERT values in employee table:
--DELETE from employee
INSERT INTO employee(Emp_ID, Emp_NM, email, hire_dt,education_lvl)
Select distinct emp_id, Emp_NM, email, hire_dt,education_lvl
from test;	

--select * from employee
--delete from department
--- Insert values in department
INSERT INTO department (department_nm)
select distinct department_nm
from test;

--select * from department




--select * from employee_role

--INSERT values into management:

INSERT INTO  management (manager_name)
SELECT distinct manager
from test;


--select * from management

--INSERT values into address:
--delete from address
INSERT INTO  address(address)
SELECT distinct address
from test;


--select * from address


--INSERT values into salary:

INSERT INTO  salary(salary_amount)
SELECT salary
from test;


--select * from salary

-- Insert into values into city
INSERT INTO city(city)
SELECT distinct city
from test;


--select * from city

-- insert values into state:
INSERT INTO  state(state)
SELECT distinct state
from test;


--select * from state



--INSERT values into location:
INSERT INTO  location(location)
SELECT distinct location
from test;


--select * from location


--- INSERT FK's in employee_role table:
ALTER TABLE employee_role
ADD manager_id int REFERENCES management(manager_id),
ADD department_id INT REFERENCES department(department_id),
ADD salary_id INT REFERENCES salary(salary_id),
ADD address_id INT REFERENCES address(address_id);

--select * from employee_role

--DELETE from employee_role;


-- insert values in emp_role table
insert into employee_role(job_title, start_dt, end_dt, emp_id, manager_id, salary_id, department_id, address_id)
select job_title, start_dt, end_dt, emp_id, manager_id, salary_id, department_id, address_id
FROM management m
join test t on m.manager_name = t.manager
join salary s on t.salary = s.salary_amount
join department d on t.department_nm = d.department_nm
join address a on t.address = a.address;



--select * from employee_role

-- test if input is correct:
/*select Emp_NM, job_title, manager_name, salary_amount, address
from employee_role er
JOIN management m ON er.manager_id = m.manager_id
join employee e on er.emp_id = e.emp_id
join salary s on s.salary_id = er.salary_id
join address a on er.address_id = a.address_id
where Emp_NM = 'Haifa Hajiri'

select * from management*/



--insert address id FK into emp_role table
/*ALTER TABLE employee_role
ADD address_id int REFERENCES address(address_id)

select * from employee_role

--insert_values in address id in emp_role table:
insert into employee_role(address_id)
select address_id 
FROM address a
join test t on a.address = t.address*/


-- insert city_id FK in address table:
--select * from address

Alter table city 
add address_id int REFERENCES address(address_id);
--select * from city
alter table state
ADD city_id int REFERENCES city(city_id);
--select * from state


alter table location
add state_id int REFERENCES state(state_id);
-- select * from location


