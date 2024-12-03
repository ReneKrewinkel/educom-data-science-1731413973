
SELECT 
	sup.id, 
    com.name AS "gemeente",
    sup.name,
    SUM(hit.hitcount) AS total_hitcount,
(
    SELECT 
        SUM(hit_1.hitcount) / COUNT(hit_1.hitcount)
    FROM(
        SELECT *
        FROM mhl_hitcount_unknown_supplier
        UNION ALL
        SELECT *
        FROM mhl_hitcount_known_supplier
        ) AS hit_1
    LEFT JOIN mhl_suppliers sup_1 ON sup_1.id = hit_1.supplier_ID
    LEFT JOIN mhl_cities cit_1 ON sup_1.city_ID = cit_1.id
    LEFT JOIN mhl_communes com_1 ON cit_1.commune_ID = com_1.id
    WHERE com_1.name = com.name
    GROUP BY com_1.name
) AS `average_hitcount`
    

FROM mhl_suppliers sup
LEFT JOIN mhl_cities p_cit ON sup.p_city_ID = p_cit.id
LEFT JOIN mhl_cities cit ON sup.city_ID = cit.id
LEFT JOIN mhl_communes p_com ON p_cit.commune_ID = p_com.id
LEFT JOIN mhl_communes com ON cit.commune_ID = com.id
LEFT JOIN (
    SELECT 
    	supplier_ID,
    	hitcount
    FROM mhl_hitcount_known_supplier
    UNION ALL
    SELECT 
    	supplier_ID,
    	hitcount
    FROM mhl_hitcount_unknown_supplier
    )
	AS hit ON sup.id = hit.supplier_ID
GROUP BY sup.id

HAVING 
	SUM(hit.hitcount) >
    (
    SELECT SUM(hit_2.hitcount) / COUNT(hit_2.hitcount)
    FROM (
        SELECT *
        FROM mhl_hitcount_unknown_supplier
        UNION ALL
        SELECT *
        FROM mhl_hitcount_known_supplier
    	) AS hit_2
    LEFT JOIN mhl_suppliers sup_2 ON hit_2.supplier_ID = sup_2.id
    LEFT JOIN mhl_cities cit_2 ON sup_2.city_ID = cit_2.id
    LEFT JOIN mhl_communes com_2 ON cit_2.commune_ID = com_2.id
    WHERE com_2.name = com.name
    GROUP BY com_2.name
    )
	
ORDER BY gemeente, total_hitcount DESC;
