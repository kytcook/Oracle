variable p_emp refcursor;
exec proc_emp_list(:p_emp);
print p_emp;

delete from dept where deptno=81

�����ȣ�� �Է� �޾Ƽ� ����� ���� �μ��� ��� �޿��� ���� ����
�� ����� ��պ��� ������ 10% �λ��� ��պ��� ������ 20% �޿��λ��� emp���̺� �ݿ��ϴ�
���ν����� �ۼ��Ͻÿ�.

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
    dbms_output.put_line('1���� 10������ ����'||hap);
    end;
