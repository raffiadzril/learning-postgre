SELECT id
FROM (
    SELECT id, 
    temperature,recordDate, 
    LAG(temperature) OVER (ORDER BY recordDate) AS yesterday_temperature,
    LAG(recordDate) OVER (ORDER BY recordDate) as is_yesterday_date
    FROM Weather
)
WHERE temperature > yesterday_temperature and recordDate = is_yesterday_date + INTERVAL '1 day';