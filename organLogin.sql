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

SELECT LoginDate AS LoginDate,
		COUNT(DISTINCT userID) AS loginCnt,
        HR_ORGAN AS HR_ORGAN
FROM (
SELECT SUBSTR(createDate, 1, 4) AS LoginDate,
		userID AS userID,
        requestCode AS requestCode,
        HR_ORGAN as HR_ORGAN
FROM (SELECT sr.createDate, sr.userID, sr.requestCode, su.HR_ORGAN
FROM statistc.requestInfo AS sr INNER JOIN statistc.user AS su
ON sr.userID = su.userID WHERE requestCode = 'L') AS organLogin) AS organ
WHERE HR_ORGAN = 'A' AND LoginDate = 2006
GROUP BY HR_ORGAN;
