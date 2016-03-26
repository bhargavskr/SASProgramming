/*

     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 1 Problem 12
     Date: 09/27/2014
     Purpose: To cretae more than one observation from a Single Data Line(Two Variables)
*/

* The data step begins here where the temporary sas dataset is cretaed;

data TEMP_DAY;
* input statment assigns variables describes the location of there values in each record and the double trailing @@ will help in creatin
g multiple observations from a single data line;
input   DAY TEMP @@;
* dataline statment indicates the beginning of "In-Stream" Data;
Datalines;
5 21  6  23   7  29 8 33 9 19  10  28
11  33  12  39 13  43  14   44 15 28  16 21 17 24   18 27 19  29
20 37  21 32  22  31 23 33  24 29
;
run;

* The Procedure Step used to print the data ;

title "Printing more than one observation from a single data line (Two Variables)";
proc print data=TEMP_DAY;
run;
