INSERT INTO statistc.requestInfo(requestID, requestCode, userID, createDate )
VALUES(9, 'L', 'DDD', '2004040305'),
(10, 'L', 'EEE', '2004040226'),
(11, 'L', 'XXX', '2004040920'),
(12, 'L', 'ZZZ', '2008180421');

WITH `login` AS (
SELECT userID AS userID,
	SUBSTR(createDate, 1, 6) AS loginDate
FROM statistc.requestInfo WHERE requestCode = 'L'
)

SELECT avg(loginCnt.loginCount) AS 하루평균로그인횟수
FROM(SELECT loginDate AS loginDate,
			COUNT(DISTINCT userID) AS loginCount
            FROM `login`
            GROUP BY loginDate
            ORDER BY loginDate ASC) AS loginCnt;


