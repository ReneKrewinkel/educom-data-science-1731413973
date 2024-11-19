SELECT FirstName, LastName 
FROM `employee`

UNION

SELECT FirstName, LastName 
FROM `customer`
ORDER BY LastName DESC
