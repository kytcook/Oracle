-- �μ��� �޿���
SELECT
       deptno
  FROM emp
 GROUP BY deptno;
 
SELECT
       deptno, SUM(sal)
  FROM emp
 GROUP BY deptno;
 
-- �׷��Լ�(���,�հ� ���)�� GROUP BY�� �Բ� ��� ������
-- �׷��Լ��� ��ü���� ó���̴�.(�� ���̵� ��̴�?)
-- �κй���ó��(��ũ�ѹٸ� ������ ������ �������� �� - �� ���̵� �����ϴ�?)
 
SELECT
       deptno, SUM(sal), AVG(sal)
  FROM emp
 GROUP BY deptno; 

--GROUP BY���� WHERE���� ���� �����ǿ� ��߳���. 
SELECT
       deptno, SUM(sal), AVG(sal)
  FROM emp
 GROUP BY deptno 
HAVING AVG(sal)>=2000;

SELECT DECODE(1,2,'��','����')
  FROM dual;
  
SELECT DECODE(1,1,'��','����')
  FROM dual;
  
SELECT DECODE(2,5,'A',2,'B',3,'C','D')
  FROM dual;

IF 2 = 5 THEN
   return 'A';
ELSIF 2 = 2 THEN
   return 'B'; 
ELSIF 2 = 3 THEN
   return 'C';
ELSE
   return 'C';
END IF;

----------------------------------
Decode�� �Ϲ����� ���α׷��� ����� IF���� SQL���� �Ǵ� PL/SQL
������ ����鿩 ����ϱ� ���Ͽ� ������� ����Ŭ �Լ��̴�.
���� �Ϲ����� ���α׷��� ����� IF���� ������ �� �ִ� �����
�����ϰ� �ִ�.
SELECT���� DECODE����� FROM ���� ����� ��𼭳� ����� �� �ִ�.
FROM���� ����� �� ���ٴ� ���� SELECT�� ���̺��� DECODE�� �̿��Ͽ�
�������� ������ �� ���ٴ� ���̱⵵ �ϴ�.
IF A = B THEN
    RETURN 'T';
END IF; 
 
A�÷��� B�÷��� ���ٸ� 'T'�� RETURN �ް� �ʹٴ� �����̴�.
DECODE�� �̿��ϸ� ������ ���� �ȴ�.
DECODE(A,B,'T')
SELECT������ �̿�ȴٸ� 
A�÷��� B�÷��� ���� Record�� 'T'���� �����޶�� �ǹ̰� �ȴ�.
SELECT DECODE(A,B,'T') AS col1
  FROM TABLE�̸�
 WHERE ...
 
�� ��� A�÷���  B�÷��� ���� �ٸ��ٸ� � ���� �����ڴ°�?
����� ��(NULL)�� ���´�.
�̿Ͱ��� �ܼ��񱳷� ���Ǵ� DECODE�� ���������� ELSE�� �����
������ ������ ELSE�� �ش�� ��� ��(NULL)�� �����Ѵ�.
�ٽ� ���ؼ� �� ������ ������ ���´� ������ ����.
SELECT DECODE(A,B,'T',NULL) AS col1
  FROM TABLE�̸�
 WHERE .... 

--lectime ���ǽð�, lecpoint ����
SELECT * FROM lecture 
 
����:�ִ� ���� �ð��� ������ ������ '�Ϲ�'�� ���� ������ �Ѵ�
��� �ؾ� �ϴ°�?
SELECT lec_time, lec_point
  FROM lecture

SELECT lectime, lecpoint, DECODE(1,1,'�Ϲ�'), DECODE(1,2,'�Ϲ�', null)
  FROM lecture;

SELECT lectime, lecpoint, DECODE(lec_time,2,'�Ϲ�'), DECODE(1,2,'�Ϲ�', null)
  FROM lecture;
  
SELECT lectime, lecpoint, DECODE(lec_time,3,'�Ϲ�'), DECODE(1,2,'�Ϲ�', null)
  FROM lecture;

SELECT lectime, lecpoint, DECODE(lec_time,lec_point,'�Ϲݰ���','��Ÿ����')
  FROM lecture;

����:�ִ簭�ǽð��� ������ ���� ������ ���ڸ� �˰� �ʹ�.
��� �ؾ� �ϴ°�?

SELECT lec_time, lec_point
  FROM lecture

SELECT lec_id, lec_time, lec_point
  FROM lecture
 WHERE lec_time = lec_point 

SELECT 2
  FROM lecture
 WHERE lec_time = lec_point
 
SELECT count(2)
  FROM lecture
 WHERE lec_time = lec_point
 
--���ĺ��� �־ 2�� ������ ����:
SELECT count('A')
  FROM lecture
 WHERE lec_time = lec_point
 
����: ���� �ð��� ������ ������ '�Ϲ�'�� ���Ϲ��� �� ���ĵ�
�ϰ� ���� ��쿡�� ��� �ؾ� �ϴ°�?
SLELCT DECODE(lectime, lecpoint, '�Ϲ�')
  FROM
 WHERE 

 
�ִ� ���� �ð��� ������ ������ '�Ϲ�' �� '����'�� ���Ϲ��� �� 
���ĵ� �ϰ� ���� ��쿡�� ��� �ؾ��ϴ°�?
����:���� �ð��� ������ �ٸ��� NULL�� ���ϵǴ� ��� 'Ư��'�̶��
���ϵǵ��� �Ϸ��� ��� �ؾ��ϴ°�?
  
IF A = B THEN
    RETURN 'T';
ELSIF A = C THEN
    RETURN 'F';
ELSE
    RETURN 'X';
END IF;
DECODE(A, B, 'T', C, 'F', 'X')
A�� B�� ������ 'T'�� �����ް� C�� ������ 'F'�� �����ް�, �̵� 
���� �ƴϸ� 'X'�� ���� �ް��� �Ѵٴ� ���̴�.
�Ʒ��� ���� A=B ���� A=C����, A=D����, A=E ���� �ƴϸ� �� ����
��������� ���� ���� '1', '2', '3', '4', '5'�� RETURN �ϰ� �ϴ�
DECODE �����̴�.
DECODE(A, B, '1', C, '2', D, '3', E, '4', '5')