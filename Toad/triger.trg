���̺� ����

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

==>  ������ ���� Ʈ���� ���� ���� Ȯ�� 

insert into dept values(66,'�����','����',null, null);

select * from dept_copy;

update dept set loc = '����' where deptno = 66;

select * from dept