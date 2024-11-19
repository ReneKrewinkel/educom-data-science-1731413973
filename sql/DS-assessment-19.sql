SELECT customer.City, invoice.BillingCity 
FROM customer 
INNER JOIN invoice ON customer.CustomerId = invoice.CustomerId 
WHERE customer.City != invoice.BillingCity
