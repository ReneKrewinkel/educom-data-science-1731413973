SELECT sup.name, sup.straat, sup.huisnr, sup.postcode, lat, lng
FROM `mhl_suppliers` sup
INNER JOIN pc_lat_long pc ON UPPER(REPLACE(sup.postcode, ' ', '')) = pc.pc6
ORDER BY pc.lat DESC
LIMIT 5;