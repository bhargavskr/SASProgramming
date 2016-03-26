
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 11
           Date: 10/18/2014
           Purpose: Merging SAS data sets with multiple By variables
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

DATA HEALTH_ALLOW;
*informat statement is used to specify how to read the values of variables from instream data;
* the ALLOWNACE variable has values which include a comma to read such values comma5. informat is used;
* the format statement is used to specify how to output the values of variable here Allowance comma5. specify that it should be printed
with commas;
informat GENDER $1. ALLOWANCE comma5.;
input GENDER LEVEL ALLOWANCE;
format ALLOWANCE comma5.;
DATALINES;
F 28 2,000
M 28 1,800
F 32 2,100
M 32 1,900
F 35 2,200
M 35 2,000
F 44 4,000
M 44 3,600
;
run;

* The obseravations in PAY1995 and HEALTH_ALLOW are sorted according to Level and Gender for this sort procedure is used with BY
  statement;
proc sort data=PAY1995;
BY LEVEL GENDER;
run;

proc sort data=HEALTH_ALLOW;
BY LEVEL GENDER;
run;





data PAY1995H;
* To add new variables to data set merge statment is used;
* The in data set option is used to determine which data sets contributed to the current observation;
* albeit is set to 1 if the ball set contributed to the observation otherwise it is set to 0;
* KEEP= option is used to consider only ID and Gender Variables from the PAY1995 data set;
merge PAY1995(IN=present) HEALTH_ALLOW;
BY LEVEL GENDER;
IF present=1;
run;

*Here is the Procedure step is used to print data;

title "Merging SAS data sets with multiple by varables";
proc print data=PAY1995H;
run;
