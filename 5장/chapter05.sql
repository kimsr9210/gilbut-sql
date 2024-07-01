SELECT * FROM subway_statistics
WHERE station_name LIKE '선릉%'
--AND (boarding_time = 7 OR boarding_time = 8); --연산자 우선순위 때문에 괄호로 묶어야됨B
AND boarding_time IN (7,9)
--AND passenger_number > 500 AND passenger_number < 1000 
AND passenger_number BETWEEN 500 AND 1000
ORDER BY 6; --INDEX 6번 컬럼 내림차순