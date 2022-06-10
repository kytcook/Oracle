


SELECT * 
  FROM emp
   WHERE empno = '7499';

SELECT * 
  FROM emp
   WHERE empno = TO_NUMBER('7499')--사원이 100만명인데 하나하나 해준다?
                                  --옵티마이저가 묵시적으로 TO_NUM을 처리해주지만 일치시켜주어야 한다.
;
   
--ClassCastExcecption - 타입이 안맞아서 나오는 예외발생. 

SELECT
       to_char('20/10/13')
      ,to_date('20/10/13')
      ,to_char(to_date('20/10/13'),'YYYY-MM-DD')
  FROM dual;

SELECT
       to_char(to_date('20/10/13'),'YYYY"년"MM"월"DD"일"')
  FROM dual;
  
SELECT
       to_char(to_date('190505'),'YYYY')||'년'
     ||to_char(to_date('190505'),'MM')||'월'
     ||to_char(to_date('190505'),'DD')||'일' 
  FROM dual;
  
SELECT to_char(to_date('190505'),'YYYY"년"MM"월"DD"일"')
  FROM dual;
  
-- trim함수의 역할
SELECT trim(' ABC D ')
      ,trim(' ABC D ')||'AAA'
  FROM dual;   
  
SELECT concat(concat(concat(empno, ','), concat(ename,',')),deptno)
  FROM dual;
  
SELECT
       merit_rating, salary
       CASE merit_rating
        WHEN 'A' THEN salary * 0.2
        WHEN 'B' THEN salary * 0.15
        WHEN 'C' THEN salary * 0.1
        ELSE 0
        END bouns
  FROM employee