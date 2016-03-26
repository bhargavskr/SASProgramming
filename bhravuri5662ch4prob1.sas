
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 1
           Date: 10/04/2014
           Purpose: Combining Similar Data from two Different SAS Data Sets
*/

*Data step begins here which is used to create sas data set;
Data PAY1995;
* the length statement is used to specify the number columns that must be considerd for a variable;
length ID $ 3 GENDER $ 1;
* input statement specifies the ways to read the variables;
input ID LEVEL SALARY GENDER;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
A23 32 68000 M
A24 35 75000 F
A30 44 97000 M
A13 28 27000 F
;

DATA PAY1996;
length ID $ 3 GENDER $ 1;
input ID LEVEL SALARY GENDER;
DATALINES;
A25 29 35000 F
A26 36 88000 F
;

Data PAY95_96;
* set statement is used to create new data set which appends one data set to the end of another dataset;
set PAY1995 PAY1996;
run;

*Here is the Procedure step is used to print data;

title "Combining Similar data from two different SAS Data Sets";
proc print data=PAY95_96;
run;
