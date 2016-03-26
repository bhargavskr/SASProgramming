 /*
          Programmer Name: Bhargav Sai Krishna, Ravuri
          Problem Identification: SQL Assignment 1 Problem 1a
          Date: 2/1/2015
          Purpose: To explore ORION database files(tables) and variables(columns)

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;

* describe statement displayes the column names and the datatype they hold in the SAS log;

* select statement retrieves the columns specified from the table if * is mentioned retrieves all columns;

proc sql;
title " Customer table";
describe table orion.customer;

select * from orion.customer order by customer_id;

title "employee_addresses table";


describe table orion.employee_addresses;

select * from orion.employee_addresses order by employee_id;

title "employee_donations table";


describe table orion.employee_donations;

select * from orion.employee_donations order by employee_id;

title " employee_organization table";


describe table orion.employee_organization;

select * from orion.employee_organization order by employee_id;

title "employee_payroll table";

describe table orion.employee_payroll;

select * from orion.employee_payroll order by employee_id;

title "employee_phone table";

describe table orion.employee_phones;

select * from orion.employee_phones order by employee_id;

title " order_fact table ";

describe table orion.order_fact;

select * from orion.order_fact order by order_id;

title " price_list table";

describe table orion.price_list;

select * from orion.price_list order by product_id;

title "product_dim table";

describe table orion.product_dim;

select * from orion.product_dim order by product_id;

title "qtr1_2007 table ";

describe table orion.qtr1_2007;

select * from orion.qtr1_2007 order by order_id;

title "qtr2_2007 table";

describe table orion.qtr2_2007;

select * from orion.qtr2_2007 order by order_id;

title " sales table ";

describe table orion.sales;

select * from orion.sales order by employee_id;

title " salesstaff table ";

describe table orion.salesstaff;

select * from orion.salesstaff order by employee_id ;

title " staff table";

describe table orion.staff;

select * from orion.staff order by employee_id;

quit;
* end of sql procedure;
