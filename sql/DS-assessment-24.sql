SELECT City, COUNT(CustomerId) AS aantalKlanten 
FROM customer 
GROUP BY City 
ORDER BY aantalKlanten DESC;
