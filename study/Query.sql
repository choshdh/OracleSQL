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

select employee_id "������̵�" from employees; 


select first_name, --�� ������ �ؿ��� ���� ���ļ� ����Ҽ� �ִ�.
       last_name
from employees;

select first_name || last_name --|| �� �� Į�� ����� ���� �÷� ������ ��ġ�� ������Ѵ�
from employees;

select first_name || ' ' || last_name
from employees;

select job_id*12 --job_id �÷��� ������  ���ڿ� �����̱⶧���� 12�� ���� �� ��� ������
from employees;

select first_name as �̸�, -- as�� �Ἥ ������̱� ���� ���� �빮�ڷ� ǥ���
       salary*12 ����, --as�� �����ʾƵ� ������ �򰥸� �� �ִ�... ���� ���� �빮�ڷ� ǥ���
       salary*12+500 "����+���ʽ�" --as ��ſ� ū ����ǥ ��� �� ������ ū����ǥ�� ����ϸ� ������� ������ ����...
from employees;

select first_name || '-' || last_name "����",
       salary*12 "����",
       salary*12+500 "����+���ʽ�",
       phone_number "��ȭ��ȣ"
from employees;

/*
���� �ּ�
*/

select * 
from employees
where DEPARTMENT_ID != 10; --�μ���ȣ�� 10�� �ƴ� ��� �̱�

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
       salary "�޿�"
from employees
where salary<=14000 or salary>=17000
order by salary asc;

select first_name || ' ' || last_name as �̸�,
       salary,
       hire_date
from employees
where hire_date>'04/01/01' and hire_date<'05/12/31'
order by hire_date asc;

select  first_name || ' ' || last_name as �̸�,
        salary "����"
from employees
where salary = 2100 or salary = 3100 or salary = 4100 or salary = 5100
order by salary;

select *
from employees
where salary in (2100,3100,4100,5100)
order by salary;

select first_name
from employees
where first_name like 'L__'; --�����(_)�� ���� �ϳ��� ����

select first_name
from employees
where first_name like 'L%'; --�ۼ�Ʈ(%)�� ���� ������ ������� �̾ƿ�

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

select department_id "�μ���ȣ",
        salary "�޿�",
        first_name "�̸�"
from employees
order by department_id asc , salary desc;


select email,
        initcap(email),  --ù���ڸ� �빮�ڷ�
        lower(email),  --��� �ҹ��ڷ�
        upper(email),  --��� �빮�ڷ�
        substr(first_name, 1, 3) --���� ���� ������ ���ڿ� �̱�
from employees
where department_id = 100;


--lpad, rpad : (������ ���ڿ�, ���������� ������ ���ڿ��� ����, ������� ä�� ����)
select first_name,
        lpad(first_name,4,first_name),
        lpad(first_name,3,'a')
from employees;


--ltrim : a �� b�� �� �۾��� �����ϵ� �ѹ� ���� �Ǿ��ִ� �۾��鸸 �����ϰ� ����ȴ� ����� fgahi
select ltrim('ababafgahi','ab')  
from dual;   -- ������ ���̺� ������ �ԷµǴ� ���ڿ����� ���̺� ����ִ°�ó�� �����ش�

--trim : ù��°���� ���ڰ� �����ڷ� ����ϰ� , ��ſ� from �̶�� �ܾ ����Ͽ� �ڿ��ִ� ���ڿ��� trim �Ѵ�
select  '---' || trim(' ' from '   data base   ') || '---'  
from dual;


--Replace : (������ ��� ���ڿ�, �������� , �����Ĺ���)
select first_name,
replace(first_name, 'a', '*')
from employees
where department_id =100;

--substr : (����ڿ�, ���� ���� ������ ���ڿ� ����, ������ ���� ���ڿ� ����)
select first_name,
replace(first_name, 'a', '*'),
replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

--round : �ݿø�(��� ����, ǥ���� �Ҽ��� �ִ� �ڸ���)
select round(123.346, 2) "r2",
round(123.456, 0) "r0",
round(123.456, -1) "r-1"
from dual;

--trunc : ����(��� ����,ǥ���� �Ҽ��� �ִ� �ڸ���)
select trunc(123.346, 2) "r2",
trunc(123.456, 0) "r0",
trunc(123.456, -1) "r-1"
from dual;

--sysdate : ����ð�
select sysdate
from dual;

--months_between : ������ �޼�
select first_name,
        months_between(sysdate, hire_date)
from employees
where department_id = 100;

--to_char(��� ����, ������ ���� ����) => ���ڸ� ���� ���·� ��ȯ�Ѱ�
select first_name, to_char(salary*12, '$999,999.99')
from employees
where department_id = 110;

--to_char ����
select sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;
--to_char ����
select sysdate,
        to_char(sysdate, 'YYYY"��"-MM"��"-DD"��" HH24:MI:SS')
from dual;

--nvl : (�÷���,null�϶���)
select commission_pct, nvl(commission_pct, 0)
from employees;
--nl2(�÷���, null�� �ƴҶ��� ��, null �϶��� ��)
select commission_pct, nvl2(commission_pct, 100, 0)
from employees;