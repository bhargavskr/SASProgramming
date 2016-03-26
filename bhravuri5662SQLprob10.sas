/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Assignment 5 Problem 10
         Date:2/28/2015
         Purpose: To display employee id for those employees whose salary in the SALESSTAFF table is different from his/her salary in th
                  e PAYROLL table

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql number;
title " Employess with different salaries in SALESSTAFF table and PAYROLL table ";


* summary function count(*) calculates the number of rows returned by the query;

* inner join is used join rows based on some matching criteria used corelated nested query;

select s.employee_id,s.salary 'Salary from SalesStaff',p.salary 'Salary from Payroll' format=dollar12.2 from orion.salesstaff as s inner
        join orion.employee_payroll as p on s.employee_id=p.employee_id where s.salary not in (select salary from orion.employee_payroll
         where employee_id=s.employee_id and salary is not missing);
reset nonumber;
*title "Number of employess with different salaries in Payroll and Salesstaff tables";

*select count(*) ' Employee Count' from orion.salesstaff as s inner join
        orion.employee_payroll as p on s.employee_id=p.employee_id where s.salary not in (select salary from orion.employee_payroll
         where employee_id=s.employee_id and salary is not missing);

quit;

* end of SQL procedure ;
