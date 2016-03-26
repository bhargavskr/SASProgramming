/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Assignment 5 Problem 9
         Date:2/28/2015
         Purpose: To display the list of repeat customers i.e. the customers who placed orders in both quater1 and quater2 of 2007

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql;
title " Customers who placed  orders during both quater1 and quater2 of 2007";





* intersect displays unique rows common in result set on left side and in the result set on right side;


select customer_id from orion.qtr1_2007  intersect  select customer_id from orion.qtr2_2007;





quit;

* end of SQL procedure ;
