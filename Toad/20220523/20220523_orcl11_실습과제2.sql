--WORKCD_VC    TIME_NU    RNK
--2022�� 5�� 23�� �����ͺ��̽� ���� �����Դϴ�.        
--�̵� �������� �۾��ð��� ª�� �ɸ��� �ð� ������� 1���� 15������ ������         
--�Űܼ� ����Ͻÿ�.  

--------------------------------------------------------------------      
SELECT SEQ_VC 
      ,WORKCD_VC
      ,TIME_NU
      ,RANK() OVER(ORDER BY TIME_NU ASC)
  FROM T_WORKTIME
 ORDER BY TIME_NU ASC
 -- RANK() OVER(ORDER BY TIME_NU ASC) : �ߺ������� �����ϸ� �ߺ��� ������ŭ ���� ���� ���� ������Ų��.
 
SELECT SEQ_VC 
      ,WORKCD_VC
      ,TIME_NU
      ,DENSE_RANK() OVER(ORDER BY TIME_NU ASC)
  FROM T_WORKTIME
 ORDER BY TIME_NU ASC
 -- DENSE_RANK() OVER(ORDER BY TIME_NU ASC) : �ߺ������� �����ص� ���������� ���� ���� ���� ǥ���Ѵ�.
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
SELECT TIME_NU AS "�۾��ð�"
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC

SELECT TIME_NU AS "�۾��ð�"
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC


INSERT into T_WORKTIME
(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)


SELECT dual
      ,TIME_NU AS "�۾��ð�"
      ,SEQ_VC
      ,WORKCD_VC
  FROM T_WORKTIME
ORDER BY TIME_NU ASC

-------------------�������� Ǯ��-------------------

SELECT * FROMT T_WORKTIME

SELECT workcd_vc, time_nu FROM t_worktime

SELECT workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc

SELECT rownum workcd_vc, time_nu FROM t_worktime
ORDER BY time_nu asc
--order by ���� �����غ��� 
SELECT rownum workcd_vc, time_nu FROM t_worktime

SELECT rownum rnk, time_nu
  FROM (
        SELECT workcd_vc, time_nu FROM t_worktime
        ORDER BY time_nu asc
        )
