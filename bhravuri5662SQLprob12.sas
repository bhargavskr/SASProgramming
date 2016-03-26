 /*
          Programmer Name: Bhargav Sai Krishna, Ravuri
          Problem Identification: SQL Assignment 6 Problem 12
          Date: 2/1/2015
          Purpose: To explore STAFF, SALESSTAFF and SALES tables and the reason ORION organized using three tables

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;

* describe statement displayes the column names and the datatype they hold in the SAS log;

* select statement retrieves the columns specified from the table if * is mentioned retrieves all columns;

/*Answer
From the below results it is found that

 Sales table lists all the employees of the sales departments which includes current employees and past employees

 Staff table contains employees from all departments

 sales staff lists only the sales representatives of the sales departments which includes current employees, past employees and rehired
 employees.

*/

proc sql number;


title " sales table ";

describe table orion.sales;

select * from orion.sales order by employee_id;

title " salesstaff table ";

describe table orion.salesstaff;

select * from orion.salesstaff order by employee_id ;

title " staff table";

describe table orion.staff;

select * from orion.staff order by employee_id;

title " Number of rows in sales, staff and salesstaff";

select count(*) as staff from orion.staff;

select count(*) as sales from orion.sales;

select count(*) as st from orion.salesstaff;



title "left join of sales table with sales staff";

select * from orion.sales s left join orion.salesstaff ss on s.employee_id=ss.employee_id;

title "left join of sales with staff";

select * from orion.sales s left join orion.staff ss on s.employee_id=ss.employee_id;

title "left join of salesstaff with staff";

select * from orion.salesstaff s left join orion.staff ss on s.employee_id=ss.employee_id;

title "left join of salesstaff with sales ";

select * from orion.salesstaff s left join orion.sales ss on s.employee_id=ss.employee_id;

 title "left join of staff with sales";

select * from orion.staff s left join orion.sales ss on s.employee_id=ss.employee_id;

 title "left join of staff with salesstaff";

select * from orion.staff s left join orion.salesstaff ss on s.employee_id=ss.employee_id;

quit;
* end of sql procedure;
