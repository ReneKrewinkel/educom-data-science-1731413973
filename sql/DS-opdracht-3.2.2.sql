SELECT
	suppliers.name, 
    suppliers.straat, 
    suppliers.huisnr, 
    suppliers.postcode
FROM mhl_suppliers suppliers
RIGHT JOIN mhl_membertypes membertypes ON suppliers.membertype = membertypes.id
WHERE membertypes.name IN ('Gold', 'Silver', 'Bronze', 'GEEN INTERESSE')