

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 8 Problem 4
           Date: 11/08/2014
           Purpose: Creating Observations from a single Observation
 */

*Data step begins here which is used to create sas data set;
Data DIAG;
* input statement specifies the ways to read the variable column input is used where the values of variables are present in same column for each observation;
* pad option is used with infile statement to specify not to go to next data record if (at least) one variable has not been assigned a value when the end of the current record is reached;
* DX1-DX5 represent varable
 list and ($2. +1) is the informat list which specifes the list of formats for the variables in a variable list;

 infile datalines pad;
 input @1 ID $3.
       @5 (DX1-DX5)($2. +1);
* datalines staement specifes the start of the inline stream of data;
DATALINES;
001 11 12
002 01 02 03 04 05
003 12
004 05 06
005 AA BB CC DD EE
;
run;

* creating a new dataset to where a single observation in DIAG data set is represented as multiple observations ;

data DIAG2;
*set statement is used to read observations from a existing sas data set;
set DIAG;
* array statement is used to create a array  which is a list of elements or variables. A specific variable is identified by using an
index;
length DX $ 2;
array ARRAY1[5] $ 2 DX1-DX5;
 DO I=1 TO 5;
  IF ARRAY1[I] ne "" THEN DO;
  DX=ARRAY1[I];
 *drop statement is used to prvent the specified variables for output display;
 DROP I;
  OUTPUT;
  END;
 END;
  run;


*Here is the Procedure step is used to print data;


title  "Creating Observations from a single Observation";
proc print data=DIAG2;
* Var statement is used to specify the order in which variables are displayed;
VAR ID DX;
run;
