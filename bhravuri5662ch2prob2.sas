
/*

     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 2 Problem 2
     Date: 09/27/2014
     Purpose: To read more than one raw data file to create a single SAS Data Set
*/

* The data step begins here where a temporary sas dataset is created;

data DEMOG_12;
*infile statment used to specify the location of raw data external file and also can be used specify options for reading raw data;
*to read multiple raw external data files using DOS wildcard character ? for single character;
infile "/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/DEMOG?.DTA";
/* input statment assigns variables describes the location of there values in each record and variables are located on same columns on
 each record so fixed column input is used with use of column pointer to place the pointer at specified location in the data line  */
* format modifiers are also used to specify the desired length that should be allcated to a variable rather then default values;
input
     @1   ID         $3.
     @4   DOB   mmddyy6.
     @10  GENDER     $1.
     @11  STATE      $2.
     @13  EMPLOYED   $1.;
* format statment is used to specify the format in which the value is to be displayed;
format DOB mmddyy8.;
run;

* The Procedure Step used to print the data ;

title "To read raw data from more one external data file , create sas data set and print the data EMPLOYED 0: NO 1:YES";
proc print data=DEMOG_12;
run;
