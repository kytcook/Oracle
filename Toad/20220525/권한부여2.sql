<<<<<<< HEAD
--sys계정에서 실행할 것?
--
--실습 시나리오
--
--오라클 서버에 tomato계정을 만들고 비번은 tiger로 한다.
--tomato계정이 사용할 물리적인 공간을 만들어 준다.
--ts_tomato라는 테이블 스페이스 이름으로 오라클이 설치되어 있는 물리적인 위치를 확인한 후
--아래 DDL문을 sys계정에서 실행한다.

create tablespace ts_KYTCOOK
datafile 'D:\app\kytco\oradata\orcl11\KYTCOOK.dbf' size 100M;


--아래는 위에서 생성한 테이블스페이스가 정상적으로 만들어 졌는지 확인하는 DML문이다.
--이것도 반드시 sys 계정에서 확인해야 한다.
select tablespace_name, file_name, autoextensible, increment_by
      ,maxbytes
  from dba_data_files
 where tablespace_name = 'TS_KYTCOOK'

--tomato라는 계정을 만들고 비번은 tiger로 하며
--tomato계정이 바라보는 테이블 스페이스는 ts_tomato로 한다.
create user KYTCOOK identified by tiger
default tablespace ts_KYTCOOK



=======
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
>>>>>>> fdabd44f0f4050f82163db1bf5a2743aa3f6baa4
