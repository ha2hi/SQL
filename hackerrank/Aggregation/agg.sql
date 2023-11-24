-- revising-aggregations-sum
-- https://www.hackerrank.com/challenges/revising-aggregations-sum/problem?isFullScreen=true
SELECT
    SUM(POPULATION)
FROM
    CITY
WHERE
    DISTRICT = 'California';

-- revising-aggregations-the-average-function
-- https://www.hackerrank.com/challenges/revising-aggregations-the-average-function/problem?isFullScreen=true
SELECT
    AVG(POPULATION)
FROM
    CITY
WHERE
    DISTRICT = 'California';

-- average-population
-- https://www.hackerrank.com/challenges/average-population/problem?isFullScreen=true
SELECT
    FLOOR(AVG(POPULATION))
FROM
    CITY;

-- japan-population
-- https://www.hackerrank.com/challenges/japan-population/problem?isFullScreen=true
SELECT
    SUM(POPULATION)
FROM
    CITY
WHERE COUNTRYCODE = 'JPN';

-- population-density-difference
-- https://www.hackerrank.com/challenges/population-density-difference/problem?isFullScreen=true
SELECT
    MAX(POPULATION)-MIN(POPULATION)
FROM 
    CITY;

-- the-blunder
-- https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
SELECT
    CEIL(AVG(SALARY)-AVG(REPLACE(SALARY, '0', '')))
FROM
    EMPLOYEES;

-- earnings-of-employees
-- https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
SELECT
    SALARY * MONTHS,
    COUNT(*)
FROM
    EMPLOYEE
WHERE
    SALARY * MONTHS = (SELECT MAX(SALARY*MONTHS) FROM EMPLOYEE)
GROUP BY
    SALARY * MONTHS;

-- weather-observation-station-2
-- https://www.hackerrank.com/challenges/weather-observation-station-2/problem?isFullScreen=true
SELECT
    ROUND(SUM(LAT_N), 2),
    ROUND(SUM(LONG_W), 2)
FROM
    STATION;

-- weather-observation-station-13
-- https://www.hackerrank.com/challenges/weather-observation-station-13/problem?isFullScreen=true
SELECT
    ROUND(SUM(LAT_N),4)
FROM
    STATION
WHERE
    LAT_N > 38.7880 
AND LAT_N < 137.2345;

-- weather-observation-station-14
-- https://www.hackerrank.com/challenges/weather-observation-station-14/problem?isFullScreen=true
SELECT
    MAX(ROUND(LAT_N, 4))
FROM
    STATION
WHERE
    LAT_N < 137.2345;

-- weather-observation-station-15
-- https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true
SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

-- weather-observation-station-16
-- https://www.hackerrank.com/challenges/weather-observation-station-16/problem?isFullScreen=true
SELECT
    ROUND(MIN(LAT_N), 4)
FROM
    STATION
WHERE
    LAT_N > 38.7780;

-- weather-observation-station-17
-- https://www.hackerrank.com/challenges/weather-observation-station-17/problem?isFullScreen=true
SELECT
    ROUND(LONG_W, 4)
FROM
    STATION
WHERE
    LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

-- weather-observation-station-18
-- https://www.hackerrank.com/challenges/weather-observation-station-18/problem?isFullScreen=true
SELECT
    ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4)
FROM
    STATION;

-- weather-observation-station-19
-- https://www.hackerrank.com/challenges/weather-observation-station-19/problem?isFullScreen=true
SELECT
    ROUND(SQRT(POW(MAX(LAT_N)-MIN(LAT_N),2) + POW(MAX(LONG_W)-MIN(LONG_W), 2)), 4)
FROM
    STATION;

-- weather-observation-station-20
-- https://www.hackerrank.com/challenges/weather-observation-station-20/problem?isFullScreen=true
SELECT
    ROUND(LAT_N,4)
FROM
(   SELECT
        LAT_N,
        PERCENT_RANK() OVER(ORDER BY LAT_N) as rnk
    FROM
        STATION
) rnk_t
WHERE rnk = 0.5;
