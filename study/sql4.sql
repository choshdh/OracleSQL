--��������(SUBQUERY) SQL �����Դϴ�.
--����1.
--��� �޿����� ���� �޿��� �޴� ������ �� ���̳� �ֽ��ϱ�?
--//56��
select count(employee_id)
from employees
where salary < (select avg(salary)
				from employees);


--����2.
--�� �μ����� �ְ��� �޿��� �޴� ����� ������ȣ(employee_id), ��(last_name)�� �޿�(salary)
--�μ���ȣ(department_id)�� ��ȸ�ϼ��� �� ��ȸ����� �޿��� ������������ ���ĵǾ� ��Ÿ����
--�մϴ�.
--//11��
--1)������ ��
select employee_id,
		last_name,
		salary,
		department_id
from employees
where (department_id , salary) in (select department_id,
											max(salary)
								   from employees
								   group by department_id)
order by salary desc;

--2)���̺� ���� ��
select es.employee_id,
        es.last_name,
        es.salary,
        es.department_id
from employees es, (select department_id,
                            max(salary) salary
                            from employees
                            group by department_id) ms
where es.department_id = ms.department_id and es.salary = ms.salary
order by es.salary desc;


--����3.
--�� ����(job) ���� ����(salary)�� ������ ���ϰ��� �մϴ�. ���� ������ ���� ���� ��������
--������(job_title)�� ���� ������ ��ȸ�Ͻÿ�
--//19�μ�
select js.job_title "������",
		ss.salary "���� ����"
from  (select job_id,
	  sum(salary) salary
	  from employees
	  group by job_id) ss,
      jobs js
where ss.job_id = js.job_id
order by ss.salary desc;

--����4.
--�ڽ��� �μ� ��� �޿����� ����(salary)�� ���� ������ ������ȣ(employee_id), ��(last_name)��
--�޿�(salary)�� ��ȸ�ϼ���
--//38��
select es.employee_id "�μ����̵�",
		es.last_name "�̸�" ,
		es.salary "�޿�"
from employees es, (select department_id,
                            avg(salary) salary
                    from employees
                    group by department_id) avgs
where es.department_id = avgs.department_id and es.salary > avgs.salary;