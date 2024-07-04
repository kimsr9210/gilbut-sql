SELECT * FROM dept_master; --부서 테이블
SELECT * FROM address_master; --주소 테이블
SELECT * FROM emp_master; --사원 테이블

--INNER JOIN(내부조인)
--조인 컬럼값이 같은건만 조회
--사원정보 기준으로 부서정보를 조인하는 쿼리 
SELECT * 
    FROM emp_master E, dept_master D
WHERE E.DEPT_ID = D.DEPT_ID --공통컬럼 , 즉 조인컬럼 동등 연산자로 연결 DEPT_ID 값이 같은 건만 조회
ORDER BY E.DEPT_ID;

--ANSI 구문 **실무에서 많이 사용
SELECT * 
    FROM emp_master E
INNER JOIN dept_master D
    ON E.DEPT_ID = D.DEPT_ID 
ORDER BY E.DEPT_ID;

--사원정보 기준으로 부서정보, 주소정보를 조인하는 쿼리 
SELECT * 
    FROM emp_master E, dept_master D, address_master A
WHERE E.DEPT_ID = D.DEPT_ID
    AND e.address_id = A.address_id
    AND e.gender = '남성';

--ANSI 
SELECT * 
    FROM emp_master E
JOIN dept_master D -- 내부조인 == JOIN == INNER JOIN
    ON E.DEPT_ID = D.DEPT_ID
JOIN address_master A
    ON e.address_id = A.address_id
WHERE e.gender = '남성';

--OUTER JOIN(외부조인)
--두 테이블 중 한 테이블의 조인 컬럼 값이 없더라도 없는 건까지 모두 포함해 조회
SELECT * FROM emp_master WHERE emp_name = '왕건';
SELECT * 
    FROM emp_master E, dept_master D
WHERE E.DEPT_ID = D.DEPT_ID(+) --(+)데이터가 없으니 추가로 가져와 +기호는 오라클에서만 사용가능 
ORDER BY e.emp_id;

--ANSI 구문
--LEFT OUTER JOIN 이라고 하는데 OUTER는 생략 가능
SELECT * FROM emp_master E
LEFT JOIN dept_master D --왼쪽 테이블을 기준으로 삼고 명시한 테이블에서 조인 컬럼 값이 일치하지 않는 데이터까지 가져옴
    ON E.DEPT_ID = D.DEPT_ID
ORDER BY e.emp_id;

--부서테이블이 기준 테이블이 될경우
SELECT * FROM dept_master;
SELECT * 
    FROM emp_master E, dept_master D
WHERE E.DEPT_ID(+) = D.DEPT_ID --(+)데이터가 없으니 추가로 가져와 +기호는 오라클에서만 사용가능 
ORDER BY e.emp_id;

SELECT * FROM emp_master E
RIGHT JOIN dept_master D --오른쪽 테이블을 기준으로 삼고 명시한 테이블에서 조인 컬럼 값이 일치하지 않는 데이터까지 가져옴
    ON E.DEPT_ID = D.DEPT_ID
ORDER BY e.emp_id;

--두 테이블의 데이터를 모두 조회하려면?
--FULL OUTER JOIN 
--조인에 참여하는 두 테이블의 값을 모두 조회
--실제론 내부조인(JOIN)을 많이 사용
SELECT * FROM emp_master E
FULL JOIN dept_master D --오른쪽 테이블을 기준으로 삼고 명시한 테이블에서 조인 컬럼 값이 일치하지 않는 데이터까지 가져옴
    ON E.DEPT_ID = D.DEPT_ID
ORDER BY e.emp_id;
