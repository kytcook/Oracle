--문제1            
--영화 티켓을 받을 수 있는 사람의 명단과 현재 가지고 있는 포인트, 영화 티켓의 포인트            
--그리고 그 티켓을 사용한 후 남은 예상 포인트를 출력하시오.            
--            
--            
--이름       보유      적용     남은 예상
--노정환    40208    15000    25208
--김현식    100205   15000    85205
--김선우    80204    15000    65204
--김유신    50012    15000    35012

SELECT * FROM t_giftmem;

SELECT * FROM t_giftpoint;

SELECT *
  FROM t_giftmem, t_giftpoint;
  
SELECT t_giftmem.point_nu as "보유포인트"
  FROM t_giftmem, t_giftpoint;  

SELECT t_giftmem.point_nu as "보유포인트"
      ,t_giftpoint.point_nu as "적용포인트"
      ,t_giftmem.point_nu - t_giftpoint.point_nu as "잔여포인트"
  FROM t_giftmem, t_giftpoint;
  
--왜 음의 수가 나오는 걸까요?
--내가 보유하고 포인트로 가질 수 없는 상품이 있다.

--내가 보유한 포인트 >= 상품의 포인트

--음수는 내가 가질 수 없는 상품이다.제외시켜야 한다.
--문제를 천천히 꼼꼼하게 읽어서 최대한의 정보를 얻어내자

--영화티켓인건 중에서 and
--6개 상품중에서 하나만 따진다.
mem.point_nu >= point.point_nu

이름 보유포인트 적용포인트 보유포인트-적용포인트

6개 중에서 하나만 비교한다.

SELECT point_nu
  FROM t_giftpoint
 WHERE name_vc = '영화티켓'
 
SELECT mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '영화티켓'
       )point
       
SELECT mem.point_nu as "보유포인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '영화티켓'
       )point
WHERE mem.point_nu >= point.point_nu       

SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '영화티켓'
       )point
WHERE mem.point_nu >= point.point_nu  
 --옵티마이저가 찾는 일을 줄여주기 위해서 인라인뷰를 선택한다.경우의 수를줄여준다


SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu 
   AND point.name_vc = '영화티켓'
   
 
--변수싫어요 상수좋아요
--변수 x는 UI에서 가져온다.
SELECT mem.name_vc as "회원이름"
      ,mem.point_nu as "보유포인인트"
      ,point.point_nu as "적용포인트"
      ,mem.point_nu - point.point_nu as "잔여포인트"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu 
   AND point.name_vc =:x

변수 x는 UI에서 가져온다.
   
 ---------------------------
---------------------------------------------------------- 
----------------------------------------------------------
--문제2    
--김유신씨가 보유하고 있는 마일리지 포인트로 얻을 수 있는 상품 중 가장 포인트가 높은 것은    
--무엇인가?    
--    
--NAME_VC    POINT_NU
--한과세트      50000

SELECT
       point_nu
  FROM t_giftmem
 WHERE name_vc = '김유신';
 
SELECT
       point_nu
  FROM t_giftmem
 WHERE name_vc =:name;
 
SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= 50012;
 

-- 상수좋아여
-- 서브쿼리 : 50012를 준게 아니라 김유신을 줬다
-- 5만을 씌운다 max
SELECT max(point_nu)
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '김유신'
                   ) ;

--그룹함수와 일반컬럼은 같이 사용할 수 없다
--
SELECT max(point_nu), max(name_vc)
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '김유신'
                   ); 

SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = 50000;
 
 
SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = (
                    SELECT max(point_nu)
                      FROM t_giftpoint
                     WHERE point_nu <= (
                                        SELECT
                                               point_nu
                                          FROM t_giftmem
                                         WHERE name_vc = '김유신'
                                        ) 
                   );
                   
----------------------------------------------
SELECT
       ename
  FROM emp;
 
--첫글자가 S 
SELECT
       ename
  FROM emp
 WHERE ename LIKE 'S%';
 
--끝글자가 S 
SELECT
       ename
  FROM emp
 WHERE ename LIKE '%S';
 
--S포함 
SELECT
       ename
  FROM emp
 WHERE ename LIKE '%S%' 

---------------------------------------------- 
선분조건
점조건

SELECT ename, sal
  FROM emp
 WHERE sal > 1000
   AND sal < 3000
   
SELECT ename, sal
  FROM emp
 WHERE sal BETWEEN 1000 AND 3000
 
 
--등호는 항상 오른쪽에 온다. 
SELECT ename, sal
  FROM emp
 WHERE sal >= 1000
   AND sal <= 3000
 
SELECT
* 
  FROM temp
  
