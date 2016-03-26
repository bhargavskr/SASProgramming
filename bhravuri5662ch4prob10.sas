
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 10
           Date: 10/18/2014
           Purpose: Combining Variables from two SAS data sets
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

DATA BALL;
length ID $ 3;
input ID HEIGHT;
DATALINES;
A24 65
A13 66
A23 72
;
run;

* The obseravations in PAY1995 and BALL are sorted according to ID for this sort procedure is used with BY statement;

proc sort data=PAY1995;
BY ID;
run;

proc sort data=BALL;
BY ID;
run;





data TEAM;
* To add new variables to data set merge statment is used;
* The in data set option is used to determine which data sets contributed to the current observation;
* albeit is set to 1 if the ball set contributed to the observation otherwise it is set to 0;
* KEEP= option is used to consider only ID and Gender Variables from the PAY1995 data set;
merge PAY1995(KEEP= ID GENDER) BALL(IN=albeit);
BY ID;
IF albeit=1;
run;

*Here is the Procedure step is used to print data;

title "Combining variables from two data sets using IN= option";
proc print data=TEAM;
run;
