SELECT 1+5, 6+2, 2*3, 10/2 FROM dual --��Ƽ�������� ���� ����
-- ,(�޸�)�� �� �� ���� ���������� �������
-- ��ü���� ������ �� �� ��.
-- SELECT�� FROM �� �ȿ���1.COLUMN�� �´�
--                    2.�Լ��� �´�
-- �������� �� �� �ִ�. �������� ,(�޸�)
SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000) 
-- �ζ��κ� - ���� - ������
--FROM �� �ڿ� ������ �´�.

--DBA 
  
SELECT empno 
  FROM emp 
 WHERE sal >= 2000

SELECT 1 FROM DUAL
UNION ALL
SELECT 2 FROM DUAL
UNION ALL
SELECT 3 FROM DUAL
-- �����н� : ���ο� ���ο� ���� ����/ �������� ���

SELECT deptno FROM emp
MINUS
SELECT deptno FROM dept;


SELECT deptno 
  FROM dept
 MINUS -- ������
SELECT deptno 
  FROM emp;

SELECT deptno 
  FROM dept
INTERSECT -- ������
SELECT deptno 
  FROM emp
-- �μ� 4���� ��� 3���� / �μ��� ���� ����

DELETE FROM dept --���Կ� �ִ� �����͸� �����Ѵ�.
