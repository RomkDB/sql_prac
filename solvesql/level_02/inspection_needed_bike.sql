/*
Title : 점검이 필요한 자전거 찾기
Content :
따릉이를 운영하는 서울시에서는 매달 따릉이 자전거의 정기점검을 진행하고 있습니다.
1달에 주행 거리가 50km 이상인 자전거가 정기점검 대상에 포함됩니다.
2021년 2월 정기점검 대상 자전거를 추출하려고 합니다.
rental_history 테이블을 사용해 2021년 1월 한 달간 총 주행 거리가 50km 이상인 자전거의 ID를 출력하는 쿼리를 작성해주세요.
*/

SELECT bike_id
FROM rental_history
WHERE DATE(rent_at) BETWEEN '2021-01-01' AND '2021-01-31'
GROUP BY bike_id
HAVING SUM(distance) >= 50000;