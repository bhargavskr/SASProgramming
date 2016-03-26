
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 5 Problem 4
           Date: 11/01/2014
           Purpose: Computing Averages within an observation
*/

*Data step begins here which is used to create sas data set;
Data ENV_SUR;
* input statement specifies the ways to read the variables;
input ID Q1-Q10;
*The n() returns the number of non missing numeric values among its arguments;
*mean() functions returns the average of non missing values of its arguments;
IF n(OF Q1-Q10) >= 8 THEN SCORE=mean(OF Q1-Q10);

* datalines statement specifies the starting of inline stream of data;
DATALINES;
1 3 4 3 2 . 5 5 4 4 3
2 . . . 2 1 1 1 2 1 2
3 5 4 5 3 3 4 5 4 . 5
;
run;
*Here is the Procedure step is used to print data;


title " Computing Averages within an Observation";
proc print data=ENV_SUR;
run;
