--����
temp���� ���, ����, �μ��ڵ带 �о�µ� �μ���Ī�� �Բ� ���� ����
��쿡 �����?

���̺� ������ �ľ��Ͽ���. pk, fk, ���̺�� ��� ���� �ľ��Ͽ���

-----------------��------------------
SELECT emp_id as "���"
     , emp_name as "����"
     , dept_code as "�μ��ڵ�"
  FROM temp, tdept
 WHERE temp.dept_code = tdept.dept_code;
 
SELECT emp_id as "���"
     , emp_name as "����"
     , temp.dept_code as "�μ��ڵ�"
     , tdept.dept_name as "�μ���Ī"
  FROM temp, tdept
 WHERE temp.dept_code = tdept.dept_code;

------------------��-------------------
SELECT
       *
  FROM temp a, tdept b;
  
SELECT
       *
  FROM temp a, tdept b
 WHERE a.dept_code = b.dept_code -- �������ŭ �پ��� �ȴ�.
 ;
 
SELECT
       b.dept_code --�ε����� b���տ� �����Ƿ� b������ �ڵ带 �������°� ���ڴ�. 
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
 
--INNER JOIN�� JOIN ������ �����ϴ� �ุ ������ ����� �����ɴϴ�.

SELECT 
       a.emp_id, a.emp_name
     , b.dept_code, b.dept_name
  FROM temp a INNER JOIN tdept b
    ON a.dept_code = b.dept_code;

--------------------------------------------------------------------
--��������2.
--tcom�� work_year�� 2001�� �ڷ�� temp�� ������� �����ؼ� ������ ��
--comm�� �޴� ������ ����, salary + comm�� ��ȸ�ϴ� sql���� �ۼ��Ͻÿ�.

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
--  non-equal����
-- : ���� ������ = �� �ƴ� �ٸ� �����ȣ�� �־����� ���
temp�� emp_level�� �̿���emp_level�� ���� ������, ���� ����/���� ���� ���� ���
������ ����� ����, ����, salary�� �о���� sql���� �ۼ��Ͻÿ�.

SELECT * FROM temp;

SELECT * FROM emp_level;

SELECT lv.lev
  FROM temp t, emp_level lv
 WHERE lv.lev = '����';
 
SELECT lv.LEV
  FROM temp t, emp_level lv
 WHERE lv.lev = '����' And from_sal between to_age; 
 
SELECT  
       emp_id, emp_name
     , lv.lev
     , salary
  FROM temp t, emp_level lv
 WHERE lv.LEV = '����';

SELECT  
       emp_id, emp_name
     , lv.lev
     , salary
  FROM temp t, emp_level lv

------------------------------------------------------
WHERE temp.salary BETWEEN from_sal AND to_sal
AND lev = '����';

SELECT
       a.emp_id, a.emp_name
     , a.lev, a.salary
  FROM temp a, emp_level b
WHERE a.salary BETWEEN b.from_sal AND b.to_sal
AND b.lev = '����'

----------------------------------------------------
outer join
�� �� �̻��� ���̺� ���ν� ���� ���̺��� �࿡ ���� �ٸ��� ���̺� ��ġ�ϴ� ����
������ �ٸ��� ���̺��� ���� NULL�� �Ͽ� ���� RETURN �ϴ� ���� OUTER JOIN�̴�.

SELECT
       �÷�1, �÷�2....
  FROM ���̺�1, ���̺�2
 WHERE ���̺�1.�÷� = ���̺�2.�÷�(+)
 
�� ��� ������ �Ǵ� ���̺��� ���̺�1 �̴�.
���յ� �÷� ���� ���̺� 2�� ������ ���̺� 1�� ������
���̺�2�� ���� �� ���̺�1�� ��ġ�Ǵ� ���� ���� ���� ��� NULL�� ���ϵȴ�.

�� ����� ����, salary, �������ѱݾ�, �������ѱݾ��� ������ �Ѵ�.
temp�� emp_level�� �����Ͽ� ����� �����ֵ�
������ �������� ��ϵǾ� ���� ���� ���� ����� ����, salary������
�̶� ���� �� �ֵ��� �������� �ۼ��Ͻÿ�. (emp_level���� ������ ����)


SELECT a.emp_id   "���"
     , a.emp_name "����"
     , a.salary   "����"
     , b.from_sal "�������ѱݾ�"
     , b.to_sal   "�������ѱݾ�"
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+)

-----------------------------------��-----------------------------------------
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a, emp_level b
 WHERE a.lev = b.lev(+) 
 
--�ٲ� ���� icǥ��
--������ NULL�� ���´�
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a LEFT OUTER JOIN emp_level b
    ON a.lev = b.lev  

-- ���ʿ� �ִ� �͸� ���´�.
SELECT
       a.emp_id, a.emp_name
      ,a.salary, b.from_sal, b.to_sal
  FROM temp a RIGHT OUTER JOIN emp_level b
    ON a.lev = b.lev
    
-------------------------------------------
-- SELF-JOIN
--�ϳ��� ���̺��� �ڽ��� ���̺�� EQUI JOIN�� �߻��Ѵ�.

--tdept ���Ժ� �ڽ��� ���� �μ������� �����ϰ� �ִ�.
--�� ���̺��� �̿��Ͽ� �μ��ڵ�, �μ���, �����μ��ڵ�, �����μ����� �о����
--������ �ۼ��Ͻÿ�

SELECT
       b.dept_code
     , b.dept_name
     , a.parent_dept
     , a.dept_name
  FROM tdept a LEFT OUTER JOIN tdept b
    ON a.parent_dept = b.dept_code
    
----------------------------------��---------------------------
SELECT * FORM TDEPT

SELECT
       '�μ��ڵ�' as "�μ��ڵ�"
     , '�μ���' as "�μ���"
     , '�����μ��ڵ�' as "�����μ��ڵ�"
     , '�����μ���' as "�����μ���"  
  FROM  tdept a, tdept b;
  
SELECT
       '�μ��ڵ�' as "�μ��ڵ�"
     , '�μ���' as "�μ���"
     , '�����μ��ڵ�' as "�����μ��ڵ�"
     , '�����μ���' as "�����μ���"  
  FROM  tdept a, tdept b 
 WHERE b.dept_code = a.parent_dept;
 
 --------��----
SELECT
       a.dept_code as "�μ��ڵ�"
     , a.dept_name as "�μ���"
     , b.dept_code as "�����μ��ڵ�"
     , b.dept_name as "�����μ���"  
  FROM tdept a, tdept b 
 WHERE b.dept_code = a.parent_dept;

-- FROM������ TDEPT ���̺� �˸��߽� �� a,b�� �༭ �ٸ� �ΰ��� ���̺�� ����Ѵ�
-- WHERE������  b.dept_code, a.parent_dept �� �� ���� ���ٴ� ������ �ش�.
-- SELECT���� a.�� b.�� ���� �� � ������ ���ļ� a�� �μ����� ������ b�� �����μ����� ������?? 
 

SELECT a.* 
  FROM tdept a, tdept b 
 WHERE a.parent_dept = b.dept_code;
 
 
SELECT b.* 
  FROM tdept a, tdept b 
 WHERE a.parent_dept = b.dept_code; 
 
 
SELECT a.empno �����ȣ
     , a.ename ����̸�
     , a.mgr   �μ����ȣ
     , b.empno �μ����ȣ
     , b.ename �μ���
  FROM emp a, emp b
 WHERE a.mgr = b.empno