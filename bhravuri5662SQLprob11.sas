/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Assignment 6 Problem 11
         Date:2/28/2015
         Purpose: To display total sales for each product category and limit the output to only those product categories that have total
                   sales less than the average of the total retail sales for product categories

*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* select statment selects data that meet certain conditions;
proc sql;
title " Total sales for each product category limited by average computation  ";

*order by clause is used to order the query results in a  specific order by default ascending;


*gorup by clause is used to classify data into groups based on the values of one or more columns and calculate statistics for each uniqu
e value of the grouping column;

* summary function sum() calculates the sum of Total retail prices across rows;
* summary function avg() calculates the avg of the total sales for product categories;

* having clause is processed after the group by clause and determines which groups will be displayed

* inline view is a temporary virtual table that exists only during query execuition which is created by placing a query expression in a
  from clause where a table name would normally be used;

* subquery is a query that resides within an outer query. The subquery must be resolved before the main query is resolved;


select product_category,sum(Total_Retail_Price)  ' Total Sales ' format=dollar12.2 from orion.order_fact inner join orion.product_dim on
  order_fact.product_id=product_dim.product_id group by product_category having sum(Total_Retail_Price)<(select avg(sum_sale_cat)
           from (select sum(Total_Retail_Price) as sum_sale_cat from orion.order_fact
        inner join orion.product_dim on  order_fact.product_id=product_dim.product_id
           group by product_category)) order by 1;


quit;

* end of SQL procedure ;
