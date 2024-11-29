CREATE VIEW VERZENDLIJST AS
SELECT 
    sup.id AS "ID",
    CASE
    	WHEN sup.p_address REGEXP '[a-zA-Z]' THEN sup.p_address
        ELSE CONCAT(sup.straat, " ", sup.huisnr)
    END AS `Adress`,
    CASE
    	WHEN sup.p_address REGEXP '[a-zA-Z]' THEN sup.p_postcode
        ELSE sup.postcode
    END AS `Postcode`,
    CASE 
    	WHEN sup.p_address REGEXP '[a-zA-Z]' THEN cit_p.name
        ELSE cit.name
    END AS `Stad`

FROM mhl_suppliers sup 
LEFT JOIN mhl_cities cit_p ON sup.p_city_ID = cit_p.id
LEFT JOIN mhl_cities cit ON sup.city_ID = cit.id