/*
   Programmer Name: Bhargav Sai Krishna Ravuri
   Problem Identification: Chapter 1 Problem 10
   Date:09/20/2014
   Purpose: Creating a single observation from More than one line of row data using #, @ and informats.
*/

* DATA STEP;

data SURVEY;
*/ informat statment for defining date;
*input statement to read data values of an observation from multiple rows ;
input  #1 SUBJECT  $  1-3
          DOB         mmddyy8.
          STATE    $  25-26
          ZIP_CODE $  40-44
       #2 NUMBER      5
       @11  CAR1        $10.
          CAR2     $  21-30;
* format statement to display the date;
format DOB mmddyy8.;
/* data lines entered in column format
         1         2         3         4         5
12345678901234567890123456789012345678901234567890 */
datalines;
12310/21/46             NJ             08822
123 2     Ford      Oldsmobile
23711/01/55             NY             11518
237 1     Chevy
;
run;

* PROCEDURE STEP;

title "Survey information which is entered in two lines";
* Printing data;
proc print data=SURVEY;
run;
