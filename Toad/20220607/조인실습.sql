--문제
temp에서 사번, 성명, 부서코드를 읽어내는데 부서명칭을 함께 보고 싶은
경우에 어떡하지?

테이블 구조를 파악하여라. pk, fk, 테이블명 등등 먼저 파악하여라

-----------------나------------------
SELECT emp_id as "사번"
     , emp_name as "성명"
     , dept_code as "부서코드"
  FROM temp, tdept
 WHERE temp.dept_code = tdept.dept_code;
 
SELECT emp_id as "사번"
     , emp_name as "성명"
     , temp.dept_code as "부서코드"
     , tdept.dept_name as "부서명칭"
  FROM temp, tdept
 WHERE temp.dept_code = tdept.dept_code;

------------------샘-------------------
SELECT
       *
  FROM temp a, tdept b;
  
SELECT
       *
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code -- 사원수만큼 줄어들게 된다.
 ;
 
SELECT
       b.dept_code --인덱스가 b집합에 있으므로 b집합의 코드를 가져오는게 좋겠다. 
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code ;
 
SELECT a.deptno
  FROM emp a, dept b;

SELECT NVL(a.deptno, 0)
  FROM emp a, dept b;

SELECT a.deptno
  FROM emp a, dept b
 WHERE a.deptno = 10;
 
SELECT a.deptno
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10; 
 
SELECT a.deptno, a.ename
  FROM emp a, dept b
 WHERE NVL(a.deptno,0) = 10; 
 
SELECT a.ename
  FROM emp a, dept b
 WHERE comm is not null;
 
SELECT 
       a.emp_id, a.emp_name
     , b.dept_code, b.dept_name
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code;
 
SELECT 
       a.emp_id, a.emp_name
     , b.dept_code, b.dept_name
  FROM temp a JOIN tdept b
    ON a.dept_code = b.dept_code;
    
SELECT    
       emp_id, emp_name
     , dept_code, dept_name
  FROM temp NATURAL JOIN tdept;
 
--INNER JOIN은 JOIN 조건을 만족하는 행만 질의의 결과로 가져옵니다.

SELECT 
       a.emp_id, a.emp_name
     , b.dept_code, b.dept_name
  FROM temp a INNER JOIN tdept b
    ON a.dept_code = b.dept_code;

--------------------------------------------------------------------
--연습문제2.
--tcom의 work_year가 2001인 자료와 temp를 사번으로 연결해서 조인한 후
--comm을 받는 직원의 성명, salary + comm을 조회하는 sql문을 작성하시오.

SELECT * FROM tcom;

SELECT * FROM temp;

SELECT
       a.emp_id
  FROM temp a, tcom b
 WHERE a.emp_id = b.emp_id;

SELECT
       a.emp_id, a.emp_name
      ,a.salary + b.comm
  FROM temp a, tcom b
 WHERE a.emp_id = b.emp_id
   AND b.work_year = '2001';

------------------------------------------------
--  non-equal조인
-- : 조인 조건이 = 이 아닌 다른 연산기호로 주어지는 경우
temp와 emp_level을 이용해emp_level의 과장 직급의, 연봉 상한/하한 범위 내에 드는
직원의 사번과 성명, 직급, salary를 읽어오는 sql문을 작성하시오.

SELECT * FROM temp;

SELECT * FROM emp_level;

SELECT lv.lev
  FROM temp t, emp_level lv
 WHERE lv.lev = '과장';
 
SELECT lv.LEV
  FROM temp t, emp_level lv
 WHERE lv.lev = '과장' And from_sal between to_age; 
 
SELECT  
       emp_id, emp_name
     , lv.lev
     , salary
  FROM temp t, emp_level lv
 WHERE lv.LEV = '과장';

SELECT  
       emp_id, emp_name
     , lv.lev
     , salary
  FROM temp t, emp_level lv

------------------------------------------------------
WHERE temp.salary BETWEEN from_sal AND to_sal
AND lev = '과장';

SELECT
       a.emp_id, a.emp_name
     , a.lev, a.salary
  FROM temp a, emp_level b
WHERE a.salary BETWEEN b.from_sal AND b.to_sal
AND b.lev = '과장'

----------------------------------------------------
outer join
두 개 이상의 테이블 조인시 한쪽 테이블의 행에 대해 다른쪽 테이블에 일치하는 행이
없더라도 다른쪽 테이블의 행을 NULL로 하여 행을 RETURN 하는 것이 OUTER JOIN이다.

SELECT
       컬럼1, 컬럼2....
  FROM 테이블1, 테이블2
 WHERE 테이블1.컬럼 = 테이블2.컬럼(+)
 
이 경우 기준이 되는 테이블은 테이블1 이다.
결합된 컬럼 값이 테이블 2에 없더라도 테이블 1에 있으면
테이블2의 값들 중 테이블1과 일치되는 값이 없는 행은 모두 NULL로 리턴된다.

각 사번의 성명, salary, 연봉하한금액, 연봉상한금액을 보고자 한다.
temp와 emp_level을 조인하여 결과를 보여주되
연봉의 상하한이 등록되어 있지 않은 수습 사원은 성명, salary까지만
이라도 나올 수 있도록 쿼리문을 작성하시오. (emp_level에는 수습이 없다)


SELECT a.emp_id   "사번"
     , a.emp_name "성명"
     , a.salary   "연봉"
     , b.from_sal "연봉하한금액"
     , b.to_sal   "연봉상한금액"
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+)

-----------------------------------샘-----------------------------------------
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+) 
 
--바뀐 문법 ic표준
--수습도 NULL로 나온다
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a LEFT OUTER JOIN emp_level b
    ON a.lev = b.lev  

-- 양쪽에 있는 것만 나온다.
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a RIGHT OUTER JOIN emp_level b
    ON a.lev = b.lev
    
-------------------------------------------
-- SELF-JOIN
--하나의 테이블에서 자신의 테이블과 EQUI JOIN이 발생한다.

--tdept 테입블에 자신의 상위 부서정보를 관리하고 있다.
--이 테이블을 이용하여 부서코드, 부서명, 상위부서코드, 상위부서명을 읽어오는
--쿼리를 작성하시오

SELECT
       b.dept_code
     , b.dept_name
     , a.parent_dept
     , a.dept_name
  FROM tdept a LEFT OUTER JOIN tdept b
    ON a.parent_dept = b.dept_code
    
----------------------------------샘---------------------------
SELECT * FORM TDEPT

SELECT
       '부서코드' as "부서코드"
     , '부서명' as "부서명"
     , '상위부서코드' as "상위부서코드"
     , '상위부서명' as "상위부서명"  
  FROM  tdept a, tdept b;
  
SELECT
       '부서코드' as "부서코드"
     , '부서명' as "부서명"
     , '상위부서코드' as "상위부서코드"
     , '상위부서명' as "상위부서명"  
  FROM  tdept a, tdept b 
 WHERE b.dept_code = a.parent_dept;
 
 --------샘----
SELECT
       a.dept_code as "부서코드"
     , a.dept_name as "부서명"
     , b.dept_code as "상위부서코드"
     , b.dept_name as "상위부서명"  
  FROM tdept a, tdept b 
 WHERE b.dept_code = a.parent_dept;

-- FROM절에서 TDEPT 테이블에 알리야스 명 a,b를 줘서 다른 두개의 테이블로 명시한다
-- WHERE절에서  b.dept_code, a.parent_dept 의 두 값은 같다는 조건을 준다.
-- SELECT에서 a.와 b.를 썼을 때 어떤 과정을 거쳐서 a는 부서별이 나오고 b는 상위부서별이 나오나?? 
 

SELECT a.* 
  FROM tdept a, tdept b 
 WHERE a.parent_dept = b.dept_code;
 
 
SELECT b.* 
  FROM tdept a, tdept b 
 WHERE a.parent_dept = b.dept_code; 
 
 
SELECT a.empno 사원번호
     , a.ename 사원이름
     , a.mgr   부서장번호
     , b.empno 부서장번호
     , b.ename 부서장
  FROM emp a, emp b
 WHERE a.mgr = b.empno