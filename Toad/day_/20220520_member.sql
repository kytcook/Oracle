SELECT * FROM member
 

query
SQL��

INSERT INTO MEMBER(mem_no, mem_id, mem_pw, mem_name)
VALUES(2,'nice','123','������')
COMMIT

SELECT
    mem_name
  FROM 
 WHERE ���̵� = ��
   AND ���  = ��
   
-- ���̵�� ����� ��ġ�ϴ� ��쿡�� ��� ����� �� �� �ִ�.
-- �����͸� �߰��� �ڿ� commit�� ���� ������ ���� DB table�� �ݿ����� �ʴ´�.
-- �ڽ� ������ �ٶ󺼶��� ����� �ִ� �� ó�� ���������� �ܺο��� �����ϸ� �� �� ����.   
   
SELECT
    mem_name
  FROM member
 WHERE mem_id := mid
   AND mem_pw := mpw
   
