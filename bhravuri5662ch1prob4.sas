/*
    Programmer Name: Bhargav Sai Krishna Ravuri
    Problem Identfication: Chapter 1 Problem 4
    Date: 09/13/2014
    Purpose: Reading Data Values Where Missing Values Are Represented by Periods except at the end of Short Data Lines.
*/

* DATA Step;

data CLASS;
infile datalines missover;      /* using missover in infile statment*/
input F_Name $ ID $ Gender $ GPA Height Weight;   /* F_Name: First Name GPA: Grade Point Average*/
datalines;
Hector 123 M 3.5 . 155
. 328 F 3.7 52 99
Edward 747
Michelle 778 F 3.0 54
Sampson 289 M 3.5 60 180
;
run;

*PROCEDURE Step;

title "Student information with missing values and short records";
proc print data=CLASS;                         /* Printing the data values */
run;
