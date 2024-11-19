SELECT man.LastName as Manager, med.LastName AS Medewerker
FROM employee med 
INNER JOIN employee man ON man.EmployeeId = med.ReportsTo
