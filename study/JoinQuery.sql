select count(department_id)
from EMPLOYEES;

select count(employee_id) "직원수",
        count(*) "전체 카운트",  -- *전체는 null 포함
        count(commission_pct)  "수당책정직원"  -- 컬럼지정시 null 포함 하지않음
from employees;

select count(employee_id)
from employees
where salary>16000;

select sum(salary)
from employees;

select count(employee_id),
        sum(salary)
from employees;

select count(employee_id) "직원 수",
        sum(salary) "직원의 급여 총합" ,
        round(avg(salary),2) "null 포함 평균급여",
        round(avg(nvl(salary,0)),2) "평균급여"
from employees;

select count(employee_id) "직원 수",
        max(salary) "  월급도둑! : ",
        min(salary) "  노예...  "
from employees;

select department_id "부서 아이디",
        round(avg(salary),2) "평균 급여",
        max(salary) "월급도둑 급여",
        min(salary) "노예.. 급여"
from employees
group by department_id
order by department_id;

select department_id, job_id, count(*), sum(salary)
from employees
group by department_id, job_id
order by department_id;

select department_id, count(*), sum(salary)
from employees
group by department_id
having sum(salary) > 20000   --sql 문의 where 절까지 실행된 결과 상태는 현재 그룹이 지어지지 않은 상태이기때문에 ,그룹 함수는 절대 where 절에서 사용 할 수 없다.
        and department_id = 100; --그러므로 그룹단위에게 조건을 사용하여 검색 할 때는 having을 사용한다
        
        
select first_name||' '||last_name "이름",
        department_id "부서번호",
        case when department_id >=10 and department_id<=50 then 'A-team'
             when department_id >=51 and department_id<=100 then 'B-team'
             when department_id >=101 and department_id<=150 then 'C-team'
             else '팀없음'
        end "팀이름"
from employees
order by department_id;

select first_name||' '||last_name "이름",
        department_name "부서명",
        job_title "업무명"
from employees es, departments ds, jobs js
where es.job_id = js.job_id and es.department_id = ds.department_id (+);


