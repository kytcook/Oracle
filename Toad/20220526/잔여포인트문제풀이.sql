--����1            
--��ȭ Ƽ���� ���� �� �ִ� ����� ��ܰ� ���� ������ �ִ� ����Ʈ, ��ȭ Ƽ���� ����Ʈ            
--�׸��� �� Ƽ���� ����� �� ���� ���� ����Ʈ�� ����Ͻÿ�.            
--            
--            
--�̸�       ����      ����     ���� ����
--����ȯ    40208    15000    25208
--������    100205   15000    85205
--�輱��    80204    15000    65204
--������    50012    15000    35012

SELECT * FROM t_giftmem;

SELECT * FROM t_giftpoint;

SELECT *
  FROM t_giftmem, t_giftpoint;
  
SELECT t_giftmem.point_nu as "��������Ʈ"
  FROM t_giftmem, t_giftpoint;  

SELECT t_giftmem.point_nu as "��������Ʈ"
      ,t_giftpoint.point_nu as "��������Ʈ"
      ,t_giftmem.point_nu - t_giftpoint.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem, t_giftpoint;
  
--�� ���� ���� ������ �ɱ��?
--���� �����ϰ� ����Ʈ�� ���� �� ���� ��ǰ�� �ִ�.

--���� ������ ����Ʈ >= ��ǰ�� ����Ʈ

--������ ���� ���� �� ���� ��ǰ�̴�.���ܽ��Ѿ� �Ѵ�.
--������ õõ�� �Ĳ��ϰ� �о �ִ����� ������ ����

--��ȭƼ���ΰ� �߿��� and
--6�� ��ǰ�߿��� �ϳ��� ������.
mem.point_nu >= point.point_nu

�̸� ��������Ʈ ��������Ʈ ��������Ʈ-��������Ʈ

6�� �߿��� �ϳ��� ���Ѵ�.

SELECT point_nu
  FROM t_giftpoint
 WHERE name_vc = '��ȭƼ��'
 
SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'
       )point
       
SELECT mem.point_nu as "��������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'
       )point
WHERE mem.point_nu >= point.point_nu       

SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "����������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem
    , (
        SELECT point_nu
          FROM t_giftpoint
         WHERE name_vc = '��ȭƼ��'
       )point
WHERE mem.point_nu >= point.point_nu  
 --��Ƽ�������� ã�� ���� �ٿ��ֱ� ���ؼ� �ζ��κ並 �����Ѵ�.����� �����ٿ��ش�


SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "����������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu 
   AND point.name_vc = '��ȭƼ��'
   
 
--�����Ⱦ�� ������ƿ�
--���� x�� UI���� �����´�.
SELECT mem.name_vc as "ȸ���̸�"
      ,mem.point_nu as "����������Ʈ"
      ,point.point_nu as "��������Ʈ"
      ,mem.point_nu - point.point_nu as "�ܿ�����Ʈ"
  FROM t_giftmem mem, t_giftpoint point
 WHERE mem.point_nu >= point.point_nu 
   AND point.name_vc =:x

���� x�� UI���� �����´�.
   
 ---------------------------
---------------------------------------------------------- 
----------------------------------------------------------
--����2    
--�����ž��� �����ϰ� �ִ� ���ϸ��� ����Ʈ�� ���� �� �ִ� ��ǰ �� ���� ����Ʈ�� ���� ����    
--�����ΰ�?    
--    
--NAME_VC    POINT_NU
--�Ѱ���Ʈ      50000

SELECT
       point_nu
  FROM t_giftmem
 WHERE name_vc = '������';
 
SELECT
       point_nu
  FROM t_giftmem
 WHERE name_vc =:name;
 
SELECT point_nu
  FROM t_giftpoint
 WHERE point_nu <= 50012;
 

-- ������ƿ�
-- �������� : 50012�� �ذ� �ƴ϶� �������� ���
-- 5���� ����� max
SELECT max(point_nu)
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������'
                   ) ;

--�׷��Լ��� �Ϲ��÷��� ���� ����� �� ����
--
SELECT max(point_nu), max(name_vc)
  FROM t_giftpoint
 WHERE point_nu <= (
                    SELECT
                           point_nu
                      FROM t_giftmem
                     WHERE name_vc = '������'
                   ); 

SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = 50000;
 
 
SELECT name_vc, point_nu
  FROM t_giftpoint
 WHERE point_nu = (
                    SELECT max(point_nu)
                      FROM t_giftpoint
                     WHERE point_nu <= (
                                        SELECT
                                               point_nu
                                          FROM t_giftmem
                                         WHERE name_vc = '������'
                                        ) 
                   );
                   
----------------------------------------------
SELECT
       ename
  FROM emp;
 
--ù���ڰ� S 
SELECT
       ename
  FROM emp
 WHERE ename LIKE 'S%';
 
--�����ڰ� S 
SELECT
       ename
  FROM emp
 WHERE ename LIKE '%S';
 
--S���� 
SELECT
       ename
  FROM emp
 WHERE ename LIKE '%S%' 

---------------------------------------------- 
��������
������

SELECT ename, sal
  FROM emp
 WHERE sal > 1000
   AND sal < 3000
   
SELECT ename, sal
  FROM emp
 WHERE sal BETWEEN 1000 AND 3000
 
 
--��ȣ�� �׻� �����ʿ� �´�. 
SELECT ename, sal
  FROM emp
 WHERE sal >= 1000
   AND sal <= 3000
 
SELECT
* 
  FROM temp
  
