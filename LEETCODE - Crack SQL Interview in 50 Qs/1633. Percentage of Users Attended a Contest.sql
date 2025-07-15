SELECT 
  r.contest_id,
  ROUND((COUNT(r.user_id)* 1.0 / (SELECT COUNT(*) FROM Users)) * 100.0, 2) AS percentage
FROM Register r
JOIN Users u ON u.user_id = r.user_id
GROUP BY r.contest_id
ORDER BY percentage DESC, contest_id ASC;
