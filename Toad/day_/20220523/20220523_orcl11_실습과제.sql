--WORKCD_VC    TIME_NU    RNK
--2022년 5월 23일 데이터베이스 구현 과제입니다.        
--이들 데이터의 작업시간이 짧게 걸리는 시간 순서대로 1부터 15까지의 순위를         
--매겨서 출력하시오.  
--------------------------------------------------------------------      
SELECT SEQ_VC 
      ,WORKCD_VC
      ,TIME_NU
      ,RANK() OVER(ORDER BY TIME_NU ASC)
  FROM T_WORKTIME
 ORDER BY TIME_NU ASC
 -- RANK() OVER(ORDER BY TIME_NU ASC) : 중복순위가 존재하면 중복된 개수만큼 다음 순위 값을 증가시킨다.
 
SELECT SEQ_VC 
      ,WORKCD_VC
      ,TIME_NU
      ,DENSE_RANK() OVER(ORDER BY TIME_NU ASC)
  FROM T_WORKTIME
 ORDER BY TIME_NU ASC
 -- DENSE_RANK() OVER(ORDER BY TIME_NU ASC) : 중복순위가 존재해도 순차적으로 다음 순위 값을 표시한다.
---------------------------------------------------------------------- 

 ROLLBACK
---------------------------------------------------------------------------- 
 SELECT * FROM T_WORKTIME
 
SELECT TIME_NU
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC
------------------------------------------------------------------
SELECT TIME_NU AS "작업시간"
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC

