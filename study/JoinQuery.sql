select count(department_id)
from EMPLOYEES;

select count(employee_id) "������",
        count(*) "��ü ī��Ʈ",  -- *��ü�� null ����
        count(commission_pct)  "����å������"  -- �÷������� null ���� ��������
from employees;

select count(employee_id)
from employees
where salary>16000;

select sum(salary)
from employees;

select count(employee_id),
        sum(salary)
from employees;

select count(employee_id) "���� ��",
        sum(salary) "������ �޿� ����" ,
        round(avg(salary),2) "null ���� ��ձ޿�",
        round(avg(nvl(salary,0)),2) "��ձ޿�"
from employees;

select count(employee_id) "���� ��",
        max(salary) "  ���޵���! : ",
        min(salary) "  �뿹...  "
from employees;

select department_id "�μ� ���̵�",
        round(avg(salary),2) "��� �޿�",
        max(salary) "���޵��� �޿�",
        min(salary) "�뿹.. �޿�"
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
having sum(salary) > 20000   --sql ���� where ������ ����� ��� ���´� ���� �׷��� �������� ���� �����̱⶧���� ,�׷� �Լ��� ���� where ������ ��� �� �� ����.
        and department_id = 100; --�׷��Ƿ� �׷�������� ������ ����Ͽ� �˻� �� ���� having�� ����Ѵ�
        
        
select first_name||' '||last_name "�̸�",
        department_id "�μ���ȣ",
        case when department_id >=10 and department_id<=50 then 'A-team'
             when department_id >=51 and department_id<=100 then 'B-team'
             when department_id >=101 and department_id<=150 then 'C-team'
             else '������'
        end "���̸�"
from employees
order by department_id;

select first_name||' '||last_name "�̸�",
        department_name "�μ���",
        job_title "������"
from employees es, departments ds, jobs js
where es.job_id = js.job_id and es.department_id = ds.department_id (+);


