

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 8 Problem 2
           Date: 11/08/2014
           Purpose: Converting a value of "NA" to missing for character variables
 */

*Data step begins here which is used to create sas data set;
Data NOTAPPLY;
* input statement specifies the ways to read the variable list input is used where the values of variables are seperated by a delimiter;
*length statement is used to specify how many bytes to reserve for values of a variable;
 length A B C D E $ 2;
 input ID A $ B $ C $ D $ E $ X Y Z;
DATALINES;
001 Y N N Y Y 1 2 3
002 na NA Y Y Y 3 4 5
003 NA NA NA na na 8 9 10
;
run;

* creating a new dataset to where the values of "NA" in NOTAPPLY are converted into a character missing value;

data NEW;
*set statement is used to read observations from a existing sas data set;
set NOTAPPLY;
* array statement is used to create a array  which is a list of elements or variables. A specific variable is identified by using an
index;
array ARRAY1[5] $ 2 A B C D E;
 DO I=1 TO 5;
  IF ARRAY1[I]="NA" or ARRAY1[I]="na" THEN ARRAY1[I]="";
END;

*drop statement is used to prvent the specified variables for output display;
DROP I;
run;

*Here is the Procedure step is used to print data;


title  "Converting a value of 'NA' to missing for character variables";
proc print data=NEW;
* Var statement is used to specify the order in which variables are displayed;
var ID A B C D E X Y Z;
run;
