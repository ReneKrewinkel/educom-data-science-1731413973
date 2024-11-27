SELECT sup.name, sup.straat, sup.huisnr, sup.postcode
FROM `mhl_suppliers` sup
LEFT JOIN mhl_cities cit ON sup.city_ID = cit.id
WHERE lower(cit.name) = "amsterdam"; 

SELECT sup.name, sup.straat, sup.huisnr, sup.postcode, sup.city_ID
FROM `mhl_suppliers` sup;

SELECT cit.id, cit.name
FROM mhl_cities cit