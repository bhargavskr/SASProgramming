/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL  Assignment 3 Problem 6
         Date:2/28/2015
         Purpose: To compute and display total Sales for each product category order by product category and output product categories
                  that have sales less than $5000

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql;
title " Prodcut Category with total sales less than $5000 ordered by product category  ";

*order by clause is used to order the query results in a  specific order by default ascending;


*gorup by clause is used to classify data into groups based on the values of one or more columns and calculate statistics for each uniqu
e value of the grouping column;

* summary function sum() calculates the sum of Total retail prices across rows;


* having clause is processed after the group by clause and determines which groups will be displayed;


select product_category,sum(Total_Retail_Price) as Total_Sales  format=dollar12.2 from orion.order_fact inner join orion.product_dim on
  order_fact.product_id=product_dim.product_id group by product_category having sum(Total_Retail_Price)<5000 order by 1;


quit;

* end of SQL procedure ;
