create table guestbook(
    no number,
    name varchar2(80),
    password varchar2(20),
    content varchar2(2000),
    reg_date date,
    primary key(no)
);

create sequence seq_guestbook_no
increment by 1
start with 1;

drop table guestbook;
drop sequence seq_guestbook_no;