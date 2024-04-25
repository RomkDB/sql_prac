/*
Title : 가구 판매의 비중이 높았던 날 찾기
Content :
US E-Commerce Records 2020 데이터셋은 미국 이커머스 웹사이트의 판매 데이터 입니다. 
이 중 records 테이블은 주문 번호, 주문 날짜, 주문 지역, 카테고리 등 주문의 상세 정보를 담고 있습니다.
이 데이터를 이용하여 가구 판매의 비중이 높았던 날을 찾고 싶습니다.
일별 주문 수가 10개 이상인 날 중에서, ‘Furniture’ 카테고리 주문의 비율이 40% 이상 이었던 날만 출력하는 쿼리를 작성해주세요.
카테고리 정보는 category 컬럼에 기록되어 있습니다.
결과 데이터는 아래의 컬럼들을 포함해야 합니다.
Furniture 카테고리의 주문 비율은 백분율로 계산하며, 반올림하여 소수점 둘째자리까지만 출력해주세요.
Furniture 카테고리의 주문 비율이 높은 것부터 보여주도록 정렬하고, 비율이 같다면 날짜 순으로 정렬해주세요.

- order_date - 주문 날짜
- furniture - 해당 일의 Furniture 카테고리 주문 수
- furniture_pct - 해당 일의 전체 주문 대비 Furniture 카테고리 주문의 비율 (%)

결과 데이터 예시
| order_date | furniture | furniture_pct |
|2020-11-19 | 9 | 60 |
|2020-12-01 | 8 | 57.14 |

결과 데이터 해석
- 2020년 6월 30일 주문 중 6건은 Furniture 카테고리에서 나온 주문입니다. 이는 2020년 6월 30일 전체 주문 중 약 54.55% 비중을 차지합니다.
- 2020년 12월 29일 주문 중 6건은 Furniture 카테고리에서 나온 주문입니다. 이는 2020년 12월 29일 전체 주문 중 약 50% 비중을 차지합니다.
*/

SELECT DATE(order_date) AS order_date,
    COUNT(DISTINCT(CASE WHEN category = 'Furniture' THEN order_id END)) AS furniture,
    ROUND((COUNT(DISTINCT(CASE WHEN category = 'Furniture' THEN order_id END)) + 0.00) / (COUNT(DISTINCT(order_id)) + 0.00) * 100, 2) AS furniture_pct
FROM records
GROUP BY DATE(order_date)
HAVING COUNT(DISTINCT(order_id)) >= 10 AND furniture_pct >= 40
ORDER BY 3 DESC, 1;