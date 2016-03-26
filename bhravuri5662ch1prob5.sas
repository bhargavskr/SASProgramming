/*
    Programmer Name: Bhargav Sai Krishna Ravuri
    Problem Identfication:Chapter 1 Problem 5
    Date: 09/13/2014
    Purpose: Reading Data Values Seperated by commas Where Missing Values Are Represented by Two Adjacent Commas and Some of the Charact
er values Are Placed in Double Quotes
*/

* DATA Step;

data CLASS;
infile datalines dsd;      /* using dsd in infile statment*/
input F_Name $ ID $ Gender $ GPA Height Weight;   /* F_Name: First Name GPA: Grade Point Average*/
datalines;
Hector,123,M,3.5,,155
,328,"F",3.7,52,99
"Edward",747,,,,,                      /* data values seperated by commas*/
Michelle,778,F,3.0,54,,
Sampson,289,M,3.5,60,180
;
run;

*PROCEDURE Step;

title "Student information with data values seperated by commas and missing values by two commas";
proc print data=CLASS;      /* printing the data values */
run;
