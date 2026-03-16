# MYSQL-Comprehensive-Assessment-
# Library Management System – SQL Project

## Overview

This project implements a simple **Library Management System** using SQL.
The system stores and manages information about library branches, employees, books, customers, book issuing, and book returns.

The database helps track:

* Available books
* Employees working in branches
* Customers registered in the library
* Books issued and returned

## Database Name

`library`

## Tables Used

The project contains the following tables:

1. **Branch** – Stores branch details such as branch number, manager, address, and contact number.
2. **Employee** – Stores employee details including employee ID, name, position, salary, and branch number.
3. **Books** – Contains information about books such as ISBN, title, category, rental price, availability status, author, and publisher.
4. **Customer** – Stores customer details including customer ID, name, address, and registration date.
5. **IssueStatus** – Records the books issued to customers with issue date and ISBN reference.
6. **ReturnStatus** – Records returned books with return date and ISBN reference.

## Features

* Uses **Primary Keys** and **Foreign Keys** for data relationships.
* Tracks **book availability**.
* Stores **customer registration details**.
* Maintains **issue and return records**.
* Supports queries for retrieving library information.

## Queries Implemented

The SQL file includes queries to:

* Display available books
* List employees with salaries
* Show issued books and customers
* Count books by category
* Identify high-salary employees
* Find customers who have not issued books
* Count employees in each branch
* Show customers who issued books in June 2023
* Search books containing the word "history"
* Find branches with more than 5 employees
* Show branch managers and addresses
* Find customers who issued books with rental price above ₹25

## How to Run

1. Open **MySQL Workbench**.
2. Load the file **library_management_system.sql**.
3. Execute the script.
4. The script will automatically:

   * Create the database
   * Create tables
   * Insert sample records
   * Run the required queries.

## Author

Library Management System SQL Project
