

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 6 Problem 2
           Date: 11/01/2014
           Purpose: Checking for invalid data values
*/

*Data step begins here which is used to create sas data set;
Data INVALID;
* input statement specifies the ways to read the variables;
* informats are used to minimize the space occupied by each variable and specify how to read the variable;
 input @1 ID $3.
       @4 RESPONSE  $10.;
 IF verify(RESPONSE,"ABCDE ") ne 0 THEN OUTPUT;
* verify() function is used make sure that character variable contains valid values, returns 0 if the string is valid;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
001ABCDEABCDE
002XCCBEBBABC
003A BACECBAA
004abcdeabcde
;
run;
*Here is the Procedure step is used to print data;


title  " Checking for invalid data values ";
proc print data=INVALID;
run;
