
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 2
           Date: 10/04/2014
           Purpose: taking a subset of aboservations from a SAS data set
*/

*Data step begins here which is used to create sas data set;
Data PAY1995;
* the length statement is used to specify the number columns that must be considerd for a variable;
length ID $ 3 GENDER $ 1;
* input statement specifies the ways to read the variables;
input ID LEVEL SALARY GENDER;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
A23 32 68000 M
A24 35 75000 F
A30 44 97000 M
A13 28 27000 F
;
Data FEM_1995;
* set statement is used to specify an original SAS data set from which a sub set is created;
set PAY1995;
* where statement is used for conditional checking based on which new sas data set is created;
where GENDER="F";
run;
*Here is the Procedure step is used to print data;


title " Taking a subset of observations from a SAS data set";
proc print data=FEM_1995;
run;
