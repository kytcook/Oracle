1.1.�� �޿��� ������ 18�� ������ Ȧ�� �޿��� ������ 1/18�� ���޵ǰ�, 
¦���޿��� ������ 2/18�� ���޵ȴٰ� �������� �� Ȧ�� �ް� ¦�� �޿� ���� �ݾ��� ��Ÿ���ÿ�.

SELECT * FROM temp

SELECT emp_name, salary FROM temp


SELECT emp_name, salary, salary/18 "Ȧ���޿� �޿�"
  FROM temp

SELECT emp_name, salary
     , salary/18 "Ȧ���޿� �޿�" , salary/9 "¦���޿� �޿�"
  FROM temp
  
SELECT emp_name, salary
     , salary/18 "Ȧ���޿� �޿�" , salary/9 "¦���޿� �޿�"
  FROM temp
  
SELECT round(1234567.456, 1) -- �Ҽ� 2��° �ڸ����� �ݿø��ϱ�
      ,round(1234567.456, -1) -- �Ҽ��� �������� ���� �ö󰡸� ������ ������
      ,round(1234567.456, -2) -- �Ҽ��� �������� ���� �ö󰡸� ������ ������
      ,round(1234567.456, 2)
  FROM dual  
  
SELECT emp_name, salary
     , round(salary/18,-1) "Ȧ���޿� �޿�" 
     , round(salary/9,-1) "¦���޿� �޿�"
  FROM temp  
  
SELECT emp_name, salary
     , round(salary/18,-1)||'��' "Ȧ���޿� �޿�" 
     , round(salary/9,-1)||'��' "¦���޿� �޿�"
  FROM temp  
  
SELECT emp_name, salary
     , TO_CHAR(round(salary/18,-1),'999,999,999')||'��' "Ȧ���޿� �޿�" 
     , TO_CHAR(round(salary/9,-1),'999,999,999')||'��' "¦���޿� �޿�"
  FROM temp
    
SELECT 
       550000, TO_CHAR(sysdate, 'YYYYMMDD')
       ,TO_CHAR(sysdate, 'MMDD')
       ,sysdate, sysdate-1, sysdate+1
  FROM dual  
  
�������� ���������� ��ȯ�� �ִ� �Լ��� �ִ�. 
to_char(��¥,'YYYYMMDD')
to_char(500000,'999,999,999')  
  
SELECT 
       550000, TO_CHAR(550000,'999,999')
      ,TO_CHAR(5500000,'999,999,999')
       ,TO_CHAR(550000.123,'999,999,999.999')
  FROM dual  
  
  
2.������ ���� �� �޿��� ����� 10������ ���޵ȴٸ�(¦������ 20����)���� ������ 
��� �ٲ��� �ۼ��� ���ÿ�.

SELECT emp_name, salary
     , TO_CHAR((round(salary/18,-1)+100000),'999,999,999')||'��' "Ȧ���޿� �޿�" 
     , TO_CHAR((round(salary/9,-1)+200000),'999,999,999')||'��' "¦���޿� �޿�"
  FROM temp


null�� �𸥴� , �������� �ʾҴ�., �׷��� �������� �ƴϴ�.

SELECT 
       count(empno), count(comm)
  FROM emp

-- emp�̿��� ��

SELECT ename, sal FROM emp


���������̴�. - range scan�� �ϴ� ����� �̴�.
�����˻�

�������̴�.

SELECT empno FROM emp 
WHERE ename='SCOTT'

SELECT empno FROM emp 
WHERE ename='scott'

�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �μ���ȣ�� 10 �̰ų� 30�� ����� �̸��� �μ� ��ȣ�� ����ϴ�
sql�� �ۼ��Ͻÿ�.

SELECT ename, deptno FROM emp

SELECT ename, deptno FROM emp
WHERE deptno = 10

SELECT ename, deptno FROM emp
WHERE deptno = 30


SELECT ename, deptno FROM emp
WHERE deptno = 10
UNION ALL
SELECT ename, deptno FROM emp
WHERE deptno = 30


SELECT ename, deptno FROM emp
WHERE deptno = 10
   OR deptno = 30
   
SELECT ename, deptno FROM emp
WHERE deptno IN (10,30)
   


�츮ȸ�翡 �ٹ��ϴ� ��� �߿��� �μ�Ƽ�긦 �޴� ����� �̸�, �μ�Ƽ����� ����ϴ� 
sql���� �ۼ��Ͻÿ�.

SELECT
       ename, comm
  FROM emp

------------------------------------------------------------

3.TEMP ���̺��� ��̰� NULL �� �ƴ� ����� ������ �о���ÿ�.
--
--������ ���
SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm is null
--INTERSECT  --������ ��� 
SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm !=0


SELECT emp_name FROM temp


SELECT emp_name FROM temp
WHERE hobby !=null

SELECT emp_name FROM temp
WHERE hobby <> null

SELECT emp_name FROM temp WHERE hobby is not null

SELECT ename , comm
  FROM emp
 WHERE comm = null
 
�� �̱������̼��� ���̸� ���ڿ� - varchar2 

SELECT ename, comm
  FROM emp
 WHERE comm = 'null'; 
 
 --���ڿ� null�� ���Ѵ�.

--�츮 ȸ�翡 �ٹ��ϴ� ������� �޿� �Ѿ��� �� �Դϱ�?
SELECT sum(sal) 
  FROM emp;

SELECT DECODE(job,'CLERK', sal) AS "Ŭ��ũ"
      ,DECODE(job,'SALESMAN', sal) AS "�������"
      ,DECODE(job,'CLERK',null,'SALESMAN',null)
  FROM emp
  
  
  
SELECT
       SUM (DECODE(job,'CLERK', sal)) as "clerk_sum"
      ,SUM (DECODE(job,'SALESMAN', sal)) as "salesman_sum"
      ,SUM (DECODE(job,'CLERK',null,'SALESMAN',null)) as "etc_sum"
  FROM emp


------------------------------------------------------------
--4.TEMP ���̺��� ��̰� NULL�� ����� ��� HOBBY�� ���������̶�� ���� ġȯ�Ͽ�
-- �������� �������� �״�� ���� �о���ÿ�.

SELECT 
       emp_name, NVL(hobby,'����') as "hobby"
  FROM temp

����

SELECT
  FROM
 WHERE
ORDER BY

SELECT empno FROM emp

SELECT empno FROM emp
order BY empno desc --��������

SELECT ename FROM emp
order by ename asc --��������

-- ORDER BY�� �ϸ� ��ĵ�� ��� ������� ���ϰ� 2�� ������ �ؾ߸� �Ѵ�. - ������
-- order by�� ���� �ʰ� ������ �� �� �ִٸ� NICE

-- hint���� ����Ͽ� ��Ƽ���������� ������ ������ ������ �� �ִ�. /**/
-- ���� ��Ÿ�� ������ ���õȴ�.
-- index�� �����ϴ� �÷��� ���̺� ������ ���� ����� ������
-- order by ���� ������ �� �ִٸ� �˻� �ӵ��� ���� �� �ִ�.

SELECT
       /* +index_desc(emp pk_emp) */ empno
  FROM emp;
  
-- ���̺��� pk�� �ε����� ������
-- �ε����� �ִ� �÷��� ���̺� access ���� ��� �����ϴ�.
 
SELECT ename FROM emp;

-- �����ȣ�� ������� ���ĵǾ� �ִ�.PK. �ĺ����̴�. null���� ������ �ʴ´�.
-- PK�� �ߺ��� �ȵȴ�.PK�� �ε���(����) ���� - �˻��ӵ� ���
-- ����̸��� PK�� �ƴϴ�. 

SELECT rowid rid FROM emp;

SELECT ename, deptno, job 
  FROM emp
 WHERE rowid = 'AAARE8AAEAAAACTAAC';

/*
 rowid �ο� ���̵�
 DBMS�� ������ �ִ� ��� �������� ������ ������ �ĺ����̴�.
 index���̺��� index key �� rowid�� ������
 �����δ� �������� ������ index ���̺� ���� �ִ� rowid��
 �ش� �����͸� ã�� ���� �ϳ��� ������ �����̴�.
 1) 6�ڸ� : ������ ������Ʈ ��ȣ
 2) 3�ڸ� : ������� ���� ��ȣ
 3) 6�ڸ� : ��Ϲ�ȣ
 4) 3�ڸ� : ��� ���� �� ��ȣ
*/

--rownum

SELECT rownum, empno FROM emp;

SELECT rownum, empno FROM emp
WHERE deptno = 30;


SELECT empno FROM emp;

SELECT empno, ename FROM emp;



--NVL

SELECT comm, NVL(comm, 0) FROM emp

--���� ���̺� ���� ���ϴ� ���� �ƴϴ�.


5.TEMP�� �ڷ� �� HOBBY�� ���� NULL�� ����� ����ꡯ���� ġȯ���� �� HOBBY��
 ������� ����� ������ �������� ������ �ۼ��Ͻÿ�.

SELECT emp_name, NVL(hobby, '����'), NVL(hobby, '���') 
  FROM temp


6.TEMP�� �ڷ� �� EMP_ID�� EMP_NAME�� ���� �������,���������� ǥ�õǾ� DISPLAY�ǵ��� COLUMN ALLIAS�� �ο��Ͽ� SELECT �Ͻÿ�.

SELECT
      emp_id, emp_name
 FROM temp

SELECT
      emp_id as "������̵�", emp_name as "����"
 FROM temp


7.TEMP�� �ڷḦ ���� ��(LEV)�� ASCENDING�ϸ鼭 ��������� �ٽ� ��� ������ 
DESCENDING�ϰ� �ϴ� ORDER BY�ϴ� ������ ����� ���ÿ�.



SELECT 1+5, 6-2, 2*3, 10/2 FROM dual

����

SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000)  - �ζ��κ� - ���� -������
  
DBA  
  
SELECT empno FROM emp WHERE sal >= 2000  

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual
UNION ALL
SELECT 3 FROM dual


SELECT deptno FROM emp
MINUS
SELECT deptno FROM dept


SELECT deptno FROM dept
MINUS
SELECT deptno FROM emp


SELECT deptno FROM dept
INTERSECT
SELECT deptno FROM emp


DELETE FROM dept

SELECT
       point_nu
      ,rank() over(order by point_nu desc) rnk
  FROM t_greport
  
  
  
������ ���

SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm is null
 
--INTERSECT  --������ ��� 
SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm !=0
 
----------------------------------------
/* 
�л� A 85 85
�л� B 70 70 | �л� B���� �� ���� �ִ�. 3���̴�.
�л� C 90 90
�л� B�� ����� ������
? count( ) �� ��ȣ�ȿ��� � �ְ� ����?
------------

*/
SELECT ename, deptno
  FROM emp
  
SELECT dname FROM dept --���� ��ȣ�� ������ �������� �ĺ���

SELECT a.time_nu, b.time_nu FROM t_worktime a, t_worktime b

SELECT rownum rno, ename FROM emp
WHERE rownum < 4 -- rownum�� ��ȸ����� ���ؼ� ��ȣ�� �����Ͽ� �ٿ��ش�.

SELECT time_nu FROM t_worktime
WHERE rownum < 4

SELECT a.time_nu -- ���ʿ� ���ִ� time_nu�� �˸��߽� a.�� �ٿ��ش�.
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )b
 WHERE a.time_nu <= b.time_nu;

--������ ũ�ų� ������ 6��


SELECT 
       a.time_nu, b.time_nu -- ���ʿ� ���ִ� time_nu�� �˸��߽� a.�� �ٿ��ش�.
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )b
WHERE a.time_nu <= b.time_nu -- a�� �������� b�� ũ�ų� ����

-- ������տ��� deptno�� fk�̰� ������տ��� pk�� �����ȣ�� �¾ƿ�.
-- �μ����տ��� deptno�� pk�̴�.
-- �μ����տ� deptno�� �޾Ƽ��¾ �ڼ��� ��������̰�
-- ����� �θ��� deptno�� �ڼ����� ���� �ܷ�Ű�� �Ǿ���.


SELECT deptno FROM emp, dept -- deptno�� ���� ���̺� ��� �߰�ġ�� �ִ�.

SELECT a.deptno 
  FROM emp a, dept b;

SELECT b.deptno 
  FROM emp a, dept b;
  
-- pk�� �ε����� ������ �ִ�. ���̺��� access���� �ʾƵ� �ȴ�.
-- ���̺� �������� �ʾƵ� �ȴ�.
-- 
SELECT empno FROM emp; -- �����ȣ�� pk�ϱ� ���ĵǾ��ִ�. �ε���.

SELECT a.time_nu, count(b.time_nu) 
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )b
WHERE a.time_nu <= b.time_nu
GROUP BY a.time_nu;

------------------------------------
/*
 group by��
 �츮 ȸ�翡 �ٹ��ϴ� ����鿡 ���ؼ� �μ��� ������� ����ϰ� �ʹ�.
 �����?

 ������� - FK - deptno

 FK�� �ߺ��� ����ȴ�.
 �ε����� �������� �ʴ´�.
 FK�� �����̼��̴�.(1:n�� ��������)
 �μ������� PK�� ����������� ���� FK�� �Ǿ���.
*/

--�������� �ĺ��� :  emp�ȿ� dname�� ����.
SELECT empno
  FROM emp
 GROUP BY dname; 
 
--GROUP BY ǥ������ �ƴմϴ�.
SELECT empno
  FROM emp
 GROUP BY deptno;
 
SELECT deptno
  FROM emp
 GROUP BY deptno;

--�ߺ��� �� �� ����. 
SELECT empno 
  FROM emp
GROUP BY empno;
 
-- ���� 6������ �� ���� ����.
SELECT COUNT(empno)
  FROM emp
 GROUP BY deptno;

SELECT deptno, COUNT(empno)
  FROM emp
 GROUP BY deptno
 
--�׷��Լ� - avg  count  max   min  sum
--      - ��    ��    �ִ밪  �ּڰ�  ��ü��
--���̺� ��ü �����Ϳ��� ������� ����� ��� ���ؼ� �� ���տ�
--�����Ͽ� �ϳ��� ����� ������

--�Ϲ��÷��� �׷��Լ��� ���� �� �� �ֳ�?
--����.

SELECT sum(sal) 
  FROM emp;

SELECT sum(sal), ename 
  FROM emp;

-- �������� ������ �ذ������� �ǹ̰� ����.(�������谡 ����)
SELECT sum(sal), max(ename) 
  FROM emp;

-- �ǹ̰� �ֳ�? �� �μ��� �ٹ��ϴ� ��ü ������� �޿���
SELECT deptno, sum(sal), max(ename) 
  FROM emp
GROUP BY deptno;


-- group by�� ����� �÷����� select ������ ������� ��
-- �ǹ̰� �ִ�. �������� �ִ�.


SELECT sum(sal), deptno 
  FROM emp
GROUP BY deptno;

SELECT max(sal),avg(sal), deptno 
  FROM emp
GROUP BY deptno

--�׷��ٸ� �ذ� ����� �ֳ���?
--    1. �Ϲ��÷��� �׷��Լ��� �����
--    2. group by���� �߰��ؼ� �Ϲ� �÷����� ���´�.

