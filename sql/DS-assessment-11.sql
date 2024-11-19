SELECT CustomerID, COUNT(CustomerID) 
FROM `invoice` 
GROUP BY CustomerID
ORDER BY COUNT(CustomerID) DESC