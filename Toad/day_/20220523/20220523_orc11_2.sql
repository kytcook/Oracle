TEMP�� �ڷ� �߿��� HOBBY�� ��� �Ǵ� ���� �� ��츦 �о����
���Ͽ� ������ ���� ������ �� �� �ִ�.
?
SELECT
       emp_id, emp_name, hobby
  FROM temp
 WHERE hobby IN ('���', '����'); -- or�̴ϱ� �� �߿� �ϳ��� �����ص� �ȴ�.
 
?
HOBBY�� NULL �Ǵ� '���'�� ���
?
SELECT 
       emp_id, emp_name, hobby
  FROM temp
 WHERE hobby IN (NULL,'���') -- �𸥴ٸ� ���� �� ����.
?
SELECT 100 + null, 5*2, 5*null --NULL�� �ȵȴ�. ��ư �ȵȴ�.
  FROM dual 
  
  
SELECT 
       comm
  FROM emp
ORDER BY comm asc -- �������� ���� ũ��

SELECT 
       comm
  FROM emp
ORDER BY comm asc -- �������� ���� ũ��

--NULL�� � ���� �����ص� NULL�̹Ƿ� ���� �𸥴�. FALSE�̴�.

HOBBY�� NULL�� ��쿡 �ش��ϴ� 6���� �����ִ�
�� ��������?
?
�� ������ �ٽ� ���� ������ ����.
WHERE hobby = NULL --��ü�� �׻� false�̴�.
   OR hobby = '���'
   
�̷��� �Ǹ� hobby = NULL �̶� ������ �׻� FALSE�� RETURN�ȴ�.
���ϱ�?
NULL�� �׻� IS NULL �Ǵ� IS NOT NULL�� �񱳵Ǿ�� �ϱ� �����̴�.
-- is null�� is not not����ȭ
?
���� hobby = '���' �� ��츸�� �˻��ȴ�.
?
�׳��� IN�� OR�� ����� �����Ƿ� hobby = '���'�� ���� 
�˻��� ���̴�.
?
�׷��ٸ� 
hobby�� NULL �Ǵ� '����' ��ο� ������ �ʴ� ���
?
SELECT 
       emp_id, emp_name, hobby
  FROM temp
 WHERE hobby NOT IN (NULL,'����');   
?
�� ��� NULL�� '����'�� ������ ������ ����� 3���� ��� �˻��ұ�
�ƴϸ� ������ ��츸 ������ 9���� �˻��ұ�?
?
�� �� �ƴϴ� .
�Ѱǵ� �˻����� ���Ѵ�.
?
NOT IN�����ڿ� NULL�� ���ԵǸ� ��� ��� ������ �� �ǵ�
DATA�� �˻����� ���Ѵ�.
?
SELECT * FROM temp
 WHERE hobby <> NULL;
 
SELECT * FROM temp
 WHERE hobby <> NULL
   AND hobby <> '����';
 
SELECT * FROM temp
 WHERE hobby IS NOT NULL; 
  
SELECT * FROM temp
 WHERE hobby IS NOT NULL
   AND hobby <> '����' 