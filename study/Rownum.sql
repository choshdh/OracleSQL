select rownum,
        first_name,
        salary
from employees
order by salary desc;

select rownum,      -- s테이블에서 뽑아온 데이터에 rownum 을 붙이는 작업을 하는것 = *rownum 이 붙여진 상태로 나오는게 아니고 s테이블에서 select된 컬럼 값에 rownum 을 붙이며 증가 시키는 것이기 때문에 => where 절로 이동 해보자
        s.first_name,
        s.salary
from (select first_name,   -- first_name, salary 를 가진 s 테이블 생성
             salary
      from employees
      order by salary desc) s
where rownum = 3;    -- where 절에서 바로 rownum의 값이 3번인 데이터를 select 하면 찾을 수 없다.
                     -- 왜냐하면 아직 1번 rownum을 지정하려는 상태이기 때문에.
                     -- 첫번째 데이터부터 rownum이 3번인 데이터를 찾게되면 select 조건에 만족하지 못하게되서 rownum의 값은 계속 증가되지 못한다.

select r.rn,
       r."이름",
       r."사번",
       r."입사일"
from
    (select rownum rn,
           o."이름",
           o."사번",
           o."입사일"
    from 
         (select first_name || ' ' || last_name "이름",
                 employee_id "사번",
                 hire_date "입사일"
          from employees
          where hire_date >= '07/01/01'
          and hire_date <= '07/12/31'
          order by salary desc
          ) o
    ) r
where r.rn>3 and r.rn<7;


        