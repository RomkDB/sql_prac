/*
Title : 할부는 몇 개월로 해드릴까요
Content :
olist_order_payments_dataset 테이블에는 각 주문의 결제 정보가 저장되어 있습니다.
고객이 Olist 상점에서 신용카드로 주문한 내역을 할부 개월 수 별로 나누어 살펴보려고 합니다.
할부 개월 수 별로 주문 수, 최소 결제 금액, 최대 결제 금액, 평균 결제 금액을 집계해주세요.
결과 데이터에는 5개의 컬럼이 들어가야 합니다.

- payment_installments - 할부 개월 수
- order_count - 주문 수
- min_value - 최소 결제 금액
- max_value - 최대 결제 금액
- avg_value - 평균 결제 금액
*/

SELECT payment_installments,
    COUNT(DISTINCT(order_id)) AS order_count,
    MIN(payment_value) AS min_value,
    MAX(payment_value) AS max_value,
    AVG(payment_value) AS avg_value
FROM olist_order_payments_dataset
WHERE payment_type = 'credit_card'
GROUP BY payment_installments;