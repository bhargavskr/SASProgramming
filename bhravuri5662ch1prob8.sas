

 /*
                Programmer Name: Bhargav Sai Krishna Ravuri
                Problem Identification: Chapter 1 Problem 8
                Data: 09/05/2014
                Purpose: To create a temporary SAS data set called CLASS from the data lines by including the lines of data "instream" i
                -n the program and display the contents of the data set. Use column pointers and informats to read data values.

*/


* DATA STEP;

data CLASS;
* Informat statement to read data values and assign the memory for the variables;
informat F_Name  $8.
         ID $3.
         Gender $1.
         GPA   3.
         Height 2.
         Weight 3.;
*input statment to read datavalues from specified column position;
input @1 F_Name    /* F_Name(First Name), GPA(Grade Point Average)*/
      @13 ID
      @22 Gender
      @31 GPA
      @39 Height
      @49 Weight;
*Data lines arranges as per column numbers;
datalines;
Hector      123      M        3.5     59        155
Nancy       328      F        3.7     52         99
Edward      747      M        2.4     62        205
Michelle    778      F        3.0     54        115
Sampson     289      M        3.5     60        180
;
run;

* PROCEDURE STEP;

title "Students data arranged as per column numbers";
proc print data=CLASS;                                 /* Printing Data */
run;
