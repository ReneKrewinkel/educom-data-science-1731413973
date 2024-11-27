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

SELECT cit_1.name, cit_2.name, cit_1.id, cit_2.id
FROM cit_1
JOIN cit_2 ON cit_1.name = cit_2.name
ORDER BY cit_1.name

