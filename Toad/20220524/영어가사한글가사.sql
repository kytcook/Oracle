--�ζ��κ�� UNION ALL Ȱ���Ͽ� Ǯ���� ����

--3. ����� �ѱ۰��� ������ ������ �ϱ�

SELECT * FROM t_letitbe;

SELECT seq_vc 
      ,TO_NUMBER(seq_vc)
  FROM t_letitbe;
--�Լ��� ����� ���� ����
--�Լ��� ������ ���´� ��¥��(���纻�̴�).


SELECT empno FROM emp
DECODE(MOD(2,2),1,'Ȧ��')

SELECT DECODE(MOD(2,2),0,'Ȧ��')
  FROM dual
  
IF 2%2=0 THEN
  return '¦��'
ELSIF 2%2=1 THEN
  return 'Ȧ��'
END;

SELECT
       MOD(seq_vc,2) n
  FROM t_letitbe

SELECT
       MOD(seq_vc,2) n
  FROM t_letitbe
 WHERE n = 1
 --��Ī �˸��߽� ��Ī�� ���� ���� �����ʴ�.
 
SELECT
    n
  FROM (
       SELECT
              MOD(seq_vc,2) n
         FROM t_letitbe
       )
WHERE n=1
--�ζ��κ� : FROM�� �ؿ� SELECT���� ���� �ζ��κ�
-- ���̺��� �ƴϰ� ����
-- �ζ��κ並 ���� ���������� �˸��߽� ���� ����� �� �ִ�.

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

----------------------------2��
SELECT
       rownum no, kor_words
  FROM (
        SELECT
               MOD(seq_vc,2) no
              ,DECODE(MOD(seq_vc,2),0,words_vc) kor_words
          FROM t_letitbe
       )
WHERE no=0


--------------------------------3��
-�ΰ� ���� �ϳ��� �׷����ִ� �� -group by

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

