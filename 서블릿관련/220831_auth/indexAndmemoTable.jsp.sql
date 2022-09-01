SELECT * FROM member
 WHERE mem_id LIKE '%'||'toma'||'%'

SELECT * FROM member
 WHERE mem_name LIKE '%'||'토'||'%' 
 
 
--셀렉트와 FROM절 사이에는 상수가 올 수 있다. 
SELECT mem_id, mem_name, '쪽지쓰기' as btn FROM member

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual

------------------------------------------------------
--집합을 만들자

create table memo(
    no number(5) constraints memo_no_pk primary key,
    from_id varchar2(10) not null,
    to_id varchar2(10) not null,
    memo_content varchar2(4000),
    create_date varchar2(30),
    read_yn varchar2(1)
)

where from_id = 'tomato'

where to_id = 'banana'