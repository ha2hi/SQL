-- weather-observation-station-5
-- https://www.hackerrank.com/challenges/weather-observation-station-5/problem?isFullScreen=false
(SELECT
    CITY
    ,LENGTH(CITY)
FROM
    STATION
ORDER BY LENGTH(CITY), CITY
LIMIT 1)
UNION ALL
(SELECT
    CITY
    ,LENGTH(CITY)
FROM
    STATION
ORDER BY LENGTH(CITY) DESC, CITY
LIMIT 1)
