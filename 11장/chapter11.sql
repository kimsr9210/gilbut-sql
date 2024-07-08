--데이터 입력
CREATE TABLE subway_dml_test AS 
SELECT * 
 FROM subway_statistics
WHERE ROWNUM < 1; --데이터는 하나도 만들어지지 않음 단점 INDEX나 기본 키는 만들 수 없음
--ROWNUM란? 문장에서 반환되는 로우의 수

SELECT * FROM subway_dml_test;

ALTER TABLE subway_dml_test ADD PRIMARY KEY (seq_id);

INSERT INTO subway_dml_test 
SELECT * 
 FROM subway_statistics
WHERE station_name NOT LIKE '종합운동장%';

COMMIT;

--기본키와 충돌하지 않도록 데이터 입력하기
INSERT INTO subway_dml_test 
SELECT * FROM subway_statistics a
WHERE NOT EXISTS (SELECT 1 FROM subway_dml_test b 
                  WHERE a.seq_id = b.seq_id);
                  
--데이터삭제
DELETE FROM subway_dml_test
WHERE station_name LIKE '종합운동장%';

COMMIT;

--데이터수정 
SELECT boarding_date FROM subway_dml_test
WHERE station_name LIKE '삼성%';

UPDATE subway_dml_test 
 SET passenger_number = passenger_number + 10 --기존값에서 10 더함
    ,boarding_date = ADD_MONTHS(boarding_date, 1) --기존값에서 한달 더함
WHERE station_name LIKE '삼성%';



