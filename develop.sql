--DML(isert, update, delete, merge)
-- 1) insert into table명 (칼람1, 칼람2....) values(값1,값2.....)
SELECT
    * FROM board;
-- 4 /글등록 연습/user01 /sql연습중
insert into board(board_no , title , writer , content)
values ((SELECT max(board_no)+1 from board) , :title, :writer ,:content); 

SELECT max(board_no)+1 from board;
--insert 완성
update board
set click_cnt = click_cnt +1
    ,title = :title
    ,content = :content
where writer = 'user01';

SELECT
    * FROM board;

insert into board
values(9, 'title' ,'user02', 'content',sysdate,0);

select * from emp;
--max+1, 이름, SALESMAN, ,2026/06/01,3000, 10, 30
insert into emp(EMPNO , ENAME , JOB ,HIREDATE ,SAL, COMM , DEPTNO)
values((select max(EMPNO)+1 from emp),:ENAME,:JOB,:HIREDATE , :SAL ,:COMM,:DEPTNO);
--30번부서 매니저의 아이디를 업데이트
update emp
set mgr = (select empno from emp
            where deptno = 30
            and job = 'MANGER')
where empno = 7935;

--상품테이블(product_tb1)
--상품코드, 상품명 , 가격 , 상품설명 , 평점(5,4,3,2,1,),제조사, 등록일자
--key     nn      nn     nn        3                      sysdate
drop table product_tb1;
create table product_tb1(
    code varchar2(10) not null,
    name varchar2(100) not null,
    price varchar2(20) not null,
    des varchar2(100) not null,
    val number(5) not null,
    creat varchar2(10) not null,
    create_at  date default sysdate
    );

ALTER table product_tb1 modify val number DEFAULT 3;

SELECT
    * FROM  product_tb1;

INSERT INTO product_tb1(code , name , price, des , val , creat)
                VALUES ('S'||(select lpad(max(substr(code,2,3))+1,3,'0')
                            FROM product_tb1),
                        :name, :price , :des, :val, :creat);
                        
--merge into table
--using table2
--on 병합조건
--when matched then
--update....
--when not matched then
--insert
merge into product_tb1 tb11
using (select  'S014' code
                ,'새로운상품1434' name
                , 14000 price 
                , '아주좋은 144상품' des
                , '3' val
                , '12' creat
        from dual) tb12
on (tb11.code = tb12.code)
when matched then
    update set
     tb11.price = tb12.price
    ,tb11.des = tb12.des
when not matched then
insert (code,name,price,des,val,creat)
values (tb12.code, tb12.name ,tb12.price ,tb12.des,tb12.val,tb12.creat);

SELECT
    * FROM product_tb1;