CREATE OR REPLACE PROCEDURE SCOTT.proc_zipcode(keyword IN varchar, rc_zipcode OUT SYS_REFCURSOR)
    IS
    BEGIN
      OPEN rc_zipcode
       FOR SELECT zipcode, address FROM zipcode_t
           WHERE dong LIKE keyword||'%';
    END;
/


SELECT * FROM zipcode_t
 WHERE dong LIKE '����'||'%';
 
------------------------------------------

variable rc_zipcode refcursor;
exec proc_zipcode('���', rc_zipcode);
print rc_zipcode; 