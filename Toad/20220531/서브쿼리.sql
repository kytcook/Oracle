SELECT member
  FROM emp;

SELECT member
  FROM emp;
  
SELECT member
  FROM emp;
      
/*  
로그인이 먼저
아님
회원가입이 먼저 인가요?

회원가입시 아이디 중복검사 쿼리문을 작성해 본다.
*/
SELECT count(mem_id)
  FROM member
 WHERE mem_id =:x;
 
SELECT 1 FROM member
WHERE mem_id='apple';

SELECT 1 FROM member
WHERE mem_id='apple';

--서브쿼리는 where절 아래 select문을 말한다.

SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple5');
                
SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple5');

SELECT NVL(hobby,'없음') FROM temp;

SELECT NVL((
            SELECT 1
             FROM dual
            WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple6')
          ),0)
--0이면 아이디가 없다  
  FROM dual; 
  



--인라인뷰는 from절 아래 select문을 말함.

SELECT rownum rno, empno, ename FROM emp;

SELECT rownum rno, empno, ename FROM emp
WHERE rownum <= 5; -- 크다는 비교는 안된다.

SELECT
       rownum rno, cdate, amt
  FROM test02;

SELECT
       rownum cno, cdate, crate
  FROM test02;

SELECT
       a.cdate, a.amt, a.amt*b,crate
  FROM (
        SELECT
               rownum rno, cdate, amt
          FROM test02
       )a,
       (
        SELECT
               rownum cno, cdate, crate
          FROM test02       
       )b;
       
SELECT
        a.cdate, a.amt, a.amt*b.crate
  FROM (
        SELECT
               rownum rno, cdate, amt
          FROM test02
       )a,
       (
        SELECT
               rownum cno, cdate, crate
          FROM test02       
       )b
 WHERE a.rno-1 = b.cno
 
 SELECT
        a.cdate, a.amt, TO_CHAT(a.amt*b.crate,'999,999,999,999')||'원' as "한화금액"
  FROM (
        SELECT
               rownum rno, cdate, amt
          FROM test02
       )a,
       (
        SELECT
               rownum cno, cdate, crate
          FROM test02       
       )b
 WHERE a.rno-1 = b.cno