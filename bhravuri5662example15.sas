 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 3
     Date:09/13/2014
     Purpose: dsd and dlm
*/

libname lib "MyLib/";
data lib.Company;
infile "Documents/Company.txt" dlm="$" dsd;
input Last_Name $ Employee_Number $ Annual_Salary;
run;

title "3.15 Problem 3";
proc print data=lib.Company;
run;
