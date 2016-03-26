/*
        Programmer Name: Bhargav Sai Krishna Ravuri
        Problem Identification: Chapter 1 Problem 15
        Date: 09/20/2014
        Purpose: Using Variable lists and informat lists to make the INPUT statement More Compact.
*/


* DATA STEP;

data VARLIST;
* input statement using variable list and informat list;
input @1 (Q1-Q5)(2.)
      @15 (DATE1-DATE3)(mmddyy8.)
      @50 (X1-X3)($1.)
      @53 (Y1-Y3)($1.);
* format statement to display date;
format DATE1-DATE3 mmddyy8.;
/* datalines in column format
          1         2         3         4         5
12345678901234567890123456789012345678901234567890123456  */
datalines;
1122334455    10/21/4511/13/4206/05/48           123456
9672347656    01/01/9501/02/9501/03/95           987654
;
run;

* Procedure Step;

title "Printing data using variable and informat lists ";
* data printing;
proc print data=VARLIST;
run;
