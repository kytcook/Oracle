���̵�� ����� ��� ��ġ�ϸ� mem_name�� ��ȸ
����� Ʋ���� 0��ȯ
���̵� �������� ������ -1;

SELECT
       CASE WHEN mem_id =:id THEN 
        CASE WHEN mem_pw=:pw THEN mem_name
            ELSE '0'
        END
       ELSE '-1' 
       END as mem_name
  FROM member