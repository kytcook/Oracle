CREATE TABLE test1 (
 t_no number(3) constraints test1_pk primary key
,t_name varchar2(30) not null
,t_sal number(7,2) default 0
);
--------------------------------------------
--SELECT SEQ_TEST1_NO.nextval from dual;

CREATE TABLE test2 (
mem_id varchar(10) constraints test2_pk primary key
,mem_name nvarchar2(10)
,mem_name2 varchar2(10)
);

insert into test2(mem_id, mem_name, mem_name2) values ('kytcook','주먹쥐고 일어서','임은택');