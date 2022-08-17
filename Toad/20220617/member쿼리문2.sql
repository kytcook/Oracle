아이디와 비번이 모두 일치하면 mem_name을 조회
비번이 틀리면 0반환
아이디가 존재하지 않으면 -1;

SELECT
       CASE WHEN mem_id =:id THEN 
        CASE WHEN mem_pw=:pw THEN mem_name
            ELSE '0'
        END
       ELSE '-1' 
       END as mem_name
  FROM member