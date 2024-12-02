-- 쿼리2_서브쿼리.sql

use testdb;

-- 가장 많은 마일리지를 고유한 고객 조회
-- #1. 일반적인 쿼리
select 고객번호, 고객회사명, 마일리지
from 고객
order by 마일리지 desc
limit 1;

-- #2. 서브쿼리
select 고객번호, 고객회사명, 마일리지
from 고객
where 마일리지 = (select max(마일리지) from 고객);
-- where 마일리지 = 128790

/***** 서브쿼리가 사용되는 위치에 따라 3종류로 나눌 수 있음 *****/

-- #1. where절
-- 주문번호 'H0249'를 주문한 고객의 모든 정보 조회
-- join 쿼리
select 고객.*
from 고객 inner join 주문
on 고객.고객번호 = 주문.고객번호
where 주문.주문번호 = 'H0249';
-- 서브쿼리
select 고객.*
from 고객
where 고객번호 = (select 고객번호 from 주문 where 주문번호 = 'H0249');
-- where 고객.고객번호 = (주문테이블에서 주문번호가 'H0249'인 고객번호)

-- #2. from절
-- 담당자명, 고객회사명, 마일리지, 도시, 해당도시의 평균마일리지를 조회
select 담당자명, 고객회사명, 마일리지, 고객.도시, 해당도시평균마일리지
from 고객
inner join (
select 도시, avg(마일리지) as 해당도시평균마일리지
from 고객 
group by 도시) as 도시요약
on 고객.도시 = 도시요약.도시;



select 도시, avg(마일리지) as 해당도시평균마일리지
from 고객
group by 도시;






-- #3. select절





















