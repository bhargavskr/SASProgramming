

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 15 Problem 3
           Date: 11/17/2014
           Purpose: Demonstrating how missing values are handled
*/



 *libname statement is used to specify the location of an Permanent SAS dataset;
 *options is a global statement where fmtsearch is used for accessing a permanent data set with user defined formats;
 libname ab "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";
 options fmtsearch=(ab);



*Here are  the Procedures step is used to print one way to n way frequences  ;

title  " Producing simple one way frequencies without MISSING Option in table statement";
proc freq data=ab.CLINICAL;
* table statement is used to specify the variables for which proc freq must construct and print frequency and crosstab tables;
tables SEC_DX;
run;

title  " Producing simple one way frequencies with MISSING Option in table statement";
proc freq data=ab.CLINICAL;
* table statement is used to specify the variables for which proc freq must construct and print frequency and crosstab tables;
*MISSING option cause the proc freq to treat missing values as non missing values and include them in the calculation of percentages and other statistics;
tables SEC_DX / MISSING;
run;
