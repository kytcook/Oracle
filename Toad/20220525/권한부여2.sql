create tablespace ts_tomato
datafile 'D:\oracle_App\oradata\orcl11\ts_tomato.dbf' size 100M;

 
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_TOMATO';

create user tomato identified by tiger
default tablespace TS_TOMATO;


----------------------------------------------------------

grant create session to tomato  with admin option;

-- DCL - 권한부여

grant create table to tomato with admin option 
--테이블을 만드려는 권한을 토마토에게  준다.

grant create view to tomato with admin option
--뷰를 만드는 권한을 준다

alter user tomato quota unlimited on TS_TOMATO
--테이블 스페이스에 대한 설정 

grant create trigger to tomato
--트리거를 만드는 권한부여

grant create sequence to tomato
-- 1일 증가하는 오브젝트 시퀀스?권한 부여

COMMIT;