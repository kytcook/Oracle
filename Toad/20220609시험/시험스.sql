SELECT deptno, SUM(sal) 합계, FLOOR(AVG(sal)) 평균, COUNT(*) 인원수
FROM EMP
WHERE sal > 280
GROUP BY deptno
ORDER BY deptno ASC;

SELECT * FROM emp;

SELECT deptno 부서번호, SUM(sal) 합계, FLOOR(AVG(sal)) 평균, COUNT(empno) 인원수
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 200
ORDER BY deptno ASC;

SELECT deptno 부서번호, SUM(sal) 합계, FLOOR(AVG(sal)) 평균, COUNT(empno) 인원수
FROM emp
GROUP BY deptno
HAVING AVG(sal) > 200
ORDER BY deptno ASC;

SELECT b.dname, SUM(sal) 합계, FLOOR(AVG(sal)) 평균, COUNT(empno) 인원수
  FROM emp a, dept b
 WHERE a.deptno = b.deptno
GROUP BY a.deptno
HAVING AVG(sal) > 200
ORDER BY a.deptno ASC;


------------------------------------
--2.
--ROWNUM을 이용해서 월급이 가장 높은 3명을 뽑을려고 하였으나, 올바른 결과가 조회 되지 않았다.
--결과가 잘못 조회된 이유를 [원인](30점)에 기술하고, 아래의 구문을 수정하여 [조치내용](30점)에 기술하시오. (총 60점)
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
-----------------주관식문제------------------
--4.
SELECT to_char(to_date('190505'),'yy-mm-dd') 날짜
  FROM dual

--5.
SELECT to_char(to_date('190505'),'yyyy"년 "mm"월 "dd"일"') 날짜
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
         WHEN 10 THEN '총무부'
         WHEN 20 THEN '개발부'
          END '발발부'
  FROM emp

 SELECT deptno
       ,sal
        ,CASE 
           WHEN deptno = 10 THEN SAL * 0.2 as d
           WHEN deptno = 20 THEN SAL * 0.15
           WHEN deptno = 30 THEN SAL * 0.1
    end as "뭐징"
FROM emp