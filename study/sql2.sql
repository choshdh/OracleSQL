select max(salary) "최고임금",
		min(salary) "최저임금",
		max(salary)-min(salary) "최고임금-최저임금"
from employees;

select to_char(max(hire_date),'YYYY"년"MM"월"DD"일"') "마지막 신입 입사일"
from employees;

select round(avg(salary),0),
		max(salary),
		min(salary),
		department_id
from employees
group by department_id
order by avg(salary) desc;

select job_id,
		round(avg(salary),0) "평균임금",
		max(salary) "최고임금",
		min(salary) "최저임금"
from employees
group by job_id
order by avg(salary) desc;

select to_char(min(hire_date),'YYYY"년"MM"월"DD"일"') "장기근속 직원 입사일"
from employees;

select es.employee_id "직원아이디",
        to_char(hire_date,'YYYY"년"MM"월"DD"일"') "입사일",
        to_char(start_date,'YYYY"년"MM"월"DD"일"') "시작일",
        to_char(end_date,'YYYY"년"MM"월"DD"일"') "종료일"
from employees es, job_history jh
where es.employee_id = jh.employee_id;

select to_char(min(hire_date),'YYYY"년"MM"월"DD"일"') "장기근속 직원 입사일"
from employees;

select department_id "부서",
		round(avg(salary),0) "평균임금",
		min(salary) "최저임금",
		round(avg(salary),0)-min(salary) "평균임금-최저임금"
from employees
group by department_id
having ((round(avg(salary),0)-min(salary))<2000
order by round(avg(salary),0)-min(salary) desc;

select job_id,
		max(salary)-min(salary) "최고임금-최저임금"
from employees
group by job_id
order by max(salary)-min(salary) desc;