/*
Title : 우리 플랫폼에 정착한 판매자 2
Content :
olist_order_items_dataset 테이블에는 주문 안에 어떤 상품이 포함되어 있는지, 상품의 판매자는 누구인지 등 상품 단위의 데이터가 들어있습니다.
상품 가격이 50달러 이상인 주문이 100건 이상 들어온 판매자 리스트를 주문 건수가 많은 순서대로 출력하는 쿼리를 작성해주세요.
쿼리 결과에는 아래 컬럼이 있어야 합니다.

- seller_id - 판매자 ID
- orders - 판매자가 판매한 주문 건수
*/

SELECT seller_id, COUNT(DISTINCT(order_id)) AS orders
FROM olist_order_items_dataset
WHERE price >= 50
GROUP BY seller_id
HAVING orders >= 100
ORDER BY 2 DESC;