SELECT 
    sub.id, 
    CASE 
        WHEN sub.parent NOT IN ( 
            SELECT id 
            FROM mhl_rubrieken ) AND sub.parent != 0 
            THEN "Unknown" 
        WHEN rub.name IS NULL THEN sub.name 
        ELSE rub.name 
    END AS hoofdrubriek, 
    CASE 
        WHEN sub.parent NOT IN ( 
            SELECT id 
            FROM mhl_rubrieken ) AND sub.parent != 0 
            THEN sub.name 
        WHEN rub.name IS NULL THEN "" 
        ELSE sub.name 
    END AS subrubriek 
FROM mhl_rubrieken sub 
LEFT JOIN mhl_rubrieken rub ON sub.parent = rub.id 
ORDER BY hoofdrubriek, subrubriek;