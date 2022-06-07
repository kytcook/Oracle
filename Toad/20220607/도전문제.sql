--��������
--temp�� tdept�� �̿��Ͽ� ���� �÷��� �����ִ� SQL�� ����� ����.
--�����μ��� 'CA0001'�� �μ��� �Ҽӵ�(where parent_dept = 'ca0001') ������ 1.���, 2.����, 3.�μ��ڵ�
--4.�μ���,//  5.�����μ��ڵ�, 6.�����μ���, 7.�����μ����ڵ�, 8.�����μ��强��
--������ �����ָ� �ȴ�.
--TEMP : PK(EMP_ID), TDEPT : PK(DEPT_CODE)

SELECT * from temp;

SELECT * from tdept
WHERE parent_dept = 'CA0001';

-- temp ���̺�� tdept ���̺���dept_code �÷��� ����и�� ���´�
--  
SELECT t.emp_id    ���
     , t.emp_name  ����
     , td.dept_code �μ��ڵ�
     , td.dept_name �μ���
     , td.parent_dept �����μ��ڵ�
     , '�����μ���'    as "�����μ���" 
     , '�����μ����ڵ�' as "�����μ����ڵ�"
     , '�����μ��强��' as "�����μ��强��"  
  FROM tdept td,temp t 
 WHERE t.dept_code = td.dept_code 
   AND parent_dept = 'CA0001';
 
SELECT t.emp_id    ���
     , t.emp_name  ����
     , td.dept_code �μ��ڵ�
     , td.dept_name �μ���
     , td.parent_dept �����μ��ڵ�
     , '�����μ���'    as "�����μ���" 
     , '�����μ����ڵ�' as "�����μ����ڵ�"
     , '�����μ��强��' as "�����μ��强��"  
  FROM tdept td,temp t 
 WHERE t.dept_code     = td.dept_code
   AND parent_dept     = 'CA0001'
   AND td.paraent_dept = t.dept_code  
 
--
SELECT td.emp_id    ���
     , td.emp_name  ����
     , t2.dept_code �μ��ڵ�
     , t2.dept_name �μ���
     , t1.dept_code �����μ��ڵ�
     , t1.dept_name �����μ��� 
     , t1.boss_id   �����μ����ڵ�
     , '�����μ��强��' �����μ��强�� 
  FROM tdept t1, tdept t2, temp td
 WHERE t1.dept_code = td.dept_code 
   AND t1.dept_code = t2.parent_dept
   AND t1.parent_dept = 'CA0001';

