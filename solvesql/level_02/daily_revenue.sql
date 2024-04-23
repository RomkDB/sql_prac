/*
Title : 레스토랑의 일일 매출
Content :
Waiter's Tips 데이터셋에는 식사 금액, 팁, 결제자 성별, 결제 요일 등 레스토랑 손님들의 계산 정보가 들어있습니다.
이 데이터를 이용하여 레스토랑의 요일별 매출 총액을 계산하려고 합니다.
요일별로 매출 총액을 집계하는 쿼리를 작성해주세요.
1000달러 미만으로 판매한 날은 결과에서 제외하고, 매출이 많았던 요일부터 순서대로 출력해주세요.
결과 데이터는 아래 컬럼을 포함해야 합니다.

- day - 요일
- revenue_daily - 요일 별 매출 총액
*/

SELECT day, SUM(total_bill) AS revenue_daily
FROM tips
GROUP BY day
HAVING revenue_daily >= 1000
ORDER BY 2 DESC;