CREATE TABLE EMP_MASTER(
    EMP_ID NUMBER NOT NULL,
    EMP_NAME VARCHAR2(100) NOT NULL,
    GENDER VARCHAR2(10),
    AGE NUMBER,
    HIRE_DATE DATE,
    DEPT_ID NUMBER,
    ADDRESS_ID NUMBER,
    CONSTRAINT EMP_MASTER_PK PRIMARY KEY (EMP_ID)
);

CREATE TABLE DEPT_MASTER(
DEPT_ID NUMBER NOT NULL,
DEPT_NAME VARCHAR2(50),
USE_YN VARCHAR2(2) DEFAULT 'Y',
DEPT_DESC VARCHAR(100), --부서설명
CONSTRAINT DEPT_MASTER_PK PRIMARY KEY(DEPT_ID)
);

CREATE TABLE ADDRESS_MASTER(
ADDRESS_ID NUMBER NOT NULL,
CITY VARCHAR2(100),
GU VARCHAR2(50),
ADDRESS_NAME VARCHAR(100), 
CONSTRAINT ADDRESS_MASTER_PK PRIMARY KEY(ADDRESS_ID)
);

-- 쿼리 9-2
INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (1, '김유신', '남성', 56, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 1);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (2, '신사임당', '여성', 34, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 1, 2);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (3, '홍길동', '남성', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 3, 2);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (4, '강감찬', '남성', 23, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 2, 3);

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (5, '세종대왕', '남성', 45, TO_DATE('2018-01-01', 'YYYY-MM-DD'), 4, 4);


INSERT INTO dept_master ( dept_id, dept_name )
VALUES (1, '회계팀');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (2, '경영팀');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (3, '전산팀');

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (4, '마케팅팀');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (1, '서울특별시', '중구', '새문안로 12');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (2, '서울특별시', '서대문구', '연희로 15길');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (3, '서울특별시', '영등포구', '여의대로 99');

INSERT INTO address_master ( address_id, city, gu, address_name )
VALUES (4, '서울특별시', '강남구', '테헤란로 33');

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (6, '왕건', '남성', 35, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 4);

COMMIT;

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (5, 'IT팀');

COMMIT;