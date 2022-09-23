CREATE OR REPLACE PROCEDURE proc_memberinsert(pmem_id IN varchar, pmem_pw IN varchar
,pmem_name IN varchar, pmem_zipcode IN varchar, pmem_address IN varchar, result OUT number)
IS
--선언부
BEGIN
    INSERT INTO member(mem_no, mem_id, mem_pw, mem_name, mem_zipcode, mem_address)
    VALUES(seq_member_no.nextval, pmem_id,pmem_pw,pmem_name,pmem_zipcode,pmem_address);
    commit;
    result := 1;
END;
/

----------------------------------------------
variable result number;
exec proc_memberinsert('nice','123','이순신','135908','서울시 영등포구',:result);
print result;

----------------------------------------------
SELECT * FROM member;

INSERT INTO member(mem_no, mem_id, mem_name, mem_zipcode, mem_address)
VALUES(seq_member_no.nextval, 'good','123','나이스','123987','서울시 마포구 공덕동')

SELECT * FROM memo;
