

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 7 Problem 2
           Date: 11/08/2014
           Purpose: Reading Dates in non standard forms
*/

*Data step begins here which is used to create sas data set;
Data IN_DATE2;
* input statement specifies the ways to read the variables fixed column input is used where the values of variables are placed in same
 columns    for  each observation;
 input  DAY1 3-4
        MONTH1 10-11
        YEAR1  15-18
        MONTH2  20-21
        YEAR2   23-24;
*MDY(Month,day,year) is a  function that creates sas date from the specification of month, day and year;
 DATE1=MDY(MONTH1,DAY1,YEAR1);
 DATE2=MDY(MONTH2,15,YEAR2);
 *Calculating number of years (rounded to nearest year between date1 and date2);
 NUMBER_YEARS=round((DATE2-DATE1)/365.25,1);
*format statement is used to specify the way in which the variable values are displayed in the output;
format DATE1-DATE2 worddate18.;
/* datalines statement specifies the starting of inline stream of data and column input is used specifying the column where the varibale
 starts, worddatew. is a format which displays date in the form of "december 3, 2006"
         1         2         3         4
123456789012345678901234567890123456789012345   */
* statement is used to prevent the variables specified from displaying in the output;
drop DAY1  MONTH1 MONTH2 YEAR1 YEAR2;
DATALINES;
  17     09   1990 04 96
  30     11   1991 05 95
;
run;
*Here is the Procedure step is used to print data;


title  " Reading Dates in non standard form";
proc print data=IN_DATE2;
run;
