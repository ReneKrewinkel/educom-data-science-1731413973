SELECT 
    sup.name AS "Supplier name",
    COALESCE(con.name, "tav de directie") as aanhef,
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
    END AS `Stad`,
    CASE 
    	WHEN sup.p_address REGEXP '[a-zA-Z]' THEN dis_p.name
        ELSE dis.name
    END AS `Provincie`

FROM mhl_suppliers sup 
LEFT JOIN mhl_cities cit_p ON sup.p_city_ID = cit_p.id
LEFT JOIN mhl_cities cit ON sup.city_ID = cit.id
LEFT JOIN mhl_communes com_p ON cit_p.commune_ID = com_p.id
LEFT JOIN mhl_communes com ON cit.commune_ID = com.id
LEFT JOIN mhl_districts dis_p ON com_p.district_ID = dis_p.id 
LEFT JOIN mhl_districts dis ON com.district_ID = dis.id
LEFT JOIN mhl_contacts_known_supplier con ON sup.id = con.supplier_ID AND con.department = 3  
HAVING `Adress` <> "" AND `Adress` NOT LIKE ' %'
ORDER BY Stad, sup.name