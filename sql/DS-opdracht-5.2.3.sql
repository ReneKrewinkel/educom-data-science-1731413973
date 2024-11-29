WITH hitcount AS (
    SELECT * 
    FROM mhl_hitcount_known_supplier
    UNION ALL
    SELECT * 
    FROM mhl_hitcount_unknown_supplier
)
SELECT
	year,
    SUM(
    	CASE
    		WHEN month IN (1, 2, 3) THEN hitcount
        	ELSE 0
        END
    ) AS `Eerste kwartaal`,
    SUM(
    	CASE
    		WHEN month IN (4, 5, 6) THEN hitcount
        	ELSE 0
        END
    ) AS `Tweede kwartaal`,
	SUM(
    	CASE
    		WHEN month IN (7, 8, 9) THEN hitcount
        	ELSE 0
        END
    ) AS `Derde kwartaal`,
    SUM(
    	CASE
    		WHEN month IN (10, 11, 12) THEN hitcount
        	ELSE 0
        END
    ) AS `Vierde kwartaal`,
    SUM(hitcount) AS `totaal`
FROM hitcount
GROUP BY year
ORDER BY year