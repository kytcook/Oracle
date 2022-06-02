�̸� - t_giftmem
��������Ʈ - t_giftmem, point_nu
��ȭƼ�� - t_giftpoint, point_nu


-- �Ʒ��� FROM�� �Ʒ� ������ �̰��� �ζ��κ��̴�.
-- ��ü ���̺��� �並 ���� �Ϻ��� ���Ҹ��� ������ ó���� �� �ִ�.
CREATE VIEW v_emp1(e_no, e_name)
AS SELECT empno, ename
     FROM emp
    WHERE deptno = 10;

-- �� �ȿ� ���ǵǾ��ִ� ���̺� ������ �����ϴ�.
SELECT e_no, e_name FROM v_emp1;

SELECT point_nu FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��';

-- ��ü 6�� �߿��� ��ȭƼ���� ��츸 ������ �� �ִ�.
--���̺� 2����ó���� �ɾ���ϴ»�Ȳ������ ī�ٽþ��� ���� ���� �� �ִ�.
SELECT
       point_nu
  FROM (
        SELECT point_nu FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��';--  
       )
       
SELECT 
       mem.name_vc. mem.point.nu, point.point_nu 
  FROM t_giftmem mem,
       (
        SELECT point_nu FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'     
       )point
 WHERE mem.point_nu >= point.point_nu;
 
SELECT * FROM emp;

-- �츮ȸ�翡 �ٹ��ϴ� ����߿� 'ALLEN'���� �޿��� �� ���� �޴�
-- ����� �̸��� �޿��� �ۼ��Ͻÿ�
SELECT ename AS "���", sal AS "�޿�"
  FROM EMP
 WHERE sal > 1600 


SELECT ename as "���", sal AS "�޿�"
  FROM emp 
 WHERE sal (SELECT ename
              FROM emp
             WHERE ename = 'Allen')
             
--------��
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


-- *�������� ����
--------------------------------
--1.temp���� ������ ���� ���� ������ row�� ã�Ƽ� �� �ݾװ� ������ �ݾ���
--�޴� ������ ����� ������ ����Ͻÿ�.
SELECT emp_id, emp_name, salary
  FROM temp

SELECT emp_id, emp_name, salary
  FROM temp
ORDER BY salary DESC

SELECT MAX(salary)
  FROM temp
  
SELECT emp_id as "���", emp_name as "�����̸�", salary as "����"
  FROM temp 
 WHERE salary = (SELECT MAX(salary)
                   FROM temp)


SELECT emp_id, emp_name, salary
  FROM temp
 WHERE emp_id = '19970101'
 
SELECT emp_id as "���", emp_name as "�����̸�", salary as "����"
  FROM temp 
 WHERE salary = (SELECT salary
                 FROM temp
                 WHERE emp_name = '��浿')

------------------��-------------------
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


-- 2.temp�� �ڷḦ �̿��Ͽ� salary�� ����� ���ϰ� �̺��� ū �ݾ��� salary��
-- �޴� ������ ����� ����, ������ �����ֽÿ�
SELECT emp_id ���, emp_name ����, salary ����
  FROM temp

SELECT AVG(salary)
  FROM temp  


SELECT emp_id as "���", emp_name as "�̸�", salary as "����"
  FROM temp
 WHERE salary > ( SELECT AVG(salary)
                  FROM temp )  
---------------------��----------------
SELECT
       emp_id, emp_name
  FROM temp
 WHERE salary > (
                SELECT avg(salary) FROM temp
                )   


-- 3.temp�� ���� �� ��õ�� �ٹ��ϴ� ������ ����� ������ �о���� SQL�� ����
-- ������ �̿��� �����ÿ�.

SELECT dept_code FROM tdept WHERE area = '��õ'

SELECT emp_id, emp_name, dept_code
  FROM temp
WHERE DEPT_CODE IN(SELECT DEPT_CODE
                     FROM TDEPT 
                    WHERE AREA = '��õ')

--1:3
--
--1:1 OR 1:1 OR 1:1
--
--1 in (1,1,1)
--------------------------��---------------
SELECT emp_id, emp_name 
  FROM temp
  
SELECT * FROM tdept

SELECT dept_code 
  FROM tdept
 WHERE area = '��õ'
 
SELECT emp_id, emp_name, dept_code 
  FROM temp
 WHERE dept_code IN( SELECT dept_code 
                       FROM tdept
                      WHERE area = '��õ'
                   ) 

--4.tcom�� ���� �ܿ� Ŀ�̼��� �޴� ������ ����� �����Ǿ� �ִ�.
--�� ������ ���������� select�Ͽ� �μ� ��Ī���� Ŀ�̼��� �޴�
--�ο����� ���� ������ ����� ���ÿ�.
--��
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

-- temp���� dept_name�� ����?
SELECT count(emp_id), dept_name
  FROM temp
 WHERE emp_id IN(SELECT emp_id FROM tcom)
GROUP BY dept_name 

SELECT count(emp_id), dept_name
  FROM temp, tdept
 WHERE emp_id IN(SELECT emp_id FROM tcom)
   AND temp.dept_code = tdept.dept_code
GROUP BY dept_name