
-- =========================================
-- LIBRARY MANAGEMENT SYSTEM PROJECT
-- =========================================

CREATE DATABASE library;
USE library;

-- Branch Table
CREATE TABLE Branch(
Branch_no INT PRIMARY KEY,
Manager_Id INT,
Branch_address VARCHAR(100),
Contact_no VARCHAR(15)
);

-- Employee Table
CREATE TABLE Employee(
Emp_Id INT PRIMARY KEY,
Emp_name VARCHAR(50),
Position VARCHAR(50),
Salary DECIMAL(10,2),
Branch_no INT,
FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

-- Books Table
CREATE TABLE Books(
ISBN VARCHAR(20) PRIMARY KEY,
Book_title VARCHAR(100),
Category VARCHAR(50),
Rental_Price DECIMAL(6,2),
Status VARCHAR(3),
Author VARCHAR(50),
Publisher VARCHAR(50)
);

-- Customer Table
CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY,
Customer_name VARCHAR(50),
Customer_address VARCHAR(100),
Reg_date DATE
);

-- IssueStatus Table
CREATE TABLE IssueStatus(
Issue_Id INT PRIMARY KEY,
Issued_cust INT,
Issued_book_name VARCHAR(100),
Issue_date DATE,
Isbn_book VARCHAR(20),
FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- ReturnStatus Table
CREATE TABLE ReturnStatus(
Return_Id INT PRIMARY KEY,
Return_cust INT,
Return_book_name VARCHAR(100),
Return_date DATE,
Isbn_book2 VARCHAR(20),
FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

-- Sample Data

INSERT INTO Branch VALUES
(1,101,'Kochi Main Branch','9876543210'),
(2,102,'Trivandrum Branch','9876543211'),
(3,103,'Calicut Branch','9876543212');

INSERT INTO Employee VALUES
(101,'Rahul','Manager',60000,1),
(102,'Anita','Manager',65000,2),
(103,'Joseph','Manager',70000,3),
(104,'Aman','Clerk',30000,1),
(105,'Divya','Assistant',35000,1),
(106,'Rakesh','Clerk',32000,2),
(107,'Neha','Assistant',34000,2),
(108,'Arjun','Clerk',31000,3),
(109,'Priya','Assistant',36000,3),
(110,'Suresh','Staff',28000,1);

INSERT INTO Books VALUES
('ISBN001','World History','History',30,'yes','Smith','Oxford'),
('ISBN002','Modern Physics','Science',25,'yes','Albert','Pearson'),
('ISBN003','SQL Basics','Technology',20,'no','John','McGraw'),
('ISBN004','Indian History','History',35,'yes','Raman','Penguin'),
('ISBN005','Data Structures','Technology',40,'yes','Mark','Pearson'),
('ISBN006','Chemistry 101','Science',18,'yes','David','Oxford'),
('ISBN007','Ancient Civilizations','History',28,'no','Clark','Penguin'),
('ISBN008','Operating Systems','Technology',45,'yes','Tanenbaum','Pearson'),
('ISBN009','Biology Basics','Science',22,'yes','Watson','McGraw'),
('ISBN010','Network Security','Technology',50,'yes','Andrew','Pearson');

INSERT INTO Customer VALUES
(1,'Akash','Delhi','2021-05-10'),
(2,'Meera','Mumbai','2023-02-15'),
(3,'Rahim','Kochi','2020-11-20'),
(4,'Sneha','Chennai','2022-01-10'),
(5,'Arun','Bangalore','2023-03-05'),
(6,'Latha','Hyderabad','2021-09-17'),
(7,'Kiran','Pune','2023-06-11'),
(8,'Riya','Kolkata','2020-04-19'),
(9,'Manu','Trivandrum','2022-12-01'),
(10,'Nikhil','Calicut','2023-06-20');

INSERT INTO IssueStatus VALUES
(1,1,'World History','2023-06-10','ISBN001'),
(2,2,'Modern Physics','2023-05-05','ISBN002'),
(3,3,'SQL Basics','2023-06-12','ISBN003'),
(4,4,'Indian History','2023-04-18','ISBN004'),
(5,5,'Data Structures','2023-06-20','ISBN005');

INSERT INTO ReturnStatus VALUES
(1,1,'World History','2023-06-25','ISBN001'),
(2,2,'Modern Physics','2023-05-20','ISBN002'),
(3,3,'SQL Basics','2023-06-30','ISBN003');

-- Queries

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status='yes';

SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

SELECT IssueStatus.Issued_book_name, Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id;

SELECT Category, COUNT(*) AS Total_Books FROM Books GROUP BY Category;

SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

SELECT Customer_name
FROM Customer
WHERE Reg_date < '2022-01-01'
AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);

SELECT Branch_no, COUNT(Emp_Id) AS Total_Employees
FROM Employee
GROUP BY Branch_no;

SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
WHERE MONTH(Issue_date)=6 AND YEAR(Issue_date)=2023;

SELECT Book_title FROM Books WHERE Book_title LIKE '%history%';

SELECT Branch_no, COUNT(Emp_Id) AS Employee_Count
FROM Employee
GROUP BY Branch_no
HAVING COUNT(Emp_Id) > 5;

SELECT Emp_name, Branch_address
FROM Employee
JOIN Branch ON Employee.Emp_Id = Branch.Manager_Id;

SELECT DISTINCT Customer.Customer_name
FROM IssueStatus
JOIN Customer ON IssueStatus.Issued_cust = Customer.Customer_Id
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
WHERE Books.Rental_Price > 25;
