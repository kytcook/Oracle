edit book

delete from book

rollback

----------------------------------------------------------

CREATE OR REPLACE function SCOTT.fn_choseong(str in varchar2)
return varchar2
IS
    returnStr varchar2(100);--처리후 초성정보 담기
    cnt number:=0;--잘라낸 문자열 비교할때 사용할 위치정보
    tmpStr varchar2(20);--한자씩 잘라내기
BEGIN
    if str is null then
        return '';
    end if;
    cnt := length(str);--문자열의 길이 담기
    for i in 1 ..cnt loop
        tmpStr := substr(str,i,1);
        returnStr := returnStr ||
        case when tmpStr < 'ㄱ' then substr(tmpStr,1,1)
        when ascii('ㄱ') <= ascii(tmpStr)
             and ascii(tmpStr) <= ascii('ㅎ') then chr(ascii(tmpStr))
        when tmpStr < '나' then 'ㄱ'
        when tmpStr < '다' then 'ㄴ'
        when tmpStr < '라' then 'ㄷ'
        when tmpStr < '마' then 'ㄹ'
        when tmpStr < '바' then 'ㅁ'
        when tmpStr < '사' then 'ㅂ'
        when tmpStr < '아' then 'ㅅ'
        when tmpStr < '자' then 'ㅇ'
        when tmpStr < '차' then 'ㅈ'
        when tmpStr < '카' then 'ㅊ'
        when tmpStr < '타' then 'ㅋ'
        when tmpStr < '파' then 'ㅌ'
        when tmpStr < '하' then 'ㅍ'
        else 'ㅎ'
        end;
    end loop;
    return returnStr;
END;
/

------------------------------------------------

SELECT fn_choseong('혼')  --ㅈ
      ,fn_choseong('홍') -- ㅈㅅ
      ,fn_choseong('하') --ㅈㅅㅇㅂ
  FROM dual

SELECT 함수명(값) FROM dual

함수는 컬럼명이 오는 자리에 올 수 있다..

SELECT
       *
  FROM book
 WHERE bk_title LIKE '혼'||'%'
 
 WHERE fn_choseong(bk_title) LIKE '혼'||'%'

----------------------------------------------------

SELECT
       *
  FROM book
 WHERE fn_choseong(bk_title) LIke 'ㅎ'||'%'
 
SELECT fn_choseong(bk_title), bk_title
  FROM book

 
 
 초성유무 체크 - 어디서? 그리고 어떻게?? 그리고 누가??
 
 입력받은 데이터의 유효성 검사도 자바스크립트로 해야 한다.
 프론트에서, how? 초성인지를 계산하는 공식, 자바스크립트가

