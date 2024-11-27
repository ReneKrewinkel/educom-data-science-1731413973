SELECT 
	sup.name AS sup_name, 
	typ.name,
    CASE
    	WHEN yn.content IS NULL THEN "NOT SET"
        ELSE yn.content
    END AS content
	
FROM mhl_cities cit
INNER JOIN mhl_suppliers sup ON cit.id = sup.city_ID
CROSS JOIN mhl_propertytypes typ 
LEFT JOIN mhl_yn_properties_known_supplier yn ON sup.id = yn.supplier_ID AND typ.id = yn.propertytype_ID
WHERE LOWER(cit.name) = "amsterdam"
	AND typ.proptype = "A"
    AND typ.name != "Unknown"