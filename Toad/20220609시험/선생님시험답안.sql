


SELECT * 
  FROM emp
   WHERE empno = '7499';

SELECT * 
  FROM emp
   WHERE empno = TO_NUMBER('7499')--����� 100�����ε� �ϳ��ϳ� ���ش�?
                                  --��Ƽ�������� ���������� TO_NUM�� ó���������� ��ġ�����־�� �Ѵ�.
;
   
--ClassCastExcecption - Ÿ���� �ȸ¾Ƽ� ������ ���ܹ߻�. 

SELECT
       to_char('20/10/13')
      ,to_date('20/10/13')
      ,to_char(to_date('20/10/13'),'YYYY-MM-DD')
  FROM dual;

SELECT
       to_char(to_date('20/10/13'),'YYYY"��"MM"��"DD"��"')
  FROM dual;
  
SELECT
       to_char(to_date('190505'),'YYYY')||'��'
     ||to_char(to_date('190505'),'MM')||'��'
     ||to_char(to_date('190505'),'DD')||'��' 
  FROM dual;
  
SELECT to_char(to_date('190505'),'YYYY"��"MM"��"DD"��"')
  FROM dual;
  
-- trim�Լ��� ����
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