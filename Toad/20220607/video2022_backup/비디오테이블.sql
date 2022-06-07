create user video2022 identified by tiger;

GRANT CREATE sequence to video2022;

GRANT CREATE trigger to video2022;

grant create session to video2022;

grant create table to video2022;

grant create view to video2022;

alter user video2022 default tablespace users quota unlimited on users;