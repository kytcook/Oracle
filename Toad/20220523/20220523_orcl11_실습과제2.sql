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

SELECT TIME_NU AS "작업시간"
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC


INSERT into T_WORKTIME
(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)


SELECT dual
      ,TIME_NU AS "작업시간"
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC

-------------------선생님이 풀이-------------------

SELECT * FROMT T_WORKTIME

SELECT workcd_vc, time_nu FROM t_worktime

SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc

SELECT rownum workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc
--order by 없이 정렬해보면 
SELECT rownum workcd_vc, time_nu FROM t_worktime

SELECT rownum rnk, time_nu
  FROM (
        SELECT workcd_vc, time_nu FROM t_worktime
        ORDER BY time_nu asc
        )
