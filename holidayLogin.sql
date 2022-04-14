CREATE table statistc.holiday(
      holiday varchar(10)
);

INSERT INTO statistc.holiday(holiday)
VALUES('200622'),('200702');

WITH hdLogin AS (
SELECT SUBSTR(createDate, 1, 6) AS createDate,
		userID AS userID,
    requestCode AS requestCode
FROM statistc.requestInfo
WHERE SUBSTR(createDate, 1, 6) NOT IN (SELECT holiday FROM statistc.holiday)
)

SELECT createDate AS LoginDate,
		COUNT(DISTINCT userID) AS LoginCnt 
FROM hdLogin
WHERE requestCode = 'L'
GROUP BY createDate
ORDER BY createDate ASC;
