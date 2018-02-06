select manager_id from DEPARTMENTS where DEPARTMENT_ID>40;

select employee_id,
       first_name,
       last_name
from employees;

select first_name,
       phone_number,
       hire_date
from employees;

select first_name,
       last_name, 
       salary, 
       phone_number, 
       email, hire_date
from employees;

select employee_id "사원아이디" from employees; 


select first_name, --요 형식을 밑에와 같이 합쳐서 출력할수 있다.
       last_name
from employees;

select first_name || last_name --|| 는 뒷 칼럼 내용과 앞의 컬럼 내용을 합치는 기능을한다
from employees;

select first_name || ' ' || last_name
from employees;

select job_id*12 --job_id 컬럼의 정보가  문자열 형식이기때문에 12를 곱할 수 없어서 오류다
from employees;

select first_name as 이름, -- as를 써서 별명붙이기 영어 사용시 대문자로 표기됨
       salary*12 연봉, --as를 쓰지않아도 되지만 헷갈릴 수 있다... 영어 사용시 대문자로 표기됨
       salary*12+500 "연봉+보너스" --as 대신에 큰 따옴표 사용 할 수있음 큰따옴표를 사용하면 띄어쓰기등의 장점이 있음...
from employees;

select first_name || '-' || last_name "성명",
       salary*12 "연봉",
       salary*12+500 "연봉+보너스",
       phone_number "전화번호"
from employees;

/*
다중 주석
*/

select * 
from employees
where DEPARTMENT_ID != 10; --부서번호가 10이 아닌 사람 뽑기

select *
from employees
where salary*12 > 15000;

select *
from employees
where hire_date > '07/01/01';

select *
from employees
where first_name = 'Lex';

select first_name,
       salary "급여"
from employees
where salary<=14000 or salary>=17000
order by salary asc;

select first_name || ' ' || last_name as 이름,
       salary,
       hire_date
from employees
where hire_date>'04/01/01' and hire_date<'05/12/31'
order by hire_date asc;

select  first_name || ' ' || last_name as 이름,
        salary "연봉"
from employees
where salary = 2100 or salary = 3100 or salary = 4100 or salary = 5100
order by salary;

select *
from employees
where salary in (2100,3100,4100,5100)
order by salary;

select first_name
from employees
where first_name like 'L__'; --언더바(_)는 글자 하나를 뜻함

select first_name
from employees
where first_name like 'L%'; --퍼센트(%)는 글자 갯수와 상관없이 뽑아옴

--1
select first_name,
       salary
from employees
where first_name like '%am%'; 

--2
select first_name,
        salary
from employees
where first_name like '_a%'; 

--3
select first_name
from employees
where first_name like '___a%';

--4
select first_name
from employees
where first_name like '_a__';

select first_name, salary, commission_pct
from employees
where commission_pct is not null
order by salary;

select first_name, salary
from employees
where salary >= 9000
order by first_name asc, salary asc;

select department_id "부서번호",
        salary "급여",
        first_name "이름"
from employees
order by department_id asc , salary desc;


select email,
        initcap(email),  --첫글자만 대문자로
        lower(email),  --모두 소문자로
        upper(email),  --모두 대문자로
        substr(first_name, 1, 3) --시작 지점 끝지점 문자열 뽑기
from employees
where department_id = 100;


--lpad, rpad : (수정할 문자열, 최종적으로 존재할 문자열의 개수, 빈공간에 채울 문자)
select first_name,
        lpad(first_name,4,first_name),
        lpad(first_name,3,'a')
from employees;


--ltrim : a 와 b가 들어간 글씨를 제거하되 한번 연계 되어있는 글씨들만 제거하고 종료된다 결과값 fgahi
select ltrim('ababafgahi','ab')  
from dual;   -- 가상의 테이블 위에서 입력되는 문자열들이 테이블에 들어있는것처럼 보여준다

--trim : 첫번째오는 인자가 구분자로 사용하고 , 대신에 from 이라는 단어를 사용하여 뒤에있는 문자열을 trim 한다
select  '---' || trim(' ' from '   data base   ') || '---'  
from dual;


--Replace : (수정할 대상 문자열, 변경대상문자 , 변경후문자)
select first_name,
replace(first_name, 'a', '*')
from employees
where department_id =100;

--substr : (대상문자열, 왼쪽 기준 제외할 문자열 개수, 제외후 뽑을 문자열 개수)
select first_name,
replace(first_name, 'a', '*'),
replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

--round : 반올림(대상 숫자, 표현할 소숫점 최대 자리수)
select round(123.346, 2) "r2",
round(123.456, 0) "r0",
round(123.456, -1) "r-1"
from dual;

--trunc : 버림(대상 숫자,표현할 소숫점 최대 자리수)
select trunc(123.346, 2) "r2",
trunc(123.456, 0) "r0",
trunc(123.456, -1) "r-1"
from dual;

--sysdate : 현재시간
select sysdate
from dual;

--months_between : 사이의 달수
select first_name,
        months_between(sysdate, hire_date)
from employees
where department_id = 100;

--to_char(대상 숫자, 지정할 포맷 형식) => 숫자를 문자 형태로 변환한것
select first_name, to_char(salary*12, '$999,999.99')
from employees
where department_id = 110;

--to_char 응용
select sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;
--to_char 응용
select sysdate,
        to_char(sysdate, 'YYYY"년"-MM"월"-DD"일" HH24:MI:SS')
from dual;

--nvl : (컬럼명,null일때값)
select commission_pct, nvl(commission_pct, 0)
from employees;
--nl2(컬럼명, null이 아닐때의 값, null 일때의 값)
select commission_pct, nvl2(commission_pct, 100, 0)
from employees;