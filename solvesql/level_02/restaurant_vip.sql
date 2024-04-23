/*
Title : 레스토랑의 요일별 VIP
Content :
tips 테이블에는 식사 금액, 팁, 결제자 성별, 요일, 시간대 등 어느 레스토랑의 테이블 당 결제에 관련된 데이터가 들어있습니다.
요일별로 가장 높은 금액의 결제 내역을 출력하는 쿼리를 작성해주세요.
쿼리 결과에는 tips 테이블에 있는 모든 컬럼이 포함되어야 합니다.
*/

SELECT *
FROM tips
WHERE total_bill in (SELECT MAX(total_bill) FROM tips GROUP BY day);