SELECT
	YEAR(joindate) AS jaar,
	DATE_FORMAT(joindate, '%M') AS maand,
    COUNT(id)
FROM mhl_suppliers
GROUP BY jaar, maand
ORDER BY jaar, MONTH(joindate)