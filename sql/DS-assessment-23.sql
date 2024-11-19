SELECT kolom_naam, COUNT(*) AS aantal_null_waarden
FROM (
    SELECT 'Company' AS kolom_naam,
    CASE WHEN Company IS NULL THEN 1 ELSE 0 END AS is_null
    FROM customer

    UNION ALL
    
    SELECT 'Address' AS kolom_naam,
    CASE WHEN Address IS NULL THEN 1 ELSE 0 END AS is_null
    FROM customer
    
    UNION ALL
    
    SELECT 'Phone' AS kolom_naam,
    CASE WHEN Phone IS NULL THEN 1 ELSE 0 END AS is_null
    FROM customer
    
    UNION ALL
    
    SELECT 'FirstName' AS kolom_naam,
    CASE WHEN FirstName IS NULL THEN 1 ELSE 0 END AS is_null
    FROM customer
    
    UNION ALL
    
    SELECT 'PostalCode' AS kolom_naam,
    CASE WHEN PostalCode IS NULL THEN 1 ELSE 0 END AS is_null
    FROM customer
    
    UNION ALL
    
    SELECT 'Fax' AS kolom_naam,
    CASE WHEN Fax IS NULL THEN 1 ELSE 0 END AS is_null
    FROM customer
) subquery
WHERE is_null = 1
GROUP BY kolom_naam
