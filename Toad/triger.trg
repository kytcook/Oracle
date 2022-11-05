테이블 복제

create or replace trigger trg_table_copy
after insert or update or delete on dept
for each row
begin
  if inserting then
     insert into dept_copy(deptno, dname, loc)
           values(:new.deptno, :new.dname, :new.loc);
  elsif updating then
     update dept_copy
        set dname = :new.dname, loc = :new.loc
      where dept_copy.deptno = :old.deptno;
  elsif deleting then
     delete from dept_copy
      where dept_copy.deptno = :old.deptno;
  end if;
end;  


create table dept_copy as
select * from dept

==>  데이터 복제 트리거 적용 여부 확인 

insert into dept values(66,'전산과','서울',null, null);

select * from dept_copy;

update dept set loc = '대전' where deptno = 66;

select * from dept