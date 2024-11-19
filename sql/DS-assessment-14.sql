SELECT 
    invoice.CustomerId, 
    CONCAT(customer.FirstName, " ", customer.LastName) AS Name, 
    customer.City, 
    customer.Email, 
    COUNT(invoice.CustomerId) as nrInvoices
FROM `invoice` 
LEFT JOIN `customer` ON invoice.CustomerId = customer.CustomerId 
GROUP BY invoice.CustomerId 

UNION 

SELECT 
    invoice.CustomerId, 
    CONCAT(customer.FirstName, " ", customer.LastName) AS Name, 
    customer.City, 
    customer.Email, 
    COUNT(invoice.CustomerId) as nrInvoices
FROM `invoice` 
RIGHT JOIN `customer` ON invoice.CustomerId = customer.CustomerId 
GROUP BY invoice.CustomerId
