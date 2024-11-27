SELECT hit.hitcount, sup.name AS 'leverancier', cit.name AS 'stad', com.name AS 'gemeente', dis.name AS 'provincie'
FROM mhl_hitcount_known_supplier hit
INNER JOIN mhl_suppliers sup ON hit.supplier_ID = sup.id
INNER JOIN mhl_cities cit ON sup.city_ID = cit.id
INNER JOIN mhl_communes com ON cit.commune_ID = com.id
INNER JOIN mhl_districts dis ON com.district_ID = dis.id
WHERE hit.year = 2014 
	AND hit.month = 1
    AND LOWER(dis.name) IN ("limburg", "noord-brabant", "zeeland");