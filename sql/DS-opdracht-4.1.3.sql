WITH RECURSIVE drank AS(
	SELECT id, name, parent
    FROM mhl_rubrieken
    WHERE name = 'drank'
    
    UNION ALL
    
    SELECT rub.id, rub.name, rub.parent
    FROM mhl_rubrieken rub
    INNER JOIN drank ON rub.parent = drank.id
)

SELECT rub.name as 'R.name', sup.name as 'S.name', sup.straat, sup.huisnr, sup.postcode
FROM mhl_suppliers sup
INNER JOIN mhl_suppliers_mhl_rubriek_view_known_supplier_known_rubriek sup_rub ON sup.id = sup_rub.mhl_suppliers_ID
INNER JOIN mhl_rubrieken rub ON sup_rub.mhl_rubriek_view_ID = rub.id
INNER JOIN mhl_rubrieken rub_parent ON rub.parent = rub_parent.id
INNER JOIN mhl_cities cit ON sup.city_ID = cit.id
WHERE rub_parent.id IN (
    SELECT id
    FROM drank
) AND LOWER(cit.name) = "amsterdam" 
ORDER BY rub.name, sup.name;