-- revising-the-select-query
-- https://www.hackerrank.com/challenges/revising-the-select-query/problem?isFullScreen=true
SELECT
    *
FROM
    CITY
WHERE
    1=1
AND POPULATION > 100000
AND COUNTRYCODE = 'USA';

-- weather-observation-station-1
-- https://www.hackerrank.com/challenges/weather-observation-station-1/problem?isFullScreen=true
SELECT
     CITY
    ,STATE
FROM
    STATION

-- select-by-id
-- https://www.hackerrank.com/challenges/select-by-id/problem?isFullScreen=true
SELECT
    *
FROM
    CITY
WHERE 
    1=1
AND ID = 1661

-- weather-observation-station-6
-- https://www.hackerrank.com/challenges/weather-observation-station-6/problem?isFullScreen=true
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    1=1
AND CITY LIKE ('a%')
OR  CITY LIKE ('e%')
OR  CITY LIKE ('i%')
OR  CITY LIKE ('o%')
OR  CITY LIKE ('u%');

-- Weather Observation Station 12
-- https://www.hackerrank.com/challenges/weather-observation-station-12/problem?isFullScreen=true
ELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    1=1
AND CITY NOT LIKE ('a%')
AND CITY NOT LIKE ('e%')
AND CITY NOT LIKE ('i%')
AND CITY NOT LIKE ('o%')
AND CITY NOT LIKE ('u%')
AND CITY NOT LIKE ('%a')
AND CITY NOT LIKE ('%e')
AND CITY NOT LIKE ('%i')
AND CITY NOT LIKE ('%o')
AND CITY NOT LIKE ('%u');

-- name-of-employees
-- https://www.hackerrank.com/challenges/name-of-employees/problem?isFullScreen=true
SELECT
    NAME
FROM
    EMPLOYEE
ORDER BY NAME;

-- salary-of-employees
--https://www.hackerrank.com/challenges/salary-of-employees/problem?isFullScreen=true
SELECT
    NAME
FROM
    EMPLOYEE
WHERE 
    1=1
AND SALARY > 2000
AND MONTHS < 10
ORDER BY EMPLOYEE_ID ASC;

--more-than-75-marks
--https://www.hackerrank.com/challenges/more-than-75-marks/problem?isFullScreen=true
SELECT
    NAME
FROM
    STUDENTS
WHERE 
    1=1
AND MARKS > 75
ORDER BY SUBSTR(NAME, -3), ID; -- RIGHT(NAME,3)

-- weather-observation-station-15
-- https://www.hackerrank.com/challenges/weather-observation-station-15/problem?isFullScreen=true
SELECT
    ROUND(LONG_W,4)
FROM
    STATION
WHERE
    1=1
AND LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

-- weather-observation-station-7
-- https://www.hackerrank.com/challenges/weather-observation-station-7/problem?isFullScreen=true
SELECT DISTINCT
    CITY
FROM
    STATION
WHERE
    1=1
AND CITY LIKE '%a'
OR CITY LIKE '%e'
OR CITY LIKE '%i'
OR CITY LIKE '%o'
OR CITY LIKE '%u'

-- weather-observation-station-8
-- https://www.hackerrank.com/challenges/weather-observation-station-8/problem?isFullScreen=true
SELECT DISTINCT CITY
FROM STATION
WHERE REGEXP_LIKE(CITY, '^[aeiouAEIOU].*[aeiouAEIOU]$');
