SELECT deptno, dname
 FROM dept;

--����? ��Ƽ������ = �ϲ� : ���� ���ϴ� ��
--��ȸ����� 3�� �ȿ� ó���ؾ� �� - �������
--��ü ������Ʈ�� ������ 3%�� �Ѿ��? ���
--�˻� �ӵ��� ���� - �ε��� ����

SELECT deptno, dname, loc FROM dept;

SELECT empno, ename, job, mgr, hiredate, comm, sal, deptno FROM emp;

-- ���̺� ����� ���� �����ϱ�
--���Ἲ ��������(FK_DEPTNO) ������ ������ �Ұ��ϴ�.
--������� ������ �Ұ��ϴ�. - �����͸� �����ϰ� ������ �� �ִ�.
--�ε����� �����ȴ�. (����-�˻� �ӵ� �̳� ������)
--������ �ٴ��� �����ϱ� �Ҿ���� ���� ����.
--�� ��Ʈ�� ���� �͵� ���� ����.

DELETE FROM dept;

DELETE FROM emp;

--dept deptno pk�̰� - �⺻Ű, emp deptno fk�̴� - �ܷ�Ű

ROLLBACK;
--------------------------------------------
SELECT �÷���1, �÷���2, .....
  FROM �����̸�
 WHERE �÷��� = ��

--�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �̸��� SCOTT�� ����� �ִ�?

SELECT empno
  FROM emp
 WHERE ename  = 'SCOTT';
 
 
SELECT 1 as "�����ϴ�(1: �ִ�, 0�̸� ����)"
  FROM emp
 WHERE ename  = 'SCOTT';

SELECT �Լ���(�÷���)
  FROM emp
 WHERE �̸�  = 'SCOTT'


SELECT count(empno)--�÷����� ���� �ڸ��� �Լ��� ����� �� �ִ�.
  FROM emp
 WHERE ename  = 'SCOTT'
 

 
 
-- �츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �̸��� SCOTT�� ����� �� ���̴�?
--
-- tomato���̵� �����ϴ�?
--
-- tomato���̵� �� �� �ִ�?

SELECT * FROM member

EDIT member


COMMIT;