/*

     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 1 Problem 11
     Date: 09/27/2014
     Purpose: To cretae more than one observation from a Single Data Line
*/

* The data step begins here where a temporary sas dataset is cretaed;

data TEMPER;
* The input Statment assigns names to variables and describes the location of their values in each data record and the double trailing @
@ helps in creating multiple obseravations from a single data line;
input Temperature @@;
*datalines statement indicates the beginning of in-stream data;
datalines;
21  23   29 33 19  28
33  39 43  44 28  21 24   27  29
37   32    31  33 29
;
run;

* Procedure step is used to print the contents of SAS data set;

title "Printing more than one observation from a single data line";
proc print data=TEMPER;
run;
