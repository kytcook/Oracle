SELECT * FROM member;

--프로시저 - 전체목록 조회
--프로시저 안에서는 입력,조회,수정이 한 번에 다된다.
--테이블에 있는 건 데이터이다
--프로시저는 하나의 오브젝트이다.
---- connection con 오라클 서버에 접속할 때마다 핑을 날려본다. -> 연결이된다.
--prepare
--insert문
--인서트 메소드 따로 아이디 중복검사 메소드 따로
---> 프로시저라는 구조체 안에 넣게 되면 한개의 메소드 안에서 한번에 처리할 수 있다.(stored procedure:저장프로시저)
---> 재사용을 위해서 - 저장 프로시저는 이름이 있어야 한다. create해준다.

프로시저가 데이터 자체를 가지고 있지는 않다.
OUT -> 오라클 서버 바깥쪽으로 내보내야 하는 정보에 대해서는 OUT속성을 이용해서 내보내게 되어있다.
자바와 같은 리턴타입이 없다.

--proc을 붙이면 프로시저를 만드려 하는구나~
CREATE OR REPLACE PROCEDURE proc_dept_list(p_dept OUT SYS_REFCURSOR)
IS
BEGIN
  -- 실행문
  OPEN p_dept
   FOR SELECT deptno, dname, loc FROM dept;
END;

----------------------
proc이라는 접두어로 표시
파라미터로 듣기와 쓰기를 다한다 프로시저는
프로시저도 일종의 오브젝트이다. 그런데 프로시저의 이름을 정할 수 있다.
듣기와 말하기를 할 수 있다.
IN 듣기. 내보낼때는 OUT
직관적이지 않은것은 다 싫어한다

CREATE OR REPLACE PROCEDURE proc_sal(v_ename IN varchar2, v_sal OUT number)
IS
BEGIN
 SELECT sal into v_sal -- select 안에 into는 프로시저 안에서만 사용 가능하다.
   FROM emp
  WHERE ename = v_ename;
END; -- 좌중괄호 우중괄호 대신에 END를 사용 


CREATE OR REPLACE PROCEDURE proc_emp_list(p_emp OUT SYS_REFCURSOR)
IS
BEGIN
    --실행문
  OPEN p_emp
   FOR SELECT a,empno, b.dname, a.ename
         FROM emp a, dept b
        WHERE a.deptno = b.deptno;
END;

CREATE OR REPLACE PROCEDURE proc_emp_list(p_emp OUT SYS_REFCURSOR)
IS
BEGIN
    --실행문
  OPEN p_emp
   FOR SELECT a.empno, b.dname, a.ename
         FROM emp a, dept b
        WHERE a.deptno = b.deptno;
  INSERT INTO dept(deptno, dname, loc) VALUES(81, '유지보수팀', '포항');
  COMMIT;
END;