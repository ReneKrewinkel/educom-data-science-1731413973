SELECT 
	cit.name AS 'City name',
    
    SUM(
        CASE 
        	WHEN mem.name = 'Gold' THEN 1 
        	ELSE 0 
        END
    	) AS 'Gold',
    SUM(
        CASE 
        	WHEN mem.name = 'Silver' THEN 1 
        	ELSE 0 
        	END
    	) AS 'Silver',
    SUM(
        CASE 
        	WHEN mem.name = 'Bronze' THEN 1 
        	ELSE 0
    	END
    	) AS 'Bronze',
    SUM(
        CASE 
        	WHEN mem.name NOT IN ('Gold', 'Silver', 'Bronze') THEN 1
        	ELSE 0
        END
        ) AS 'Other'
FROM mhl_suppliers sup
LEFT JOIN mhl_membertypes mem ON sup.membertype = mem.id
LEFT JOIN mhl_cities cit ON sup.city_ID = cit.id
GROUP BY cit.name
ORDER BY `Gold` DESC, `Silver` DESC, `Bronze` DESC, `Other` DESC;