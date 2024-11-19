SELECT * 
FROM `invoice` 
WHERE BillingCity IN ("Brasilia", "Edmonton", "Vancouver") 
ORDER BY InvoiceId DESC;
