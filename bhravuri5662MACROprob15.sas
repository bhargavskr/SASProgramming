 /*
           Programmer Name: Bhargav Sai Krishna, Ravuri
           Problem Identification: MACRO Assignment 8 Problem 15
           Date:4/3/2015
           Purpose:  To use macros that will display the name and salaries of employees  whose salary exceeds a specific amount

 */

  * The libname statement is used to refer to the directory where the ORION database is located;
  libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
  *libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* Macro parameters list contains a marco variable that can be used within the macro;
* macros with positional  parameters use one to one correspondence between parameter name on macro definition and parameter value on mac
ro call;
* Macro enables to write macro programs;
* mprint option writes to SAS log the text that is generated by macro execution;
* symbolgen option is used to display the results of resolved macro variable reference in the SAS log;
* A Macro call is not a statement so semicolon is not required;
* Order by clause is used to sort query results in specific order by default the values in the specified column are sorted in ascending
order;
* A query that lists multiple tables in from clause without a where clause produces all possible combinations of rows from all tables. t
his result is called cartesian product;
* Inner join resembles a subset of cartesian product. On clause specifes the join criteria. where clause is used to subset the results;

options mprint symbolgen;

%macro salaries(sal_limit);


proc sql;
title "Employees with Salary more than $&sal_limit";
select Employee_Name,Salary from orion.employee_payroll p inner join orion.employee_addresses a on p.Employee_ID=a.Employee_ID
 where Salary>&sal_limit order by Salary;
quit;

%mend salaries;





%salaries(50000)
%salaries(100000)
