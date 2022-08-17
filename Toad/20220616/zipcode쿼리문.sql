SELECT mem_no, mem_id, mem_pw
      ,mem_name, mem_zipcode, mem_address
  FROM member
ORDER BY mem_no desc
  
SELECT mem_no, mem_id, mem_pw
      ,mem_name, mem_zipcode, mem_address
  FROM member
 WHERE mem_id='test'
 
SELECT mem_no, mem_id, mem_pw
      ,mem_name, mem_zipcode, mem_address
  FROM member
 WHERE mem_id='kiwi' -- 널값을 허용하므로 빈 값이어도 입력이 된다.
 
SELECT 
        zipcode, address
  FROM  zipcode_t
 WHERE  dong LIKE '%'||'역삼'||'%' -- ?: 역삼이 들어가면 역삼이 들어가는건 다 검색이 되는 쿼리문