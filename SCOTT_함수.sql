--함수--
SELECT
    name
    ,pay
    ,bonus
    ,pay*12 + nvl(bonus, 0)*3 as total
    ,nvl(bonus,0)
     FROM professor;
--     
--initcap('문자열'/컬럼)
SELECT initcap('hello')
FROM dual;

SELECT profno
,lower(name)
FROM professor;

SELECT ename
,initcap(ename)
from emp;

SELECT ename
,lower(ename)
,upper(ename)
from emp;

SELECT ename,LENGTH(ename)"LENGTH"
     FROM emp
     WHERE deptno =20;

    
SELECT 
    * FROM PROFESSOR
        WHERE lower(name) LIKE'%st%';

SELECT
    PROFNO,NAME,EMAIL,hiredate 
    FROM PROFESSOR
    WHERE LENGTH(name)<10 ;
--sbustr
SELECT 'hello,world'
        ,substr('hello,wordl', 1, 5)substrl -- +값이면 왼쪽 순번,
        ,substr('hello,wordl', -5, 5)substrl -- -값이면 오른쪽부터 왼쪽순번
        ,substr('0'||5,-2,2) mm
        ,substr('02)3456-2345', 1 ,instr('02)3456-2345',')', 1) -1) instrl
        ,substr('034)3456-2345', 1 ,instr('034)3456-2345',')', 1) -1) instrl 
        ,instr('031)2345-2312',')',1) instr2 --문자열에서 찾을 문자열의 위치 변환.
        FROM dual;
        
        
--주전공(210) -> 전화번호 지역번호 구분
SELECT
    name
    ,tel
    ,substr(tel , 1 , instr(tel,')', 1)-1)as 지역번호
    ,substr(tel --문자열
        ,instr(tel, ')' , 1) +1 --시작위치
        ,instr(tel, '-',1) - instr(tel, ')',1) -1 --크기
        )as  "lst No"
    ,substr(tel --문자열
        ,instr(tel, '-' , 1) +1 --시작위치
        ,instr(tel, '-',1) - instr(tel, ')',1) -1 --크기
        )as "lst No1"
    FROM student;

-- lpad/ rpad
SELECT 
    lpad('hello', 10, '*')--10개의 자리에 빈공간이 있으면 *로 채우겠습니다
    ,rpad('hello', 10 , '$')-- 10개의 자리에 빈공간이 있으면 $로 채우겠습니다
     FROM dual;

SELECT 
    lpad(ename, 9, '1234567')
    ,rpad(ename, 10 , '-')
     FROM emp
     where deptno = 10;
     
SELECT 
    rpad(ename , 9, substr('123456789', lengthb(ename)+1))
     FROM emp
     where deptno = 10;

SELECT replace('Hello', 'e','E')
FROM dual;

SELECT ename
    ,replace(ename,substr(ename, 1, 2) , '**')
FROM emp
WHERE deptno = 10;

SELECT ename
    ,replace(ename,substr(ename, 2, 3) , '--')
FROM emp
WHERE deptno = 20;

SELECT name , jumin
    ,replace(jumin,substr(jumin, 7, 13) , '-/-/-/-')
FROM student
WHERE deptno1 = 101 ;

SELECT name , TEL
    ,replace(tel,
    substr(tel,instr(TEL, ')' ,1)+1 
    ,instr(TEL, '-' , 1) - instr(TEL, ')', 1) -1)
    , '***')
FROM student
WHERE deptno1 = 102 ;

SELECT name , TEL
    ,replace(tel,
             substr(tel,instr(TEL, '-' ,1)+1 
                  ,instr(TEL, '-' , 1)+1 - instr(TEL, ')', 1)-1)
           , '****')
FROM student
WHERE deptno1 = 101 ;

SELECT round(123.456, 2) --소수점 반올림
        ,trunc(123.4)
        ,mod(12,5) --나눈후 나머지
        ,ceil(12.3)
        ,floor(12.3)
        ,trunc(sysdate)
        ,to_char( trunc(sysdate, 'mm'), 'rrrr/mm/dd hh24:mi:ss')
FROM dual;

--날짜관련함수
SELECT
    add_months(SYSDATE, 0) next_months-- 값 +일
    ,months_between(sysdate + 28, sysdate)
    FROM dual;
    
SELECT 
EMPNO, 
ename ,
hiredate,
trunc(months_between(sysdate, hiredate )/12) || '년' ||
mod(trunc(months_between(sysdate, hiredate)),12)||'개월' 근속일수
FROM emp;

SELECT count(*)
FROM professor;

SELECT profno,name,p.deptno, dname
FROM professor p, department d
WHERE p.deptno = d.deptno ;

SELECT
profno
,name
,hiredate
,position
,pay -- 교수번호 , 이름, 입사일자 ,급여 (20년 이상 , software Enginearing)
,p.deptno
FROM professor p , department d
WHERE p.deptno = d.deptno
and d.dname = 'Software Engineering'
and (months_between(sysdate, hiredate)/12) >= 20;
--order by 3;

SELECT
    EMPNO, ENAME, SAL , DNAME
    FROM  
 emp,dept
 where 
 emp.deptno = dept.deptno
 and dname = 'SALES'
 and (months_between(sysdate, hiredate)/12) >= 40
order by emp.empno; --sales부서에 근속년 40년이 넘는 사람 , 사번, 이름,급여

SELECT 2 + '2'
,concat(2,'2')

FROM dual
  where  sysdate > '2026/02/03' ;
  
SELECT 
sysdate
    ,to_char(sysdate,'RRRR-MM-DD HH24:MI:SS')
    ,to_date('05/2024/03', 'DD/RRRR/MM'
     FROM dual;
     
-- to_char
SELECT to_char(12345.6789, '099,999.99') -- 반올림 한 연살결과 문자출력
    FROM dual;


SELECT studno, name, to_char(birthday, 'DD/MON/RR') as birthday
FROM student
WHERE to_CHAR(birthday, 'MM') = '01' ;

--nvl()
SELECT 
nvl(10,0) -- null ? 0 : 10
FROM dual;

SELECT pay + nvl(bonus, 0) " 월급 "
from professor;

-- student(profno) -> 없으면 9999 / 담당교수번호
SELECT 
    name,
    NVL(to_char(profno) , '담당 교수가 없습니다') 
FROM student;

-- decode(A, B, '같은조건','다른조건')
SELECT
    decode( 10, 20, '같다' , '다르다')
     FROM dual;
     
SELECT decode(profno, null, '9999' , profno)
FROM student
order by profno desc;

SELECT decode('A','c', '현재A','B' , '현재B', '기타')
FROM dual;

SELECT
    * FROM professor;

SELECT
    deptno
    ,name
    ,DECODE(deptno,101,'computer Engineering' , 'ETC') "DNAME"
    FROM professor;
    

SELECT *
FROM emp;

SELECT
    * FROM dept;
    
SELECT e.* , dname, loc
FROM emp e, dept d
where e.deptno = d.deptno
AND LOC = 'CHICAGO';

select *
FROM emp e
JOIN dept d ON e.deptno = d.deptno
WHERE job = 'SALESMAN';

-- student(profno) , professor(profno)
--학생번호, 이름 , 담당교수번호 , 이름
select studno, s.name , p.profno , p.name
FROM student s 
left outer JOIN professor p ON s.profno = p.profno;

--학생번호, 학생이름 , 담당교수이름 / 담당교수없음
--0615 , Daniel DAY-LE~~, Jodie
--9712 , Sean Connery , 담당교수없음
select studno , s.name , nvl(p.name ,'담당교수없음') as "교수이름"
from student s
left outer JOIN professor p ON s.profno = p.profno;

SELECT name 
        ,substr(tel, 1, instr(tel , ')' , 1) -1) as "지역번호"
        ,case substr(tel, 1, instr(tel , ')' , 1) -1) when '02' then '서울'
                                                      when '031' then '경기도'
                                                      when '051' then '부산'
                                                      else '기타'
        end"지역명"
        -- 학생들의 주민번호에서 생년월일을 추출해서 몇분기인지 파악해라
FROM student;

SELECT name 
        ,substr(jumin, 3,2) as "생일"
        ,case when substr(jumin, 3 ,2) between '01' and '03' then '1/4분기'
              when substr(jumin, 3 ,2) between '04' and '06' then '2/4분기'
              when substr(jumin, 3 ,2) between '07' and '09' then '3/4분기'
              when substr(jumin, 3 ,2) between '10' and '12' then '4/4분기'
              end"분기"
FROM student;

SELECT empno , ename , sal 
, case when SAL between '1' and '1000' then 'LEVEL 1'
        when SAL between '1001' and '2000' then 'LEVEL 2'
        when SAL between '2001' and '3000' then 'LEVEL 3'
        when SAL between '3001' and '4000' then 'LEVEL 4'
        else 'LEVEL 5'
        end"LEVEL"
FROM emp;

SELECT job , count(*), SUM(sal), round(avg(sal),1) ,min(hiredate),max(hiredate)
FROm emp
GROUP BY job;

--부서별 급여 합계 , 평균 급여 , 인원
SELEcT * FROM
(SELECT deptno 
        , sum(sal)
        , round(avg(sal),1)
        ,count(*)  
    FROm emp
    GROUP BY deptno) e
JOIN dept d ON e.deptno = d.deptno  ;
--emp dept 조인.
SELECT 
        d.dname
        ,sum(e.sal) "급여합계"
        ,round(avg(e.sal + nvl(comm, 0)),1) "평균급여"
        ,count(*) "인원"
FROM emp e
JOIN dept d ON e.deptno = d.deptno
GROUP BY d.dname;


--부서별 직무별 평균급여, 사원수
SELECT
    deptno , job , avg(sal) , count(*)
     FROM emp
     GROUP BY deptno , job


union
--부서별 평균급여 , 사원수,
SELECT deptno,'부서 평균급여', round(avg(sal),1) , count(*)
    FROM emp
    GROUP BY deptno

union
--평균급여,사원수
SELECT 99,'총 평균급여',round(avg(sal),1) , count(*)
    FROM emp
     ORDER BY 1;    

--rollup()
SELECT nvl(to_char(deptno),'총')"직무" , nvl(job,'합계')"부서" , round(avg(sal),1)"평균급여" , count(*)"사원수"
FROM emp
GROUP BY rollup(deptno, job)
ORDER BY 1;
        
   
--게시판 (board)
--글번호 , 제목 , 작성자 , 글내용 , 작성시간
drop table board;
create table board (
  board_no number(10) primary key --글번호 
  ,title varchar2(300) not null-- 제목 글제한 300 
  ,writer varchar2(50) not null-- 작성자
  ,content varchar2(100) not null --글내용
  ,created_at date default sysdate --작성시간
);
--컬럼 추가,
alter table board add (click_cnt number);
alter table board modify content varchar2(1000);
alter table board modify click_cnt number default 0;

insert into board ( board_no, title , writer , content)
values (3, 'test' ,'user01', '연습글입니다');     

insert into board ( board_no, title , writer , content)
values (2, 'test' ,'user02', '연습글입니다'); 

insert into board ( board_no, title , writer , content)
values (4, 'test' ,'user01', 'sql연습중'); 

select * from board;
commit;