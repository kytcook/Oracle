IS NOT NULL

SELECT ename, comm
  FROM emp 
 WHERE 
 
SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm is null
 
SELECT ename, comm
  FROM emp
INTERSECT
SELECT ename, comm
  FROM emp
 WHERE comm != 0



-- 정렬
SELECT
  FROM
 WHERE
ORDER BY -- 스캔한대로 출력하지 못하고 2차 가공을 해야하만 한다. >> 속도가 느리다.
-- order by를 하지 않고 정렬을 할 수 있다면 nice ! (속도가 느려지지 않는다.)

-- 힌트문을 사용하여 옵티마이저에게 개발자 생각을 전달할 수 있다. 오타가 있으면 무시된다.

-- index가 존재하는 컬럼은 테이블 억세스 없이 출력이 가능하다.
-- order by 없이 정렬할 수 있따면 검색 속도를 높일 수 있다. 

SELECT 
       /*+index_desc(emp pk_emp)*/ empno
  FROM emp
  
-- 테이블에서 pk는 인덱스가 제공되기 때문에
-- 인덱스가 있는 컬럼은 데이ㅣ블 access 없이 출력가능함

select rowid rno from emp

select ename, deptno, job from emp
 where rowid = 'AAARE8AAEAAAACTAAC'
 
-- DBMS가 가지고 있는 모든 데이터의 각각의 고유한 식별자
-- index 테이블은 index keydhk rowid로 구성됨
-- 실제로는 존재하지 않으며 index 테이블 내에 있는 rowid는 해당하는 데이터를 찾기 위한 하나의 논리적인 정보이다. 
-- 1) 6자리: 데이터 오브젝트 번호
-- 2) 3자리: 상대적인 파일 번호
-- 3) 6자리: 블록번호
-- 4) 3자리: 블록 내의 행 번호

rownum

SELECT rownum, empno FROM emp

SELECT rownum, empno FROM emp
 WHERE deptno = 30
 
 
-- group by절 
우리 회사에 근무하는 사원들에 대해서 부서별 사원 수를 출력하고 싶다. 어떻게하지?

사원집합 - fk -  deptno
fk는 중복이 허락된다.
인덱스를 제공하지 않는다.
fk는 릴레이션이다. (1:n 관계형태)

SELECT empno
  FROM emp
GROUP BY dname

SELECT deptno
  FROM emp
GROUP BY deptno

SELECT empno
  FROM emp
GROUP BY empno

SELECT count(empno)
  FROM emp
GROUP BY deptno

일반 컬럼과 그룹함수가 같이 올 수 있나? 없다 !
select sum(sal) from emp
select sum(sal), ename from emp

문법적인 문제는 해결햇지만 의미가 없다. (의존관계가 없음)
select sum(sal), max(ename) from emp

select sum(sal) from emp
group by deptno -- 그룹 별 합을 보여준다.

select sum(sal) from emp

group by에 사용한 컬럼명은 select 다음에 사용했을 때 의미가 있다. 의존관계가 있다.

select sum(sal), deptno from emp
group by deptno

select max(sal), avg(sal), deptno from emp
group by deptno





SELECT empno FROM emp
SELECT ename FROM emp
SELECT empno, ename FROM emp
-- 오라클 테이블 안에 인덱스가 있는지 확인할 수 있다.

SELECT ename FROM emp
ORDER BY empno desc 

SELECT ename FROM emp


NVL


select * from t_letitbe
select mod(6,2), mod(6,3) from dual

if(6%2==0)

select decode(1,1,'같다','다르다'), decode(1,2,'같다','다르다') from dual