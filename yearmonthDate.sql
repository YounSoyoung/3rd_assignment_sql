CREATE table statistc.yearmonthDate(
SELECT SUBSTR(createDate, 1, 6) AS yearmonthDate, userID AS userID
FROM statistc.requestInfo
GROUP BY createDate
ORDER BY createDate ASC
);

SELECT yearmonthDate as 접속날짜,
	COUNT(DISTINCT userID) as 접속자수
FROM statistc.yearmonthDate
GROUP BY yearmonthDate
ORDER BY yearmonthDate ASC;
