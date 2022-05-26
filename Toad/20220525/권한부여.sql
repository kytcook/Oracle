-- DCL - 권한부여

<<<<<<< HEAD

grant create session to KYTCOOK;

grant create table to KYTCOOK with admin option;
--테이블을 만드려는 권한을 토마토에게  준다.

grant create view to KYTCOOK with admin option;
--뷰를 만드는 권한을 준다

alter user KYTCOOK quota unlimited on TS_KYTCOOK;
--테이블 스페이스에 대한 설정 

grant create trigger to KYTCOOK;
--트리거를 만드는 권한부여

grant create sequence to KYTCOOK;
=======
grant create table to KYTCOOK with admin option 
--테이블을 만드려는 권한을 토마토에게  준다.

grant create view to KYTCOOK with admin option
--뷰를 만드는 권한을 준다

alter user KYTCOOK quota unlimited on TS_KYTCOOK
--테이블 스페이스에 대한 설정 

grant create trigger to KYTCOOK
--트리거를 만드는 권한부여

grant create sequence to KYTCOOK
>>>>>>> db5ed133edbc3c204c6caa61e51a861b8109af69
-- 1일 증가하는 오브젝트 시퀀스?권한 부여