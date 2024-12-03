SELECT 
	DATE_FORMAT(joindate, '%W') AS 'Dag van de week',
    COUNT(*)
FROM mhl_suppliers
GROUP BY `Dag van de week`
ORDER BY 
	FIELD(
        	DATE_FORMAT(joindate, '%W'), 
        	'Sunday',
        	'Monday',
            'Tuesday', 
        	'Wednesday', 
        	'Thursday', 
        	'Friday', 
        	'Saturday'
    )
