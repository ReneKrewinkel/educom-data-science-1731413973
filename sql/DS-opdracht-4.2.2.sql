
SELECT cit.name as "City name",
CASE 
	WHEN com.name = 'Unknown' 
      OR com.name REGEXP '^[^a-zA-Z]+$' 
      OR com.name REGEXP '[0-9]' 
      OR com.name LIKE '%~%' 
      OR com.name LIKE '%`%' 
      OR com.name LIKE '%!%' 
      OR com.name LIKE '%@%' 
      OR com.name LIKE '%#%' 
      OR com.name LIKE '%$%' 
      OR com.name LIKE '%¤%' 
      OR com.name LIKE '%\%%' 
      OR com.name LIKE '%€%' 
      OR com.name LIKE '%^%' 
      OR com.name LIKE '%*%' 
      OR com.name LIKE '%+%' 
      OR com.name LIKE '%=%' 
      OR com.name LIKE '%[%' 
      OR com.name LIKE '%]%' 
      OR com.name LIKE '%{%' 
      OR com.name LIKE '%}%' 
      OR com.name LIKE '%\%' 
      OR com.name LIKE '%|%'
      OR com.name LIKE '%:%' 
      OR com.name LIKE '%"%' 
      OR com.name LIKE '%<%' 
      OR com.name LIKE '%>%' 
      OR com.name LIKE '%?%'
      THEN "INVALID"
      ELSE com.name
    END AS "Commune name"
FROM mhl_cities cit
INNER JOIN mhl_communes com ON cit.commune_ID = com.id
WHERE cit.name not in ("Unknown",  "---");