create table board(
    no number primary key,
    title varchar2(500) not null,
    content varchar2(4000),
    reg_date date not null,
    hit number,
    user_no number not null,
    constraint c_board_fk foreign key (user_no)
    references users(no)
);
drop table board;

insert into board values(1,'첫번째','글입니다',sysdate,0,1);

insert into board values(seq_board_no.nextval, '무제' , '테스트' , sysdate , 0 , 1);
create sequence seq_board_no
increment by 1
start with 1;
drop sequence seq_board_no;

select * from board;

drop table users;

select rn
        ,no
        ,title
        ,reg_date
        ,hit
        ,user_no
        ,name
from       
    (select rownum rn
            ,no
            ,title
            ,reg_date
            ,hit
            ,user_no
            ,name
    from
            (select b.no
                    , b.title
                    , b.reg_date
                    , b.hit
                    , b.user_no 
                    , u.name
            from users u, board b 
            where u.no = b.user_no
            order by reg_date desc))
where rn>0 and rn<11;

select count(no) no from board;
commit;
