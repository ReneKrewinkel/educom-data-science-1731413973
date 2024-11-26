SELECT sup.name, sup.straat, sup.huisnr, sup.postcode 
FROM `mhl_suppliers` sup 
WHERE sup.name LIKE "'t%" 
ORDER BY `sup`.`name` ASC