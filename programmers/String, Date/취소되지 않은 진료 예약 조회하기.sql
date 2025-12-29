-- https://school.programmers.co.kr/learn/courses/30/lessons/132204
-- 코드를 입력하세요
-- 2022년 4월 13일 취소되지 않은 흉부외관(CS) 예약 내역 조회
-- 예약번호, 환자이름, 환자번호, 진료과코드, 의사이름, 진료예약일시 출력
-- 진료예약일시 오름차순
SELECT
    A.APNT_NO,
    P.PT_NAME,
    A.PT_NO,
    A.MCDP_CD,
    D.DR_NAME,
    A.APNT_YMD
FROM
    APPOINTMENT A
LEFT JOIN PATIENT P ON A.PT_NO = P.PT_NO
LEFT JOIN DOCTOR D ON A.MDDR_ID = D.DR_ID
WHERE
    A.APNT_YMD >= '2022-04-13'
AND A.APNT_YMD < '2022-04-14'
AND A.MCDP_CD = 'CS'
AND A.APNT_CNCL_YN = 'N'
ORDER BY A.APNT_YMD
