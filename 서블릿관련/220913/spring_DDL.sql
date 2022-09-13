create table test (
test_no number(5) constraints test_no_pk primary key,
test_title varchar2(30),
test_content varchar2(4000)
)

edit test

INSERT INTO test(test_no,test_title,test_content)
VALUES(SELECT 50, '다중테스트5', '멀티추가5' FROM dual)

commit

select * from test

select * from dept

select count(*) from emp
where deptno in(40, 90)

delete from dept
where deptno IN(90)

rollback;