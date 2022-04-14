INSERT INTO statistc.user(userID, HR_ORGAN, USERNAME)
VALUES('AAA', 'B', 'Tom'),
('BBB', 'A', 'Choi'),
('CCC', 'A', 'Joe'),
('DDD', 'B', 'Jack'),
('EEE', 'A', 'Lisa'),
('GGG', 'C', 'Youn'),
('HHH', 'B', 'Kim'),
('XXX', 'C', 'Lee'),
('ZZZ', 'A', 'Sung');

CREATE table statistc.organLogin (
SELECT SUBSTR(createDate, 1, 4) AS createDate,
    userID AS userID,
    requestCode AS requestCode
FROM statistc.requestInfo
WHERE userID IN (SELECT userID FROM statistc.user WHERE HR_ORGAN = 'A')
GROUP BY createDate
ORDER BY createDate ASC
);

SELECT createDate AS LoginDate,
		COUNT(DISTINCT userID) AS LoginCnt
FROM statistc.organLogin
WHERE createDate = 2006 AND requestCode = 'L';
