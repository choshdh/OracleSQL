--집계(통계) SQL 문제입니다.
--문제 1.
--직원중에 최고임금(salary)과 최저임금을 “최고임금, “최저임금”프로젝션 타이틀로 함께
--출력해 보세요. 두 임금의 차이는 얼마인가요? “최고임금 – 최저임금”이란 타이틀로 함께
--출력해 보세요.

select max(salary) "최고임금",
		min(salary) "최저임금",
		max(salary)-min(salary) "최고임금-최저임금"
from employees;

--문제2.
--마지막으로 신입사원이 들어온 날은 언제 입니까? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일

select to_char(max(hire_date),'YYYY"년"MM"월"DD"일"') "마지막 신입 입사일"
from employees;

--문제3.
--부서별로 평균임금, 최고임금, 최저임금을 부서(department_id)와 함께 출력하고 정렬순서는
--평균연봉 내림차순입니다.

select round(avg(salary),0) "평균임금",
		max(salary) "최고임금",
		min(salary) "최저임금",
		department_id "부서"
from employees
group by department_id
order by avg(salary) desc;

--문제4.
--업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무(job_id)와 함께 출력하고 정렬순서는
--평균연봉 내림차순입니다.

select job_id,
		round(avg(salary),0) "평균임금",
		max(salary) "최고임금",
		min(salary) "최저임금"
from employees
group by job_id
order by avg(salary) desc;

--문제5.
--가장 오래 근속한 직원의 입사일은 언제인가요? 다음 형식으로 출력해주세요.
--예) 2014년 07월 10일

select to_char(min(hire_date),'YYYY"년"MM"월"DD"일"') "장기근속 직원 입사일"
from employees;


--문제6.
--평균임금과 최저임금의 차이가 2000 미만인 부서(department_id), 평균임금, 최저임금 그리고
--(평균임금 – 최저임금)를 (평균임금 – 최저임금)의 내림차순으로 정렬해서 출력하세요.

select department_id "부서",
		round(avg(salary),0) "평균임금",
		min(salary) "최저임금",
		round(avg(salary),0)-min(salary) "평균임금-최저임금"
from employees
group by department_id
having (round(avg(salary),0)-min(salary))<2000
order by round(avg(salary),0)-min(salary) desc;

--문제7.
--업무(JOBS)별로 최고임금과 최저임금의 차이를 출력해보세요.
--차이를 확인할 수 있도록 내림차순으로 정렬하세요?

select job_id,
		max(salary)-min(salary) "최고임금-최저임금"
from employees
group by job_id
order by max(salary)-min(salary) desc;