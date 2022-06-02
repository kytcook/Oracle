SELECT
        sql_text, sharable_mem, executions
  FROM v$sqlarea
  --관리자 계정에서만 보여준다.
  --LIKE문 : 연관검색
  --
 WHERE sql_text LIKE 'SELECT ename, sal%' 
 
선분조건이다. - range scan을 하는 예약어 이다. -- 구간검색이다.
점조건이다.
SELECT ename FROM emp -- 관리자계정이 바라보는 물리적인 경로는 없다?