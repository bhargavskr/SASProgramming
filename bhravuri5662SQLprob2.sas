/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification:SQL problem 2
         Date:2/12/2015
         Purpose: Listing detalis of the employees who have been terminated
*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* Problem 2a;
proc sql;
title " Details of the employees who have been terminated";

select Employee_ID 'Emplyoee ID', Employee_Name 'Employee Name',Job_Title 'Employee Job Title',Emp_Term_Date 'Termination Date'
format=mmddyy8. from orion.salesstaff where Emp_Term_Date is not missing order by 3,4,1,2;

*Problem 2b;


title " Number of Employees Terminated";

* using aggregate function count() to count all the rows returned by query;
select count(*) ' Number of Employees Terminated' from orion.salesstaff where Emp_Term_Date is not missing;

quit;

* end of SQL procedure
