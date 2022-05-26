SELECT
       point_nu
       ,rank() over(order by point_nu desc) rnk
       ,densc_rank() over(order by point_nu desc) rnk
  FROM t_greport