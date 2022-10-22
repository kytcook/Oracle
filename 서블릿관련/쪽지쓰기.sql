INSERT INTO memo(no, from_id, to_id, memo_content, create_date, read_yn)
VALUES(seq_memo_no.nextval,'apple','tomato','내용',to_char(sysdate,'YYYY-MM-DD'),'N')

commit;

SELECT
       mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
  FROM member
  
SELECT
       mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
       ,'<a href=javascript:memoForm()>쪽지쓰기</a>'
  FROM member
  
SELECT 1,2,4 FROM dual

SELECT * FROM memo

edit memo

--보낸쪽지함
--왜? 조인을 하는거야?- 받는사람의 이름을 알고 싶어서... 보낸사람의 이름을 알고 싶어서...

SELECT
       mo.to_id, mb.mem_name "받은사람 이름"
      ,mo.memo_content, mo.create_date
      ,DECODE(read_yn,'Y','읽음','N','읽지않음') as read_yn 
  FROM member mb, memo mo
 WHERE mb.mem_id = mo.to_id
   AND mo.from_id = 'apple'
   
--받은쪽지함

SELECT
       mo.to_id, mb.mem_name
      ,mo.memo_content, mo.create_date
      ,DECODE(read_yn,'Y','읽음','N','읽지않음') as read_yn 
  FROM member mb, memo mo
 WHERE mb.mem_id = mo.from_id
   AND mo.to_id = 'haha'



edit member