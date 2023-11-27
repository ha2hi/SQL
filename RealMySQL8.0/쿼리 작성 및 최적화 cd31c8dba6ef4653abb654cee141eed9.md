# 쿼리 작성 및 최적화

### 영문 대소문자 구분

MySQL 서버는 설치된 운영체제에 따라 대소문자를 구분한다. 윈도우에 설치된 MySQL에서는 대소문자를 구분하지 않지만, 유닉스 계열의 운영 체제에서는 대소문자를 구분한다. 운영체제와 관계없이 대소문자 영향을 받지 않게 하기 위해서는 MySQL 서버 설정파일에 lower_case_table_names 시스템 변수를 1로 설정하면 모두 소문자로 저장된다. 이 설정 기본값은 0으로 대소문자를 구분한다.

### MySQL 예약어

데이터베이스나 테이블, 컬럼의 이름에 예약어를 사용하고 싶다면 역따옴표(`)나 쌍따옴표로 감싸야한다.

### 11.3.1.1 문자열

문자열 값에 홑따옴표가 포함돼 있을 때 홑따옴표를 두 번 연속해서 입력하면 된다.

```sql
SELECT * FROM departments WHERE dept_n='d''001';
```

### 11.3.2.1 동등 비교

MySQL에서는 동등 비교를 위해 “<=>”연산자를 제공합니다.  “<=>”연산자는 “=”연사잔와 같으며, 부가적으로 NULL 값에 대한 비교까지 수행한다.

```sql
SELECT 1=1, NULL = NULL, 1 = NULL;
```

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled.png)

```sql
SELECT 1<=>1, NULL <=> NULL, 1 <=> NULL;
```

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%201.png)

### 11.3.2.3 NOT 연산자(!)

TRUE 또는 FALSE 연산의 결과를 반대로 만드는 연산자로 “NOT”을 사용한다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%202.png)

### 11.3.2.4 AND(&&)와 OR(||) 연산자

오라클에서는 “||”를 불리언 표현식 결합 연산자가 아닌 문자열 결합하는 연산자로 사용하는데 MySQL에서 사용하려면 sql_mode 시스템 변숫값에 PIPES_AS_CONCAT을 성정하면된다. SQL의 가독성을 높이기 위해 다른 용도로 사용될 수 있는 “&&”연산자와 “||” 연산자는 사용을 자제하는 것이 좋다.

AND연산자가 OR연산자보다 우선순위를 가진다.

### 11.3.2.5 나누기(/,DIV)와 나머지(%,MOD) 연산자

나누기 연산자는 ‘/’를 사용한다. 나눈 몫의 정수만 가져오려먼 DIV연산자를 사용하고, 나눈 결과의 나머지를 가져오기 위해서는 ‘%’또는 MOD 연산자를 사용한다.

### 11.3.2.6 REGEXP 연산자

문자열의 값이 어떤 패턴을 만족하는지 확인하는 연사자이다. 정규표현식을 비교하는 연산자다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%203.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%204.png)

- ^ : 문자열의 시작을 표시
- $ : 문자열의 끝을 표시
- [] : 문자 그룹을 표시 [xyz]라고 표현하면 ‘x’,’y’,’z’ 문자 중 하나인지 확인
- () : 문자 그룹을 표시 (xyz)라고하면 세 문자 중 한 문자가 있는지 체크하는 것이 아니라 “xyz”가 모두 있는 체크
- | : 연결된 문자 중 하나에 해당되는지 확인 “abc|xyz”라고하면 “abc”이거나 “xyz”인지 확인
- . : 어떠한 문자든 1개의 문자를 표시
- * : 0번 또는 1번 이상 반복될 수 있다.
- + : 1번 이상 반복될 수 있다.
- ? : 0번 또는 1번만 올 수 있다.

REGEXP연산자를 문자열 칼럼 비교에 사용할 때 REGEXP 조건의 비교는 인덱스 레인지 스캔을 사용할 수 없다. 따라서 WHERE 조건절에 REGEXP 연산자를 사용한 조건을 단독으로 사용하는 것은 성능상 좋지 않다.

### 11.3.2.7 LIKE 연산자

와일드카드 문자인 ‘%’나 ‘_’ 문자 자체를 비교한다면 ESCAPE 절을 LIKE 조건 뒤에 추가해 이스케이프 문자를 설정할 수 있다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%205.png)

LIKE 연산자는 와일드카드 문자인(%,_)가 검색어의 뒤쪽에 있다면 인덱스 레인지 스캔을 사용할 수 있지만 검색어의 앞쪽에 있다면 인덱스 레인지 스캔을 사용할 수 없다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%206.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%207.png)

와일드카드가 앞쪽에 있는경우 인덱스레인지 스캔을 사용하지 못하고 인덱스를 처음부터 끝까지 읽는 인덱스 풀 스캔 방식으로 쿼리가 처리된다.

### 11.3.2.8 BETWEEN 연산자

BETWEEN 연산자는 다른 비교 조건과 결합해 하나의 인덱스를 사용할 때 주의해야 할 점이 있다.

```sql
SELECT * FROM dept_emp
WHERE dept_no='d003' AND emp_no=10001;

SELECT * FROM dept_emp
WHERE dept_no BETWEEN'd003' AND 'd005' AND emp_no=10001;
```

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%208.png)

BETWEEN 조건을 사용하는 쿼리는 dept_emp테이블의 인덱스의 상당히 많은 레코드를 읽는다.

이 쿼리를 다음과 같은 형태로 바꾸면

```sql
SELECT * FROM dept_emp
WHERE dept_no IN ('d003','d004','d005')
 AND emp_no=10001;
```

BETWEEN이 선형으로 인덱스를 검색해야 하는 것과는 달리 IN은 동등 비교를 여러 번 수행하는 것과 같은 효과가 있기 때문에 dept_emp 테이블을의 인덱스를 최적으로 사용할 수 있다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%209.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2010.png)

예전 버전의 MySQL 서버에서는 BETWEEN 연산자를 IN 연산자로 변경하기 위해서는 우선 dept_no 컬럼의 값이 ‘d003’와 ‘dd05’ 사이의 모든 부서 코드 값을 가져와 dept_no IN (’d003’, ‘d004’, ‘d005’) 조건을 만들어야 했다. 하지만 MySQL 8.0 버전부터는 다음과 같인 “IN(subquery)” 형태로 작성하면 옵티마이저가 세미 조인 최적화를 통해 더 빠른 쿼리로 변환해서 실행한다.

```sql
SELECT *
FROM dept_emp USE INDEX(PRIMARY)
WHERE dept_no IN(
			SELECT dept_no 
			FROM dept_emp
			WHERE dept_no BETWEEN 'd003' AND 'd005')
AND emp_no = 10001;
```

### 11.3.2.9 IN연산자

IN은 여러 개의 값이 비교되지만 BETWEEN과 달리 범위로 검색하는 것이 아니라 여러 번의 동등 비교로 실행하기 때문에 일반적으로 빠르게 처리된다.

```sql
SELECT *
FROM dept_emp 
WHERE (dept_no, emp_no) IN (('d001',100117), ('d002',10114),('d003',10054));
```

위 쿼리는 IN절에 단순 스칼라 값이 아니라 튜플이 사용됐다. MySQL 8.0버전 부터는 위의 쿼리와 같이 IN절에 튜플을 그대로 나열해도 인덱스를 최적으로 사용할 수 있게 개선됐다. 인덱스 레인지 스캔을 실행한다.

### 11.3.3.1 NULL 값 비교 및 대체(IFNULL, ISNULL)

IFNULL()은 칼럼이나 표현식이 NULL 인지 비교하고, NULL이면 다른 값으로 대체하는 함수이다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2011.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2012.png)

ISNULL()은 인자 값이 NULL이면 TRUE(1), NULL이 아니면 FALSE(0)을 반환한다

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2013.png)

### 11.3.3.2 현재 시각 조회(NOW, SYSDATE)

NOW()와 SYSDATE() 모두 현재의 시간을 반환해주는 함수이다. NOW()함수는 같은 값을 가지지만 SYSDATE()함수는 하나의 SQL 내에서도 호출되는 시점에 따라 결과 값이 달라진다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2014.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2015.png)

SYSDATE()함수는 이러한 특성 탓에 두 가지 큰 잠재적인 문제가 있다.

- 첫 번째로는 SYSDATE() 함수가 사용된 SQL은 레플리카 서버에서 안정적으로 복제되지 못한다.
- 두 번째로는 SYSDATE() 함수와 비교되는 칼럼은 인덱스를 효율적으로 사용하지 못한다.

NOW()를 사용하는 경우에 인덱스 레인지 스캔을 사용하지만, SYSDATE()를 사용하는 경우에 풀 스캔을 사용한다. 꼭 필요할 때가 아니라면 SYSDATE()를 사용하지 않는 편이 좋다.

### 11.3.3.3 날짜와 시간의 포맷(DATE_FORMAT, STR_TO_DATE)

DATETIME 타입의 칼럼이나 값을 원하는 형태의 문자열로 변환해야 할 때는 DATE_FORMAT() 함수를 이용하면 된다.

| 지정문자 | 내용 |
| --- | --- |
| %Y | 4자리 연도 |
| %m | 2자리 월 |
| %d | 2자리 일자 |
| %H | 2자리 시 |
| %i | 2자리 분 |
| %s | 2자리 초 |

```sql
SELECT DATE_FORMAT(NOW(), '%Y-%m-%d');

SELECT DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s');
```

STR_TO_DATE() 함수를 이용해 문자열을 DATETIME 타입으로 변환할 수 있다.

```sql
SELECT STR_TO_DATE('2022-08-23', '%Y-%m-%d');

SELECT STR_TO_DATE('2022-08-23 15:03:28', '%Y-%m-%d %H:%i:%s');
```

### 11.3.3.4 날짜와 시간의 연산(DATE_ADD)

특정 날짜에서 더하거나 뺄 때는 DATE_ADD() 함수나 DATE_SUB()함수를 사용한다. DATE_ADD() 함수로 더하거나 빼는 처리를 모두 할 수 있기 때문에 DATE_SUB()는 크게 필요 없다.

DATE_ADD()는 총 2개의 인자가 필요한데, 첫 번째 인자는 날짜이고, 두 번째 인자는 INTERVAL n [YEAR, MONTH, DAY, HOUR, MINUTE, SECOND,..] 형태로 입력한다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2016.png)

### 11.3.3.5 타임스탬프 연산(UNIX_TIMESTAMP, FROM_UNIXTIME)

UNIX_TIMESTAMP() 함수는 ‘1970-01-01 00:00:00’으로 부터 경과된 초의 수를 반환하는 함수다. UNIX_TIMESTAMP()는 인자가 없으면 오늘 날짜 값 기준으로 값이 반환된다. 

FROM_UNIXTIME()함수는 UNIX_TIMESTAMP()와 반대로, DATETIME 타입으로 변환하는 함수다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2017.png)

### 11.3.3.6 문자열 처리(RPAD, LPAD / RTRIM, LTRIM, TRIM)

RPAD(), LPAD() 함수는 문자열의 좌측 또는 우측에 문자를 덧붙여서 지정된 길이의 만자열로 만드는 함수다.

RTRIM()함수와 LTRIM() 함수는 문자열의 우측 또는 좌측에 연속된 공백 문자(Space, NewLine, Tab 문자)를 제거하는 함수다. TRIM()은 좌 우측 동시에 공백 문자를 제거하는 함수다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2018.png)

### 11.3.3.7 문자열 결합(CONCAT, CONCAT_WS)

여러 개의 문자열을 연결해서 하나의 문자열로 반환하는 함수로, 인자의 개수는 제한이 없다. 숫자 값을 인자로 전달하면 문자열 타입으로 자동 변환 후 연결된다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2019.png)

비슷한 함수로 CONCAT_WS()라는 함수가 있는데, 각 문자열을 연결할 때 구분자를 넣어주는 함수다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2020.png)

### 11.3.3.8 GROUP BY 문자열 결합(GROUP_CONCAT)

COUNT(), MAX(), MIN(), AVG() 등과 같은 그룹합수 여러 레코드 값을 병합해서 하나의 값을 만들어내는 함수 중 하나다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2021.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2022.png)

- 윈도우 함수를 이용해 최대 5개 부서만 GROUP_CONCAT 실행

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2023.png)

- 레터럴 조인을 이용해 부서별 10명씨만 GROUP_CONCAT 실행

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2024.png)

### 11.3.3.9 값의 비교와 대체(CASE WHEN … THEN … END)

크게 2가지 방법으로 사용할 수 있는데, 예제를 통해 살펴보자

```sql
SELECT emp_no, first_name
       CASE gender WHEN 'M' THEN 'Man'
                   WHEN 'F' THEN 'Woman'
                   ELSE 'Unknown' END AS gender
FROM employees
LIMIT 10;
```

이 방식은 동등 연산자(=)로 비교할 수 있을 때 비교하고자 하는 칼럼이나 표현식을 CASE와 WHEN 키워드 사이에 두고, 비교 기준 값을 WHEN 뒤에 입력하는 방식이다.

```sql
SELECT emp_no, first_name
       CASE WHEN hire_date < '1995-01-01' THEN 'Old'
            ELSE 'NEW' END AS employee_type
FROM employees
LIMIT 10;
```

이 방식은 단순히 두 비교 대상 값의 동등 비교가 아니라 크다 또는 작다 비교와 같이 표현식으로 비교할 때 사용하는 방식이다.

CASE WHEN 구문에서 한 가지 중요한 사실은 CASE WHEN 절이 일치하는 경우만 THEN이하의 표현식이 실행된다는 점이다. 다음 예저는 d001 부서에 소속된 적이 있는 모든 사원의 가장 최근 급여를 조회하는 쿼리다.

```sql
SELECT de.dept_no, e.first_name, e.gender,
       (SELECT s.salary FROM salaries s
        WHERE s.emp_no = e.emp_no
        ORDER BY from_date DESC LIMIT 1) AS last_salary
FROM dept_emp de, employees e
WHERE de.emp_no = e.emp_no
AND   de.dept_no = 'd001';
```

해당 쿼리는 2만여 건의 레코드를 조회하는데, 급여 테이블을 조회하는 서브쿼리도 이 레코드 건수만큼 실행된다.

그런데 성별이 여자인 경우에만 최종 급여가 필요하다면, 남자인 경우 salaries 테이블을 조회할 필요가 없다.

```sql
SELECT de.dept_no, e.first_name, e.gender,
       CASE e.gender = 'F' THEN 
	       (SELECT s.salary FROM salaries s
	        WHERE s.emp_no = e.emp_no
	        ORDER BY from_date DESC LIMIT 1) AS last_salary
       ELSE 0 END AS last_salary
FROM dept_emp de, employees e
WHERE de.emp_no = e.emp_no
AND   de.dept_no = 'd001';
```

이렇게 변경하면 여자인 경우에만 서브쿼리가 실행될 것이다.

### 11.3.3.10 타입의 변환(CAST, CONVERT)

프리페어 스테이트먼트를 제외하면 SQL은 텍스트(문자열)기반으로 작동하기 때문에 SQL에 포함된 모든 입력값은 문자열 취급된다. 이럴 때 명시적으로 타입의 변환이 필요하다면 CAST() 함수를 이용하면 된다.

CAST()함수를 통해 변환할 수 있는 데이터 타입은 DATE, TIME, DATETIME, BINARY, CHAR, DECIMAL, SINGNED INTEGER, UNSIGNED INTEGER다.

```sql
SELECT CAST('1234' AS SIGNED INTEGER);

SELECT CAST('2000-01-01' AS DATE);
```

### 11.3.3.11 이진값과 16진수 문자열 변환(HEX, UNHEX)

HEX()함수는 이진값을 16진수의 문자열로 변환하는 함수이고, UNHEX() 함수는 16진수의 문자열을 이진값으로 변환하는 함수이다.

### 11.3.3.13 처리 대기(SLEEP)

SQL의 개발이나 디버깅 요도로 잠깐 대기하거나 일부러 쿼리의 실행을 오래 시간 유지하고자 할 때 상당히 유용한 함수다.

이 함수는 대기할 시간을 초 단위로 인자를 받는다.

```sql
SELECT SLEEP(1.5) FROM employees LIMIT 10;
```

SLEEP() 함수는 레코드의 건수만큼 SLEEP() 함수를 호출하기 때문에 위의 쿼리는 조회되는 레코드 건별로 1.5초 동안 대기한다. 총 15초 동안 실행

### 11.3.3.14 벤치마크(BENCHMARK)

BENCHMARK() 함수는 SLEEP() 함수와 같이 디버깅이나 간단한 함수의 성능 테스트 용으로 아주 유용한 함수다. BENCHMARK() 함수는 2개의 인자가 필요하다. 1. 반복할 횟수, 2. 반복할 표현식, 2번째 인자의 표현식은 반드시 스칼라 값을 반환해야 하는 표현식이어야 한다.

employees 테이블에서 건수만 세는 SQL 문장을 10만번 실행하는데 걸리는 시간을 파악하여 쿼리 성능을 확인해볼 수 있다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2025.png)

BENCHMARK() 사용시 주의 사항은 SELECT BENCHMARK(10, expr)와 SELECT expr을 10번 실행하는 것은 차이가 있다. BENCHMARK 사용하는 것이 메모리 할당도 1/10 밖에 일어나지 않고, 1번의 네트워크, 쿼리 파싱 및 최적화 비용만 소요된다.

두 개의 동일한 기능을 상대적으로 비교 분석하는 용도로 사용할 것을 권장한다.

### JSON 포맷(JSON_PRETTY)

JSON_PRETTY() 함수를 이용하면 JSON 칼럼의 값을 읽기 쉬운 포맷으로 변환해준다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2026.png)

### 11.3.3.17 JSON 필드 크기(JSON_STORAGE_SIZE)

JSON 데이터는 텍스트 기반이지만 MYSQL 서버는 디스크 저장공간을 절약하기위해 BSON(Binary JSON) 포맷을 사용하여 저장하기 때문에 저장 공간의 크기가 얼마나 될지 예측하기 어렵다. JSON_STORAGE_SIZE() 함수는 JSON의 사이즈를 알려준다. 단위는 바이트다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2027.png)

### 11.3.3.18 JSON 필드 추출(JSON_EXTRACT)

JSON 값에서 특정 필드를 가져오는 방법은 여러 가지가 있지만 일반적인 방법은 JSON_EXTRACT() 함수를 사용하는 것이다. 2개의 인자가 필요한데 1. JSON 데이터가 저장된 칼럼, 2. 경로 이다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2028.png)

JSON_UNQUOTE() 함수를 함께 사용하면 따옴표 없이 값만 가져올 수 있다. JSON_EXTRACT() 함수를 간편하게 사용할 수 있다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2029.png)

“→” 연산자는 JSON_EXTRACT()와 동일한 기능이며, “→>”연산자는 JSON_UNQUOTE()와 JSON_EXTRACT()를 조합한 것과 동일하다.

### 11.3.3.19 JSON 오브젝트 포함 여부 확인(JSON_CONTAINS)

JSON 도큐먼트 또는 지정된 JSON 경로에 JSON 필드를 가지고 있는지 확인하는 함수

```sql
SELECT emp_no FROM employee_docs
WHERE JSON_CONTAINS(doc, '{"first_name":"Christian"}'

SELECT emp_no FROM employee_docs
WHERE JSON_CONTAINS(doc, '"Christian"', '$.first_name');
```

### 11.3.3.20 JSON 오브젝트 생성(JSON_OBJECT)

칼럼의 값을 이용해 JSON 오브젝트를 생성하는 함수다.

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2030.png)

### 11.3.3.21 JSON 칼럼으로 집계(JSON_OBJECTAGG & JSON_ARRAYAGG)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2031.png)

![Untitled](%E1%84%8F%E1%85%AF%E1%84%85%E1%85%B5%20%E1%84%8C%E1%85%A1%E1%86%A8%E1%84%89%E1%85%A5%E1%86%BC%20%E1%84%86%E1%85%B5%E1%86%BE%20%E1%84%8E%E1%85%AC%E1%84%8C%E1%85%A5%E1%86%A8%E1%84%92%E1%85%AA%20cd31c8dba6ef4653abb654cee141eed9/Untitled%2032.png)