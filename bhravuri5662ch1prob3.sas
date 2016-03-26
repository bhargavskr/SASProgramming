/*
     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 1 Problem 3
     Date: 09/13/2014
     Purpose: Reading data values seperated by spaces with a character value greater than 8 Bytes long.
*/

*Data Step;

data CLASS;
informat F_Name $10.;        /* informat statement to print character variable of lenght 10 */
input F_Name ID $ Gender $ GPA Height Weight;    /* F_Name: First Name GPA: Grade Point Average */
datalines;
Hector 123 M 3.5 59 155
Nancy 328 F 3.7 52 99
Edward 747 M 2.4 62 205
Michelle 778 F 3.0 54 115
Washington 289 M 3.5 60 180
;
run;

*Procedure Step;

title "Student Information with character values greater than 8 Bytes";              /* Print student information */
proc print data=CLASS;
run;
