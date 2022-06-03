-- �ζ��κ� ����� ���� ���δ�.
-- 

-- DDL
-- ���̺��� ������ �����Ѵ�.
-- ������ Ÿ���̴�. VARCHAR2 : 5�ڸ��� �� ä���� ������ ��ȯ�ȴ�.�޸𸮸� �����Ҵ��Ѵ�.
CREATE TABLE SAM_TAB02 (GUBUN VARCHAR2(5) );

-- PL/SQL�� ���� ���� ���ν����� �����ϴ� syntax - �͸����ν���:���Ͳ��� ���󰣴�.
-- ���ν����� ���� ������
-- DECLARE�� BEGIN ���̿��� ������ �´�.
-- DECLARE�� �̸��� ����. �߻����̴�.-> �̸��� �־�� �Ѵ�.
-- SU��� ������ ���� �ʱ�ȭ. �ʱ갪 106(defalut)
-- LOOP : ������ ����. �ݺ���(do while) - ������ �ѹ��� ����ȴ�./ ���ѷ��� ����
-- ���ѷ����� ���� �����ڵ� �Ű�(while�� �ȿ� break ��!)
-- EXIT : ���ѷ����� ���� �����ڵ� (=BREAK) - 126�� ���� �� Ż���Ѵ�.
DECLARE
SU NUMBER;
BEGIN
SU:=106;
LOOP
SU:=SU+1;
EXIT WHEN SU>125;

-- ����, �Է�, �߰� �ִ°Ϳ� append
-- 107�� ���´�. 107, 125���� ũ��> �ƴϿ�
-- INSERT���� ������ ����ȴ�.
-- 'F'�� VARCHAR2 ����.
-- TO_CHAR : ���ڸ� ���ڷ� �ٲ����
-- COMMIT : �� ���ڵ� �� Ŀ�� SAM_TAB02�� �μ�Ʈ : �������� ���̺� �ݿ� > ����
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


--�ζ��� �並 �̿��ϸ� ���̺� ���Ե� �÷��� �ƴϴ��� ������ �����ϴ�.
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

�����͸� 2����� �����ϱ� - īŸ�þȰ�
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
SELECT '�Ѱ�' FROM dual;                

--�����׽�Ʈ

DECODE(rownum, 1, indate_vc, 2, '�Ѱ�');

SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b;   

SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�');


SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�');

--��¥�� �������� �� �Ѱ��� �÷��� �߰��Ͽ���

SUM(qty_nu*price_nu) as "��ǰ�� �����"

SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
     ,    SUM(qty_nu*price_nu) as "��ǰ�� �����"
     ,  COUNT(qty_nu*price_nu) as "��ǰ�� �����"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�');
 
SELECT DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�') as "�Ǹų�¥"
     ,    SUM(qty_nu)||'��' as "�ǸŰ���"
     ,  COUNT(qty_nu*price_nu)||'��' as "�ǸŰ���"
  FROM t_orderbasket,
       (
        SELECT rownum rno FROM dept
         WHERE rownum < 3
       )b 
GROUP BY DECODE(b.rno, 1, indate_vc, 2, '�Ѱ�')
ORDER BY "�Ǹų�¥";

--pk�� fk�� ���� ���̺� ���� ��ġ�� �ִ�.
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
SELECT '�Ѱ�' FROM dual;

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

--pk�� ���� �� �� ����.
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
       decode(b.rno,'1',a.dname,'�Ѱ�')DNAME
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
              SELECT rownum rno FROM dept --==>DEPT�� ����� ���� 4�����̴ϱ� 
              WHERE rownum <3 --==>ROWNUM �۴� �۰ų� ���ٸ� ����
            )b
GROUP BY decode(b.rno,'1',a.dname,'�Ѱ�')
ORDER BY decode(b.rno,'1',a.dname,'�Ѱ�');


