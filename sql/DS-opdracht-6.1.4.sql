SELECT 
	CASE 
	 	WHEN rub.parent = 0 THEN rub.name
        ELSE CONCAT(rub_parent.name, ' - ', rub.name)
    END AS name,
    COALESCE(
        (
        SELECT
    --       name
            SUM(`Sum per supplier`)
        FROM(
            SELECT 
                name, 
                `Sum per supplier`
            FROM (
                SELECT
                    CASE 
                        WHEN rub_1.parent = 0 THEN rub_1.name
                        ELSE CONCAT(rub_parent_1.name, ' - ', rub_1.name)
                    END AS name,
                    SUM(hit.hitcount) AS 'Sum per supplier'
                FROM 
                    (SELECT *
                     FROM mhl_hitcount_unknown_supplier
                     UNION ALL
                     SELECT *
                     FROM mhl_hitcount_known_supplier
                    ) AS hit
                LEFT JOIN mhl_suppliers sup ON hit.supplier_ID = sup.id

                LEFT JOIN 
                    (SELECT *
                     FROM mhl_suppliers_mhl_rubriek_view_known_supplier_known_rubriek
                     UNION ALL
                     SELECT *
                     FROM mhl_suppliers_mhl_rubriek_view_unknown_supplier_known_rubriek
                     UNION ALL
                     SELECT *
                     FROM mhl_suppliers_mhl_rubriek_view_unknown_supplier_unknown_rubriek
                     UNION ALL
                     SELECT *
                     FROM mhl_suppliers_mhl_rubriek_view_known_supplier_unknown_rubriek
                    ) AS sup_rub ON sup.id = sup_rub.mhl_suppliers_ID
                LEFT JOIN mhl_rubrieken AS rub_1 ON sup_rub.mhl_rubriek_view_ID = rub_1.id
                LEFT JOIN mhl_rubrieken AS rub_parent_1 ON rub_1.parent = rub_parent_1.id
                GROUP BY hit.supplier_ID
                ) AS supquery_1
            ) AS supquery_2
        WHERE supquery_2.name  = 
            CASE 
                WHEN rub.parent = 0 THEN rub.name
                ELSE CONCAT(rub_parent.name, ' - ', rub.name)
            END
        GROUP BY name
        ), 'Geen hits') AS total
FROM mhl_rubrieken rub
LEFT JOIN mhl_rubrieken rub_parent ON rub.parent = rub_parent.id
WHERE 
     rub.parent = 0
     OR CONCAT(rub_parent.name, ' - ', rub.name) IS NOT NULL
ORDER BY name;