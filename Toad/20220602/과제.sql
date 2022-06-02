/*
 System Name    :  TEST                                        
 Entity Name    : 
 Table  Name    :  T_ORDERBASKET
 작성자         :  노정환                     
 작성일         :  2004.04.21                             
 내용            :  장바구니를 보며 ROLLUP과 CUBE의 차이를 알아 봄
 비고         :  
*/

SELECT indate_vc as "판매날짜"
     , SUM(QTY_NU) as "판매개수"
     , SUM(PRICE_NU) as "판매가격"
  FROM T_ORDERBASKET
GROUP BY indate_vc;


SELECT 
       indate_vc as "판매날짜"
      ,SUM(QTY_NU) as "판매개수"
      ,SUM(PRICE_NU) as "판매가격"
  FROM T_ORDERBASKET
GROUP BY ROLLUP(seq_nu, indate_vc) ;


SELECT indate_vc as "판매날짜"
      ,SUM(QTY_NU) as "판매개수"
      ,SUM(PRICE_NU) as "판매가격"
  FROM T_ORDERBASKET
GROUP BY CUBE(indate_vc)