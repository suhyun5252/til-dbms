-- 데이터베이스 목록보기
show databases;
-- 데이터베이스 즉 스키마 만들기
create database board;
-- 데이터베이스 목록보기
show databases;
-- 스키마(데이터베이스)에 표를 생성한다
-- 어느 스키마를 쓸지 결정을 해주어야 한다.
use board;
-- create table 테이블명
create table author(
	id int primary key, -- pk 로 항목의 제약 조건을 지정함. 
	name varchar(100), 
	email varchar(30), 
	password varchar(20)
);

-- 실행이 된 쿼리 다시 보기
show create table author;



-- board 스키마(데이터베이스) 에 posts 테이블 생성하기
create table posts(
   id int,
    title varchar(255),
    content varchar(3000),
    author_id int not null, -- FK     
    primary key(id),
    foreign key (author_id) references author(id)
);


-- 실행이 된 쿼리 다시 보기
show create table posts;

-- 만들어진 테이블 구조 살펴보기
describe author;
describe posts;

-- 테이블명 변경하기
use board; -- board 스키마를 사용하겠다는 쿼리

-- 테이블에 상세 정보보기
describe posts;
-- 테이블명 변경
alter table posts rename post;
-- 테이블 목록보기
show tables;


-- 테이블명 변경
alter table post rename posts;
-- 테이블 목록보기
show tables;

-- author 테이블에 age int 컬럼 추가하기
alter table author add column age int;

-- 상세정보 보기
describe author;


-- author 테이블에 컬럼 삭제하기
alter table author drop column age;

-- 상세정보 보기
describe author;

-- posts 테이블에 content 를 contents 로 변경
alter table posts change column content contents varchar(3000);

-- 만들어진 테이블 구조 살펴보기
describe author;
describe posts;

-- author 테이블에 email 컬럼 변경하기
alter table author modify column  email varchar(30) not null;


-- post 테이블에 title 칼럼의 속성을 변경
alter table posts modify column title varchar(255) not null;

-- 만들어진 테이블 구조 살펴보기
describe posts;


-- 만들어진 테이블 구조 살펴보기
describe author;

-- 레코드 추가
insert into author (id,name,email,password) values (1,'홍길동','hong@naver.com','1234');

-- 레코드 내용 전체 출력
select * from author;

-- 만들어진 테이블 구조 살펴보기
describe posts;

-- author 테이블에 id 가 존재하는 레코드를 post에 추가
insert into posts (id,title,contents,author_id) value (1,"react","react...",1);
-- 전체 레코드 출력
select * from posts;

-- author 테이블에 id 가 존재하는 레코드를 post에 추가
insert into posts (id,title,contents,author_id) value (2,"react","react...",2); -- 거부됨
-- 전체 레코드 출력 (거부되어 코드 변화가 없다)
select * from posts;

-- 추가 레코드 입력
insert into author (id, name, email, password ) values (2, '홍길동2', 'hong2@naver.com', '1234' );
insert into author (id, name, email, password ) values (3, '홍길동3', 'hong3@naver.com', '1234' );

-- 전체 레코드 출력
select * from author;

-- Editor 에서 Safe Update Mode 가 where 절을 요구하도록 셋팅됨 . (SET SQL_SAFE_UPDATES = 0)
update author set email="a@a.net"; -- 실행 안됨
update author set email="a@a.net" where id = 1; -- 실행 

-- 전체 레코드 출력
select * from author;


-- author 에서 id 가 2인 레코드 삭제
delete from author where id=2;
-- 전체 레코드 출력
select * from author;

-- 컬럼별로 뽑기
select id, name from author;
-- where 조건 뽑기
select * from author where id = 1;
select email, name from author where id=1;

-- 비교문 쓰기
select * from author where id > 1;
select * from author where id >= 1;


-- 그리고 조건 더 쓰기
select * from author where id >= 1 and name = '홍길동2';
-- 또는  조건
select * from author where id >= 1 or name = '홍길동2';

-- 중복되는 값 제거 
select distinct password from author;

-- 오름차순 정렬
select * from author order by id asc;
-- 내림차순 정렬
select * from author order by id desc;
select * from author order by email desc;

-- 갯수제한(2개만)
select * from author order by name limit 2;

-- 별칭 사용
select name as "이름", email as "메일주소" from author;

select ttt.name as "이름", ttt.email as "메일주소" from author as ttt;



-- author 에서 id 가 2인 레코드 삭제
-- author 테이블에 id 가 존재하지 않는 경우 레코드를 post에 추가