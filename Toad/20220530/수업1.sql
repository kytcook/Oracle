-- 인덱스가 있어서 정렬이 되어 있따.
SELECT empno FROM emp;

-- 인덱스가 없다. 정렬이 안 돼 있다.
SELECT ename FROM emp;

SELECT ename FROM emp
 WHERE empno = 7566;
 
 --함수를 씌어서 사용하더라도 똑같이 인덱스를 사용하고 있닫.
SELECT ename FROM emp
 WHERE NVL(empno, 0) = 7566; 

-- 옵티마이저 차이가 크다 oracle vs sql 빅데이터에서..
SELECT /*+index_desc(emp PK_EMP) */empno
  FROM emp;

SELECT ename FROM emp
ORDER BY ename desc;

SELECT ename FROM emp
 WHERE ename is null;
 
SELECT ename FROM emp
 WHERE ename 'XXX';
 

-- 인덱스가 있다고 무조건 사용되는것은 아니다
-- 인덱스가 있는 컬럼이더라도 가공하면 인덱스를 사용할 수 없다. 
SELECT ename FROM emp
 WHERE NVL(ename,'0') = 'XXX';
 


  
create  index i_ename
on emp(ename);

SELECT ename, deptno
  FROM emp

SELECT ename, deptno
  FROM emp
  
 GROUP BY 절에 사용한 컬럼만 사용가능하다.
 
SELECT ename, deptno
  FROM emp
 GROUP BY deptno, ename

SELECT count(ename), deptno
  FROM emp
 GROUP BY deptno

SELECT * FROM dept 

--56(14*4)건 - 일어날 수 있는 모든 경우의 수이다. - 카타시안의 곱 - 묻지마 조인

SELECT
       emp.ename, dept.deptno
  FROM emp, dept

National JOIN = equal join

--양쪽에 있는것만 나온다.
SELECT
       COUNT(emp.ename), dept.deptno.dname
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno -- 현재의 부서정보  
GROUP BY dept.deptno, dept.dname

서브쿼리, 인라인뷰

--양쪽(emp[10,20,30] dept[10,20,30,40]) 테이블에 있는 것이 아닌 한쪽 테이블에만 있고
--다른 한쪽테이블(dept)에만 있고 다른 한쪽(emp)에는 없는 것(40)을 출력할 때
--나(emp)는 null로 하더라도 너(dept)는 있으면 보여줄래?
--null이 와야하는 쪽에 '+'기호를 붙여준다
--반대쪽에 '+'기회를 주면 없다
SELECT
       COUNT(emp.ename), dept.deptno.dname
  FROM emp, dept
 WHERE emp.deptno(+) = dept.deptno -- 현재의 부서정보  
GROUP BY dept.deptno, dept.dname

--널은 모른다 잖아
--모르는걸 셀 수가 있ㄴ?

ename은 not null 
pk not null unique unique index

SELECT
       COUNT(ename), COUNT(COMM), COUNT(*)
  FROM emp
  
왜 comm에 null이 있는 걸까? - 설계가 잘못됨

--NVL 널값도 센다
SELECT
       COUNT(ename), COUNT(NVL(comm,0)), COUNT(*) 
  FROM emp
  
널인 건 굳이 세지 않는다.
널인 경우를 굳이 계산하지 않는다.

SELECT sum(comm) FROM emp

SELECT distinct(deptno) FROM emp

--중복값이 나온다
SELECT deptno FROM emp
UNION ALL
SELECT deptno FROM dept

--중복값을 제거한다
SELECT deptno FROM emp
UNION 
SELECT deptno FROM dept
------------------------------------------------------

SELECT ename FROM emp
ORDER BY ename desc;


--인덱스를 사용할 수 있기 때문에 Oracle사용 (성능)
--PK는 인덱스 사용, FK는 안됨