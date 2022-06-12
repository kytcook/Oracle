SELECT * FROM dept;

INSERT INTO dept(deptno, dname, loc)
          VALUES(71,'개발1팀','서귀포');

--int result = pstmt.excuteUpdate();

SELECT * FROM dept
 WHERE deptno = 71;
 
COMMIT; 

-- 테이블의 모든 값이 변경되므로 주의. 롤백할것
UPDATE dept
   SET dname = '개발2팀'
      ,loc = '거제도';

-- 조건절을 주어서 특정 컬럼만 변경
UPDATE dept
   SET dname = '개발2팀'
      ,loc = '거제도'
 WHERE deptno = 71;

rollback; 

DELETE FROM dept
 WHERE deptno = (71,40);
 
--데이터의 추가 삭제 커밋 롤백에 대한 이해 
--남의 서버 들어가서 데이터 조작해보기
--내가 insert를 했어도 commit을 하지 않았다면 다른사람이 내 서버에 들어와서 보여지는 테이블엔 반영X
--보통은 신입개발자에게 권한을 주지 않는다.


부서 CRUD 실습