select employee_id,
        first_name,
        last_name,
        department_id
from employees
where department_id = (select  department_id
                       from employees
                       where last_name like '%hae%')
order by employee_id desc;

select  city,
        first_name,
        last_name,
        salary
from employees es, departments ds, locations ls
where es.department_id = ds.department_id
      and ds.location_id = ls.location_id
      and (city ,salary) in (select  city,
                             max(salary)
                     from employees es,departments ds, locations ls
                     where es.department_id = ds.department_id and ds.location_id = ls.location_id
                     group by city)
order by salary;

select �����̸�,
       ��տ���
from
     (select rownum,
             �����̸�,
             ��տ���
      from
          (select country_name as �����̸�,
                  avg(salary) as ��տ���
           from employees es, departments ds, locations ls, countries cs
           where es.department_id = ds.department_id
                 and ds.location_id = ls.location_id
                 and ls.country_id = cs.country_id
           group by country_name
           order by ��տ��� desc)
      where rownum = 1);


select �����̸�,
       ��տ���
from
     (select rownum,
             region_name as �����̸�,
             salary as ��տ���
      from
           (select region_name ,
                    avg(salary) salary
            from employees es, departments ds, locations ls, countries cs, regions rs
            where es.department_id = ds.department_id
                  and ds.location_id = ls.location_id
                  and ls.country_id = cs.country_id
                  and cs.region_id = rs.region_id
            group by region_name
            order by salary desc)
      where rownum = 1);


select "�μ��̸�",
		"�����"
from 
	 (select rownum,
	        "�μ��̸�",
	        "�����"
	  from 
	       (select  ds.department_name "�μ��̸�",
	             count(employee_id) "�����"
	        from employees es , departments ds
	        where es.department_id = ds.department_id
	            and ds.department_id is not null
	        group by ds.department_name
	        order by "�����" desc)
	  where rownum = 1);


select es.employee_id,
       es.last_name,
       es.email,
       js.job_title,
       ds.department_name,
       ls.city
from employees es, jobs js, departments ds, locations ls
where es.job_id = js.job_id
      and es.department_id = ds.department_id
      and ds.location_id = ls.location_id
      and js.job_id = 'PU_CLERK'
      and ls.city = 'Seattle'
order by es.employee_id desc;