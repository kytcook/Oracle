SELECT * FROM zipcode_t;

SELECT count(*) as "�����ȣ ��ü ��ȸ��" 
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
 WHERE dong LIKE '%'||'���'||'%';
 
��з� - �� �� ������ ��ȸ�ϼ���. �ߺ����� �ϼ���

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

---��---
SELECT '��ü' zdo FROM dual
UNION ALL
SELECT '���' FROM dual
UNION ALL
SELECT '����' FROM dual;

SELECT
       distinct(zdo) zdo
  FROM zipcode_t
ORDER BY zdo asc;

SELECT '��ü' zdo FROM dual
UNION ALL
SELECT
       distinct(zdo) zdo
  FROM zipcode_t
ORDER BY zdo asc;

SELECT '��ü' zdo FROM dual
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
--   SET zdo = '�泲'
-- WHERE zdo = '��??�Ƿɱ�'

--------------------����-------------
SELECT *
  FROM zipcode_t
 WHERE sigu like '�Ⱦ�%' AND dong like '����2��%'
 
