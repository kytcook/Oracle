CREATE TABLE member_security(
    id number(5) constraints smember_id_pk primary key,
    username varchar2(30),
    password varchar2(100),
    email varchar2(50),
    role varchar2(30),
    createdate varchar2(30)
);

edit member_security;