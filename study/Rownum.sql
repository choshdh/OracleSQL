select rownum,
        first_name,
        salary
from employees
order by salary desc;

select rownum,      -- s���̺��� �̾ƿ� �����Ϳ� rownum �� ���̴� �۾��� �ϴ°� = *rownum �� �ٿ��� ���·� �����°� �ƴϰ� s���̺��� select�� �÷� ���� rownum �� ���̸� ���� ��Ű�� ���̱� ������ => where ���� �̵� �غ���
        s.first_name,
        s.salary
from (select first_name,   -- first_name, salary �� ���� s ���̺� ����
             salary
      from employees
      order by salary desc) s
where rownum = 3;    -- where ������ �ٷ� rownum�� ���� 3���� �����͸� select �ϸ� ã�� �� ����.
                     -- �ֳ��ϸ� ���� 1�� rownum�� �����Ϸ��� �����̱� ������.
                     -- ù��° �����ͺ��� rownum�� 3���� �����͸� ã�ԵǸ� select ���ǿ� �������� ���ϰԵǼ� rownum�� ���� ��� �������� ���Ѵ�.

select r.rn,
       r."�̸�",
       r."���",
       r."�Ի���"
from
    (select rownum rn,
           o."�̸�",
           o."���",
           o."�Ի���"
    from 
         (select first_name || ' ' || last_name "�̸�",
                 employee_id "���",
                 hire_date "�Ի���"
          from employees
          where hire_date >= '07/01/01'
          and hire_date <= '07/12/31'
          order by salary desc
          ) o
    ) r
where r.rn>3 and r.rn<7;


        