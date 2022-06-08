SELECT * FROM zipcode_t;

SELECT count(*) as "우편번호 전체 조회수" 
      ,count(uid_no)
      ,count(ri)
  FROM zipcode_T;

SELECT empno, ename
  FROM emp
 WHERE ename LIKE '%'||'S'||'%';
 
SELECT empno, ename
  FROM emp
 WHERE ename LIKE '%'||'S';
 
SELECT empno, ename
  FROM emp
 WHERE ename LIKE 'S'||'%' ;

SELECT
       address, zipcode
  FROM zipcode_t
 WHERE dong LIKE '%'||'당산'||'%';
 
대분류 - 시 도 정보만 조회하세요. 중복제거 하세요

SELECT DISTINCT
       zdo, sigu
  FROM zipcode_t
GROUP BY zdo, sigu   
ORDER BY zdo, sigu;

SELECT DISTINCT
       zdo
  FROM zipcode_t
GROUP BY zdo  
ORDER BY zdo;

---샘---
SELECT '전체' zdo FROM dual
UNION ALL
SELECT '경기' FROM dual
UNION ALL
SELECT '서울' FROM dual;

SELECT
       distinct(zdo) zdo
  FROM zipcode_t
ORDER BY zdo asc;

SELECT '전체' zdo FROM dual
UNION ALL
SELECT
       distinct(zdo) zdo
  FROM zipcode_t
ORDER BY zdo asc;

SELECT '전체' zdo FROM dual
UNION ALL
SELECT zdo
  FROM (
        SELECT
               distinct(zdo) zdo
          FROM zipcode_t
        ORDER BY zdo asc
       );
       
SELECT sigu





--------------------------------------------
--UPDATE zipcode_t
--   SET zdo = '경남'
-- WHERE zdo = '경??의령군'

--------------------내집-------------
SELECT *
  FROM zipcode_t
 WHERE sigu like '안양%' AND dong like '관양2동%'
 
