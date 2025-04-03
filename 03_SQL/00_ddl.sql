create user 'playdata'@'localhost' identified by '1111';
create user 'playdata'@'%' identified by '1111';

-- 00_ddl.sql
-- 생성된 계정을 확인
select user, host from mysql.user;

-- SQL문 작성: 한 명령문이 끝나면 ; 으로 종료.
-- 실행: control + enter
-- 한줄 주석
-- 주석 : control + / 
# 한줄 주석
/* block 주석 */

-- 계정에 권한을 부여
-- grant 부여할 권한 on 대상 테이블 to 권한부여할 계정
grant all privileges on *.* to playdata@localhost;
grant all privileges on *.* to playdata@'%';
-- *:DB.*:table

###########################
# DB 생성
###########################
create database test_db;

create database hr;
create database my_db;
show databases;
-- grant all privileges on test_db.customer to playdata@'%';

drop database hr;
drop database my_db;

use test_db;

-- table이름 => test_db database의 테이블.
-- sys.sys_config  => 다른 database의 테이블 호출. db이름.테이블이름

############################
# 테이블 생성
############################
-- create table test_db.member();
use test_db; -- database이름을 명시하지 않으면 test_db다.

create table member(
	id varchar(10) primary key, -- 최대 10글
    password varchar(10) not null, -- not null (필수 입력)
    name varchar(50) not null,
    point int default 1000, -- 값을 넣지 않으면 1000을 기본값으로 넣는다.
    email varchar(100) not null unique, -- unique: 중복값은 허용안함.
    age int check(age > 20), 
    join_date timestamp not null default current_timestamp 
    -- default current_timestamp: 값이 insert되는 시점을 저장.
);

-- 테이블들 조회
show tables;
-- 테이블의 컬럼정보 조회
desc member;
-- 테이블 삭제
drop table if exists aaaaaa;

drop table if exists member;

#########################
# insert 
#########################
-- 모든 컬럼에 값을 다 넣을 경우 컬럼명 생략
insert into member 
values ('id-100', '1111', '이순신', 5000, 'lee@a.com', 30, 
	    '2023-12-10 11:22:33');

-- point, join_date: default값, age: null
insert into member (id, password, name, email)
values ('id-200', '2222', '유관순', 'ryu@a.com');

insert into member (id, password, name, point, email)
values ('id-300', '3333', '강감찬', null, 'kang@aaa.com');

insert into member (id, password, name, email, age)
values ('id-400', '2222', '유관순', 'ryu2@a.com', 5);

select * from member;


