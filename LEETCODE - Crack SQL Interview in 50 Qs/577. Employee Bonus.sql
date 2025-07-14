SELECT E.name, B.bonus from Employee E 
LEFT JOIN Bonus B on E.empID = B.empId 
where B.bonus < 1000 OR B.bonus is NULL;