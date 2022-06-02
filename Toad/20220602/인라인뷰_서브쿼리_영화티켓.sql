이름 - t_giftmem
보유포인트 - t_giftmem, point_nu
영화티켓 - t_giftpoint, point_nu


-- 아래를 FROM절 아래 적으면 이것이 인라인뷰이다.
-- 전체 테이블에서 뷰를 통해 일부의 원소만을 가지고 처리할 수 있다.
CREATE VIEW v_emp1(e_no, e_name)
AS SELECT empno, ename
     FROM emp
    WHERE deptno = 10;

-- 그 안에 정의되어있는 테이블만 접근이 가능하다.
SELECT e_no, e_name FROM v_emp1;

SELECT point_nu FROM t_giftpoint
 WHERE name_vc = '영화티켓';

-- 전체 6건 중에서 영화티켓인 경우만 가져올 수 있다.
--테이블 2개를처리를 걸어야하는상황에서도 카다시안의 곱을 줄일 수 있다.
SELECT
       point_nu
  FROM (
        SELECT point_nu FROM t_giftpoint
         WHERE name_vc = '영화티켓';--  
       )
       
SELECT 
       mem.name_vc. mem.point.nu, point.point_nu 
  FROM t_giftmem mem,
       (
        SELECT point_nu FROM t_giftpoint
         WHERE name_vc = '영화티켓'     
       )point
 WHERE mem.point_nu >= point.point_nu;
 
SELECT * FROM emp;

-- 우리회사에 근무하는 사원중에 'ALLEN'보다 급여를 더 많이 받는
-- 사원의 이름과 급여를 작성하시오
SELECT ename AS "사원", sal AS "급여"
  FROM EMP
 WHERE sal > 1600 


SELECT ename as "사원", sal AS "급여"
  FROM emp 
 WHERE sal (SELECT ename
              FROM emp
             WHERE ename = 'Allen')
             
--------샘
SELECT sal 
  FROM emp
 WHERE ename = 'ALLEN'
 
SELECT
       ename, sal
  FROM emp              

SELECT
       ename, sal
  FROM emp  
 WHERE sal > (
             SELECT sal 
             FROM emp
             WHERE ename = 'ALLEN'
             );
             
------------------------------------------


SELECT * FROM temp

SELECT * FROM tdept

SELECT * FROM tcom


-- *서브쿼리 문제
--------------------------------
--1.temp에서 연봉이 가장 많은 직원의 row를 찾아서 이 금액과 동일한 금액을
--받는 직원의 사번과 성명을 출력하시오.
SELECT emp_id, emp_name, salary
  FROM temp

SELECT emp_id, emp_name, salary
  FROM temp
ORDER BY salary DESC

SELECT MAX(salary)
  FROM temp
  
SELECT emp_id as "사번", emp_name as "직원이름", salary as "연봉"
  FROM temp 
 WHERE salary = (SELECT MAX(salary)
                   FROM temp)


SELECT emp_id, emp_name, salary
  FROM temp
 WHERE emp_id = '19970101'
 
SELECT emp_id as "사번", emp_name as "직원이름", salary as "연봉"
  FROM temp 
 WHERE salary = (SELECT salary
                 FROM temp
                 WHERE emp_name = '김길동')

------------------샘-------------------
max(salary)
emp_id, emp_name

SELECT max(salary) FROM temp

SELECT
       emp_id, emp_name
  FROM temp
 WHERE salary = 100000000
 
SELECT
       emp_id, emp_name
  FROM temp
 WHERE salary = (
                SELECT max(salary) FROM temp
                )             


-- 2.temp의 자료를 이용하여 salary의 평균을 구하고 이보다 큰 금액을 salary로
-- 받는 직원의 사번과 성명, 연봉을 보여주시오
SELECT emp_id 사번, emp_name 성명, salary 연봉
  FROM temp

SELECT AVG(salary)
  FROM temp  


SELECT emp_id as "사번", emp_name as "이름", salary as "연봉"
  FROM temp
 WHERE salary > ( SELECT AVG(salary)
                  FROM temp )  
---------------------샘----------------
SELECT
       emp_id, emp_name
  FROM temp
 WHERE salary > (
                SELECT avg(salary) FROM temp
                )   


-- 3.temp의 직원 중 인천에 근무하는 직원의 사번과 성명을 읽어오는 SQL을 서브
-- 쿼리를 이용해 만들어보시오.

SELECT dept_code FROM tdept WHERE area = '인천'

SELECT emp_id, emp_name, dept_code
  FROM temp
WHERE DEPT_CODE IN(SELECT DEPT_CODE
                     FROM TDEPT 
                    WHERE AREA = '인천')

--1:3
--
--1:1 OR 1:1 OR 1:1
--
--1 in (1,1,1)
--------------------------샘---------------
SELECT emp_id, emp_name 
  FROM temp
  
SELECT * FROM tdept

SELECT dept_code 
  FROM tdept
 WHERE area = '인천'
 
SELECT emp_id, emp_name, dept_code 
  FROM temp
 WHERE dept_code IN( SELECT dept_code 
                       FROM tdept
                      WHERE area = '인천'
                   ) 

--4.tcom에 연봉 외에 커미션을 받는 직원의 사번이 보관되어 있다.
--이 정보를 서브쿼리로 select하여 부서 명칭별로 커미션을 받는
--인원수를 세는 문장을 만들어 보시오.
--샘
SELECT emp_id FROM tcom

SELECT emp_id
  FROM temp

SELECT emp_id
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)
 
SELECT count(emp_id), dept_code
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)
GROUP BY dept_code

-- temp에는 dept_name이 없다?
SELECT count(emp_id), dept_name
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)
GROUP BY dept_name 

SELECT count(emp_id), dept_name
  FROM temp, tdept
 WHERE emp_id IN(SELECT emp_id FROM tcom)
   AND temp.dept_code = tdept.dept_code
GROUP BY dept_name