DEPT 

--DDL(객체생성) - DBA
--DCL(권한) - DB서버 운영자
--DML(SELECT, INSERT, DELETE, UPDATE : 데이터 조작어

--조회(배송조회, 주문조회 경우....)

--입력, 수정, 삭제(실력차이 거의 없다)

SELECT 컬럼명1, 컬럼명2, ....--컬럼명:세로
  FROM 집합이름(SELECT문 - 인라인뷰)
    
SELECT ename, JOB
  FROM emp

--as " " :컬럼명을 바꿔준다
--WHERE 절은 = IF
--DB 의 '='은 JAVA의 '=='와 같다
SELECT ename as "이름", JOB, HIREDATE 
  FROM emp
    
--50만명
--옵티마이저 - 일꾼 - JVM
--
--우리 회사에 근무하는 사원 중에서 ALLEN사원의 급여는 얼마인가요?
SELECT empno,ename , sal
  FROM emp
 WHERE ename = 'ALLEN';
 
--우리 회사에 근무하는 사원 중에서 급여가 1000달러 이상인 사원의 이름, 급여를
--출력하는 SELECT문을 작성하시오.
SELECT empno, ename, sal
  FROM emp
 WHERE sal >= 1000;


SELECT ename "사원",SAL "급여"
      ,empno, ename, sal, comm, hiredate, deptno, mgr --임의로 순서를 바꿀 수 있다.
  FROM emp
  WHERE sal >= 1000;

SELECT  empno "사원 번호" -- 알리야스 명을 줄 때(중간에 띄어쓰기 할때) " " (더블쿼테이션) 사용한다.
       ,empno as "사원번호2" -- 표준
       ,empno 사원번호
  FROM emp;
    
SELECT ename, sal
  FROM emp
 WHERE sal >= 1000;

조건 검색시 WHERE절을 사용하면 된다.

SELECT ename, sal
  FROM emp
 WHERE sal >= 2000;
 
 --WHERE..AND 교집합 : 조회결과가 줄어든다.
SELECT ename, sal
  FROM emp
 WHERE sal >= 2000
   AND deptno = 20;
   
 --OR는 합집합이다. 둘 중에 하나만 만족하면 된다.
SELECT ename, sal
  FROM emp
 WHERE sal >= 2000
    OR deptno = 20;
   
  
--테이블의 값은 대소문자를 구별한다. 
SELECT sal 
  FROM emp
 WHERE ename = 'ALLEN';

SELECT sal 
  FROM emp
 WHERE ename = 'allen'