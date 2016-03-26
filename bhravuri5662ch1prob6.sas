

 /*
                Programmer Name: Bhargav Sai Krishna Ravuri
                Problem Identification: Chapter 1 Problem 6
                Data: 09/05/2014
                Purpose: To create a temporary SAS data set called CLASS from the data lines by including the lines of data "instream" i
                -n the program and display the contents of the data set. The INPUT statement should use starting and ending column numbe
                -rs.
*/


* DATA STEP;

data CLASS;
input F_Name $ 1-8 ID $ 13-15 Gender $ 22 GPA 31-33 Height 39-40 Weight 49-51;    /* F_Name(First Name), GPA(Grade Point Average)*/
datalines;
Hector      123      M        3.5     59        155
Nancy       328      F        3.7     52         99
Edward      747      M        2.4     62        205          /*     Data lines arranged as per column number */
Michelle    778      F        3.0     54        115
Sampson     289      M        3.5     60        180
;
run;

* PROCEDURE STEP;

title "Students data arranged as per column numbers";
proc print data=CLASS;                                 /* Printing Data */
run;
