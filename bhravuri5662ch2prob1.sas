
/*

     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 2 Problem 1
     Date: 09/27/2014
     Purpose: To read raw data from external file
*/

* The data step begins here where a temporary sas dataset is created;

data CARS;
*infile statment used to specify the location of raw data external file and also can be used specify options for reading raw data;
* pad is used for reading short data lines;
infile "/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/CARS.DTA" pad;
/* input statment assigns variables describes the location of there values in each record and variables are located on same columns on
 each record so fixed column input is used with use of column pointer to place the pointer at specified location in the data line  */
* format modifiers are also used to specify the desired lenght that should be allcated to a variable rather then default values;
input
     @1   SIZE      $9.
     @11  MANUFACT  $9.
     @22  MODEL     $9.
     @38  MILEAGE    2.
     @50  RELIABLE   1.;
run;

* The Procedure Step used to print the data ;

title "To read raw data from an external data file , create sas data set and print the data";
proc print data=CARS;
run;
