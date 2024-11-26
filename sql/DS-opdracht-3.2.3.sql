SELECT sup.name, sup.straat, sup.huisnr, sup.postcode
FROM `mhl_suppliers` sup
INNER JOIN mhl_cities cit ON sup.city_ID = cit.id
LEFT JOIN mhl_cities p_cit ON sup.p_city_ID = p_cit.id
WHERE LOWER(cit.name) = "amsterdam" AND LOWER(p_cit.name) != "amsterdam";