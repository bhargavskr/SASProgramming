/*
   Programmer Name: Bhargav Sai Krishna, Ravuri
   Problem Identification: SQL Assignment 3 problem 4
   Date:02/28/2015
   Purpose: To compute and diaplay the average salary for all employees
*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* Summary function Avg() calculates the average salary of all the employess in staff table;

* Start of sql procedure;

proc sql;

* Problem 4a;


title " Average Salary For All the Employees (Table Staff)  ";

select avg(salary) as AvgSalary from orion.staff;

* Problem 4b;

* order by clause is used to sort query results in specific order by default ascending order;

* group by clause is used to classify data into groups based on the values of one or more columns and calculate statistics for each uniq
ue value of the grouping column;

title " Average Salary for each job title, ordered by job title ";

select job_title,avg(salary) as AvgSalary from orion.staff group by job_title order by 1;

quit;

* end of sql procedure;
