SELECT member
  FROM emp;

SELECT member
  FROM emp;
  
SELECT member
  FROM emp;
      
/*  
�α����� ����
�ƴ�
ȸ�������� ���� �ΰ���?

ȸ�����Խ� ���̵� �ߺ��˻� �������� �ۼ��� ����.
*/
SELECT count(mem_id)
  FROM member
 WHERE mem_id =:x;
 
SELECT 1 FROM member
WHERE mem_id='apple';

SELECT 1 FROM member
WHERE mem_id='apple';

--���������� where�� �Ʒ� select���� ���Ѵ�.

SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple5');
                
SELECT 1
  FROM dual
 WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple5');

SELECT NVL(hobby,'����') FROM temp;

SELECT NVL((
            SELECT 1
             FROM dual
            WHERE EXISTS (SELECT mem_name
                 FROM member
                WHERE mem_id='apple6')
          ),0)
--0�̸� ���̵� ����  
  FROM dual; 
  



--�ζ��κ�� from�� �Ʒ� select���� ����.

SELECT rownum rno, empno, ename FROM emp;

SELECT rownum rno, empno, ename FROM emp
WHERE rownum <= 5; -- ũ�ٴ� �񱳴� �ȵȴ�.

SELECT
       rownum rno, cdate, amt
  FROM test02;

SELECT
       rownum cno, cdate, crate
  FROM test02;

SELECT
       a.cdate, a.amt, a.amt*b,crate
  FROM (
        SELECT
               rownum rno, cdate, amt
          FROM test02
       )a,
       (
        SELECT
               rownum cno, cdate, crate
          FROM test02       
       )b;
       
SELECT
        a.cdate, a.amt, a.amt*b.crate
  FROM (
        SELECT
               rownum rno, cdate, amt
          FROM test02
       )a,
       (
        SELECT
               rownum cno, cdate, crate
          FROM test02       
       )b
 WHERE a.rno-1 = b.cno
 
 SELECT
        a.cdate, a.amt, TO_CHAT(a.amt*b.crate,'999,999,999,999')||'��' as "��ȭ�ݾ�"
  FROM (
        SELECT
               rownum rno, cdate, amt
          FROM test02
       )a,
       (
        SELECT
               rownum cno, cdate, crate
          FROM test02       
       )b
 WHERE a.rno-1 = b.cno