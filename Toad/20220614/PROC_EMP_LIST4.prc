CREATE OR REPLACE PROCEDURE proc_emp_salupdate(p_empno IN number, msg OUT varchar2)
IS
   v_rate number; --���� 1.1 or 1.2
   avg_sal number; --��ձ޿���� ����
   my_name varchar2(30); -- �޿��λ� ��� �̸��� ��� ����
   my_sal number; -- ���� �޴� �޿� ��� ����
   up_sal number; --������ �޿��� ��� ����
BEGIN 
   SELECT ename, sal INTO my_name, my_sal
     FROM emp
    WHERE empno = p_empno; --1�� �϶��� into���� ��밡����.
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
       COMMIT; --Ŀ������� ���� ������̺� ����ȴ�.
       msg:= my_name||'�����'||my_sal||'�޿���'||up_sal||'���� �λ� �Ǿ����ϴ�.'    
END;