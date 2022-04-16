CREATE table statistc.holiday(
      hMonth varchar(5),
      hDate varchar(5)
);

INSERT INTO statistc.holiday(hMonth, hDate)
VALUES('06', '22'),
('07', '02');

WITH hdLogin AS (
SELECT SUBSTR(createDate, 1, 6) AS createDate,
		userID AS userID,
    requestCode AS requestCode
FROM statistc.requestInfo
WHERE SUBSTR(createDate, 3, 2) NOT IN (SELECT hMonth FROM statistc.holiday) and
      SUBSTR(createDate, 5, 2) NOT IN (SELECT hDate FROM statistc.holiday)
)

SELECT createDate AS LoginDate,
		COUNT(DISTINCT userID) AS LoginCnt 
FROM hdLogin
WHERE requestCode = 'L'
GROUP BY createDate
ORDER BY createDate ASC;
