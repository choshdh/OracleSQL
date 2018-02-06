--����1.
--���� �ʰ� �Ի��� ������ �̸�(first_name last_name)�� ����(salary)�� �ٹ��ϴ� �μ�
--�̸�(department_name)��?
--1)rownum ���� ��
select es.first_name||' '||es.last_name "�̸�",
        es.salary "����",
        ds.department_name "�ٹ��μ�",
        es.hire_date "�Ի���"
from employees es, departments ds
where es.department_id = ds.department_id
      and es.hire_date = (select max(hire_date)
                          from employees);

--2)rownum �� ����� sql Ǯ��
select es.first_name||' '||es.last_name "�̸�",
            es.salary "����",
            ds.department_name "�ٹ��μ�",
            es.hire_date "�Ի���"
from employees es, departments ds
where es.department_id = ds.department_id
      and es.hire_date =  (select b.hire_date
                           from
                               (select rownum,
                                     a.hire_date
                                from
                                    (select hire_date
                                     from employees
                                     order by hire_date desc
                                    ) a
                                where rownum = 1
                                )b 
                          );   -- �� ���������� ��ȿ�� ���ε� �ٷ� ���̺��� �ִ밪�� ������ �ֱ� ������


--����2.
--��տ���(salary)�� ���� ���� �μ� �������� ������ȣ(employee_id), �̸�(firt_name),
--��(last_name)�� ����(job_title), ����(salary)�� ��ȸ�Ͻÿ�.
--1)rownum ���� ��
select es.employee_id "�����ȣ",
        es.first_name||' '||es.last_name "�̸�",
        js.job_title "������",
        es.salary "����"
from employees es, jobs js
where es.job_id = js.job_id 
      and es.department_id = (select department_id
                              from (select department_id,
                                         avg(salary) avgSalary
                                    from employees
                                    group by department_id) avgs
                              where avgs.avgSalary = (select max(avg(salary))
                                                     from employees
                                                     group by department_id));
                                                     
--2)rownum �� ����� sql Ǯ��
select ds.department_name,
        es.employee_id "���",
        es.first_name||' '||es.last_name "�̸�",
        js.job_title "������",
        es.salary "����"
from employees es, jobs js , departments ds
where es.job_id = js.job_id
      and es.department_id = ds.department_id
      and ds.department_name =
                        (select a.department_name
                        from (select  rownum,
                                        department_name
                                from 
                                    (select ds.department_name,
                                            avg(es.salary) "��ձ޿�"
                                    from employees es, departments ds
                                    where es.department_id = ds.department_id
                                    group by ds.department_name
                                    order by "��ձ޿�" desc
                                    ) avgs
                                where rownum = 1
                             )a
                        );
                                        
                                                     
--����3.
--��� �޿�(salary)�� ���� ���� �μ���?
--1)rownum ���� ��
select distinct ds.department_name "�μ���"
from employees es,
     departments ds,
     (select department_id,
             avg(salary) avgSalary
      from employees
      group by department_id) avgs
where es.department_id = ds.department_id
      and es.department_id = avgs.department_id
      and avgs.avgSalary = (select max(avg(salary))
                            from employees
                            group by department_id);
                            
--2)rownum �� ����� sql Ǯ��
select r."�μ���"
from
    (select rownum,
            avgs."�μ���",
            avgs."��ձ޿�"
    from
        (select department_name "�μ���",
               avg(salary) "��ձ޿�"
        from employees es,
             departments ds
        where es.department_id = ds.department_id
        group by department_name
        order by "��ձ޿�" desc
        ) avgs
    where rownum = 1    --where �������� ���� select ���� �ٿ����� ��Ī�� ��� �� �� ���°� ����...
                         --��Ī�� ���� select������ ����ϱ� ���ؼ� ���̴� �̸��ε�...
    )r;



--����4.
--��� �޿�(salary)�� ���� ���� ������?

select "������"
--1)rownum ���� ��
from (select rs.region_name "������",
                avg(es.salary) avgSalary
        from employees es,
             departments ds,
             locations ls,
             countries cs,
             regions rs
        where es.department_id = ds.department_id
              and ds.location_id = ls.location_id
              and ls.country_id = cs.country_id
              and cs.region_id = rs.region_id
        group by rs.region_name) avgs
where avgs.avgSalary = (select max(avg(es.salary))
                       from employees es,
                             departments ds,
                             locations ls,
                             countries cs,
                             regions rs
                       where es.department_id = ds.department_id
                             and ds.location_id = ls.location_id
                             and ls.country_id = cs.country_id
                             and cs.region_id = rs.region_id
                       group by rs.region_name);
                       
--2)rownum �� ����� sql Ǯ��
select totalResult."������"
from
    (select rownum rn,
            "������"
     from 
           (select  rs.region_name "������",
                 avg(es.salary) avgSalary
            from employees es,
                 departments ds,
                 locations ls,
                 countries cs,
                 regions rs
            where es.department_id = ds.department_id
                  and ds.location_id = ls.location_id
                  and ls.country_id = cs.country_id
                  and cs.region_id = rs.region_id
            group by rs.region_name
            order by avgSalary desc
            ) avgs
     ) totalResult
where totalResult.rn = 1;


--����5.
--��� �޿�(salary)�� ���� ���� ������?
--1)rownum ���� ��
select j.job_title
from
     (select js.job_id,
             avg(es.salary) avgsalary
      from employees es, jobs js
      where es.job_id = js.job_id
      group by js.job_id) jes ,jobs j 
where jes.job_id = j.job_id
      and jes.avgsalary = (select max(avg(es.salary)) avgsalary
                           from employees es, jobs js
                           where es.job_id = js.job_id
                           group by js.job_id);

--2)rownum �� ����� sql Ǯ��
select job_title
from
     (select rownum rn,
               job_title
     from (select job_title,
                  avg(salary) avgSalary
           from employees es , jobs js
           where es.job_id = js.job_id
           group by job_title
           order by avgSalary desc
           ) r
     ) r2
where r2.rn= 1;

