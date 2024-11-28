-- 함수5_집계함수.sql

use testdb;

-- count 데이터 개수를 세는 함수(null은 제외)
select count(*), count(고객번호), count(도시), count(지역)
from 고객;

-- sum 합계
-- avg 평균
-- min 최소값
-- max 최대값
select sum(마일리지), avg(마일리지), min(마일리지), max(마일리지)
from 고객;

-- group by 그룹별로 묶어주는 명령어
select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지
from 고객
group by 도시;

select 담당자직위, 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지
from 고객
group by 담당자직위, 도시
order by 담당자직위, 도시;

-- 고객별 주문수
select 고객번호, count(주문번호) as 주문수
from 주문
group by 고객번호;

-- having 그룹별 조건
select 도시, count(*) as 고객수, avg(마일리지) as 평균마일리지
from 고객
group by 도시
having 고객수 >= 4; -- MySQL만 가능
-- having count(*) >= 4; -- 표준 SQL에서는 이렇게 사용해야 함!! **

select 도시, 고객번호, sum(마일리지) as 총마일리지
from 고객
where 고객번호 like 'T%'
group by 도시, 고객번호
having 총마일리지 >= 1000;

-- 제품별 주문수량합계 구하기
select 제품번호, sum(주문수량) as 주문수량합계
from 주문세부
group by 제품번호
order by 제품번호;

-- 각 제품별 주문수량이 1000개 이상인 제품만 출력 (총주문수량이 많은 순서대로 정렬)
select 제품번호, sum(주문수량) as 총주문수량
from 주문세부
group by 제품번호
having 총주문수량 >= 1000
order by 총주문수량 desc;


















