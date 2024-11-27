SELECT sup.name, sup.straat, sup.huisnr, sup.postcode, cit.name
FROM mhl_suppliers sup
INNER JOIN mhl_cities cit ON sup.city_ID = cit.id
INNER JOIN mhl_communes com ON cit.commune_ID = com.id
WHERE LOWER(com.name) = "steenwijkerland" ;