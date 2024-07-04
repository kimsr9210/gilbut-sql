--테이블 생성
CREATE TABLE emp08 (
    EMP_ID02 NUMBER NOT NULL,
    EMP_NAME VARCHAR2(100) NOT NULL,
    GENDER VARCHAR(10),
    AGE NUMBER,
    HIRE_DATE DATE,
    ETC VARCHAR2(300),
    CONSTRAINT EMP08_PK PRIMARY KEY (EMP_ID02)
);

--컬럼 수정
ALTER TABLE emp08 RENAME COLUMN EMP_NAME TO EMP_NAME2;

SELECT * FROM emp08;

--데이터 삽입
INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (1, '선덕여왕', '여성', 23, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (2, '허난설헌', '여성', 33, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (3, '김만덕', '여성', 43, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (4, '장희빈', '여성', 35, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

INSERT INTO emp08 ( emp_id2, emp_name2, gender, age, hire_date )
VALUES (5, '신사임당', '여성', 45, TO_DATE('2018-02-01', 'YYYY-MM-DD'));

COMMIT;

INSERT INTO emp_master ( emp_id, emp_name, gender, age, hire_date, dept_id, address_id )
VALUES (6, '왕건', '남성', 35, TO_DATE('2018-01-01', 'YYYY-MM-DD'), NULL, 4);

COMMIT;

INSERT INTO dept_master ( dept_id, dept_name )
VALUES (5, 'IT팀');

COMMIT;