SELECT 
    sup.name, 
    sup.straat, 
    sup.huisnr, 
    sup.postcode 
FROM mhl_suppliers sup 
INNER JOIN mhl_yn_properties_known_supplier pro ON sup.id = pro.supplier_ID 
INNER JOIN mhl_propertytypes typ ON pro.propertytype_ID = typ.id 
WHERE LOWER(typ.name) = "specialistische leverancier" 
    OR LOWER(typ.name) like "%ook voor particulieren%"
ORDER BY sup.name;