DEPT 

--DDL(��ü����) - DBA
--DCL(����) - DB���� ���
--DML(SELECT, INSERT, DELETE, UPDATE : ������ ���۾�

--��ȸ(�����ȸ, �ֹ���ȸ ���....)

--�Է�, ����, ����(�Ƿ����� ���� ����)

SELECT �÷���1, �÷���2, ....--�÷���:����
    FROM �����̸�(SELECT�� - �ζ��κ�)
    
SELECT ename, JOB
    FROM emp

--as " " :�÷����� �ٲ��ش�
--WHERE ���� = IF
--DB�� '='�� JAVA�� '=='�� ����
SELECT ename as "�̸�", JOB, HIREDATE 
    FROM emp
    
--50����
--��Ƽ������ - �ϲ� - JVM
--
--�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� ALLEN����� �޿��� ���ΰ���?
--
--�츮 ȸ�翡 �ٹ��ϴ� ��� �߿��� �޿��� 1000�޷� �̻��� ����� �̸�, �޿���
--����ϴ� SELECT���� �ۼ��Ͻÿ�.

SELECT ename ���,SAL �޿�
       empno, ename, sal, comn, hiredate, deptno, mgr --���Ƿ� ������ �ٲ� �� �ִ�.
  FROM emp
    
    WHERE sal >= 1000

SELECT
    empno "��� ��ȣ" -- �˸��߽� ���� �� ��(�߰��� ���� �Ҷ�) " " (���������̼�) ����Ѵ�.
    ,empno as "�����ȣ2" -- ǥ��
    ,empno �����ȣ
    FROM emp
    
SELECT ename, sal
  FROM emp
 WHRER sal >= 1000

���� �˻��� WHERE���� ����ϸ� �ȴ�.

SELECT ename, sal
  FROM emp
 WHRER sal >= 2000
 
 --WHERE..AND ������ : ��ȸ����� �پ���.
SELECT ename, sal
  FROM emp
 WHRER sal >= 2000
   AND depto = 20
   
 --OR�� �������̴�. �� �߿� �ϳ��� �����ϸ� �ȴ�.
SELECT ename, sal
  FROM emp
 WHRER sal >= 2000
    OR deptno = 20
   
 
SELECT sal 
  FROM emp
 WHERE ename = 'ALLEN'
  
--���̺��� ���� ��ҹ��ڸ� �����Ѵ�. 
SELECT sal 
  FROM emp
 WHERE ename = 'allen'