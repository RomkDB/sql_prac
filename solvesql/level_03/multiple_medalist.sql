/*
Title : 복수 국적 메달 수상한 선수 찾기
Content :
역대 올림픽 정보 데이터셋은 역대 올림픽 경기와 관련된 데이터가 들어있는 테이블로 이루어져 있습니다.
athletes 테이블에는 역대 올림픽 참가 선수의 이름이 들어 있습니다. events 테이블에는 종목과 경기 이름이 들어 있습니다.
games 테이블에는 올림픽 개최 연도, 개최 도시와 시즌 정보가 기록되어 있습니다.
records 테이블에는 역대 올림픽 참가 선수들의 신체 정보와 획득한 메달 정보가 기록되어 있습니다.
이 테이블은 다른 테이블과 매핑할 수 있는 ID 정보도 가지고 있습니다.
teams 테이블에는 국가 정보가 기록되어 있습니다.
2000년 이후의 메달 수상 기록만 고려했을 때, 메달을 수상한 올림픽 참가 선수 중 2개 이상의 국적으로 메달을 수상한 기록이 있는 선수의 이름을 조회하는 쿼리를 작성해주세요.
조회된 선수의 이름은 오름차순으로 정렬되어 있어야 합니다.
예를 들어, Viktor An 선수는 2006년 토리노에서 열린 동계 올림픽과 2014년 소치에서 열린 동계 올림픽에서 메달을 수상했는데, 2006년에는 대한민국(KOR) 국적으로 메달을 수상했고 2014년에는 러시아(RUS) 국적으로 메달을 수상했습니다.
*/

SELECT a.name
FROM records AS r
INNER JOIN games AS g ON r.game_id = g.id
INNER JOIN athletes AS a ON r.athlete_id = a.id
WHERE g.year >= 2000 AND r.medal IS NOT NULL
GROUP BY r.athlete_id
HAVING COUNT(DISTINCT(team_id)) > 1
ORDER BY a.name;