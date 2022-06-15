SELECT mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
  FROM member;
  
  
SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id =:x) --파라미터로 받아야 한다.
                

-- 공백이 들어있으면 길이가 7 나온다.
SELECT length(mem_id), length('tomato ') FROM member 
 WHERE mem_id = 'tomato'
                
             select * from member
             
INSERT INTO member(mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address)
VALUES(8,'nonice','123','이순신','12345','서울시 마포구 공덕동')


SELECT * FROM member

WHERE mem_id = 'nice'

commit

create sequence seq_member_no