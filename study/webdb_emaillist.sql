create table emaillist(
    no number(10),
    last_name varchar2(5),
    first_name varchar2(10),
    email varchar2(100),
    primary key(no)
);

create sequence seq_emaillist_no
increment by 1
start with 1;

insert into emaillist
values (seq_emaillist_no.nextval, 'Á¶', '½ÂÇö', 'cho@gmail.com');

select no,
       last_name,
       first_name,
       email
from emaillist;

commit;

delete from emaillist where email is null;

drop table emaillist;
drop sequence seq_emaillist_no;
