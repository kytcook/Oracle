1.1.월 급여는 연봉을 18로 나누어 홀수 달에는 연봉의 1/18이 지급되고, 
짝수달에는 연봉의 2/18가 지급된다고 가정했을 때 홀수 달과 짝수 달에 받을 금액을 나타내시오.

SELECT * FROM temp

SELECT emp_name, salary FROM temp


SELECT emp_name, salary, salary/18 "홀수달에 급여"
  FROM temp

SELECT emp_name, salary
     , salary/18 "홀수달에 급여" , salary/9 "짝수달에 급여"
  FROM temp
  
SELECT emp_name, salary
     , salary/18 "홀수달에 급여" , salary/9 "짝수달에 급여"
  FROM temp
  
SELECT round(1234567.456, 1) -- 소수 2번째 자리에서 반올림하기
      ,round(1234567.456, -1) -- 소수점 기준으로 위로 올라가면 음수로 생각함
      ,round(1234567.456, -2) -- 소수점 기준으로 위로 올라가면 음수로 생각함
      ,round(1234567.456, 2)
  FROM dual  
  
SELECT emp_name, salary
     , round(salary/18,-1) "홀수달에 급여" 
     , round(salary/9,-1) "짝수달에 급여"
  FROM temp  
  
SELECT emp_name, salary
     , round(salary/18,-1)||'원' "홀수달에 급여" 
     , round(salary/9,-1)||'원' "짝수달에 급여"
  FROM temp  
  
SELECT emp_name, salary
     , TO_CHAR(round(salary/18,-1),'999,999,999')||'원' "홀수달에 급여" 
     , TO_CHAR(round(salary/9,-1),'999,999,999')||'원' "짝수달에 급여"
  FROM temp
    
SELECT 
       550000, TO_CHAR(sysdate, 'YYYYMMDD')
       ,TO_CHAR(sysdate, 'MMDD')
       ,sysdate, sysdate-1, sysdate+1
  FROM dual  
  
숫자형을 문자형으로 전환해 주는 함수가 있다. 
to_char(날짜,'YYYYMMDD')
to_char(500000,'999,999,999')  
  
SELECT 
       550000, TO_CHAR(550000,'999,999')
      ,TO_CHAR(5500000,'999,999,999')
       ,TO_CHAR(550000.123,'999,999,999.999')
  FROM dual  
  
  
2.위에서 구한 월 급여에 교통비가 10만원씩 지급된다면(짝수달은 20만원)위의 문장이 
어떻게 바뀔지 작성해 보시오.

SELECT emp_name, salary
     , TO_CHAR((round(salary/18,-1)+100000),'999,999,999')||'원' "홀수달에 급여" 
     , TO_CHAR((round(salary/9,-1)+200000),'999,999,999')||'원' "짝수달에 급여"
  FROM temp


null은 모른다 , 결정되지 않았다., 그래서 연산대상이 아니다.

SELECT 
       count(empno), count(comm)
  FROM emp

-- emp이용할 것

SELECT ename, sal FROM emp


선분조건이다. - range scan을 하는 예약어 이다.
구간검색

점조건이다.

SELECT empno FROM emp 
WHERE ename='SCOTT'

SELECT empno FROM emp 
WHERE ename='scott'

우리회사에 근무하는 사원 중에서 부서번호가 10 이거나 30인 사원의 이름과 부서 번호를 출력하는
sql문 작성하시오.

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
   


우리회사에 근무하는 사원 중에서 인센티브를 받는 사원의 이름, 인센티브액을 출력하는 
sql문을 작성하시오.

SELECT
       ename, comm
  FROM emp

------------------------------------------------------------

3.TEMP 테이블에서 취미가 NULL 이 아닌 사람의 성명을 읽어오시오.
--
--집합접 사고
SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm is null
--INTERSECT  --집합적 사고 
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
 
값 싱글쿼테이션을 붙이면 문자열 - varchar2 

SELECT ename, comm
  FROM emp
 WHERE comm = 'null'; 
 
 --문자열 null을 비교한다.

--우리 회사에 근무하는 사원들의 급여 총액은 얼마 입니까?
SELECT sum(sal) 
  FROM emp;

SELECT DECODE(job,'CLERK', sal) AS "클라크"
      ,DECODE(job,'SALESMAN', sal) AS "세일즈맨"
      ,DECODE(job,'CLERK',null,'SALESMAN',null)
  FROM emp
  
  
  
SELECT
       SUM (DECODE(job,'CLERK', sal)) as "clerk_sum"
      ,SUM (DECODE(job,'SALESMAN', sal)) as "salesman_sum"
      ,SUM (DECODE(job,'CLERK',null,'SALESMAN',null)) as "etc_sum"
  FROM emp


------------------------------------------------------------
--4.TEMP 테이블에서 취미가 NULL인 사람은 모두 HOBBY를 “없음”이라고 값을 치환하여
-- 가져오고 나머지는 그대로 값을 읽어오시오.

SELECT 
       emp_name, NVL(hobby,'없음') as "hobby"
  FROM temp

정렬

SELECT
  FROM
 WHERE
ORDER BY

SELECT empno FROM emp

SELECT empno FROM emp
order BY empno desc --내림차순

SELECT ename FROM emp
order by ename asc --오름차순

-- ORDER BY를 하면 스캔한 대로 출력하지 못하고 2차 가공을 해야만 한다. - 느리다
-- order by를 하지 않고 정렬을 할 수 있다면 NICE

-- hint문을 사용하여 옵티마이저에게 개발자 생각을 전달할 수 있다. /**/
-- 만일 오타가 있으면 무시된다.
-- index가 존재하는 컬럼은 테이블 엑세스 없이 출력이 가능함
-- order by 없이 정렬할 수 있다면 검색 속도를 높일 수 있다.

SELECT
       /* +index_desc(emp pk_emp) */ empno
  FROM emp;
  
-- 테이블에서 pk는 인덱스가 제공됨
-- 인덱스가 있는 컬럼은 테이블 access 없이 출력 가능하다.
 
SELECT ename FROM emp;

-- 사원번호는 순서대로 정렬되어 있다.PK. 식별자이다. null값은 허용되지 않는다.
-- PK는 중복도 안된다.PK는 인덱스(색인) 제공 - 검색속도 향상
-- 사원이름은 PK가 아니다. 

SELECT rowid rid FROM emp;

SELECT ename, deptno, job 
  FROM emp
 WHERE rowid = 'AAARE8AAEAAAACTAAC';

/*
 rowid 로우 아이디
 DBMS가 가지고 있는 모든 데이터의 각각의 고유한 식별자이다.
 index테이블은 index key 와 rowid로 구성됨
 실제로는 존재하지 않으며 index 테이블 내에 있는 rowid는
 해당 데이터를 찾기 위한 하나의 논리적인 정보이다.
 1) 6자리 : 데이터 오브젝트 번호
 2) 3자리 : 상대적인 파일 번호
 3) 6자리 : 블록번호
 4) 3자리 : 블록 내의 행 번호
*/

--rownum

SELECT rownum, empno FROM emp;

SELECT rownum, empno FROM emp
WHERE deptno = 30;


SELECT empno FROM emp;

SELECT empno, ename FROM emp;



--NVL

SELECT comm, NVL(comm, 0) FROM emp

--실제 테이블에 값이 변하는 것은 아니다.


5.TEMP의 자료 중 HOBBY의 값이 NULL인 사원을 ‘등산’으로 치환했을 때 HOBBY가
 ‘등산인 사람의 성명을 가져오는 문장을 작성하시오.

SELECT emp_name, NVL(hobby, '없음'), NVL(hobby, '등산') 
  FROM temp


6.TEMP의 자료 중 EMP_ID와 EMP_NAME을 각각 ‘사번’,’성명’으로 표시되어 DISPLAY되도록 COLUMN ALLIAS를 부여하여 SELECT 하시오.

SELECT
      emp_id, emp_name
 FROM temp

SELECT
      emp_id as "사원아이디", emp_name as "성명"
 FROM temp


7.TEMP의 자료를 직급 명(LEV)에 ASCENDING하면서 결과내에서 다시 사번 순으로 
DESCENDING하게 하는 ORDER BY하는 문장을 만들어 보시오.



SELECT 1+5, 6-2, 2*3, 10/2 FROM dual

패턴

SELECT count(empno) FROM emp

SELECT count(empno) 
  FROM (SELECT empno FROM emp WHERE sal >= 2000)  - 인라인뷰 - 보안 -금융권
  
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
  
  
  
집합접 사고

SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm is null
 
--INTERSECT  --집합적 사고 
SELECT ename, comm
  FROM emp
MINUS
SELECT ename, comm
  FROM emp
 WHERE comm !=0
 
----------------------------------------
/* 
학생 A 85 85
학생 B 70 70 | 학생 B위에 두 명이 있다. 3등이다.
학생 C 90 90
학생 B의 등수를 세보자
? count( ) 의 괄호안에는 어떤 애가 들어갈까?
------------

*/
SELECT ename, deptno
  FROM emp
  
SELECT dname FROM dept --없는 번호를 적으면 부적합한 식별자

SELECT a.time_nu, b.time_nu FROM t_worktime a, t_worktime b

SELECT rownum rno, ename FROM emp
WHERE rownum < 4 -- rownum이 조회결과에 대해서 번호를 정렬하여 붙여준다.

SELECT time_nu FROM t_worktime
WHERE rownum < 4

SELECT a.time_nu -- 양쪽에 다있는 time_nu에 알리야스 a.를 붙여준다.
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )b
 WHERE a.time_nu <= b.time_nu;

--나보다 크거나 작은거 6개


SELECT 
       a.time_nu, b.time_nu -- 양쪽에 다있는 time_nu에 알리야스 a.를 붙여준다.
  FROM (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )a,
       (
        SELECT time_nu FROM t_worktime
        WHERE rownum < 4
       )b
WHERE a.time_nu <= b.time_nu -- a가 기준으로 b가 크거나 같은

-- 사원집합에서 deptno는 fk이고 사원집합에서 pk는 사원번호가 맞아요.
-- 부서집합에서 deptno는 pk이다.
-- 부서집합에 deptno를 받아서태어난 자손이 사원집합이고
-- 따라사 부모의 deptno가 자손으로 가서 외래키가 되었다.


SELECT deptno FROM emp, dept -- deptno는 양쪽 테이블에 모두 발걸치고 있다.

SELECT a.deptno 
  FROM emp a, dept b;

SELECT b.deptno 
  FROM emp a, dept b;
  
-- pk는 인덱스를 가지고 있다. 테이블을 access하지 않아도 된다.
-- 테이블에 접근하지 않아도 된다.
-- 
SELECT empno FROM emp; -- 사원번호는 pk니까 정렬되어있다. 인덱스.

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
 group by절
 우리 회사에 근무하는 사원들에 대해서 부서별 사원수를 출력하고 싶다.
 어떡하지?

 사원집합 - FK - deptno

 FK는 중복이 허락된다.
 인덱스를 제공하지 않는다.
 FK는 릴레이션이다.(1:n의 관계형태)
 부서집합의 PK는 사원집합으로 가서 FK가 되었다.
*/

--부적합한 식별자 :  emp안에 dname이 없다.
SELECT empno
  FROM emp
 GROUP BY dname; 
 
--GROUP BY 표현식이 아닙니다.
SELECT empno
  FROM emp
 GROUP BY deptno;
 
SELECT deptno
  FROM emp
 GROUP BY deptno;

--중복이 될 수 없다. 
SELECT empno 
  FROM emp
GROUP BY empno;
 
-- 누가 6명인지 알 수가 없다.
SELECT COUNT(empno)
  FROM emp
 GROUP BY deptno;

SELECT deptno, COUNT(empno)
  FROM emp
 GROUP BY deptno
 
--그룹함수 - avg  count  max   min  sum
--      - 평군    셈    최대값  최솟값  전체합
--데이블 전체 데이터에서 통계적인 결과를 얻기 위해서 행 집합에
--적용하여 하나의 결과를 생산함

--일번컬럼과 그룹함수가 같이 올 수 있나?
--없다.

SELECT sum(sal) 
  FROM emp;

SELECT sum(sal), ename 
  FROM emp;

-- 문법적인 문제는 해결했지만 의미가 없다.(의존관계가 없음)
SELECT sum(sal), max(ename) 
  FROM emp;

-- 의미가 있나? 그 부서에 근무하는 전체 사원들의 급여액
SELECT deptno, sum(sal), max(ename) 
  FROM emp
GROUP BY deptno;


-- group by에 사용한 컬럼명은 select 다음에 사용했을 때
-- 의미가 있다. 의존관계 있다.


SELECT sum(sal), deptno 
  FROM emp
GROUP BY deptno;

SELECT max(sal),avg(sal), deptno 
  FROM emp
GROUP BY deptno

--그렇다면 해결 방법은 있나요?
--    1. 일반컬럼도 그룹함수를 씌운다
--    2. group by절을 추가해서 일반 컬럼명을 적는다.

