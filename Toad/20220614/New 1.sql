SELECT mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address
  FROM member;
  
  
SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id =:x) --�Ķ���ͷ� �޾ƾ� �Ѵ�.
                

-- ������ ��������� ���̰� 7 ���´�.
SELECT length(mem_id), length('tomato ') FROM member 
 WHERE mem_id = 'tomato'
                
             select * from member
             
INSERT INTO member(mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address)
VALUES(8,'nonice','123','�̼���','12345','����� ������ ������')


SELECT * FROM member

WHERE mem_id = 'nice'

commit

create sequence seq_member_no