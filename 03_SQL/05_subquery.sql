

/* **************************************************************************
서브쿼리(Sub Query)
- 쿼리안에서 select 쿼리를 사용하는 것.
- 메인 쿼리 - 서브쿼리

서브쿼리가 사용되는 구
 - select절, from절, where절, having절
 
서브쿼리의 종류
- 어느 구절에 사용되었는지에 따른 구분
    - 스칼라 서브쿼리 - select 절에 사용. 반드시 서브쿼리 결과가 1행 1열(값 하나-스칼라) 0행이 조회되면 null을 반환
    - 인라인 뷰 - from 절에 사용되어 테이블의 역할을 한다.
- 서브쿼리 조회결과 행수에 따른 구분
    - 단일행 서브쿼리 - 서브쿼리의 조회결과 행이 한행인 것.
    - 다중행 서브쿼리 - 서브쿼리의 조회결과 행이 여러행인 것.
- 동작 방식에 따른 구분
    - 비상관 서브쿼리 - 서브쿼리에 메인쿼리의 컬럼이 사용되지 않는다.
                메인쿼리에 사용할 값을 서브쿼리가 제공하는 역할을 한다.
    - 상관 서브쿼리 - 서브쿼리에서 메인쿼리의 컬럼을 사용한다. 
                            메인쿼리가 먼저 수행되어 읽혀진 데이터를 서브쿼리에서 조건이 맞는지 확인하고자 할때 주로 사용한다.

- 서브쿼리는 반드시 ( ) 로 묶어줘야 한다.
************************************************************************** */
use hr_join;


-- 직원_ID(emp.emp_id)가 120번인 직원과 같은 업무(emp.job_id)를 하는 
-- 직원의 id(emp_id),이름(emp.emp_name), 업무(emp.job_id), 급여(emp.salary) 조회
select job_id from emp where emp_id=120;

select emp_id, emp_name, job_id, salary
from   emp
where  job_id = (select job_id from emp where emp_id=120);-- 120번 직원의 job_id;

-- 직원_id(emp.emp_id)가 115번인 직원과 같은 업무(emp.job_id)를 하고 같은 
-- 부서(emp.dept_id)에 속한 직원들을 조회하시오.
select job_id, dept_id from emp where emp_id=115;

select * from emp
where  (job_id, dept_id) =  (select job_id, dept_id 
						     from emp 
                             where emp_id=115);

-- select * from emp where (job_id, dept_id) = ('PU_MAN', 30);
	-- mysql은 지원하지만 안되는 dbms도 있다.

-- 직원의 ID(emp.emp_id)가 150인 직원과
--  업무(emp.job_id)와 상사(emp.mgr_id)가 같은 직원들의 
-- id(emp.emp_id), 이름(emp.emp_name), 업무(emp.job_id), 
-- 상사(emp.mgr_id) 를 조회
select emp_id, emp_name, job_id
from   emp
where  (job_id, mgr_id) = (select job_id, mgr_id from emp where emp_id=150);

-- 직원들 중 급여(emp.salary)가 전체 직원의 평균 급여보다 적은 직원들의 id(emp.emp_id), 이름(emp.emp_name), 급여(emp.salary)를 조회. 
select avg(salary) from emp; -- 6517.906542

select  emp_id, emp_name, salary 
from    emp
where   salary < (select avg(salary) from emp)
order by 3 desc;

-- 부서직원들의 평균이 전체 직원의 평균(emp.salary) 이상인 부서의 이름(dept.dept_name), 평균 급여(emp.salary) 조회.
-- 평균급여는 소숫점 2자리까지 나오고 통화표시($)와 단위 구분자 출력
select  d.dept_id, d.dept_name, avg(e.salary) as "평균급여"
from    dept d join emp e on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name
having avg(salary) >= (select avg(salary) from emp)
order by 3
;

select  d.dept_id, 
		d.dept_name, 
        concat('$', round(avg(e.salary), 2)) as "평균급여"
from    dept d join emp e on d.dept_id = e.dept_id
group by d.dept_id, d.dept_name
having avg(salary) >= (select avg(salary) from emp)
order by 3
;


select  dept_id, 
		dept_name, 
        concat('$', round(평균급여, 2)) as "평균급여"
from  (select  d.dept_id, d.dept_name, avg(e.salary) as "평균급여"
		from    dept d join emp e on d.dept_id = e.dept_id
		group by d.dept_id, d.dept_name
		having avg(salary) >= (select avg(salary) from emp)
		order by 3
       ) as t;

--  급여(emp.salary)가장 많이 받는 직원이 속한 부서의 이름(dept.dept_name), 
-- 위치(dept.loc)를 조회.
select dept_name, loc
from   dept
where  dept_id = (select dept_id 
			      from emp 
                  where salary = (select max(salary) from emp));


-- Sales 부서(dept.dept_name) 의 평균 급여(emp.salary)보다
--  급여가 많은 직원들의 모든 정보를 조회.
select * from emp
where salary > (select avg(salary)
			    from   dept d join emp e on d.dept_id = e.dept_id
			    where  d.dept_name = 'Sales')
order by salary asc;

select avg(salary)
from   dept d join emp e on d.dept_id = e.dept_id
where  d.dept_name = 'Sales';


-- 전체 직원들 중 담당 업무 ID(emp.job_id) 가 'ST_CLERK'인 직원들의 평균 급여보다 
-- 적은 급여를 받는 직원들의 모든 정보를 조회. 
-- 단 업무 ID가 'ST_CLERK'이 아닌 직원들만 조회. 
select * from emp
where  salary < (select avg(salary) from emp where job_id = 'ST_CLERK')
and    (job_id <> 'ST_CLERK' or job_id is null);
-- job_id is null 을 안하면 job_id가 null인 행들이 조회가 안됨. null은 =, <> 모두 false


-- 업무(emp.job_id)가 'IT_PROG' 인 직원들 중 가장 많은 급여를 받는 직원보다 
-- 더 많은 급여를 받는 직원들의 id(emp.emp_id), 이름(emp.emp_name), 급여(emp.salary)를 급여 내림차순으로 조회.
select emp_id, emp_name, salary
from   emp
where  salary > (select max(salary) from emp where job_id = 'IT_PROG')
order by 3 desc;

select max(salary) from emp where job_id = 'IT_PROG';

/* ----------------------------------------------
 다중행 서브쿼리
 - 서브쿼리의 조회 결과가 여러행인 경우
 - where절 에서의 연산자
	- in
	- 비교연산자 any : 조회된 값들 중 하나만 참이면 참 (where 컬럼 > any(서브쿼리) )
	- 비교연산자 all : 조회된 값들 모두와 참이면 참 (where 컬럼 > all(서브쿼리) )
------------------------------------------------*/
-- 'Alexander' 란 이름(emp.emp_name)을 가진 관리자(emp.mgr_id)의 
-- 부하 직원들의 ID(emp_id), 이름(emp_name), 업무(job_id), 입사년도(hire_date-년도만출력), 급여(salary)를 조회
select  emp_id, emp_name, job_id, year(hire_date) as "입사년도", salary
from    emp
where   mgr_id in (select emp_id from emp where emp_name = 'Alexander');

select emp_id from emp where emp_name = 'Alexander'
;

--  부서 위치(dept.loc) 가 'New York'인 부서에 소속된 직원의 ID(emp.emp_id),
--  이름(emp.emp_name), 부서_id(emp.dept_id) 를 sub query를 이용해 조회.
select  emp_id, emp_name, dept_id
from    emp
where   dept_id in (select dept_id from dept where loc='New York');

-- subquery where 절의 비교 컬럼(loc)이 unique 가 아닐 경우 => 결과행이 여러개일 수있다.
--    다중행 subquery 연산.

-- 직원 ID(emp.emp_id)가 101, 102, 103 인 직원들 보다 급여(emp.salary)를 많이 받는 직원의 모든 정보를 조회.
select * from emp
where salary > all(select salary from emp where emp_id in (101, 102, 103));

select salary from emp where emp_id in (101, 102, 103);

-- 직원 ID(emp.emp_id)가 101, 102, 103 인 직원들 중 급여가 가장 적은 직원보다 급여를 많이 받는 직원의 모든 정보를 조회.
select * from emp
where salary > any(select salary from emp where emp_id in (101, 102, 103));

-- 최대 급여(job.max_salary)가 6000이하인 업무를 담당하는  직원(emp)의 모든 정보를 sub query를 이용해 조회.
select * from emp
where job_id in (select job_id from job where max_salary <= 6000);

select job_id from job where max_salary <= 6000;

-- 전체 직원들 중 부서_ID(emp.dept_id)가 20인 부서의 모든 직원들 
-- 보다 급여(emp.salary)를 많이 받는 직원들의 정보를 sub query를 이용해 조회.
select * from emp
where salary > all(select salary from emp where dept_id=20);

select salary from emp where dept_id=20;

/* *************************************************************************************************
인라인 뷰(Inline View)
- from절에 서브쿼리를 사용하는 것.
- 서브쿼리 결과를 테이블처럼 사용할 수 있다.
* *************************************************************************************************/

-- 중복된 데이터 조회  (emp에서 여러번 나오는 이름을 조회)
select emp_name, cnt
from (
	select emp_name, count(*) as "cnt"
	from   emp
	group by emp_name
    order by cnt
) t
where cnt >= 2;


/* *************************************************************************************************
상관 쿼리
- 메인쿼리문 테이블의 값을 where절의 subquery에서 참조한다.
	- 메인 쿼리의 각 행마다 where의 subquery가 조회 대상인지 검사하면서 실행된다. 이때 현재 검사중인 그 행의 컬럼값을 subquery에서 사용한다.
    


EXISTS, NOT EXISTS 연산자 (상관쿼리와 같이 사용된다)
-- 서브쿼리의 결과를 만족하는 값이 존재하는지 여부를 확인하는 조건. 
-- 조건을 만족하는 행이 여러개라도 한행만 있으면 더이상 검색하지 않는다.

- 보통 데이터테이블의 값이 이력 테이블(Transaction TB)에 있는지 여부를 조회할 때 사용된다.
	- 메인쿼리: 데이터테이블
	- 서브쿼리: 이력테이블
	- 메인쿼리에서 조회할 행이 서브쿼리의 테이블에 있는지(또는 없는지) 확인
	
고객(데이터) 주문(이력) -> 특정 고객이 주문을 한 적이 있는지 여부
장비(데이터) 대여(이력) -> 특정 장비가 대여 된 적이 있는지 여부
************************************************************************************* */
 select * from emp;

-- 직원이 한명이상 있는 부서의 부서ID(dept.dept_id)와 이름(dept.dept_name), 위치(dept.loc)를 조회
select d.dept_id, d.dept_name, d.loc
from   dept d
where  exists (select * from emp e where e.dept_id = d.dept_id);

-- subquery에서 main query의 table을 사용하도록 정의하면 상관 쿼리.

-- 직원이 한명도 없는 부서의 부서ID(dept.dept_id)와 이름(dept.dept_name), 위치(dept.loc)를 조회
select d.dept_id, d.dept_name, d.loc
from   dept d
where  not exists (select * from emp e where e.dept_id = d.dept_id);
