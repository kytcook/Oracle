-- DCL - ���Ѻο�

<<<<<<< HEAD

grant create session to KYTCOOK;

grant create table to KYTCOOK with admin option;
--���̺��� ������� ������ �丶�信��  �ش�.

grant create view to KYTCOOK with admin option;
--�並 ����� ������ �ش�

alter user KYTCOOK quota unlimited on TS_KYTCOOK;
--���̺� �����̽��� ���� ���� 

grant create trigger to KYTCOOK;
--Ʈ���Ÿ� ����� ���Ѻο�

grant create sequence to KYTCOOK;
=======
grant create table to tomato with admin option 
--���̺��� ������� ������ �丶�信��  �ش�.

grant create view to tomato with admin option
--�並 ����� ������ �ش�

alter user tomato quota unlimited on TS_TOMATO
--���̺� �����̽��� ���� ���� 

grant create trigger to tomato
--Ʈ���Ÿ� ����� ���Ѻο�

grant create sequence to tomato
>>>>>>> db5ed133edbc3c204c6caa61e51a861b8109af69
-- 1�� �����ϴ� ������Ʈ ������?���� �ο�