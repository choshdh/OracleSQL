--테이블간 조인(JOIN) SQL 문제입니다.
--문제 1.
--각 사원(employee)에 대해서 사번(employee_id), 이름(first_name),
--부서명(department_name), 매니저(manager)의 이름(first_name)을 조회하세요.

select es1.employee_id,
		es1.first_name,
		d.department_name,
		es1.manager_id,
		es2.first_name
from employees es1, employees es2, departments d
where es1.manager_id = es2.employee_id (+) and es1.department_id = d.department_id (+);


--문제2.
--지역(regions)에 속한 나라들을 지역이름(region_name), 나라이름(country_name)으로
--출력하되 지역이름, 나라이름 순서대로 내림차순으로 정렬하세요.
--//25개국

select cs.country_name,
		rs.region_id,
		rs.region_name
from countries cs, regions rs
where cs.region_id = rs.region_id
order by region_name desc ,country_name desc;


--문제3.
--각 부서(department)에 대해서 부서번호(department_id), 부서이름(department_name),
--매니저(manager)의 이름(first_name), 위치(locations)한 도시(city), 나라(countries)의
--이름(countries_name) 그리고 지역구분(regions)의 이름(resion_name)까지 전부 출력해
--보세요.
--//11개

select es.department_id "부서아이디",
		ds.department_name "부서명",
		ds.manager_id || ' ' || es.first_name "매니저의 id+first_name",
		ls.city "도시명",
		cs.country_name "나라이름",
		rs.region_name "지역명"
from employees es,departments ds,locations ls,countries cs,regions rs
where es.employee_id = ds.manager_id and ds.location_id = ls.location_id and ls.country_id = cs.country_id and cs.region_id = rs.region_id;

--문제4.
--‘Public Accountant’의 직책(job_title)으로 과거에 근무한 적이 있는 모든 사원의 사번과
--이름을 출력하세요. (현재 ‘Public Accountant’의 직책(job_title)으로 근무하는 사원은
--고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력합니다.
--//2명

select first_name || ' ' || last_name "사원 이름",
		es.employee_id,
        job_title
from employees es, job_history jh, jobs js
where es.employee_id = jh.employee_id and jh.job_id = js.job_id and job_title='Public Accountant';

--문제5.
--직원들의 사번(employee_id), 이름(firt_name), 성(last_name)과 부서 이름을 조회하여
--성(last_name)순서로 오름차순 정렬하세요
--//106명

select employee_id,
		first_name,
		last_name,
		department_name
from employees es, departments ds
where es.department_id= ds.department_id
order by last_name;


--문제6.
--자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과
--채용일(hire_date)을 조회하세요

select es.employee_id,
		es.last_name,
		es.hire_date
from employees es1, employees es2
where es1.manager_id = es2.employee_id and es1.hire_date < es2.hire_date;

