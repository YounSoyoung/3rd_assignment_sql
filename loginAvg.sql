INSERT INTO statistc.requestInfo(requestID, requestCode, userID, createDate )
VALUES(9, 'L', 'DDD', '2004040305'),
(10, 'L', 'EEE', '2004040226'),
(11, 'L', 'XXX', '2004040920'),
(12, 'L', 'ZZZ', '2008180421');

CREATE table statistc.login(
SELECT userID AS userID, 
SUBSTR(createDate, 1, 6) AS loginDate
FROM statistc.requestInfo WHERE requestCode = "L"
GROUP BY createDate
ORDER BY createDate ASC
);

CREATE table statistc.loginCnt(
SELECT loginDate as loginDate,
	COUNT(DISTINCT userID) AS loginCount
FROM statistc.login
GROUP BY loginDate
ORDER BY loginDate ASC);

SELECT AVG(loginCount) FROM statistc.loginCnt;
