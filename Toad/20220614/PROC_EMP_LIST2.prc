variable p_emp refcursor;
exec proc_emp_list(:p_emp);
print p_emp;

delete from dept where deptno=81

사원번호를 입력 받아서 사원이 속한 부서별 평균 급여를 구한 다음
그 사원이 평균보다 많으면 10% 인상을 평균보다 적으면 20% 급여인상을 emp테이블에 반영하는
프로시저를 작성하시오.

declare
   dan number :=0;
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
