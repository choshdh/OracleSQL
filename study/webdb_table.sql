--쿼리 예시)
alter table book add(pubs varchar2(50));  --테이블 내 속성 추가

alter table book modify(title varchar2(100));  --테이블 내 속성 수정

alter table book drop(author);  --테이블 내 속성 제거

rename book to article;  --테이블명 변경

drop table article; --테이블 삭제

update author  --데이터 수정
set author_name = '기안84',
    author_desc = '웹툰작가'
where author_id = 1;

delete from author  --데이터 삭제
where author_id=1;

insert into author values(seq_author_id.nextval, '박경리', '토지 작가'); --시퀀스의 증가값을 사용하여 데이터 삽입

--삽입할 벨류값 개수 지정 방식
insert into author(author_id, author_name) values(2, '이문열');

--시퀀스
select seq_author_id.currval from dual; --시퀀스의 현재값 가져오기 dual 이라는 가상의 테이블 생성
select seq_author_id.nextval from dual; --시퀀스의 다음값 가져오기 nextval 함수를 호출 하는순간 무조건 증가 되기때문에 가져와서 본다 하더라도 사용 할 수는 없다

--테이블 삭제용
drop table book;
drop table author;

--시퀀스 삭제용
drop sequence seq_book_id;
drop sequence seq_author_id;

--테이블 검색용
select * from book;
select * from author;

--롤백용
rollback;
--커밋용
commit;



--------------------------------------------------------------------------------

create table author(  -- author 테이블 생성 참고용(선생님)
    author_id   number(10),  --저자 번호
    author_name varchar2(100) not null, --저자 이름
    author_desc varchar2(500), --저자 정보
    primary key(author_id)
);

--시퀀스 생성 (author)
create sequence seq_author_id  -- 키속성값 앞에 seq_ 를 보통 붙여서 사용함
increment by 1
start with 1;

create table book (   -- author 테이블에 관계를 맺을 테이블 book 생성 참고용(선생님)
    book_id number(10),
    book_name varchar2(100) not null, --null 을 집어 넣을 수 없다
    book_pub varchar2(100),  --출판사
    book_pub_date date,  --출판일
    author_id number(10),  --저자 번호
    primary key (book_id),
    constraint c_book_fk foreign key (author_id)   -- 외래키인 author_id 의 별칭을 c_book_fk 라고 짓는다 = 이 별칭 실질적으로 잘 사용하지 않는다고 한다.
    references author(author_id) -- author 테이블의 author_id 키 속성
);

--시퀀스 생성 (book)
create sequence seq_book_id  -- 키속성값 앞에 seq_ 를 보통 붙여서 사용함
increment by 1
start with 1;


--시퀀스의 증가값을 사용하여 데이터 삽입(author)
insert into author values(seq_author_id.nextval, '이문열', '경북 영양');
insert into author values(seq_author_id.nextval, '박경리', '경상남도 통영');
insert into author values(seq_author_id.nextval, '유시민', '17대 국회의원');
insert into author values(seq_author_id.nextval, '기안84', '기안동에서 산 84년생');
insert into author values(seq_author_id.nextval, '강풀', '온라인 만화가 1세대');
insert into author values(seq_author_id.nextval, '김영하', '알쓸신잡');

--시퀀스의 증가값을 사용하여 데이터 삽입(book)
insert into book values(seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1988-02-22',1);
insert into book values(seq_book_id.nextval, '삼국지', '민음사', '2002-03-01',1);
insert into book values(seq_book_id.nextval, '토지', '마로니에북스', '2012-08-15',2);
insert into book values(seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의 길', '2015-04-01',3);
insert into book values(seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012-02-22',4);
insert into book values(seq_book_id.nextval, '순정만화', '재미주의', '2011-08-03',5);
insert into book values(seq_book_id.nextval, '오직두사람', '문학동네', '2017-05-04',6);
insert into book values(seq_book_id.nextval, '26년', '재미주의', '2012-02-04',5);


select *
from book b, author a
where b.author_id = a.author_id;

select *
from book
where book_name = "쪼쪼";

update AUTHOR
set author_desc = '서울특별시'
where author_id=5;

alter table book -- book 테이블을 수정하겠다
add constraint c_book_fk foreign key (author_id) --속성 추가 book 테이블의 외래키에
references author (author_id) --참조하고있는 author 테이블의 author_id
on delete cascade; -- 가 삭제할때 연계 삭제 

delete from author
where author_name='기안84';




update book set book_name = '토지' , book_pub = '마로니에북스' , book_pub_date = '2012-08-15' , author_id = 2 where book_id = 3;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   
