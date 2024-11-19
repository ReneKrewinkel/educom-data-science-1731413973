SELECT *
FROM `invoice`
WHERE total BETWEEN 1 AND 5 AND CustomerID in (56, 58);
