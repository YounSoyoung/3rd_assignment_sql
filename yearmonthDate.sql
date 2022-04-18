SELECT yearmonthDate AS 접속날짜,
		COUNT(DISTINCT userID) AS 접속자수
FROM(
SELECT SUBSTR(createDate, 1, 6) AS yearmonthDate,
		userID AS userID
FROM statistc.requestInfo) AS accessCnt
GROUP BY yearmonthDate
ORDER BY yearmonthDate ASC;






