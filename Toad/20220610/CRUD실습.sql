SELECT * FROM dept;

INSERT INTO dept(deptno, dname, loc)
          VALUES(71,'����1��','������');

--int result = pstmt.excuteUpdate();

SELECT * FROM dept
 WHERE deptno = 71;
 
COMMIT; 

-- ���̺��� ��� ���� ����ǹǷ� ����. �ѹ��Ұ�
UPDATE dept
   SET dname = '����2��'
      ,loc = '������';

-- �������� �־ Ư�� �÷��� ����
UPDATE dept
   SET dname = '����2��'
      ,loc = '������'
 WHERE deptno = 71;

rollback; 

DELETE FROM dept
 WHERE deptno = (71,40);
 
--�������� �߰� ���� Ŀ�� �ѹ鿡 ���� ���� 
--���� ���� ���� ������ �����غ���
--���� insert�� �߾ commit�� ���� �ʾҴٸ� �ٸ������ �� ������ ���ͼ� �������� ���̺� �ݿ�X
--������ ���԰����ڿ��� ������ ���� �ʴ´�.


�μ� CRUD �ǽ�