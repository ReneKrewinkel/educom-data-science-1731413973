CREATE VIEW DIRECTIE AS
WITH contacts AS (
    SELECT supplier_ID, name, contacttype, department
    FROM mhl_contacts_unknown_supplier
    UNION ALL
    SELECT supplier_ID, name, contacttype, department
    FROM mhl_contacts_known_supplier
)
SELECT
	con.supplier_ID,
    con.name AS contact,
    con.contacttype AS functie,
    COALESCE(dep.name, 'nvt')
FROM contacts con
LEFT JOIN mhl_departments dep ON dep.id = con.department AND dep.name = 'Directie'
WHERE con.contacttype LIKE ('%directeur%')
ORDER BY con.supplier_ID;
