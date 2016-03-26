/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Assignment 4 Problem 7
         Date:2/28/2015
         Purpose: To combine tables QTR1_2007 and QTR2_2007, display total number of orders as "Total number of orders"

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql;
title " Combined orders from QTR1_2007 and QTR2_2007 ";



* summary function count(*) counts all the rows returned by the query;

* outer union with corr displays all data values from table one and table two but overlay common columns;

* inline view is a temporary virtual table that exist during query execution and created by placing a query expression in a from clause;

select * from orion.qtr1_2007 outer union corr select * from orion.qtr2_2007;

title "Total number of orders placed during QTR1 and QTR2 of 2007 ";


select count(*) label="Total number of orders" from (select * from orion.qtr1_2007 outer union corr select * from orion.qtr2_2007);

quit;

* end of SQL procedure ;
