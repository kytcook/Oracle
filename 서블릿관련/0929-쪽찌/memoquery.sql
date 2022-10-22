edit member

edit memo

SELECT seq_memo_no.nextval from dual

-- 이 기능은 로그인 처리와 의존관계에 있다.--
-- 따라서 MemoController와 MemoLogic을 경유할 필요가 없다.--
-- to_id는 어디서 어떻게 가져오지??
-- MemberController
-- 컨트롤계층에서 듣는다.=> @RequestParam Map 지원 어디서 되니?? /
-- Model model  com.springframework..ui...xxxx
-- login(id,pw) -> MemberVO -> mVO.getMem_id(); apple
-- pMap.put("to_id",mVO.getMem_id())

SELECT count(*)
  FROM memo
 WHERE to_id =#{to_id}
   AND read_yn='N'
   
SELECT count(*), count(comm) FROM emp

SELECT no, from_id, to_id, memo_content
      ,create_date, read_yn
  FROM memo
 WHERE no =:no
 
UPDATE memo
   SET read_yn = 'Y'
 WHERE no =: no