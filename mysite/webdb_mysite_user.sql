create table users(
    no number primary key,
    name varchar2(80),
    email varchar2(100) not null unique,
    password varchar2(20) not null,
    gender  varchar2(10)
);

create sequence seq_users_no
increment by 1
start with 1;


select * from users;

drop table users;
drop sequence seq_users_no;