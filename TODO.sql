--2026.02.03

--107 108 1113 nv12

--107p
SELECT  empno, ename, sal ,comm ,
        to_char((sal*12)+nvl(comm,0), '999,999') "SALARY"
FROM emp
where ename = 'ALLEN';

SELECT  name, pay, bonus ,
        to_char((pay*12)+bonus, '999,999') "TOTAL"
FROM professor
where bonus  is not null 
and deptno = 201;

--108p
SELECT  empno, ename, hiredate ,
         to_char((sal*12)+comm, '999,999') "sal"
        ,to_char(((sal*12)+comm)*1.15, '999,999') "15%up"                
FROM emp
where comm is not null ;
select *
from emp;
--학생 테이블의 생년월일을 기준으로 1~3 => 1/4분기
--                            4~6 => 2/4분기
--                            7~9 => 3/4분기
--                            10~11 => 4/4분기

SELECT
empno,
ename,
comm
,nvl2(comm , 'Exist' , 'NULL')"NVL2"
     FROM emp
     where deptno = 30;

SELECT
name
,birthday
,to_char(birthday,'Q' ) || '/4분기' "quarter"
,ceil(to_char(birthday,'mm')/3) "quarter2"
     FROM student
     ORDER BY to_char(birthday,'Q' ) ASC;
     
