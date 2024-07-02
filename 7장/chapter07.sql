--집계함수 
SELECT STATION_NAME FROM subway_statistics
WHERE GUBUN = '승차'
GROUP BY STATION_NAME
ORDER BY STATION_NAME;

--*집계함수는 SELECT 절에서만 사용 가능 
SELECT station_name 
, boarding_time
, GUBUN
, MIN(passenger_number) MIN_VALUE 
, MAX(passenger_number) MAX_VALUE 
, SUM(passenger_number) SUM_VALUE 
FROM subway_statistics
GROUP BY station_name, boarding_time, gubun
ORDER BY 6 DESC;

--HAVING 
--만약 승하차 인원 합계가 15000 ~ 16000명 사이인 역만 조회하려면 ? 
--*집계함수는 SELECT 절에서만 사용 가능* 이럴때 HAVING절 사용
--HAVING절은 GROUP BY절과 같이 사용되어 집계 쿼리의 조건절 역할을 함
SELECT station_name
, boarding_time
, gubun
, MIN(passenger_number) MIN_VALUE 
, MIN(passenger_number) MIN_VALUE 
, SUM(passenger_number) SUM_VALUE 
FROM subway_statistics
GROUP BY station_name, boarding_time, gubun
HAVING SUM(passenger_number) BETWEEN 15000 AND 16000
ORDER BY 6 DESC;


--7-1
SELECT station_name FROM subway_statistics
WHERE gubun = '승차'
GROUP BY station_name
ORDER BY station_name;

--GROUP BY 절 사용하지 않고 7-1 같은 쿼리 만들기.
SELECT DISTINCT station_name 
FROM subway_statistics
WHERE gubun = '승차'
ORDER BY 1;