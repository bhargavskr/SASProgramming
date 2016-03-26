
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 1 Problem 1
           Date: 09/05/2014
           Purpose: To create temporary SAS data set called CLASS from the lines of data by including the lines of data "instream" in th
           -e program and display the content of this data set.

*/

*DATA STEP;

data CLASS;
input F_Name $ ID $ Gender $ GPA Height Weight;    * F_Name(First Name) and GPA(Grade Point Average);
datalines;
Hector   123 M 3.5 59 155
Nancy     328 F 3.7 52  99                 /*  data lines read using list input */
Edward   747 M 2.4 62 205
Michelle 778 F 3.0 54 115
Sampson  289 M 3.5 60 180
;
run;

* PROCEDURE STEP;

title "Students Data";
proc print data=CLASS;                   /* printing student data */
run;
