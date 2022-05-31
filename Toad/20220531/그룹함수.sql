-- 부서별 급여액
SELECT
       deptno
  FROM emp
 GROUP BY deptno;
 
SELECT
       deptno, SUM(sal)
  FROM emp
 GROUP BY deptno;
 
-- 그룹함수(평균,합계 등등)는 GROUP BY와 함꼐 사용 가능함
-- 그룹함수는 전체범위 처리이다.(이 아이디가 몇개이니?)
-- 부분범위처리(스크롤바를 내리면 정보가 딸려오는 것 - 이 아이디가 존재하니?)
 
SELECT
       deptno, SUM(sal), AVG(sal)
  FROM emp
 GROUP BY deptno; 

--GROUP BY에는 WHERE절이 오면 컨벤션에 어긋난다. 
SELECT
       deptno, SUM(sal), AVG(sal)
  FROM emp
 GROUP BY deptno 
HAVING AVG(sal)>=2000;

SELECT DECODE(1,2,'참','거짓')
  FROM dual;
  
SELECT DECODE(1,1,'참','거짓')
  FROM dual;
  
SELECT DECODE(2,5,'A',2,'B',3,'C','D')
  FROM dual;

IF 2 = 5 THEN
   return 'A';
ELSIF 2 = 2 THEN
   return 'B'; 
ELSIF 2 = 3 THEN
   return 'C';
ELSE
   return 'C';
END IF;

----------------------------------
Decode는 일반적인 프로그래밍 언어의 IF문을 SQL문장 또는 PL/SQL
안으로 끌어들여 사용하기 위하여 만들어진 오라클 함수이다.
따라서 일반적인 프로그래밍 언어의 IF문이 수행할 수 있는 기능을
포함하고 있다.
SELECT시의 DECODE사용은 FROM 절만 빼고는 어디서나 사용할 수 있다.
FROM에서 사용할 수 없다는 것은 SELECT시 테이블을 DECODE를 이용하여
동적으로 변경할 수 없다는 뜻이기도 하다.
IF A = B THEN
    RETURN 'T';
END IF; 
 
A컬럼과 B컬럼이 같다면 'T'를 RETURN 받고 싶다는 문장이다.
DECODE를 이용하면 다음과 같이 된다.
DECODE(A,B,'T')
SELECT문에서 이용된다면 
A컬럼과 B컬럼이 같은 Record는 'T'값을 돌려달라는 의미가 된다.
SELECT DECODE(A,B,'T') AS col1
  FROM TABLE이름
 WHERE ...
 
이 경우 A컬럼과  B컬럼의 값이 다르다면 어떤 값이 나오겠는가?
결과는 널(NULL)이 나온다.
이와같이 단순비교로 사용되는 DECODE는 내부적으로 ELSE의 기능을
가지고 있으며 ELSE에 해당될 경우 널(NULL)을 리턴한다.
다시 말해서 위 문장의 완전한 형태는 다음과 같다.
SELECT DECODE(A,B,'T',NULL) AS col1
  FROM TABLE이름
 WHERE .... 

--lectime 강의시간, lecpoint 학점
SELECT * FROM lecture 
 
문제:주당 강의 시간과 학점이 같으면 '일반'을 돌려 받으려 한다
어떻게 해야 하는가?
SELECT lec_time, lec_point
  FROM lecture

SELECT lectime, lecpoint, DECODE(1,1,'일반'), DECODE(1,2,'일반', null)
  FROM lecture;

SELECT lectime, lecpoint, DECODE(lec_time,2,'일반'), DECODE(1,2,'일반', null)
  FROM lecture;
  
SELECT lectime, lecpoint, DECODE(lec_time,3,'일반'), DECODE(1,2,'일반', null)
  FROM lecture;

SELECT lectime, lecpoint, DECODE(lec_time,lec_point,'일반과목','기타과목')
  FROM lecture;

문제:주당강의시간과 학점이 같은 강의의 숫자를 알고 싶다.
어떻게 해야 하는가?

SELECT lec_time, lec_point
  FROM lecture

SELECT lec_id, lec_time, lec_point
  FROM lecture
 WHERE lec_time = lec_point 

SELECT 2
  FROM lecture
 WHERE lec_time = lec_point
 
SELECT count(2)
  FROM lecture
 WHERE lec_time = lec_point
 
--알파벳을 넣어도 2가 나오는 이유:
SELECT count('A')
  FROM lecture
 WHERE lec_time = lec_point
 
문제: 강의 시간과 학점이 같으면 '일반'을 리턴받은 후 정렬도
하고 싶은 경우에는 어떻게 해야 하는가?
SLELCT DECODE(lectime, lecpoint, '일반')
  FROM
 WHERE 

 
주당 강의 시간과 학점이 같으면 '일반' 과 '교양'을 리턴받은 후 
정렬도 하고 싶은 경우에는 어떻게 해야하는가?
문제:강의 시간과 학점이 다르면 NULL이 리턴되는 대신 '특별'이라고
리턴되도록 하려면 어떻게 해야하는가?
  
IF A = B THEN
    RETURN 'T';
ELSIF A = C THEN
    RETURN 'F';
ELSE
    RETURN 'X';
END IF;
DECODE(A, B, 'T', C, 'F', 'X')
A가 B와 같으면 'T'를 돌려받고 C와 같으면 'F'를 돌려받고, 이도 
저도 아니면 'X'를 돌려 받고자 한다는 뜻이다.
아래의 경우는 A=B 인지 A=C인지, A=D인지, A=E 인지 아니면 그 외의
경우인지에 따라 각각 '1', '2', '3', '4', '5'를 RETURN 하게 하는
DECODE 문장이다.
DECODE(A, B, '1', C, '2', D, '3', E, '4', '5')