SELECT * 
FROM `mhl_hitcount_known_supplier`
UNION
SELECT *
FROM `mhl_hitcount_unknown_supplier`
ORDER BY year, month, hitcount DESC

/*
SELECT * 
FROM `mhl_hitcount`
ORDER BY year, month, hitcount DESC
*/