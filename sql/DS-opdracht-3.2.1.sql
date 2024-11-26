SELECT
	suppliers.name, 
    suppliers.straat, 
    suppliers.huisnr, 
    suppliers.postcode
FROM mhl_suppliers suppliers
LEFT JOIN mhl_cities cities ON suppliers.city_ID = cities.id
WHERE cities.name = 'amsterdam'

union

SELECT
	suppliers.name, 
    suppliers.straat, 
    suppliers.huisnr, 
    suppliers.postcode
FROM mhl_suppliers suppliers
RIGHT JOIN mhl_cities cities ON suppliers.city_ID = cities.id
WHERE cities.name = 'amsterdam';