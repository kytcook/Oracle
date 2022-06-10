SELECT deptno, SUM(sal) �հ�, FLOOR(AVG(sal)) ���, COUNT(*) �ο���
FROM EMP
WHERE sal > 280
GROUP BY deptno
ORDER BY deptno ASC;

SELECT * FROM emp;

SELECT deptno �μ���ȣ, SUM(sal) �հ�, FLOOR(AVG(sal)) ���, COUNT(empno) �ο���
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 200
ORDER BY deptno ASC;

SELECT deptno �μ���ȣ, SUM(sal) �հ�, FLOOR(AVG(sal)) ���, COUNT(empno) �ο���
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 200
ORDER BY deptno ASC;

SELECT b.dname, SUM(sal) �հ�, FLOOR(AVG(sal)) ���, COUNT(empno) �ο���
  FROM emp a, dept b
 WHERE a.deptno = b.deptno
GROUP BY a.deptno
HAVING AVG(sal) > 200
ORDER BY a.deptno ASC;


------------------------------------
--2.
--ROWNUM�� �̿��ؼ� ������ ���� ���� 3���� �������� �Ͽ�����, �ùٸ� ����� ��ȸ ���� �ʾҴ�.
--����� �߸� ��ȸ�� ������ [����](30��)�� ����ϰ�, �Ʒ��� ������ �����Ͽ� [��ġ����](30��)�� ����Ͻÿ�. (�� 60��)
SELECT * FROM emp;


SELECT rownum, ename, sal
  FROM emp
 WHERE rownum <= 3
ORDER BY sal DESC;

SELECT rownum rno, ename, sal
  FROM emp
ORDER BY rno asc;


SELECT rownum rno, ename, sal
  FROM emp
ORDER BY sal desc;

SELECT
       rownum rno, ename, sal
  FROM (
        SELECT rownum rno, ename, sal
        FROM emp
        ORDER BY sal desc
           )
WHERE rownum <= 3

-----------------------------------
-----------------�ְ��Ĺ���------------------
--4.
SELECT to_char(to_date('190505'),'yy-mm-dd') ��¥
  FROM dual

--5.
SELECT to_char(to_date('190505'),'yyyy"�� "mm"�� "dd"��"') ��¥
  FROM dual
     
  

7.

SELECT empno || ', ' || ename || ', ' || deptno
FROM emp;

SELECT concat(concat(empno,','),ename)
    FROM emp

SELECT concat(concat(concat(concat(empno,', '),ename),', '),deptno)
  FROM emp


8. 
SELECT 
         CASE deptno
         WHEN 10 THEN '�ѹ���'
         WHEN 20 THEN '���ߺ�'
          END '�߹ߺ�'
  FROM emp

 SELECT deptno
       ,sal
        ,CASE 
           WHEN deptno = 10 THEN SAL * 0.2 as d
           WHEN deptno = 20 THEN SAL * 0.15
           WHEN deptno = 30 THEN SAL * 0.1
    end as "��¡"
FROM emp