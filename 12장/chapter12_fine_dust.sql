SELECT * FROM fine_dust; --초미세먼지 측정 테이블
SELECT * FROM fine_dust_standard; --WHO 기준 미세먼지 농도 기준치 데이터

--월간 미세먼지와 초미세먼지 최소,최대 평균값 구하기
SELECT 
    TO_CHAR(mea_date, 'YYYY-MM') months
    ,ROUND(MIN(PM10), 0)PM10_MIN
    ,ROUND(MAX(PM10), 0) PM10_MAX
    ,ROUND(AVG(PM10), 0) PM10_AVG    
    ,ROUND(MIN(PM25), 0)PM25_MIN
    ,ROUND(MAX(PM25), 0) PM25_MAX
    ,ROUND(AVG(PM25), 0) PM25_AVG
FROM fine_dust
WHERE PM10 > 0
 AND PM25 > 0
GROUP BY  TO_CHAR(mea_date, 'YYYY-MM') --월별 집계를 구하기 위해 월로 변환
ORDER BY 1; 

--월평균 미세먼지 현황
SELECT A.MONTHS
, A.PM10_AVG
, (SELECT B.STD_NAME 
     FROM fine_dust_standard B
    WHERE ORG_NAME = 'WHO'
     AND A.PM10_AVG BETWEEN B.PM10_START AND B.PM10_END) "미세먼지 상태"
, A.PM25_AVG     
, (SELECT B.STD_NAME 
     FROM fine_dust_standard B
    WHERE ORG_NAME = 'WHO'
     AND A.PM25_AVG BETWEEN B.PM25_START AND B.PM25_END) "초미세먼지 상태"
FROM (SELECT 
    TO_CHAR(MEA_DATE, 'YYYY-MM') MONTHS,
    ROUND(AVG(A.PM10), 0) PM10_AVG,
    ROUND(AVG(A.PM25), 0) PM25_AVG
 FROM fine_dust A
WHERE A. PM10 > 0
 AND A.PM25 > 0
GROUP BY TO_CHAR(MEA_DATE, 'YYYY-MM')
) A
ORDER BY MONTHS;