SELECT 
	hit.year,
    
    CASE
    	WHEN hit.month = 1 THEN 'Januari'
        WHEN hit.month = 2 THEN 'Februari'
        WHEN hit.month = 3 THEN 'Maart'
        WHEN hit.month = 4 THEN 'April'
        WHEN hit.month = 5 THEN 'Mei'
        WHEN hit.month = 6 THEN 'Juni'
        WHEN hit.month = 7 THEN 'Juli'
        WHEN hit.month = 8 THEN 'Augustus'
        WHEN hit.month = 9 THEN 'September'
        WHEN hit.month = 10 THEN 'Oktober'
        WHEN hit.month = 11 THEN 'November'
        WHEN hit.month = 12 THEN 'December'
    END AS maand,
 
 	COUNT(hit.hitcount),
    SUM(hit.hitcount)
FROM (
    SELECT *
    FROM mhl_hitcount_known_supplier
	UNION ALL
	SELECT *
    FROM mhl_hitcount_unknown_supplier
	)
AS hit
GROUP BY hit.year, hit.month
ORDER BY hit.year DESC, maand;