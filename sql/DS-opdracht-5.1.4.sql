SELECT 
	sup.name,
	SUM(hit.hitcount) AS `nrhits`, 
    COUNT(hit.hitcount) AS `nrmonths`,
    ROUND(SUM(hit.hitcount) / COUNT(hit.hitcount)) AS avgpermonth
FROM (
    SELECT month, hitcount, supplier_ID FROM `mhl_hitcount_known_supplier`
    UNION ALL
    SELECT month, hitcount, supplier_ID FROM `mhl_hitcount_unknown_supplier`
    )
AS hit
JOIN mhl_suppliers sup ON hit.supplier_ID = sup.id
GROUP BY sup.name
HAVING SUM(hit.hitcount) > 100
ORDER BY SUM(hit.hitcount) DESC;
