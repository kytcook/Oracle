select * from t_worktime;

select time_nu as "일한 시간" 
  from t_worktime 
order by time_nu asc;

--select time_nu as "일한 시간" rank() over (order by time_nu asc) '순위' from t_worktime order by time_nu as 순위 from t_worktime


-- rank() over 함수 사용
select seq_vc, workcd_vc, time_nu
     , Rank() over(order by time_nu asc) as "순위" 
  from t_worktime;

select seq_vc, workcd_vc, time_nu as "일한 시간"
     , Rank() over(order by time_nu asc) 순위 
from t_worktime;

-->>

select * from t_worktime;

select workcd_vc, time_nu from t_worktime;

select workcd_vc, time_nu 
  from t_worktime
order by time_nu asc;

select rownum rnk, workcd_vc, time_nu 
  from t_worktime
order by time_nu asc;


select rownum rnk, workcd_vc, time_nu 
  from t_worktime
 
 from (
        select workcd_vc, time_nu from t_worktime
        order by time_nu asc
       )

select ename from emp;

select deptno from dept;

select ename, deptno, ename
  from emp;
  
select dname from dept;

select a.time_nu, b.time_nu from t_worktime a, t_worktime b

select rownum rno, ename from emp
 where rownum < 4
 
 
select a.time_nu, b.time_nu from t_worktime a, t_worktime b

select time_nu from t_worktime
 where rownum < 4
 
select
       a.time_nu
  from (
        select time_nu from t_worktime
        where rownum < 4
       )a, -- a집합 
       (
        select time_nu from t_worktime
        where rownum < 4
       )b -- b집합
 where a.time_nu < b.time_nu
 
 
select
       a.time_nu
  from (
        select time_nu from t_worktime
        where rownum < 4
       )a, -- a집합 
       (
        select time_nu from t_worktime
        where rownum < 4
       )b -- b집합
 where a.time_nu <= b.time_nu
group by a.time_nu
order by count(b.time_nu) asc
 
 
 
 
-- 사원집합에서 deptnosms
-- 부서집합에서 deptno는 pk이다.
-- 부서집합에서 deptno를 받아서 태어난 자손이 사원집합이고,
-- 따라서 부모의 deptno가 자손으로 가서 외래키가 되었다.

select deptno from emp, dept

select a.deptno from emp a, dept b

select b.deptno from emp a, dept b

select empno from emp