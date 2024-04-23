/*
Title : 최고의 근무일을 찾아라
Content :
Waiter's Tips 데이터셋에는 식사 금액, 팁, 결제자 성별, 결제 요일 등 레스토랑 손님들의 계산 정보가 들어있습니다.
이 레스토랑에 근무하는 서버는 팁을 많이 받을 수 있는 날 하루를 골라 근무하고 싶습니다.
요일별로 팁 총액을 집계하고 팁이 가장 많았던 요일과 그날의 팁 총액을 출력하는 쿼리를 작성해주세요.
그날의 팁 총액은 소수점 셋째 자리에서 반올림하여 출력되도록 해주세요.
결과 데이터는 아래 컬럼을 포함해야 합니다.

- day - 요일
- tip_daily - 요일 별 팁 총액
*/

SELECT day, ROUND(SUM(tip), 3) AS tip_daily
FROM tips
GROUP BY day
ORDER BY tip_daily DESC
LIMIT 1;