create table member(
mem_no number(5) constraints member_no_pk primary key
,mem_id varchar2(30)
,mem_pw varchar2(10)
,mem_name varchar2(20)
);

-- ���̺� ����
edit member;

--�ݵ�� Ŀ���� �ؾ� �������� ���̺� �ݿ���

select * from member;

ROLLBACK;
--�α����� �����ϴ� ���. ������ ��� Ȱ���ϴ°�
COMMIT;



SELECT * FROM member
 

query
SQL�� - Structed Query Langugage

--PK�� mem_no�� �ߺ����� ������ ������. (���Ἲ �������� ����)
INSERT INTO member(mem_no, mem_id, mem_pw, mem_name)
VALUES(6,'ohho','123','���Ἲ��');



ROLLBACK;

COMMIT;

SELECT mem_name
  FROM member
 WHERE ���̵� = ��
   AND ���  = ��;
   
-- ���̵�� ����� ��ġ�ϴ� ��쿡�� ��� ����� �� �� �ִ�.
-- �����͸� �߰��� �ڿ� commit�� ���� ������ ���� DB table�� �ݿ����� �ʴ´�.
-- �ڽ� ������ �ٶ󺼶��� ����� �ִ� �� ó�� ���������� �ܺο��� �����ϸ� �� �� ����.   
   
SELECT mem_name, mem_no, mem_id, mem_pw
  FROM member
 WHERE mem_id =:x 
   AND mem_pw =:y ;
   
