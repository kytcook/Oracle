INSERT INTO memo(no, from_id, to_id, memo_content, create_date, read_yn)
VALUES(seq_memo_no.nextval,'apple','tomato','����',to_char(sysdate,'YYYY-MM-DD'),'N')

commit;

SELECT
       mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
  FROM member
  
SELECT
       mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
       ,'<a href=javascript:memoForm()>��������</a>'
  FROM member
  
SELECT 1,2,4 FROM dual

SELECT * FROM memo

edit memo

--����������
--��? ������ �ϴ°ž�?- �޴»���� �̸��� �˰� �;... ��������� �̸��� �˰� �;...

SELECT
       mo.to_id, mb.mem_name "������� �̸�"
      ,mo.memo_content, mo.create_date
      ,DECODE(read_yn,'Y','����','N','��������') as read_yn 
  FROM member mb, memo mo
 WHERE mb.mem_id = mo.to_id
   AND mo.from_id = 'apple'
   
--����������

SELECT
       mo.to_id, mb.mem_name
      ,mo.memo_content, mo.create_date
      ,DECODE(read_yn,'Y','����','N','��������') as read_yn 
  FROM member mb, memo mo
 WHERE mb.mem_id = mo.from_id
   AND mo.to_id = 'haha'



edit member