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



