SELECT 1+5, 6+2, 2*3, 10/2 FROM dual --옵티마이저를 통한 연산
-- ,(콤마)를 쓸 때 마다 오른쪽으로 길어진다
-- 전체적인 패턴을 잘 볼 것.
-- SELECT와 FROM 절 안에는1.COLUMN이 온다
--                    2.함수가 온다
-- 여러개가 올 수 있다. 연결절은 ,(콤마)
SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000) 
-- 인라인뷰 - 보안 - 금융권
--FROM 절 뒤에 집합이 온다.

--DBA 
  
SELECT empno 
  FROM emp 
 WHERE sal >= 2000

SELECT 1 FROM DUAL
UNION ALL
SELECT 2 FROM DUAL
UNION ALL
SELECT 3 FROM DUAL
-- 패턴학습 : 세로와 가로에 대한 이해/ 집합적인 사고

SELECT deptno FROM emp
MINUS
SELECT deptno FROM dept;


SELECT deptno 
  FROM dept
 MINUS -- 차집합
SELECT deptno 
  FROM emp;

SELECT deptno 
  FROM dept
INTERSECT -- 교집합
SELECT deptno 
  FROM emp
-- 부서 4가지 사원 3가지 / 부서가 높은 집함

DELETE FROM dept --집함에 있는 데이터를 삭제한다.
