/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Assignment 3 Problem 5
         Date:2/28/2015
         Purpose: To compute and display total Sales for each product category order by total sales
*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql;
title " Total sales for each product category ordered by sales  ";

*order by clause is used to order the query results in a  specific order by default ascending;


*gorup by clause is used to classify data into groups based on the values of one or more columns and calculate statistics for each uniqu
e value of the grouping column;

* summary function sum() calculates the sum of Total retail prices across rows;


select product_category,sum(Total_Retail_Price) as Total_Sales  format=dollar12.2 from orion.order_fact inner join orion.product_dim on
  order_fact.product_id=product_dim.product_id group by product_category order by 2;


quit;

* end of SQL procedure ;
