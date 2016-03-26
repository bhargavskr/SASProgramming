/*
   Programmer Name: Bhargav Sai Krishna, Ravuri
   Problem Identification: Assignment 1 problem 1b
   Date:02/01/2015
   Purpose: To determine appropriate values for the variables (columns) in each table
*/

* The libname statement is used to refer to the directory where the ORION database is located;
libname orion  '/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/STAT522/SQL/DATA'; /* Windows and UNIX */
*libname orion  '.WORKSHOP.SASDATA'; /* zOS mainframe*/

* distinct or unique options of select statement retrieves all unique values of the specified columns;

* Start of sql procedure;

proc sql;

title " Columns from Customer  Table ";

select  distinct Country  from orion.customer;

select  distinct Gender  from orion.customer;

*select  distinct Customer_Name  from orion.customer;

*select  distinct Customer_FirstName from orion.customer;

*select  distinct Customer_Address  from orion.customer;


title " Columns from employee_addresses table";

*select  distinct Employee_Name  from orion.employee_addresses;

*select  distinct Street_Name  from orion.employee_addresses;

select  distinct  City from orion.employee_addresses;

select  distinct State  from orion.employee_addresses;

select  distinct  Country from orion.employee_addresses;

title " Columns from employee_donations table";

select  distinct Recipients from orion.employee_donations;

select  distinct Paid_By from orion.employee_donations;

title " Columns from employee_organization table";

select  distinct Job_Title from orion.employee_organization;

select  distinct Department from orion.employee_organization;

title " Columns from employee_payroll table";

select  distinct Employee_Gender from orion.employee_payroll;

select  distinct  Marital_Status from orion.employee_payroll;

title " Columns from employee_phones table";

select  distinct Phone_Type from orion.employee_phones;

title "Columns from order_fact table";

*select  distinct Product_ID from orion.order_fact;

*select  distinct Street_ID from orion.order_fact;

select  distinct Discount from orion.order_fact;

*title " Columns from price_list table";

*select  distinct Product_ID from orion.price_list;

title " Columns from product_dim table";

select  distinct Product_Line from orion.product_dim;

select  distinct Product_Category from orion.product_dim;

select  distinct Product_Group from orion.product_dim;

select  distinct Product_Name from orion.product_dim;

select  distinct Supplier_Country from orion.product_dim;

select  distinct Supplier_Name from orion.product_dim;

*title "Columns from qtr1_2007 table";

*select  distinct Order_ID from orion.qtr1_2007;

*title " Columns from qtr2_2007 table";

*select  distinct Order_ID from orion.qtr2_2007;

title " Columns from sales table";

*select  distinct First_Name from orion.sales;

*select  distinct Last_Name from orion.sales;

select  distinct Gender from orion.sales;

select  distinct Job_Title from orion.sales;

select  distinct Country from orion.sales;

title " Columns from salesstaff table";

select  distinct Job_Title from orion.salesstaff;

select  distinct Gender from orion.salesstaff;

*select  distinct Employee_Name from orion.salesstaff;

title " Columns from staff table";

select  distinct Job_Title from orion.staff;

select  distinct Gender from orion.staff;

quit;

* end of sql procedure;
