CREATE TEMPORARY TABLE cit_1 AS
SELECT *
FROM mhl_cities
GROUP BY name
HAVING COUNT(*) = 2;

CREATE TEMPORARY TABLE cit_2 AS
SELECT *
FROM mhl_cities
WHERE id NOT IN
	(SELECT id
     FROM cit_1);

SELECT 
	cit_1.name AS "city", 
--    cit_2.name AS "city 2", 
    cit_1.id  AS "ID city 1", 
    cit_2.id  AS "ID city 2", 
    cit_1.commune_ID AS "Gemeente ID city 1", 
    cit_2.commune_ID AS "Gemeente ID city 2", 
    com_1.name AS "Gemeente city 1", 
    com_2.name AS "Gemeente city 2"
FROM cit_1
JOIN cit_2 ON cit_1.name = cit_2.name
JOIN mhl_communes com_1 ON cit_1.commune_ID = com_1.id
JOIN mhl_communes com_2 ON cit_2.commune_ID = com_2.id
WHERE com_1.name != "Unknown" AND com_2.name != "Unknown"
ORDER BY cit_1.name

