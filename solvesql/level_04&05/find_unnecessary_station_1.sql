/*
Title : 폐쇄할 따릉이 정류소 찾기 1
Content :
공유 자전거 서비스인 따릉이를 운영하는 팀에서는 서로 가까운 따릉이 정류소 들을 찾아내고 그 중 ��래된 정류소를 폐쇄해 따릉이 서비스의 운영 비용을 줄이려고 합니다.
따릉이 데이터를 다루는 당신은 정류소 정보를 확인해 폐쇄를 검토할 따릉이 정류소 목록을 추려내는 업무를 받았습니다.
업무를 수행하기 위해 정류소 정보가 저장된 station 테이블을 사용해 반경 300m 이내에 나중에 생기거나 업그레이드 된 다른 정류소가 5개 이상 있는 따릉이 대여소의 아이디(station_id)와 이름(name)을 출력하는 쿼리를 작성해주세요.
서로 다른 두 지점의 위도와 경도 정보를 통해 두 지점의 거리를 구할 때는 Haversine formula를 사용합니다.
장소 1의 위치를 나타내는 라디안(radian) 단위의 위도와 경도를 각각 ρ1​, λ1​, 장소 2의 위치를 나타내는 라디안(radian) 단위의 위도와 경도를 각각 ρ2​, λ2​, 그리고 지구의 반지름을 r=6356km라고 할 때, 두 장소의 거리(d)는 아래와 같습니다.
*/

SELECT station_id, name
FROM (
  SELECT s1.station_id, s1.name, COUNT(s2.station_id) AS cnt
  FROM station AS s1
  LEFT OUTER JOIN station AS s2
  ON s1.station_id != s2.station_id
    AND s2.updated_at > s1.updated_at
    AND (6371 * ACOS(COS(RADIANS(s1.lat)) * COS(RADIANS(s2.lat))
      * COS(RADIANS(s2.lng) - RADIANS(s1.lng))
      + SIN(RADIANS(s1.lat)) * SIN(RADIANS(s2.lat)))) <= 0.3
  GROUP BY s1.station_id
  HAVING cnt >= 5
)
ORDER BY 1;