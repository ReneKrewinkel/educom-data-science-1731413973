SELECT 
    DATE_FORMAT(joindate, '%d.%m.%Y') AS joindate,
    id
FROM mhl_suppliers
WHERE DAY(joindate) > DAY(LAST_DAY(joindate)) - 7