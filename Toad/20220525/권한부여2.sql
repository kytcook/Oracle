<<<<<<< HEAD
--sys�������� ������ ��?
--
--�ǽ� �ó�����
--
--����Ŭ ������ tomato������ ����� ����� tiger�� �Ѵ�.
--tomato������ ����� �������� ������ ����� �ش�.
--ts_tomato��� ���̺� �����̽� �̸����� ����Ŭ�� ��ġ�Ǿ� �ִ� �������� ��ġ�� Ȯ���� ��
--�Ʒ� DDL���� sys�������� �����Ѵ�.

create tablespace ts_KYTCOOK
datafile 'D:\app\kytco\oradata\orcl11\KYTCOOK.dbf' size 100M;


--�Ʒ��� ������ ������ ���̺����̽��� ���������� ����� ������ Ȯ���ϴ� DML���̴�.
--�̰͵� �ݵ�� sys �������� Ȯ���ؾ� �Ѵ�.
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_KYTCOOK'

--tomato��� ������ ����� ����� tiger�� �ϸ�
--tomato������ �ٶ󺸴� ���̺� �����̽��� ts_tomato�� �Ѵ�.
create user KYTCOOK identified by tiger
default tablespace ts_KYTCOOK



=======
create tablespace ts_tomato
datafile 'D:\oracle_App\oradata\orcl11\ts_tomato.dbf' size 100M;

 
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_TOMATO';

create user tomato identified by tiger
default tablespace TS_TOMATO;

----------------------------------------------------------

grant create session to tomato  with admin option;

-- DCL - ���Ѻο�

grant create table to tomato with admin option 
--���̺��� ������� ������ �丶�信��  �ش�.

grant create view to tomato with admin option
--�並 ����� ������ �ش�

alter user tomato quota unlimited on TS_TOMATO
--���̺� �����̽��� ���� ���� 

grant create trigger to tomato
--Ʈ���Ÿ� ����� ���Ѻο�

grant create sequence to tomato
-- 1�� �����ϴ� ������Ʈ ������?���� �ο�

COMMIT;
>>>>>>> fdabd44f0f4050f82163db1bf5a2743aa3f6baa4
