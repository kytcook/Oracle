SELECT * FROM t_letitbe


SELECT MOD(6,2), MOD(6,4) FROM dual
--if(6%2==0)

SELECT DECODE(1,1,'����','�ٸ���'), DECODE(1,2,'����','�ٸ���') FROM dual
--if���� ����ϱ����� �Լ�

----------------------------------------------------------------------
SELECT 
       DECODE(MOD(seq_vc,2),1,words_vc) eng_words
  From t_letitbe
  
SELECT 
       DECODE(MOD(seq_vc,2),1,words_vc,null) eng_words
  From t_letitbe

----------------------------------------------------------------------
SELECT 
       DECODE(MOD(seq_vc,2),1,words_vc,null) eng_words
  From t_letitbe
UNION ALL
SELECT 
       DECODE(MOD(seq_vc,2),0,words_vc,null) kor_words
  From t_letitbe
  
SELECT MOD(seq_vc,2) no
       DECODE(MOD(seq_vc,2),0,words_vc,null) eng_words
  From t_letitbe  
 
SELECT MOD(seq_vc,2) no
       DECODE(MOD(seq_vc,2),1,words_vc,null) eng_words
  FROM t_letitbe
 WHERE MOD(seq_vc,2) = 1
 
SELECT seq_vc FROM t_letitbe
ORDER BY seq_Vc desc

SELECT seq_vc FROM t_letitbe
ORDER BY TO_NUMBER(seq_vc) desc
  
SELECT seq_vc
  FROM (
        SELECT
            seq_vc, decode(mod(seq_vc,2),1, words_vc)
          FROM t_letitbe
        UNION ALL
        SELECT
            seq_vc, decode(mod(seq_vc,2),0, words_vc)
          FROM t_letitbe
       )
GROUP BY seq_vc  
 --group by�� ����غ���
SELECT seq_vc, WORDS_VC FROM T_LETITBE

