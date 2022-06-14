SELECT * FROM member;

--���ν��� - ��ü��� ��ȸ
--���ν��� �ȿ����� �Է�,��ȸ,������ �� ���� �ٵȴ�.
--���̺� �ִ� �� �������̴�
--���ν����� �ϳ��� ������Ʈ�̴�.
---- connection con ����Ŭ ������ ������ ������ ���� ��������. -> �����̵ȴ�.
--prepare
--insert��
--�μ�Ʈ �޼ҵ� ���� ���̵� �ߺ��˻� �޼ҵ� ����
---> ���ν������ ����ü �ȿ� �ְ� �Ǹ� �Ѱ��� �޼ҵ� �ȿ��� �ѹ��� ó���� �� �ִ�.(stored procedure:�������ν���)
---> ������ ���ؼ� - ���� ���ν����� �̸��� �־�� �Ѵ�. create���ش�.

���ν����� ������ ��ü�� ������ ������ �ʴ�.
OUT -> ����Ŭ ���� �ٱ������� �������� �ϴ� ������ ���ؼ��� OUT�Ӽ��� �̿��ؼ� �������� �Ǿ��ִ�.
�ڹٿ� ���� ����Ÿ���� ����.

--proc�� ���̸� ���ν����� ����� �ϴ±���~
CREATE OR REPLACE PROCEDURE proc_dept_list(p_dept OUT SYS_REFCURSOR)
IS
BEGIN
  -- ���๮
  OPEN p_dept
   FOR SELECT deptno, dname, loc FROM dept;
END;

----------------------
proc�̶�� ���ξ�� ǥ��
�Ķ���ͷ� ���� ���⸦ ���Ѵ� ���ν�����
���ν����� ������ ������Ʈ�̴�. �׷��� ���ν����� �̸��� ���� �� �ִ�.
���� ���ϱ⸦ �� �� �ִ�.
IN ���. ���������� OUT
���������� �������� �� �Ⱦ��Ѵ�

CREATE OR REPLACE PROCEDURE proc_sal(v_ename IN varchar2, v_sal OUT number)
IS
BEGIN
 SELECT sal into v_sal -- select �ȿ� into�� ���ν��� �ȿ����� ��� �����ϴ�.
   FROM emp
  WHERE ename = v_ename;
END; -- ���߰�ȣ ���߰�ȣ ��ſ� END�� ��� 


CREATE OR REPLACE PROCEDURE proc_emp_list(p_emp OUT SYS_REFCURSOR)
IS
BEGIN
    --���๮
  OPEN p_emp
   FOR SELECT a,empno, b.dname, a.ename
         FROM emp a, dept b
        WHERE a.deptno = b.deptno;
END;

CREATE OR REPLACE PROCEDURE proc_emp_list(p_emp OUT SYS_REFCURSOR)
IS
BEGIN
    --���๮
  OPEN p_emp
   FOR SELECT a.empno, b.dname, a.ename
         FROM emp a, dept b
        WHERE a.deptno = b.deptno;
  INSERT INTO dept(deptno, dname, loc) VALUES(81, '����������', '����');
  COMMIT;
END;