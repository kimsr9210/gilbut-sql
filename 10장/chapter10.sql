--스칼라서브쿼리
--메인 쿼리의 select 절에서 컬럼이나 표현식 처럼 사용 
--두개 이상의 컬럼이나 표현식을 사용하거나, 반환되는 데이터가 2건 이상일 경우 오류 발생
SELECT 
    a.emp_id
    ,a.emp_name
    ,a.gender
    ,a.age
    ,a.hire_date
    ,a.dept_id
    ,a.address_id
    ,(SELECT b.dept_name FROM dept_master b where a.dept_id = b.dept_id) dept_name
FROM emp_master a;

--join으로 쿼리 대체 할 수 있음
SELECT 
    a.emp_id
    ,a.emp_name
    ,a.gender
    ,a.age
    ,a.hire_date
    ,a.dept_id
    ,a.address_id
    ,b.dept_name
FROM emp_master a
left join dept_master b on  a.dept_id = b.dept_id;

--인라인 뷰 **많이 사용됨
--메인쿼리의 FROM절에서 사용하는 서브쿼리
--FROM절에서 서브쿼리 자체가 하나의 테이블처럼 사용
--여러 개의 로우를 반환 할 수 있음
SELECT
    a.dept_id,
    a.dept_name,
    k.emp_id,
    k.emp_name,
    k.address
FROM
    dept_master a,
    (
        SELECT
            b.emp_id,
            b.emp_name,
            c.city
            || c.gu
            || c.address_name AS address,
            b.dept_id
        FROM
            emp_master     b,
            address_master c
        WHERE
            b.address_id = c.address_id
    )           k
WHERE
        a.use_yn = 'Y'
    AND a.dept_id = k.dept_id
ORDER BY 1,3;

--중첩 서브쿼리 WHERE 절에서 사용
--조건절의 일부로 사용됨
--메이쿼리 테이블의 특정 컬럼 값과 비교한 값을 반환하는 용도로 사용
--여러개의 컬럼 , 여러개의 로우를 반환할 수 있음

--단일행을 반환하는 중첩 서브쿼리
--WHERE절에서 동등 연산자를 사용하고 있음으로 1건 혹은 0건이 조회 되어야 맞음
--만약 여러 건의 데이터를 반환하려면 IN 연산자 사용
SELECT * FROM dept_master a
WHERE a.dept_id = (SELECT b.dept_id FROM emp_master b WHERE b.emp_name = '세종대왕');

--다중행을 반환하는 중첩 서브쿼리
SELECT * FROM dept_master a
WHERE a.dept_id IN (SELECT b.dept_id FROM emp_master b WHERE b.age BETWEEN 40 AND 49);

--다중 컬럼, 다중 행을 반환하는 중첩 서브쿼리
SELECT * FROM emp_master a
WHERE (a.gender, a.age) IN (
    SELECT b.gender, b.age FROM emp_master b , address_master c where b.address_id = c.address_id
    AND c.gu IN ('중구', '서대문구')
);
