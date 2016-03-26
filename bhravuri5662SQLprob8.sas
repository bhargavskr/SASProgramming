/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Assignment 4  Problem 8
         Date:2/28/2015
         Purpose: To perform left join of tables product_dim and price_list

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql;
title "  Left Join of PRODUCT_DIM and PRICE_LIST ";

select d.product_id,product_name,l.product_id,unit_sales_price  from orion.product_dim as d left join orion.price_list as l on
d.product_id=l.product_id order by product_name;


quit;

* end of SQL procedure ;
