--TEMP의 자료 중에서 HOBBY가 등산 또는 낚시 인 경우를 읽어오기 위하여 다음과 같이 조건을 줄 수 있다.
SELECT emp_id, emp_name, hobby
  FROM temp
 WHERE hobby IN ('등산', '낚시') -- or이니까 둘 중에 하나만 만족해도 된다.
 

--HOBBY가 NULL 또는 '등산'인 경우

SELECT emp_id, emp_name, hobby
  FROM temp
 WHERE hobby IN (NULL,'등산') -- 모른다를 비교할 순 없다.
 
--위 조건을 다시 쓰면 다음과 같다.
SELECT emp_id, emp_name, hobby
  FROM temp
 WHERE hobby = NULL --자체가 항상 false이다.
    OR hobby = '등산'; 

SELECT 100 + null, 5*2, 5*null --NULL은 안된다. 암튼 안된다.
  FROM dual; 
  
--NULL은 어떤 값에 연산해도 NULL이므로 값을 모른다. FALSE이다.

--HOBBY가 NULL인 경우에 해당하는 6건은 빠져있다
--왜 빠졌을까?
   
-- 이렇게 되면 hobby = NULL 이란 조건은 항상 FALSE가 RETURN된다.
-- 왜일까?
-- NULL은 항상 IS NULL 또는 IS NOT NULL로 비교되어야 하기 때문이다.
 IS NULL과 IS NOT NULL습관화

-- 따라서 hobby = '등산' 인 경우만이 검색된다.
-- 그나마 IN이 OR의 개념과 같으므로 hobby = '등산'인 경우라도 
-- 검색된 것이다.

-- 그렇다면 
-- hobby가 NULL 또는 '낚시' 모두에 속하지 않는 경우
SELECT emp_id, emp_name, hobby
  FROM temp
 WHERE hobby NOT IN (NULL,'낚시');  

-- 이 경우 NULL과 '낚시'를 제외한 나머지 경우인 3건을 모두 검색할까
-- 아니면 낚시인 경우만 제외한 9건을 검색할까?
-- 둘 다 아니다 .
-- 한건도 검색하지 못한다.
-- NOT IN연산자에 NULL이 포함되면 어떠한 경우 일지라도 한 건도
-- DATA를 검색하지 못한다.

SELECT * FROM temp
 WHERE hobby <> NULL;
 
SELECT * FROM temp
 WHERE hobby <> NULL
   AND hobby <> '낚시';
 
SELECT * FROM temp
 WHERE hobby IS NOT NULL; 
  
SELECT * FROM temp
 WHERE hobby IS NOT NULL
   AND hobby <> '낚시' 
   
   
