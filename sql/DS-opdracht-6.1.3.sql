
SELECT 
	CASE 
	 	WHEN rub.parent = 0 THEN rub.name
        ELSE CONCAT(rub_hoofd.name, ' - ', rub.name)
    END AS name,
    (
    SELECT 
        count(sup_rub_1.mhl_rubriek_view_ID) AS subseq
    FROM (
        SELECT * 
        FROM `mhl_suppliers_mhl_rubriek_view_known_supplier_known_rubriek`
        UNION ALL
        SELECT * 
        FROM `mhl_suppliers_mhl_rubriek_view_unknown_supplier_known_rubriek`
        UNION ALL
        SELECT * 
        FROM `mhl_suppliers_mhl_rubriek_view_known_supplier_unknown_rubriek`
        UNION ALL
        SELECT * 
        FROM `mhl_suppliers_mhl_rubriek_view_unknown_supplier_unknown_rubriek`
        ) AS sup_rub_1
    RIGHT JOIN mhl_rubrieken rub_1 ON sup_rub_1.mhl_rubriek_view_ID = rub_1.id
    LEFT JOIN mhl_rubrieken rub_hoofd_1 ON rub_1.parent = rub_hoofd_1.id
	WHERE rub_1.name  = rub.name
    ) AS subseq
    
FROM mhl_rubrieken rub
LEFT JOIN mhl_rubrieken rub_hoofd ON rub.parent = rub_hoofd.id
WHERE 
     rub.parent = 0
     OR CONCAT(rub_hoofd.name, ' - ', rub.name) IS NOT NULL
ORDER BY name;