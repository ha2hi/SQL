-- 가격이 제일 비싼 식품의 정보 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131115?language=mysql
SELECT
    PRODUCT_ID,
    PRODUCT_NAME,
    PRODUCT_CD,
    CATEGORY,
    PRICE
FROM
    FOOD_PRODUCT
order by PRICE desc
limit 1

-- 가장 비싼 상품 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131697
SELECT
    max(price) as MAX_PRICE
FROM
    PRODUCT

-- 최댓값 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/59415?language=mysql
SELECT
    MAX(DATETIME)
FROM
    ANIMAL_INS
ORDER BY DATETIME desc
LIMIT 1

-- 최솟값 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/59038?language=mysql
SELECT
    MIN(DATETIME)
FROM
    ANIMAL_INS

-- 동물 수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/59406?language=mysql
SELECT
   count(distinct NAME)
FROM
    ANIMAL_INS
WHERE NAME is not NULL

