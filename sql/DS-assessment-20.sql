SELECT CustomerId, FirstName, LastName, Address, CONCAT(UPPER(City), " ", UPPER(Country)) 
FROM customer
