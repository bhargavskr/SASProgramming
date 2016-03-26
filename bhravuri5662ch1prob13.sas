/*

     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 1 Problem 13
     Date: 09/27/2014
     Purpose: To cretae more than one observation from a Single Data Line (Two Variables of which one Character and one Numeric)
*/

* The data step begins here where a temporary sas dataset is created;

data RATS;
* input statment assigns variables describes the location of there values in each record and the double trailing @@ will help in creatin
g multiple observations from a single data line;
input   GROUP $ WEIGHT @@;
* dataline statment indicates the beginning of "In-Stream" Data;
Datalines;
A 34  B 58  A 28  C 55
C 56  A 27  B 52  C 58 A 21 B 62
;
run;

* The Procedure Step used to print the data ;

title "Printing more than one observation from a single data line (Two Variables: one Character and one Numeric)";
proc print data=RATS;
run;
