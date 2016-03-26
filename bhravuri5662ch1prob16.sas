/*
        Programmer Name: Bhargav Sai Krishna Ravuri
        Problem Identification: Chapter 1 Problem 16
        Date: 09/20/2014
        Purpose: Using Variable lists, informat lists and Relative column pointer to read data values.
*/


* DATA STEP;

data POINTER;
* input statement using variable list, informat list and relative column pointer;
input @1 (X1-X3)(2. +5)
      @3 (Y1-Y3)(2.+5)
      @5 (Z1-Z3)($3.+4);
/* datalines in column format
          1        2
123456789012345678901  */
datalines;
0102AAA0304BBB0506CCC
2837ABC9676DEF8765GHI
;
run;

* Procedure Step;

title "Printing data using variable, informat lists and relative column pointer ";
* data printing;
proc print data=POINTER;
run;
