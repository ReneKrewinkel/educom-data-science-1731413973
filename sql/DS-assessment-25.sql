SELECT 
    invoice.InvoiceId, 
    customer.FirstName, 
    customer.LastName, 
    CONCAT(customer.FirstName, customer.LastName, invoice.InvoiceId) AS customerInvoiceId 
FROM invoice 
LEFT JOIN customer ON invoice.CustomerId = customer.CustomerId 

UNION 

SELECT 
    invoice.InvoiceId, 
    customer.FirstName, 
    customer.LastName, 
    CONCAT(customer.FirstName, customer.LastName, invoice.InvoiceId) AS customerInvoiceId 
FROM invoice 
RIGHT JOIN customer ON invoice.CustomerId = customer.CustomerId
