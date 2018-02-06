select max(salary) "�ְ��ӱ�",
		min(salary) "�����ӱ�",
		max(salary)-min(salary) "�ְ��ӱ�-�����ӱ�"
from employees;

select to_char(max(hire_date),'YYYY"��"MM"��"DD"��"') "������ ���� �Ի���"
from employees;

select round(avg(salary),0),
		max(salary),
		min(salary),
		department_id
from employees
group by department_id
order by avg(salary) desc;

select job_id,
		round(avg(salary),0) "����ӱ�",
		max(salary) "�ְ��ӱ�",
		min(salary) "�����ӱ�"
from employees
group by job_id
order by avg(salary) desc;

select to_char(min(hire_date),'YYYY"��"MM"��"DD"��"') "���ټ� ���� �Ի���"
from employees;

select es.employee_id "�������̵�",
        to_char(hire_date,'YYYY"��"MM"��"DD"��"') "�Ի���",
        to_char(start_date,'YYYY"��"MM"��"DD"��"') "������",
        to_char(end_date,'YYYY"��"MM"��"DD"��"') "������"
from employees es, job_history jh
where es.employee_id = jh.employee_id;

select to_char(min(hire_date),'YYYY"��"MM"��"DD"��"') "���ټ� ���� �Ի���"
from employees;

select department_id "�μ�",
		round(avg(salary),0) "����ӱ�",
		min(salary) "�����ӱ�",
		round(avg(salary),0)-min(salary) "����ӱ�-�����ӱ�"
from employees
group by department_id
having ((round(avg(salary),0)-min(salary))<2000
order by round(avg(salary),0)-min(salary) desc;

select job_id,
		max(salary)-min(salary) "�ְ��ӱ�-�����ӱ�"
from employees
group by job_id
order by max(salary)-min(salary) desc;