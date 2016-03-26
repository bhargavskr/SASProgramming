

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 8 Problem 1
           Date: 11/08/2014
           Purpose: Using array to set values of 9,99 and 999 to missing for a series of Numeric variables
*/

*Data step begins here which is used to create sas data set;
Data LOTS_9;
* input statement specifies the ways to read the variable list input is used where the values of variables are seperated by a delimiter;
 input X1-X5 A B C D Y1-Y5 Z1-Z3;
* datalines statement specifies the start of inline stream of data;
DATALINES;
1 0 1 0 1 2 2 2 2 1 2 3 4 5 3 3 3
9 0 0 0 9 99 99 99 7 999 999 4 5 6 999 999 999
;
run;

* a new data set is created to replace the 9, 99, and 999 values in LOTS_9 data set;

data LOTSMISS;
* set statement is used read variables values from existin sas data set;
set LOTS_9;
* array statement is used to create a array  which is a list of elements or variables. A specific variable is identified by using an
index;
array ARRAY1[5] X1-X5;
 array ARRAY2[4] A B C D;
 array ARRAY3[8] Y1-Y5 Z1-Z3;
 DO I=1 TO 5;
  IF ARRAY1[I]=9 THEN ARRAY1[I]=.;
END;
 DO J=1 TO 4;
   IF ARRAY2[J]=99 THEN ARRAY2[J]=.;
END;

DO K=1 TO 8;
 IF ARRAY3[K]=999 THEN ARRAY3[K]=.;
END;
*drop statement is used to prvent the specified variables for output display;
DROP I J K;
run;





*Here is the Procedure step is used to print data;


title  "Using Arrays to set values of 9, 99 and 999 to missing for a series of numeric variables";
proc print data=LOTSMISS;
run;
