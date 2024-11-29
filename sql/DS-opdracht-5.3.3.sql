SELECT 
	sup.id, 
	sup.name, 
    COALESCE(dir.contact, 'tav de directie') AS contact,
    ver.Adress,
    ver.Postcode,
    ver.Stad
FROM mhl_suppliers sup
LEFT JOIN directie dir ON sup.id = dir.supplier_ID
LEFT JOIN verzendlijst ver ON sup.id = ver.ID
ORDER BY sup.name;