

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 15 Problem 1
           Date: 11/15/2014
           Purpose: Producing simple one way frequecies
*/

*Data step begins here which is used to create sas data set;
*filenae statement is used to create a file reference which can be utilized with an infile statement; ;

filename  lib "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/CARS.DTA";

data CARS;
* infile statement is used to identify an external data source and options for the data source;
* pad option is used for short records;
infile lib pad;
* input statement is used  to read data into sas and assign variable names to the variables and describe the location of there values in
 each reocrd and informats are used speicfy the size of the variable and there formats to read the variables;
input @1   SIZE      $9.
      @11   MANUFACT $9.
      @22  MODEL     $9.
      @38  MILEAGE    2.
      @50  RELIABLE   1.;
run;



*Here are  the Procedures step is used to print one way to n way frequences  ;

title  " Producing simple one way frequencies";
proc freq data=CARS;
* table statement is used to specify the variables for which proc freq must construct and print frequency and crosstab tables;
tables SIZE MANUFACT;
run;
