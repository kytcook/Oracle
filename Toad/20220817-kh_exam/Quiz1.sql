SELECT mem_name FROM member
 WHERE mem_id='tomato'
   AND mem_pw='123';
 

--���̵� Ʋ�����
SELECT mem_name FROM member
 WHERE mem_id='tomato22'
   AND mem_pw='123';
   
--��й�ȣƲ�����   
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

update khboard set title = '����1', content = '����1' where id = 1