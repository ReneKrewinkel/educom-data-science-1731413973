SELECT 
-- 	DISTINCT(hit.year),
	COUNT(hit.hitcount) AS `count`, 
    AVG(hit.hitcount) AS `avg`,
    MIN(hit.hitcount) AS `min`,
    MAX(hit.hitcount) AS `max`,
    SUM(hit.hitcount) AS `sum`
FROM (
    SELECT year, hitcount FROM `mhl_hitcount_known_supplier`
    UNION ALL
    SELECT year, hitcount FROM `mhl_hitcount_unknown_supplier`
    )
AS hit
GROUP BY year;
