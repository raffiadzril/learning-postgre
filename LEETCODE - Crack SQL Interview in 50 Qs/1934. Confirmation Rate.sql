-- SUB QUERY
SELECT s.user_id,
    COALESCE(ROUND(
        (SELECT COUNT(*) 
         FROM Confirmations c2 
         WHERE c2.user_id = s.user_id AND c2.action = 'confirmed'
         GROUP BY c2.user_id) * 1.0
        /
        NULLIF((
            SELECT COUNT(*) 
            FROM Confirmations c2 
            WHERE c2.user_id = s.user_id 
            GROUP BY c2.user_id
        ), 0)
    ,2) , 0) AS confirmation_rate
FROM Confirmations c 
RIGHT JOIN Signups s ON c.user_id = s.user_id
GROUP BY s.user_id;

-- Alternative using aggregation
SELECT s.user_id,
    COALESCE(ROUND(AVG(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END), 2), 0) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;