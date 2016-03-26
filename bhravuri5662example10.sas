/*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Textbook exercise 2.1
           Date: 09/06/2014
           Purpose: To compute variables and avergaes and list them

*/

libname lib "MyLib/";
data lib.stocks;
infile "Documents/Prog9exampleDataSet.txt";
input Stock_Name $ Price Number_Stocks;
Value= Price*Number_Stocks;
run;

title "Stocks Value and there means";
proc means data=lib.stocks;
      var Price Number_Stocks;
run;

title "Display data";
proc print data=lib.stocks;
run;
