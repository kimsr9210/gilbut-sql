--중복 번호 조회
SELECT * FROM lotto_master;
SELECT * FROM lotto_detail;

SELECT NUM1,NUM2,NUM3,NUM4,NUM5,NUM6, COUNT(*) 
 FROM lotto_master
GROUP BY NUM1,NUM2,NUM3,NUM4,NUM5,NUM6;

--중복된 로또 번호 조회
--**GROUP BY 절 사용 시 집계 함수에 대한 조건은 WHERE절이 아닌 HAVING절을 사용!!
SELECT NUM1,NUM2,NUM3,NUM4,NUM5,NUM6, COUNT(*) 
 FROM lotto_master
GROUP BY NUM1,NUM2,NUM3,NUM4,NUM5,NUM6
HAVING COUNT(*) > 1;

--가장 많이 당첨된 번호 조회
SELECT NUM1, COUNT(*) CNT 
 FROM lotto_master
GROUP BY NUM1
ORDER BY CNT DESC;



