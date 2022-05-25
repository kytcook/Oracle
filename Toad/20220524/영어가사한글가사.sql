--인라인뷰와 UNION ALL 활용하여 풀이해 보기

--3. 영어가사 한글가사 번갈아 나오게 하기

SELECT * FROM t_letitbe;

SELECT seq_vc 
      ,TO_NUMBER(seq_vc)
  FROM t_letitbe;
--함수를 씌우기 전의 상태
--함수가 씌어진 상태는 가짜다(복사본이다).


SELECT empno FROM emp
DECODE(MOD(2,2),1,'홀수')

SELECT DECODE(MOD(2,2),0,'홀수')
  FROM dual
  
IF 2%2=0 THEN
  return '짝수'
ELSIF 2%2=1 THEN
  return '홀수'
END;

SELECT
       MOD(seq_vc,2) n
  FROM t_letitbe

SELECT
       MOD(seq_vc,2) n
  FROM t_letitbe
 WHERE n = 1
 --별칭 알리야스 명칭을 쓰는 것은 맞지않다.
 
SELECT
    n
  FROM (
       SELECT
              MOD(seq_vc,2) n
         FROM t_letitbe
       )
WHERE n=1
--인라인뷰 : FROM절 밑에 SELECT문이 오면 인라인뷰
-- 테이블이 아니고 집합
-- 인라인뷰를 쓰면 조건절에서 알리야스 명을 사용할 수 있다.

SELECT
       MOD(seq_vc,2) no
      ,DECODE(MOD(seq_vc,2),1,words_vc)
  FROM t_letitbe

SELECT
       rownum no, eng_words
  FROM (
        SELECT
               MOD(seq_vc,2) no
              ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe
       )
WHERE no=1

SELECT
       rownum no, eng_words
  FROM (
        SELECT
               MOD(seq_vc,2) no
              ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe
       )
WHERE no=1

----------------------------2번
SELECT
       rownum no, kor_words
  FROM (
        SELECT
               MOD(seq_vc,2) no
              ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
          FROM t_letitbe
       )
WHERE no=0


--------------------------------3번
-두개 열을 하나로 그룹해주는 것 -group by

SELECT
       rownum no, eng_words , man(eng_workds)
  FROM (
        SESLECT
               MOD(seq_vc,2) no
              ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe
         
        
        SELECT
               SEq_vd
              ,DECODE(MOD(seq_vc,2),1,words_vc) eng_words
          FROM t_letitbe
          UNION ALL
          SELECT seq_vc
          /DECOD(MOD)(seq_vd,2).0.0,words vc)eng_words
          t_firstpath
          )    
Group BY seq_Vc
ORDER BY seq_Vc TO_NUMBER(seq_vc)

          
SELECT
        seq_vc
FROM (

)
GROUP BY seq_vc

