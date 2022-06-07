--도전문제
--temp와 tdept를 이용하여 다음 컬럼을 보여주는 SQL을 만들어 보자.
--상위부서가 'CA0001'인 부서에 소속된(where parent_dept = 'ca0001') 직원을 1.사번, 2.성명, 3.부서코드
--4.부서명,//  5.상위부서코드, 6.상위부서명, 7.상위부서장코드, 8.상위부서장성명
--순서로 보여주면 된다.
--TEMP : PK(EMP_ID), TDEPT : PK(DEPT_CODE)

SELECT * from temp;

SELECT * from tdept
WHERE parent_dept = 'CA0001';

-- temp 테이블과 tdept 테이블의dept_code 컬럼을 공통분모로 엮는다
--  
SELECT t.emp_id    사번
     , t.emp_name  성명
     , td.dept_code 부서코드
     , td.dept_name 부서명
     , td.parent_dept 상위부서코드
     , '상위부서명'    as "상위부서명" 
     , '상위부서장코드' as "상위부서장코드"
     , '상위부서장성명' as "상위부서장성명"  
  FROM tdept td,temp t 
 WHERE t.dept_code = td.dept_code 
   AND parent_dept = 'CA0001';
 
SELECT t.emp_id    사번
     , t.emp_name  성명
     , td.dept_code 부서코드
     , td.dept_name 부서명
     , td.parent_dept 상위부서코드
     , '상위부서명'    as "상위부서명" 
     , '상위부서장코드' as "상위부서장코드"
     , '상위부서장성명' as "상위부서장성명"  
  FROM tdept td,temp t 
 WHERE t.dept_code     = td.dept_code
   AND parent_dept     = 'CA0001'
   AND td.paraent_dept = t.dept_code  
 
--
SELECT td.emp_id    사번
     , td.emp_name  성명
     , t2.dept_code 부서코드
     , t2.dept_name 부서명
     , t1.dept_code 상위부서코드
     , t1.dept_name 상위부서명 
     , t1.boss_id   상위부서장코드
     , '상위부서장성명' 상위부서장성명 
  FROM tdept t1, tdept t2, temp td
 WHERE t1.dept_code = td.dept_code 
   AND t1.dept_code = t2.parent_dept
   AND t1.parent_dept = 'CA0001';

