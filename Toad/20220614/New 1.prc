SELECT * FROM t_orderbasket;

더미테이블 활용

SELECT rownum rno FROM dept
WHERE rownum < 3;

카타시안의 곱 / 두

SELECT rownum rno FROM dept
WHERE rownum < 4;

SELECT
       *
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b;
      
SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b;
      
SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc) as "물품구분"
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')  
        ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc);
        
SELECT deptno, count(empno)
  FROM emp
GROUP BY deptno;

SELECT deptno, empno
  FROM emp
GROUP BY deptno;

SELECT deptno, max(empno)
  FROM emp
GROUP BY deptno;

SELECT deptno, max(empno)
  FROM emp
GROUP BY deptno, empno;


SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc) as "물품구분"
      ,SUM(a.qty_nu)||'개' as "판매개수"
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')  
        ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc);


SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc) as "물품구분"
      ,SUM(a.qty_nu)||'개' as "판매개수"
      'SUM(a.qty_nu * a.price_nu)||원'
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')  
        ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc);

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계') as "판매날짜"
      ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc) as "물품구분"
      ,SUM(a.qty_nu)||'개' as "판매개수"
      ,SUM(a.qty_nu * a.price_nu)||원
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'총계',3,'소계')  
        ,DECODE(b.rno,3,a.gubun_vc||'계', 1, a.gubun_vc)
ORDER BY "판매날짜";

SELECT
       a.emp_id as "사번", a.emp_name as "성명"
     , b.dept_code, b
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code;
 
SELECT
       a.emp_id as "사번", a.emp_name as "성명"
     , b.dept_code, b.dept_name
       c.DEPT_CODE as "상위부서코드"
  FROM temp a, tdept b, tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c_dept_code
   
 SELECT
       a.emp_id as "사번", a.emp_name as "성명"
     , b.dept_code, b.dept_name
       c.DEPT_CODE as "상위부서코드"
  FROM temp a, tdept b, tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c_dept_code
   AND c.dept_code  - 'CA(0001);
   
 SELECT
       a.emp is as 사번
       a.emp_id as "사번", a.emp_name as "성명"
     , b.dept_code, b.dept_name
       c.DEPT_CODE as "상위부서코드"
  FROM temp a, tdept b, tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c_dept_code
   AND c.dept_code  = 'CA(0001)
   AND C.DEPT = b.tdept c, temp 
   
--------------------------------------   
   SELECT 
            A1.EMP_ID 사번
           ,A1.EMP_NAME 성명
           ,A1.DEPT_CODE 부서코드
           ,B1.DEPT_NAME 부서명
           ,B2.DEPT_CODE 상위부서코드
           ,B2.DEPT_NAME 상위부서명
           ,B2.BOSS_ID 상위부서장코드
           ,A2.EMP_NAME 상위부서장성명 
FROM TEMP A1, TDEPT B1, TDEPT B2, TEMP A2
WHERE A1.DEPT_CODE = B1.DEPT_CODE
AND B2.DEPT_CODE = B1.PARENT_DEPT
AND A2.EMP_ID = B2.BOSS_ID
AND B2.DEPT_CODE = 'CA0001'