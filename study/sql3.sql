select es1.employee_id,
		es1.first_name,
		d.department_name,
		es1.manager_id,
		es2.first_name
from employees es1, employees es2, departments d
where es1.manager_id = es2.employee_id (+) and es1.department_id = d.department_id (+);

select cs.country_name,
		rs.region_id,
		rs.region_name
from countries cs, regions rs
where cs.region_id = rs.region_id
order by region_name desc ,country_name desc;

select es.department_id "�μ����̵�",
		ds.department_name "�μ���",
		ds.manager_id || ' ' || es.first_name "�Ŵ����� id+first_name",
		ls.city "���ø�",
		cs.country_name "�����̸�",
		rs.region_name "������"
from employees es,departments ds,locations ls,countries cs,regions rs
where es.employee_id = ds.manager_id and ds.location_id = ls.location_id and ls.country_id = cs.country_id and cs.region_id = rs.region_id;

select first_name || ' ' || last_name "��� �̸�",
		es.employee_id,
        job_title
from employees es, job_history jh, jobs js
where es.employee_id = jh.employee_id and jh.job_id = js.job_id and job_title='Public Accountant';

select employee_id,
		first_name,
		last_name
		department_name
from employees es, departments ds
where es.department_id= ds.department_id
order by last_name;

select es1.employee_id,
		es1.last_name,
		es1.hire_date
from employees es1, employees es2
where es1.manager_id = es2.employee_id and es1.hire_date < es2.hire_date;
