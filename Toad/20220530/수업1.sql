-- �ε����� �־ ������ �Ǿ� �ֵ�.
SELECT empno FROM emp;

-- �ε����� ����. ������ �� �� �ִ�.
SELECT ename FROM emp;

SELECT ename FROM emp
 WHERE empno = 7566;
 
 --�Լ��� ��� ����ϴ��� �Ȱ��� �ε����� ����ϰ� �ִ�.
SELECT ename FROM emp
 WHERE NVL(empno, 0) = 7566; 

-- ��Ƽ������ ���̰� ũ�� oracle vs sql �����Ϳ���..
SELECT /*+index_desc(emp PK_EMP) */empno
  FROM emp;

SELECT ename FROM emp
ORDER BY ename desc;

SELECT ename FROM emp
 WHERE ename is null;
 
SELECT ename FROM emp
 WHERE ename 'XXX';
 

-- �ε����� �ִٰ� ������ ���Ǵ°��� �ƴϴ�
-- �ε����� �ִ� �÷��̴��� �����ϸ� �ε����� ����� �� ����. 
SELECT ename FROM emp
 WHERE NVL(ename,'0') = 'XXX';
 


  
create  index i_ename
on emp(ename);

SELECT ename, deptno
  FROM emp

SELECT ename, deptno
  FROM emp
  
 GROUP BY ���� ����� �÷��� ��밡���ϴ�.
 
SELECT ename, deptno
  FROM emp
 GROUP BY deptno, ename

SELECT count(ename), deptno
  FROM emp
 GROUP BY deptno

SELECT * FROM dept 

--56(14*4)�� - �Ͼ �� �ִ� ��� ����� ���̴�. - īŸ�þ��� �� - ������ ����

SELECT
       emp.ename, dept.deptno
  FROM emp, dept

National JOIN = equal join

--���ʿ� �ִ°͸� ���´�.
SELECT
       COUNT(emp.ename), dept.deptno.dname
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno -- ������ �μ�����  
GROUP BY dept.deptno, dept.dname

��������, �ζ��κ�

--����(emp[10,20,30] dept[10,20,30,40]) ���̺� �ִ� ���� �ƴ� ���� ���̺��� �ְ�
--�ٸ� �������̺�(dept)���� �ְ� �ٸ� ����(emp)���� ���� ��(40)�� ����� ��
--��(emp)�� null�� �ϴ��� ��(dept)�� ������ �����ٷ�?
--null�� �;��ϴ� �ʿ� '+'��ȣ�� �ٿ��ش�
--�ݴ��ʿ� '+'��ȸ�� �ָ� ����
SELECT
       COUNT(emp.ename), dept.deptno.dname
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno -- ������ �μ�����  
GROUP BY dept.deptno, dept.dname

--���� �𸥴� �ݾ�
--�𸣴°� �� ���� �֤�?

ename�� not null 
pk not null unique unique index

SELECT
       COUNT(ename), COUNT(COMM), COUNT(*)
  FROM emp
  
�� comm�� null�� �ִ� �ɱ�? - ���谡 �߸���

--NVL �ΰ��� ����
SELECT
       COUNT(ename), COUNT(NVL(comm,0)), COUNT(*) 
  FROM emp
  
���� �� ���� ���� �ʴ´�.
���� ��츦 ���� ������� �ʴ´�.

SELECT sum(comm) FROM emp

SELECT distinct(deptno) FROM emp

--�ߺ����� ���´�
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept

--�ߺ����� �����Ѵ�
SELECT deptno FROM emp
UNION 
SELECT deptno FROM dept
------------------------------------------------------

SELECT ename FROM emp
ORDER BY ename desc;


--�ε����� ����� �� �ֱ� ������ Oracle��� (����)
--PK�� �ε��� ���, FK�� �ȵ�