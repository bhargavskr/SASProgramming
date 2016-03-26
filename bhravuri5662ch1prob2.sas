

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 1 Problem 2
           Date: 09/05/2014
           Purpose: To create temporary SAS data set called CLASS from the lines of data by including the lines of data "instream" in th
           -e program and display the content of this data set. The data set contains missing values both for numeric and character vari
           -ables which are represented by periods.
*/

*DATA STEP;

data CLASS;
input F_Name $ ID $ Gender $ GPA Height Weight;    * F_Name(First Name) and GPA(Grade Point Average);
datalines;
Hector   123 M 3.5  . 155
.        328 F 3.7 52  99
Edward   747 .   .  .   .        /* data lines using list input with missing values  */
Michelle 778 F 3.0 54   .
Sampson  289 M 3.5 60 180
;
run;

* PROCEDURE STEP;

title "Students Data with missing values in numeric and character variables";
proc print data=CLASS;                 * Printing the data set;
run;
