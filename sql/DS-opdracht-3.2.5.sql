SELECT sup.name, sup.straat, sup.huisnr, sup.postcode 
FROM `mhl_suppliers` sup 
WHERE sup.huisnr BETWEEN 10 AND 20