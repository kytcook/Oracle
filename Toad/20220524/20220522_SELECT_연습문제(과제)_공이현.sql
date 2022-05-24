1. 월 급여는 연봉을 18로 나누어 홀수 달에는 연봉의 1/18이 지급되고, 짝수 달에는 연봉의 2/18가 지급된다고 가정했을 때, 홀수 달과 짝수 달에 받을 금액을 나타내시오.
SELECT EMP_NAME, SALARY/18 FROM TEMP -- 홀수 달
SELECT EMP_NAME, SALARY/18*2 FROM TEMP -- 짝수 달 
SELECT * FROM (SELECT EMP_NAME, SALARY/18 FROM TEMP) -- 홀수 달
SELECT * FROM (SELECT EMP_NAME, SALARY/18*2 FROM TEMP) -- 짝수 달

>>
SELECT emp_name, salary, salary/18 "홀수 달 급여", salary/18*2 "짝수 달 급여" FROM TEMP

SELECT emp_name, salary, 
       round(salary/18, -1) "홀수 달 급여", 
       round(salary/18*2, -1) "짝수 달 급여"
  FROM TEMP
  
SELECT emp_name, salary, 
       TO_CHAR(round(salary/18, -1), '999,999,999')||'원' "홀수 달 급여", 
       TO_CHAR(round(salary/18*2, -1), '999,999,999')||'원' "짝수 달 급여"
  FROM TEMP

--
SELECT round(1234567.456, 1),  -- 소수 2번째 자리에서 반올림하기
       round(1234567.456, -1), -- 소수점 기준으로 위로 올라가면 음수로 생각함 
       round(1234567.456, -2), -- 소수점 기준으로 위로 올라가면 음수로 생각함
       round(1234567.456, 2)
  FROM dual 
  
SELECT
       550000, TO_CHAR(sysdate, 'YYMMDD')
       , TO_CHAR(sysdate, 'MMDD')
       , sysdate, sysdate-1, sysdate+1
  FROM dual

-- 숫자형을 문자형으로 전환해주는 함수가 있다.
to_char(날짜, 'YYYYMMDD')
to_char(500000, '999,999,999')

SELECT
       550000, TO_CHAR(550000, '999,999')
       , TO_CHAR(5500000, '999,999,999')
       , TO_CHAR(5500000.123, '999,999,999.999')
  FROM dual

2. 위에서 구한 월 급여에 교통비가 10만원씩 지급된다면(짝수달은 20만원)위의 문장이 어떻게 바뀔지 작성해 보시오.
SELECT EMP_NAME, SALARY/18+100000 FROM TEMP -- 홀수 달
SELECT EMP_NAME, SALARY/18*2+200000 FROM TEMP -- 짝수 달 

>>
SELECT emp_name, salary, 
       TO_CHAR((round(salary/18, -1)+100000), '999,999,999')||'원' "홀수 달 급여", 
       TO_CHAR((round(salary/18*2, -1)+200000), '999,999,999')||'원' "짝수 달 급여"
  FROM TEMP


3. TEMP 테이블에서 취미가 NULL 이 아닌 사람의 성명을 읽어오시오.
SELECT EMP_NAME, HOBBY FROM TEMP
 WHERE HOBBY != 'null'
 
>>
SELECT emp_name FROM temp
 WHERE hobby != null
 
SELECT emp_name FROM temp hobby <> null
-- null은 모른다, 결정되지 않았다라는 뜻
-- 그래서 연산대상이 아니다.

SELECT
       count(empno), count(comm)
  FROM emp
  
--우리 회사에 근무하는 사원 중에서 인센티브를 받는 사원의 이름, 인센티브 금액을 출력하는 SQL문을 작성하시오.

SELECT ename, comm FROM emp
 WHERE comm > 0
 
SELECT ename, comm FROM emp
 WHERE comm is not NULL
MINUS
SELECT ename, comm FROM emp
 WHERE comm = 0
-- ctrl + e 실행 확인
 
SELECT ename, comm FROM emp
 WHERE comm is not NULL AND comm != 0;
 
SELECT ename, sal FROM emp

SELECT empno FROM emp
 WHERE ename = 'SCOTT'
 
SELECT empno FROM emp
 WHERE ename = 'scott'
 
-- 우리 회사에 근무하는 사원 중에서 부서번호가 10이거나 30인 사원의 이름과 부서 번호를 출력하는 sql문을 작성하시오.

SELECT * FROM emp

SELECT ename, deptno FROM emp
 WHERE deptno = 10 or deptno = 30
 
SELECT ename, deptno FROM emp
MINUS
SELECT ename, deptno FROM emp
 WHERE deptno = '20'
 
SELECT ename, deptno FROM emp
 WHERE deptno IN (10, 30) -- IN : 두개의 값을 가진 집합을 불러온다.
 
-- 값 싱글 쿼테이션을 붙이면 문자열 - varchar2
SELECT ename, comm
  FROM emp
 WHERE comm = 'null'

-- 우리 회사에 근무하는 사원들의 급여 총액은 얼마입니까?
SELECT sum(sal) FROM emp
 
SELECT 
       DECODE(job, 'CLERK', sal)
      ,DECODE(job, 'SALESMAN', sal)
      ,DECODE(job, 'CLERK', null, 'SALESMAN', null, sal)
  FROM emp
  
SELECT 
       SUM(DECODE(job, 'CLERK', sal)) as "clerk_sum"
      ,SUM(DECODE(job, 'SALESMAN', sal)) as "salesman_sum"
      ,SUM(DECODE(job, 'CLERK', null, 'SALESMAN', null, sal)) as "etc_sum"
  FROM emp

4. TEMP 테이블에서 취미가 NULL인 사람은 모두 HOBBY를 "없음"이라고 값을 치환하여 가져오고 나머지는 그대로 값을 읽어오시오.
SELECT NVL(HOBBY, '없음') FROM TEMP -- NVL 함수(오라클에서만 사용)

>>
SELECT comm, NVL(comm, 0) FROM emp
-- 실제 테이블에 값이 변하는 것은 아니다.


5. TEMP의 자료 중 HOBBY의 값이 NULL인 사원을 ‘등산’으로 치환했을 때 HOBBY가 ‘등산인 사람의 성명을 가져오는 문장을 작성하시오.
SELECT EMP_NAME, NVL(HOBBY, '등산') FROM TEMP

>>
SELECT emp_name, NVL(hobby, '등산') FROM temp


6. TEMP의 자료 중 EMP_ID와 EMP_NAME을 각각 ‘사번’,’성명’으로 표시되어 DISPLAY되도록 COLUMN ALLIAS를 부여하여 SELECT 하시오.
SELECT EMP_ID as "사번", EMP_NAME as "성명" FROM TEMP


7.TEMP의 자료를 직급 명(LEV)에 ASCENDING하면서 결과내에서 다시 사번 순으로 DESCENDING하게 하는 ORDER BY하는 문장을 만들어 보시오.
SELECT * FROM TEMP order by LEV ASC, EMP_ID DESC
