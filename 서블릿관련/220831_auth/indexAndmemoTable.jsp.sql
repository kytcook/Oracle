SELECT * FROM member
 WHERE mem_id LIKE '%'||'toma'||'%'

SELECT * FROM member
 WHERE mem_name LIKE '%'||'��'||'%' 
 
 
--����Ʈ�� FROM�� ���̿��� ����� �� �� �ִ�. 
SELECT mem_id, mem_name, '��������' as btn FROM member

SELECT 1 FROM dual
UNION ALL
SELECT 2 FROM dual

------------------------------------------------------
--������ ������

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