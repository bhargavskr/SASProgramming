

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 7 Problem 1
           Date: 11/08/2014
           Purpose: Reading Dates in a variety of configurations
*/

*Data step begins here which is used to create sas data set;
Data IN_DATE;
* input statement specifies the ways to read the variables;
* informats are used to specify how to read the variable;
 input @1   DATE1  mmddyy6.
       @8   DATE2  mmddyy8.
       @17  DATE3  date7.
       @25  DATE4  julian5.
       @31  DATE5  ddmmyy6.
       @38  DATE6  mmddyy8.      ;
*format statement is used to specify the way in which the variable values are displayed in the output;
format DATE1-DATE6 mmddyy8.;
/* datalines statement specifies the starting of inline stream of data and column input is used specifying the column where the varibale
 starts, julian data format is of the form yyddd or yyyyddd where ddd is the number of the day in the year and yyor yyyy is the year
         1         2         3         4
123456789012345678901234567890123456789012345   */
DATALINES;
102146 10/21/46 21OCT46 46294 211046 10211946
122596 12/25/96 25DEC96 96360 251296 12251996
;
run;
*Here is the Procedure step is used to print data;


title  " Reading Dates in a variety of configurations ";
proc print data=IN_DATE;
run;
