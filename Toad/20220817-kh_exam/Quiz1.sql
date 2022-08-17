SELECT mem_name FROM member
 WHERE mem_id='tomato'
   AND mem_pw='123';
 

--아이디가 틀린경우
SELECT mem_name FROM member
 WHERE mem_id='tomato22'
   AND mem_pw='123';
   
--비밀번호틀린경우   
SELECT mem_name FROM member
 WHERE mem_id='tomato'
   AND mem_pw='12345'   
   

----------------------------------------------------

SELECT * FROM board

edit 

SELECT id, writer, title, content
  FROM khboard
 WHERE id=2

edit khboard

update khboard set title = '제목1', content = '내용1' where id = 1