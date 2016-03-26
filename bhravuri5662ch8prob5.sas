

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 8 Problem 5
           Date: 11/08/2014
           Purpose: Creating one observation from several Observations
 */

*Data step begins here which is used to create sas data set;
Data MANY;
* input statement specifies the ways to read the variable list input is used where the values of variables are seperated by a delimiter;

 input ID TIME X Y Z;
* datalines staement specifes the start of the inline stream of data;
DATALINES;
1 1 1 2 3
1 2 4 5 6
1 3 7 8 9
2 1 10 20 30
2 3 40 . 50
3 1 15 . .
3 2 25 26 27
3 3 35 36 37
;
run;
* sort procedure is used to sort the observations according to ID and TIME;

proc sort data=MANY;
BY ID TIME;





* creating a new dataset to where a multiple  observations in MANY data set are represented as a single observation ;
* SAS cretes temporary variables FIRST.BYVAR and LAST.BYVAR that indicate the first and last occurence of the observations in the same b
y group;
* Retain statement is used to remember the values of the variables until needed later;
* The values of the retained variables must be reset whenever a new BY-GROUP is encountered(FIRST.BYVAR);
data ONEPER;
*set statement is used to read observations from a existing sas data set;
set MANY;
BY ID;
* array statement is used to create a array  which is a list of elements or variables. A specific variable is identified by using an
index;
array ARRAY1[3] X1-X3;
array ARRAY2[3] Y1-Y3;
array ARRAY3[3] Z1-Z3;
RETAIN X1-X3 Y1-Y3 Z1-Z3;
IF first.ID=1 THEN
    DO I=1 TO 3;
      ARRAY1[I]=.;
      ARRAY2[I]=.;
      ARRAY3[I]=.;
    END;
      ARRAY1[TIME]=X;
      ARRAY2[TIME]=Y;
      ARRAY3[TIME]=Z;

 IF last.ID=1 THEN OUTPUT;
 * keep statement is used to hold only the specified variables for output display;
 KEEP  ID X1-X3 Y1-Y3 Z1-Z3;
  run;


*Here is the Procedure step is used to print data;


title  " Creating one observation from several Observations";
proc print data=ONEPER;
run;
