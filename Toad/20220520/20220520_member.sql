create table member(
mem_no number(5) constraints member_no_pk primary key
,mem_id varchar2(30)
,mem_pw varchar2(10)
,mem_name varchar2(20)
);

-- 테이블 편집
edit member;

--반드시 커밋을 해야 물리적인 테이블에 반영됨

select * from member;

ROLLBACK;
--로그인을 구현하는 상상. 변수를 어떻게 활용하는가
COMMIT;



SELECT * FROM member
 

query
SQL문 - Structed Query Langugage

--PK인 mem_no만 중복되지 않으면 괜찮다. (무결성 제약조건 만족)
INSERT INTO member(mem_no, mem_id, mem_pw, mem_name)
VALUES(6,'ohho','123','무결성씨');



ROLLBACK;

COMMIT;

SELECT mem_name
  FROM member
 WHERE 아이디 = 값
   AND 비번  = 값;
   
-- 아이디와 비번이 일치하는 경우에만 출력 결과를 볼 수 있다.
-- 데이터를 추가한 뒤에 commit을 하지 않으면 실제 DB table에 반영되지 않는다.
-- 자신 서버를 바라볼때는 결과가 있는 것 처럼 보여지지만 외부에서 접근하면 볼 수 없다.   
   
SELECT mem_name, mem_no, mem_id, mem_pw
  FROM member
 WHERE mem_id =:x 
   AND mem_pw =:y ;
   
