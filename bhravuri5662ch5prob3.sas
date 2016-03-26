
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 5 Problem 3
           Date: 11/01/2014
           Purpose: Computing Moving Average
*/

*Data step begins here which is used to create sas data set;
Data MOV_AVG;
* input statement specifies the ways to read the variables;
input MONTH $ COST;
COST1=COST;
*The lag() function returns the value of its argument the last time the lag() function executed;
* _N_ counts iterations of data step;
*mean() functions returns the average of non missing values of its arguments;
COST2=lag(COST);
COST3=lag2(COST);
IF _N_ >= 3 THEN MOVING_AVG=mean(of COST1-COST3);
*Drop statement excludes the cost1-cost3 from displaying in the output;
DROP COST1 COST2 COST3;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
JAN 125
FEB 120
MAR 130
APR 100
MAY 140
JUN 180
JUL 200
;

*Here is the Procedure step is used to print data;


title " Computing Moving Average ";
proc print data=MOV_AVG;
run;
