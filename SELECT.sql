-- 조건에 부합하는 중고거래 댓글 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/164673
SELECT
    t1.TITLE,
    t1.BOARD_ID,
    t2.REPLY_ID,
    t2.WRITER_ID,
    t2.CONTENTS,
    DATE_FORMAT(t2.CREATED_DATE, '%Y-%m-%d') as CREATED_DATE
FROM USED_GOODS_BOARD as t1, USED_GOODS_REPLY as t2
WHERE 1=1
AND   t1.BOARD_ID = t2.BOARD_ID
AND   DATE_FORMAT(t1.CREATED_DATE, '%Y-%m') = '2022-10'
ORDER BY t2.CREATED_DATE, t1.TITLE;

-- 강원도에 위치한 생산공장 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131112
SELECT
    FACTORY_ID,
    FACTORY_NAME,
    ADDRESS
FROM
    FOOD_FACTORY
WHERE 1=1
AND   substr(ADDRESS, 1, 3) = '강원도'
ORDER BY FACTORY_ID;

-- 서울에 위치한 식당 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131118
SELECT
    t1.REST_ID,
    t1.REST_NAME,
    t1.FOOD_TYPE,
    t1.FAVORITES,
    t1.ADDRESS,
    ROUND(AVG(t2.REVIEW_SCORE), 2) as SCORE
FROM REST_INFO as t1, REST_REVIEW as t2
WHERE 1=1
AND   t1.REST_ID = t2.REST_ID
AND   substr(t1.ADDRESS, 1,2) = '서울'
GROUP BY 
    t1.REST_ID,
    t1.REST_NAME,
    t1.FOOD_TYPE,
    t1.FAVORITES,
    t1.ADDRESS
ORDER BY SCORE desc, t1.FAVORITES desc

-- 흉부외과 또는 일반외과 의사 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/132203
SELECT
    DR_NAME,
    DR_ID,
    MCDP_CD,
    DATE_FORMAT(HIRE_YMD, '%Y-%m-%d') as HIRE_YMD
FROM
    DOCTOR
WHERE 1=1
AND   MCDP_CD in ('CS', 'GS')
ORDER BY HIRE_YMD desc, DR_NAME

-- 조건에 맞는 도서 리스트 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/144853
SELECT
    BOOK_ID,
    DATE_FORMAT(PUBLISHED_DATE, '%Y-%m-%d') as PUBLISHED_DATE
FROM
    BOOK
WHERE 1=1
AND   DATE_FORMAT(PUBLISHED_DATE, '%Y') = '2021'
AND   CATEGORY = '인문'
ORDER BY PUBLISHED_DATE

-- 평균 일일 대여 요금 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151136
SELECT
    ROUND(AVG(DAILY_FEE), 0) as AVERAGE_FEE
FROM
    CAR_RENTAL_COMPANY_CAR
WHERE CAR_TYPE = 'SUV'

-- 과일로 만든 아이스크림 고르기
-- https://school.programmers.co.kr/learn/courses/30/lessons/133025
SELECT
    t1.FLAVOR
FROM
    FIRST_HALF as t1, ICECREAM_INFO as t2
WHERE 1=1
AND   t1.FLAVOR = t2.FLAVOR
AND   t1.TOTAL_ORDER > 3000
AND   t2.INGREDIENT_TYPE = 'fruit_based'
order by t1.TOTAL_ORDER desc

-- 12세 이하인 여자 환자 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/132201
SELECT
    PT_NAME,
    PT_NO,
    GEND_CD,
    AGE,
    IFNULL(TLNO, 'NONE')
FROM
    PATIENT
WHERE 1=1
AND   AGE <= 12
AND   GEND_CD = 'W'
ORDER BY AGE desc, PT_NAME

-- 재구매가 일어난 상품과 회원 리스트 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131536
SELECT
    USER_ID,
    PRODUCT_ID
FROM
    ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING count(*) > 1
order by USER_ID, PRODUCT_ID desc

-- 오프라인/온라인 판매 데이터 통합하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131537
-- 코드를 입력하세요
SELECT
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE,
    PRODUCT_ID,
    USER_ID,
    SALES_AMOUNT
FROM
    ONLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'
UNION ALL
SELECT
    DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE,
    PRODUCT_ID,
    NULL as USER_ID,
    SALES_AMOUNT
FROM
    OFFLINE_SALE
WHERE DATE_FORMAT(SALES_DATE, '%Y-%m') = '2022-03'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID

