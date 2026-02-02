SELECT studno ,name ,grade ,height,WEIGHT
     FROM student
        WHERE (height > 170
        OR WEIGHT > 60)
        AND (grade = 4 OR height > 150);

--급여가 2000 이상인 직원, 커미션(급여 + 커미션)
SELECT
    * FROM emp
        WHERE ( SAL > 2000 or SAL + COMM >2000);
--교수=> 연봉이 5000 이상인. 보너스 3번
SELECT profno
,name
,pay 
,bonus 
,pay * 12 as total_1
     FROM professor
        WHERE ( pay * 12 >= 3000 AND bonus is null)
           OR (pay * 12 + bonus*3 >= 3000 AND bonus is not null)
           ORDER BY 5 DESC --정렬기준
           ;   
--문자열 like 연산자
SELECT
    * FROM student
        WHERE name like '%on___y%'; -- 문자열의 비교 like /조건검색 %% /뒤에 몇글자 _ 갯수
SELECT
    * FROM professor
    WHERE hiredate > to_date('99/01/01', 'rr/mm/dd');

--학생테이블,전화번호(02, 031, 051, 052 ,053...)
SELECT
    * FROM student
    WHERE TEL like '%051____%';
    
-- 이름 M 시작해서 8개 이상인 사람

SELECT
    * FROM student
    WHERE NAME like '%M________%';
    
-- 주민번호 10월달에 태어난 사람을 조회 96'01'251236549 뒷자리 9개   
SELECT
    * FROM student
    WHERE JUMIN like '%10_________%';   
--

