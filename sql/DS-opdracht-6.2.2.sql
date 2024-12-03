SELECT 
--    DATE_FORMAT(joindate, '%d.%m.%Y') AS joindate,
    id,
    joindate,
    DATEDIFF(CURDATE(), joindate) AS dagen_lid
FROM mhl_suppliers
-- WHERE DAY(joindate) > DAY(LAST_DAY(joindate)) - 7
ORDER BY dagen_lid