create user crud identified by tiger;

grant create session to crud;

grant create table to crud;

grant create procedure to crud; 

grant create view to crud; 

alter user crud default tablespace users quota unlimited on users;;