declare
   hap number :=0;
   i number :=1;
begin
  while i<=1 loop
    if MOD(i,2) =0 then
      hap:=hap+i;
    end if;
    i:=i+1;
  end loop;
    dbms_output.put_line('1부터 10까지의 합은'||hap);
    end;


CREATE OR REPLACE PROCEDURE proc_emp_salupdate(p_empno IN number, msg OUT varchar2)
IS
   v_rate number; --할증 1.1 or 1.2
   avg_sal number; --평균급여담는 변수
   my_name varchar2(30); -- 급여인상 대상 이름을 담는 변수
   my_sal number; -- 내가 받는 급여 담는 변수
   up_sal number; --수정된 급여액 담는 변수
BEGIN 
   SELECT ename, sal INTO my_name, my_sal
     FROM emp
    WHERE empno = p_empno; --1건 일때만 into문을 사용가능함.
   SELECT avg(sal) INTO avg_sal
     FROM emp
    WHERE deptno = (SELECT deptno
                      FROM emp
                     WHERE empno = p_empno);
       IF my_sal > avg_sal THEN
        v_rate:=1.1;
       else
          v_rate:=1.2;
       END IF;
       up_sal:= my_sal * v_rate;
       UPDATE emp SET sal = up_sal
        WHERE empno = p_empno;
       COMMIT; --커밋해줘야 실제 디비테이블에 적용된다.
       msg:= my_name||'사원의'||my_sal||'급여가'||up_sal||'으로 인상 되었습니다.'    
END