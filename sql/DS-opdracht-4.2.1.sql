SELECT name, commune_ID 
FROM mhl_cities 
WHERE commune_ID IN ( 
   SELECT id 
   FROM mhl_communes 
   WHERE name = 'Unknown' 
      OR name REGEXP '^[^a-zA-Z]+$' 
      OR name REGEXP '[0-9]' 
      OR name LIKE '%~%' 
      OR name LIKE '%`%' 
      OR name LIKE '%!%' 
      OR name LIKE '%@%' 
      OR name LIKE '%#%' 
      OR name LIKE '%$%' 
      OR name LIKE '%¤%' 
      OR name LIKE '%\%%' 
      OR name LIKE '%€%' 
      OR name LIKE '%^%' 
      OR name LIKE '%*%' 
      OR name LIKE '%+%' 
      OR name LIKE '%=%' 
      OR name LIKE '%[%' 
      OR name LIKE '%]%' 
      OR name LIKE '%{%' 
      OR name LIKE '%}%' 
      OR name LIKE '%\%' 
      OR name LIKE '%|%'
      OR name LIKE '%:%' 
      OR name LIKE '%"%' 
      OR name LIKE '%<%' 
      OR name LIKE '%>%' 
      OR name LIKE '%?%' 

      -- &()_-;,. worden gebruikt voor speciale tekens like é, ë, 
      -- de () wordt gebruikt om aan te geven waar de stad ligt
      -- wanneer er meerdere steden dezelfde naam hebben
      -- . voor sint af te korten
) 
ORDER BY `mhl_cities`.`name` ASC