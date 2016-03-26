
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 9 Problem 2
           Date: 11/01/2014
           Purpose: Computing Moving Average
*/

*Data step begins here which is used to create sas data set;
Data MOV_AVG1;
* input statement specifies the ways to read the variables;
input @1 DATE mmddyy8.
      @13 PRICE 5.;
COST1=PRICE;
*The lag() function returns the value of its argument the last time the lag() function executed;
* _N_ counts iterations of data step;
*mean() functions returns the average of non missing values of its arguments;
COST2=lag(PRICE);
COST3=lag2(PRICE);
IF _N_ >= 3 THEN MOVING_AVG=mean(of COST1-COST3);
*Drop statement excludes the cost1-cost3 from displaying in the output;
DROP COST1 COST2 COST3;
* datalines statement specifies the starting of inline stream of data;
format DATE mmddyy10. PRICE dollar10.2;
DATALINES;
01/01/95    23.00
01/02/95    25.00
01/03/95    24.00
01/04/95    29.00
01/05/95    26.00
01/06/95    23.00
01/07/95    24.00
;

*Here is the Procedure step is used to print data;


title " Computing Moving Average ";
proc print data=MOV_AVG1;
run;


title "Graph between dialy and moving average vs the date";
*symbol value=dot interpol=sms line=1 width=2;
title2 "The Moving Average is indicated by - and Price is indicated by * ";
* proc plot can be used to generate a graphof the values of one variable plotted aganist values of another variable;
proc plot data=MOV_AVG1;
* X*Y=character is used to specify the plotting character to be used to mark points on the plot;
* overlay option is used specify the proc plot to print the plot request specifed in the plot statement on a single graph;
 PLOT  MOVING_AVG * DATE="-" PRICE * DATE="*"/ overlay;
run;
