SELECT
        sql_text, sharable_mem, executions
  FROM v$sqlarea
  --������ ���������� �����ش�.
  --LIKE�� : �����˻�
  --
 WHERE sql_text LIKE 'SELECT ename, sal%' 
 
���������̴�. - range scan�� �ϴ� ����� �̴�. -- �����˻��̴�.
�������̴�.
SELECT ename FROM emp -- �����ڰ����� �ٶ󺸴� �������� ��δ� ����?