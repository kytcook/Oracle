create table test1(t_id varchar(10) constraints test1_pk primary key, t_pw varchar2(10));

SELECT * FROM test1;

AlTER TABLE SAMPLE2.TEST1
ADD (T_JUMIN VARCHAR2(20));

INSERT INTO test1(t_id, t_pw, t_email, t_jumin)
            VALUES('tomato','123','nic_test@hot.com','900712-1234567');
            
INSERT INTO test1(t_id, t_pw, t_email, t_jumin)
            VALUES('banana','123','ban_test@hot.com','920822-2234567');
            
INSERT INTO test1(t_id, t_pw, t_email, t_jumin)
            VALUES('apple','123','app_test@hot.com','930302-1834567');
            
ALTER TABLE test1 ADD emil VARCHAR(25) DEFAULT'-' NOT NULL;
----------------------------------------------------------

UPDATE test1
   SET t_pw = '125';
               
UPDATE test1
   SET t_pw = '125'
 WHERE t_id = 'apple'
 
UPDATE test1
   SET t_pw = '125'
 WHERE t_id =: x
 

UPDATE test1
   SET t_pw = '125';
   
UPDATE test1
   SET t_pw2 = '125';
   
SELECT length('123'), length('hello'), length('자바의 정석')
      ,length('자바의정석')
  FROM dual

SLELCT length(t_pw), length(t_pw2)
  FROM test1

SLELCT length(t_pw), length(t_pw2)
  FROM test1

------------------------------------------------------

SELECT 1
  FROM test1
 WHERE t_pw > t_pw2
 
SELECT 1
  FROM test1
 WHERE t_pw < t_pw2 
 
SELECT 1
  FROM test1
 WHERE t_pw <> t_pw2
 
SELECT 1
  FROM test1
 WHERE t_pw != t_pw2
------------------------------------------

rollback; 

            
commit;
--------------------------------------            
SELECT * FROM test1
 WHERE t_email LIKE '___\_%' ESCAPE '\';
 
SELECT * FROM test1
 WHERE t_email LIKE '___#_%' ESCAPE '#';

SELECT * FROM test1
 WHERE t_email LIKE '___$_%' ESCAPE '$';
 
SELECT * FROM test1
 WHERE t_email LIKE '___!_%' ESCAPE '!';
             
SELECT * FROM test1
 WHERE SUBSTR(EMP_NO,8,1)=1;
 
SELECT * FROM test1
 WHERE T_JUMIN LIKE '_______1%' ;
 
SELECT SUBSTR('Hello Java',8,1)
      ,SUBSTR('Hello Java',8,2)
      ,SUBSTR('헬로 자바',8,1)
  FROM dual