/*
Title : 레스토랑의 일일 평균 매출액 계산하기
Content :
tips 테이블에는 식사 금액, 팁, 결제자, 성별, 요일, 시간대 등 어느 레스토랑의 테이블 당 결제에 관련된 데이터가 들어있습니다.
이 레스토랑의 일일 평균 매출을 계산해주세요.
예를 들어, 일일 매출이 다음과 같다면 일일 평균 매출은 287.5 입니다.
컬럼의 이름은 avg_sales로 출력해주세요.
결과는 소수점 아래 셋째 자리에서 반올림하여 둘째 자리까지 표시되어야 합니다.
*/

SELECT ROUND(AVG(sales), 2) AS avg_sales
FROM (SELECT day, SUM(total_bill) AS sales FROM tips GROUP BY day);