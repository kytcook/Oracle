/*
 System Name    :  TEST                                        
 Entity Name    : 
 Table  Name    :  T_ORDERBASKET
 �ۼ���         :  ����ȯ                     
 �ۼ���         :  2004.04.21                             
 ����            :  ��ٱ��ϸ� ���� ROLLUP�� CUBE�� ���̸� �˾� ��
 ���         :  
*/

SELECT indate_vc as "�Ǹų�¥"
     , SUM(QTY_NU) as "�ǸŰ���"
     , SUM(PRICE_NU) as "�ǸŰ���"
  FROM T_ORDERBASKET
GROUP BY indate_vc;


SELECT 
       indate_vc as "�Ǹų�¥"
      ,SUM(QTY_NU) as "�ǸŰ���"
      ,SUM(PRICE_NU) as "�ǸŰ���"
  FROM T_ORDERBASKET
GROUP BY ROLLUP(seq_nu, indate_vc) ;


SELECT indate_vc as "�Ǹų�¥"
      ,SUM(QTY_NU) as "�ǸŰ���"
      ,SUM(PRICE_NU) as "�ǸŰ���"
  FROM T_ORDERBASKET
GROUP BY CUBE(indate_vc)