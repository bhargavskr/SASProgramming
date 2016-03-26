/*
         Programmer Name: Bhargav Sai Krishna, Ravuri
         Problem Identification: SQL Problem 3
         Date:2/12/2015
         Purpose: Listing of amount obtained from sales, total number of sales made and amount obtained through internet sales
*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* start of sql procedure ;
* Problem 3a;
* select statment selects data that meet certain conditions;
proc sql;
title " Total amount obtained from sales";

* summary function sum() calculates the sum of Total retail prices across rows;

select sum(Total_Retail_Price) ' Total amount obtained from Sales' from orion.order_fact;

title " Number of orders placed";

* summary function count() counts the number of non -missing values in Order_ID;

 * Problem 3b;
select count(distinct Order_ID) ' Number of orders placed' from orion.order_fact;


title " Total amount of sales from internet only";

* problem 3c;

select sum(Total_Retail_Price) ' Total amount of sales from internet only ' from orion.order_fact where Employee_ID=99999999;

quit;

* end of SQL procedure ;
