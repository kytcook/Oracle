SELECT id, name, address, telephone, gender
      ,relationship, birthday, comments, registedate
  FROM mkaddrtb
  
SELECT seq_mkaddrtb_id.nextval FROM dual

SELECT seq_mkaddrtb_id.currval FROM dual
  
DELETE FROM mkaddrtb

commit;

edit mkaddrtb