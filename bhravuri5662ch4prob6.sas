
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 6
           Date: 10/18/2014
           Purpose: Adding Variables from two Data Sets Based on an Identifying Variable (Match Merging)
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
run;

DATA MER1995;
length ID $ 3 MERIT $ 1;
input ID MERIT;
DATALINES;
A28 Y
A23 Y
A24 N
;
run;

* The obseravations in PAY1995 and MER1995 are sorted according to ID for this sort procedure is used with BY statement;

proc sort data=PAY1995;
BY ID;
run;

proc sort data=MER1995;
BY ID;
run;





data PAYM1995;
* To add new variables to data set merge statment is used;
merge PAY1995 MER1995;
BY ID;
run;

*Here is the Procedure step is used to print data;

title "Adding Variables from two SAS Data Sets Based on an Identifying variable ID ";
proc print data=PAYM1995;
run;
