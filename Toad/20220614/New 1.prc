SELECT * FROM t_orderbasket;

�������̺� Ȱ��

SELECT rownum rno FROM dept
WHERE rownum < 3;

īŸ�þ��� �� / ��

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
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b;
      
SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc) as "��ǰ����"
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')  
        ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc);
        
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
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc) as "��ǰ����"
      ,SUM(a.qty_nu)||'��' as "�ǸŰ���"
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')  
        ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc);


SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc) as "��ǰ����"
      ,SUM(a.qty_nu)||'��' as "�ǸŰ���"
      'SUM(a.qty_nu * a.price_nu)||��'
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')  
        ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc);

SELECT
       DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�') as "�Ǹų�¥"
      ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc) as "��ǰ����"
      ,SUM(a.qty_nu)||'��' as "�ǸŰ���"
      ,SUM(a.qty_nu * a.price_nu)||��
  FROM t_orderbasket a,
      (
        SELECT rownum rno FROM dept
        WHERE rownum < 4      
      )b
GROUP BY DECODE(b.rno,1,a.indate_vc,2,'�Ѱ�',3,'�Ұ�')  
        ,DECODE(b.rno,3,a.gubun_vc||'��', 1, a.gubun_vc)
ORDER BY "�Ǹų�¥";

SELECT
       a.emp_id as "���", a.emp_name as "����"
     , b.dept_code, b
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code;
 
SELECT
       a.emp_id as "���", a.emp_name as "����"
     , b.dept_code, b.dept_name
       c.DEPT_CODE as "�����μ��ڵ�"
  FROM temp a, tdept b, tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c_dept_code
   
 SELECT
       a.emp_id as "���", a.emp_name as "����"
     , b.dept_code, b.dept_name
       c.DEPT_CODE as "�����μ��ڵ�"
  FROM temp a, tdept b, tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c_dept_code
   AND c.dept_code  - 'CA(0001);
   
 SELECT
       a.emp is as ���
       a.emp_id as "���", a.emp_name as "����"
     , b.dept_code, b.dept_name
       c.DEPT_CODE as "�����μ��ڵ�"
  FROM temp a, tdept b, tdept c
 WHERE a.dept_code = b.dept_code
   AND b.parent_dept = c_dept_code
   AND c.dept_code  = 'CA(0001)
   AND C.DEPT = b.tdept c, temp 
   
--------------------------------------   
   SELECT 
            A1.EMP_ID ���
           ,A1.EMP_NAME ����
           ,A1.DEPT_CODE �μ��ڵ�
           ,B1.DEPT_NAME �μ���
           ,B2.DEPT_CODE �����μ��ڵ�
           ,B2.DEPT_NAME �����μ���
           ,B2.BOSS_ID �����μ����ڵ�
           ,A2.EMP_NAME �����μ��强�� 
FROM TEMP A1, TDEPT B1, TDEPT B2, TEMP A2
WHERE A1.DEPT_CODE = B1.DEPT_CODE
AND B2.DEPT_CODE = B1.PARENT_DEPT
AND A2.EMP_ID = B2.BOSS_ID
AND B2.DEPT_CODE = 'CA0001'