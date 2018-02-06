select employee_id,
		first_name,
		salary
from employees
where salary > (select salary
				from employees
				where first_name = 'Den');
                
select first_name||' '||last_name "이름",
        salary
from employees
where salary < (select avg(salary)
                        from employees)
order by salary desc;

select first_name,
        salary
from employees
where salary in (select salary
                 from employees
                 where department_id=110);
                 
select first_name,
        salary
from employees
where salary >all (select salary
        from employees
        where department_id = 110);
        
select ds.department_id,
        ds.department_name,
        first_name||' '||last_name "사원이름",
        salary
from employees ,departments ds
where (salary , ds.department_id) in (select max(salary),
                                             department_id
                                   from employees
                                   group by department_id)
        and employees.department_id = ds.department_id
order by department_id;
