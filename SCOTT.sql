-- Ocacle (DBMS) - version(21C) -xe(database명)
-- user(scott) - 테이블.
-- Structured Query Language (SQL)
--SELECT studno, name -- 칼럼명(전체명)
--FROM student; --테이블.

-- 1. professor  테이플. 전체 컬럼 조회.
SELECT
    * FROM professor;


-- 2)학생 -> 학생번호, 이름, 학년
SELECT PROFNO, name , grade
 FROM student;
    
-- 숙제 완료함
