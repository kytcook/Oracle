create user scott identified by tiger;

grant create session to scott;

grant create table to scott;

grant create procedure to scott; 

grant create view to scott; 

alter user scott default tablespace users quota unlimited on users;;

