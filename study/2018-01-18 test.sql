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

select 나라이름,
       평균연봉
from
     (select rownum,
             나라이름,
             평균연봉
      from
          (select country_name as 나라이름,
                  avg(salary) as 평균연봉
           from employees es, departments ds, locations ls, countries cs
           where es.department_id = ds.department_id
                 and ds.location_id = ls.location_id
                 and ls.country_id = cs.country_id
           group by country_name
           order by 평균연봉 desc)
      where rownum = 1);


select 지역이름,
       평균연봉
from
     (select rownum,
             region_name as 지역이름,
             salary as 평균연봉
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


select "부서이름",
		"사원수"
from 
	 (select rownum,
	        "부서이름",
	        "사원수"
	  from 
	       (select  ds.department_name "부서이름",
	             count(employee_id) "사원수"
	        from employees es , departments ds
	        where es.department_id = ds.department_id
	            and ds.department_id is not null
	        group by ds.department_name
	        order by "사원수" desc)
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