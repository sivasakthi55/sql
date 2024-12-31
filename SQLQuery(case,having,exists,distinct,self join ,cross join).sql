CREATE TABLE Employees1 (
    EmployeeID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Department NVARCHAR(50),
    Salary DECIMAL(10, 2),
    ManagerID INT
);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName NVARCHAR(50)
);

INSERT INTO Employees1 VALUES 
(1, 'Alice', 'Smith', 'HR', 60000, NULL),
(2, 'Bob', 'Johnson', 'Finance', 45000, 1),
(3, 'Charlie', 'Williams', 'HR', 30000, 1),
(4, 'David', 'Brown', 'IT', 70000, 2),
(5, 'Eve', 'Jones', 'IT', 50000, 2);

INSERT INTO Departments VALUES 
(1, 'HR'),
(2, 'Finance'),
(3, 'IT');

SELECT 
    EmployeeID,
    FirstName,
    Salary,
    CASE 
        WHEN Salary > 50000 THEN 'High'
        WHEN Salary BETWEEN 30000 AND 50000 THEN 'Medium'
        ELSE 'Low'
    END AS SalaryCategory
FROM Employees1;

SELECT Department AS Name FROM Employees1
UNION
SELECT DepartmentName AS Name FROM Departments;

SELECT distinct Department FROM Employees1;

SELECT TOP 5 * FROM Employees1 ORDER BY Salary DESC;

SELECT 
    e1.FirstName AS Employee,
    e2.FirstName AS Manager
FROM Employees1 e1
JOIN Employees1 e2
ON e1.ManagerID = e2.EmployeeID;


SELECT 
    e.FirstName AS Employee,
    d.DepartmentName
FROM Employees1 e
CROSS JOIN Departments d;

SELECT FirstName, LastName 
FROM Employees1 e
WHERE EXISTS (
    SELECT 1
    FROM Departments d
    WHERE d.DepartmentName = e.Department
);

SELECT Department, COUNT(EmployeeID) AS EmployeeCount
FROM Employees1
GROUP BY Department
HAVING COUNT(EmployeeID) > 1;
