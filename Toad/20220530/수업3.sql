CREATE USER SAMPLE2 IDENTIFIED BY tiger
default tablespace users

grant create session to sample2  with admin option;

grant connet, sesource to sample2


--테이블 만들기
grant create table to sample2 with admin option;

alter user sample2 quota unlimited on USERs;