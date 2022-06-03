-- 인라인뷰 경우의 수를 줄인다.
-- 

-- DDL
-- 테이블의 구조를 정의한다.
-- 가변형 타입이다. VARCHAR2 : 5자리를 다 채우지 않으면 반환된다.메모리를 동적할당한다.
CREATE TABLE SAM_TAB02 (GUBUN VARCHAR2(5) );

-- PL/SQL에 따른 저장 프로시저를 생성하는 syntax - 익명프로시저:컴터끄면 날라간다.
-- 프로시저에 대한 컨벤션
-- DECLARE와 BEGIN 사이에는 선언이 온다.
-- DECLARE에 이름이 없다. 추상적이다.-> 이름이 있어야 한다.
-- SU라는 변수에 대한 초기화. 초깃값 106(defalut)
-- LOOP : 조건이 없다. 반복문(do while) - 무조건 한번은 실행된다./ 무한루프 유의
-- 무한루프에 대한 방지코드 신경(while문 안에 break 꼮!)
-- EXIT : 무한루프에 대한 방지코드 (=BREAK) - 126이 됐을 때 탈출한다.
DECLARE
SU NUMBER;
BEGIN
SU:=106;
LOOP
SU:=SU+1;
EXIT WHEN SU>125;

-- 삽입, 입력, 추가 있는것에 append
-- 107이 들어온다. 107, 125보다 크닝> 아니오
-- INSERT문이 여러번 실행된다.
-- 'F'는 VARCHAR2 문자.
-- TO_CHAR : 숫자를 문자로 바꿔줘라
-- COMMIT : 올 레코드 원 커밋 SAM_TAB02에 인서트 : 물리적인 테이블에 반영 > 재사용
INSERT INTO SAM_TAB02
VALUES('F'||TO_CHAR(SU));
END LOOP;
COMMIT;
END;

SELECT ROWNUM no, gubun FROM sam_tab02;                        

SELECT ceil(no/4) rno,no,gubun                        
  FROM (                        
        SELECT rownum no,gubun FROM sam_tab02                        
       );                        
       
SELECT ceil(no/4) rno                
          ,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )         
GROUP BY celil(no/4)
ORDER BY celil(no/4); 

SELECT ceil(no/5) rno  
      ,MAX(decode(mod(no,5),1,emp_id)) c1 SELECT ceil rno
      ,MAX(decode(mod(no,5),2,emp_id)) c1 SELECT ceil rno
      ,MAX(decode(mod(no,5),3,emp_id)) c1 SELECT ceil rno
      ,MAX(decode(mod(no,5),4,emp_id)) c1 SELECT ceil(no/4) rno
      ,MAX(decode(mod(no,5),0,emp_id)) c1 SELECT ceil(no/4) rno                
          ,mod(no,4) cno                
          ,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )   
GROUP BY ceil(no/5)
GROUP BY ceil(no/5);



SELECT ceil(no/5) rno  
      ,MAX(decode(mod(no,5),1,emp_id)) c1 SELECT ceil rno
      ,MAX(decode(mod(no,5),2,emp_id)) c1 SELECT ceil rno
      ,MAX(decode(mod(no,5),3,emp_id)) c1 SELECT ceil rno
      ,MAX(decode(mod(no,5),4,emp_id)) c1 SELECT ceil(no/4) rno
      ,MAX(decode(mod(no,5),0,emp_id)) c1 SELECT ceil(no/4) rno                
          ,mod(no,4) cno                
          ,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )
GROUP BY ceil(no/5)
GROUP BY ceil(no/5);


SELECT ceil(no/5) rno  
      ,MIN(decode(mod(no,5),1,emp_id)) c1 
      ,MIN(decode(mod(no,5),2,emp_name)) name 
      ,MIN(decode(mod(no,5),3,emp_id)) c2
      ,MIN(decode(mod(no,5),4,emp_name)) name2    
      ,MIN(decode(mod(no,5),0,emp_id)) c3
      ,MIN(decode(mod(no,5),0,emp_name)) name3     
      ,MIN(decode(mod(no,5),0,emp_id)) c4
      ,MIN(decode(mod(no,5),0,emp_name)) name4
      ,MIN(decode(mod(no,5),0,emp_id)) c5
      ,MIN(decode(mod(no,5),0,emp_name)) name5            
  FROM (                
        SELECT rownum no,emp_id, emp_name FROM temp                
       )
GROUP BY ceil(no/5)
ORDER BY ceil(no/5);



SELECT ceil(no/4) rno                
          ,no,gubun                
  FROM (                
        SELECT rownum no,gubun FROM sam_tab02                
       )        ; 


--인라인 뷰를 이용하면 테이블에 포함된 컬럼이 아니더라도 접근이 가능하다.
SELECT
       rno
  FROM (
        SELECT rownum no,gubun FROM sam_tab02
       )
GROUP BY rno   ;    

SELECT * FROM t_orderbasket              

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual;

데이터를 2배수로 복제하기 - 카타시안곱
SELECT * 
  FROM t_orderbasket,
        (SELECT 1 rno FROM dual
          UNOIN ALL
         SELECT 2 rno FROMO dual)
         
SELECT *
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       );         
        
SELECT indate_vc FROM t_orderbasket
GROUP BY indate_vc
UNION ALL
SELECT '총계' FROM dual;                

--단위테스트

DECODE(rownum, 1, indate_vc, 2, '총계');

SELECT DECODE(b.rno, 1, indate_vc, 2, '총계')
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b;   

SELECT DECODE(b.rno, 1, indate_vc, 2, '총계')
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계');


SELECT DECODE(b.rno, 1, indate_vc, 2, '총계')
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')
ORDER BY DECODE(b.rno, 1, indate_vc, 2, '총계');

--날짜에 존재하지 않 총계라는 컬럼을 추가하였다

SUM(qty_nu*price_nu) as "상품의 매출액"

SELECT DECODE(b.rno, 1, indate_vc, 2, '총계')
     ,    SUM(qty_nu*price_nu) as "상품의 매출액"
     ,  COUNT(qty_nu*price_nu) as "상품의 매출액"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계');
 
SELECT DECODE(b.rno, 1, indate_vc, 2, '총계') as "판매날짜"
     ,    SUM(qty_nu)||'개' as "판매개수"
     ,  COUNT(qty_nu*price_nu)||'원' as "판매가격"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '총계')
ORDER BY "판매날짜";

--pk와 fk로 양쪽 테이블에 발을 걸치고 있다.
SELECT
       deptno
  FROM emp,dept;
  
SELECT deptno FROM dept;

SELECT deptno FROM emp;

SELECT dept.deptno
  FROM emp, dept;
  
SELECT dept.deptno
  FROM emp, dept
 WHERE emp.deptno = dept.deptno;
 
SELECT dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname;

SELECT distinct(deptno) FROM emp;

SELECT dept.dname
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname
UNION ALL
SELECT '총계' FROM dual;

SELECT dept.dname
      ,sum(decode(job,'CLERK', sal)) clerk
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname;

SELECT deptno
      ,sum(decode(job,'CLERK', sal)) clerk
      ,sum(sal)
  FROM emp
GROUP BY deptno;

--pk는 널이 될 수 없다.
SELECT count(comm), count(empno) FROM emp;

SELECT deptno
      ,sum(decode(job,'CLERK', sal)) clerk
      ,sum(decode(job,'MANAGER', sal)) manager
      ,sum(decode(job,'CLERK',null,'MANAGER',null, sal)) etc
      ,sum(sal)
  FROM emp
GROUP BY deptno

SELECT dept.dname
      ,sum(decode(job,'CLERK', sal)) clerk
      ,sum(decode(job,'MANAGER', sal)) manager
      ,sum(decode(job,'CLERK',null,'MANAGER',null, sal)) etc
      ,sum(sal) dept_sal
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname

SELECT dept.dname
      ,sum(decode(job,'CLERK', sal)) clerk
      ,sum(decode(job,'MANAGER', sal)) manager
      ,sum(decode(job,'CLERK',null,'MANAGER',null, sal)) etc
      ,sum(sal) dept_sal
  FROM emp, dept
 WHERE emp.deptno = dept.deptno
GROUP BY dept.dname;

SELECT
       decode(b.rno,'1',a.dname,'총계')DNAME
      ,SUM(clerk) clerk
      ,SUM(manager) manager
      ,sum(etc) etc
      ,sum(dept_sal) dept_sal
  FROM     (
         SELECT DEPT.DNAME
               ,sum(decode(job, 'CLERK', sal)) CLERK
               ,sum(decode(job, 'MANAGER', sal)) MANAGER
               ,sum(decode(job, 'CLERK',NULL,'MANAGER',NULL, sal)) ETC
               ,sum(sal) DEPT_SAL
           FROM emp, dept
          WHERE emp.deptno = dept.deptno
         GROUP BY DEPT.DNAME
           )a,
           (
              SELECT rownum rno FROM dept --==>DEPT는 경우의 수가 4가지이니까 
              WHERE rownum <3 --==>ROWNUM 작다 작거나 같다만 가능
            )b
GROUP BY decode(b.rno,'1',a.dname,'총계')
ORDER BY decode(b.rno,'1',a.dname,'총계');


