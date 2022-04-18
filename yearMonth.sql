INSERT INTO statistc.requestInfo(requestID, requestCode, userID, createDate )
VALUES(5, 'O', 'AAA', '2008180710'),
(6, 'O', 'EEE', '2004150204'),
(7, 'L', 'GGG', '2007020912'),
(8, 'L', 'HHH', '2007020815');

SELECT yearMonth AS 년월,
		COUNT(DISTINCT userID) AS 접속자수
FROM(
SELECT SUBSTR(createDate, 1, 4) AS yearMonth,
		userID AS userID
FROM statistc.requestInfo) AS monthLogin
GROUP BY yearMonth
ORDER BY yearMonth ASC;





