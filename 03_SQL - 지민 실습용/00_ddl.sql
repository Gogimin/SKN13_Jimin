create user 'gogimin'@'localhost' identified by '1111';
create user 'gogimin'@'%' identified by '1111';

-- 생성된 계정을 확인
select user, host from mysql.user;

-- 계정에 권한을 부여
-- grant 부여할 권한 on 대상 테이블 to 권한 부여할 계정
grant all privileges on *.* to gogimin@localhost;
grant all privileges on *.* to gogimin@'%';
-- *: DB. *: Table


-- SQL문 작성을 할 때 : 한 명령문이 끝나면 ; << 세미콜론으로 종료를 해주어야됨.

-- 실행:control + enter
-- 한줄 주석
-- control + / (커서가 있는곳에 주석) 
# 한줄 주석
/*

block 주석

*/

#################################################################################
# DB 생성
#################################################################################
create database test_db; # 데이터베이스 생성
create database hr;      # 데이터베이스 생성
show databases;
-- grant all privileges on test_db.customer to gogimin@'%';  # gogimin이라는 사용자에게 test_db의 customer에 대해서만 권한 부여

drop database hr;        # 데이터베이스 삭제
drop database my_db;     # 데이터베이스 삭제 (없는거라 오류가뜸)

use test_db;
-- table 이름 	         # test_db database의 테이블;
-- sys.sys_config        # 다른 database의 테이블 호출. db이름. 테이블이름;


#################################################################################
# 테이블 생성
#################################################################################

-- create table test_db.member();
use test_db; -- database 이름을 명시하지 않으면 test_db다.
create table member(
	id varchar(10) primary key,           -- 최대 10글자
    password varchar(10) not null,        -- not null(필수입력)
	name varchar(50) not null,            --
    point int default 1000,               -- 값을 넣지 않으면 1000을 기본값으로 넣는다.
    email varchar(100) not null unique, -- unique() : 중복값은 허용안함.
	age int check(age > 20),
    join_date timestamp not null default current_timestamp
    -- default current_timestamp : 값이 insert 되는 시점을 저장.
);

-- 테이블들 조회
show tables;
-- 테이블의 컬럼정보 조회
desc member;
-- 테이블 삭제
drop table if exists aaaaaaa;
drop table if exists member;
show tables;


#################################################################################
# insert
#################################################################################
insert into 
member -- (id, password, name, point, email, age ,join_date) 모든 컬럼에 값을 넣을 경우 생략 가능 
values('gogimin', '0502', '김지민', 5000, 'kzm0502@naver.com', 26, '2023-12-10 11:22:33');
-- Error Code: 1062. Duplicate entry 'gogimin' for key 'member.PRIMARY'	0.000 sec # 두번 했을때 뜨는 에러코드

-- point join_date : default 값, age : null
insert into member(id, password, name, email) 
values('chaemath', '0915', '채수혁', 'cotngur17@naver.com');

insert into member(id, password, name, point,email) 
values('jh_1214', '1214', '정재현', null, 'jh_1214@naver.com');

select * from member;
