
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 3
           Date: 10/18/2014
           Purpose: Creating Multiple SAS Data Sets from a Single SAS Data Set
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
* To create two sas data sets from a single sas data set we specify the the two new data sets in the data statement and then use set sta
tement to specify the original sas data set from which the others should be created;

Data FEM_1995 MAL_1995;
* set statement is used to specify the original data set;
set PAY1995;
*Subsetting if statement is used to classify the observations based on gender between the two sas data sets MAL_1995 and FEM_1995;
IF GENDER="M" THEN output MAL_1995;
ElSE IF GENDER="F" THEN output FEM_1995;
run;

*Here is the Procedure step is used to print data;

title "Creating Multiple SAS data sets from a single data set MALE List";
proc print data=MAL_1995;
run;


title "Creating Multiple SAS data sets from a single data set FEMALE List";
proc print data=FEM_1995;
run;
