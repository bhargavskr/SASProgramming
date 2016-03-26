
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 5 Problem 1
           Date: 11/01/2014
           Purpose: Using numerical functions to create new variables
*/

*Data step begins here which is used to create sas data set;
Data XYZ;
* input statement specifies the ways to read the variables;
input X Y Z;
*round function with 2 argumenst 1st argument specifies the value to be rounded and 2nd argument specifes the values for round offunits;
* round() function is used to round numbers, either to nearest integer or to other values such as 1-th or 100ths;
ROUND_X=round(X,.1);
* the log() function takes the natural logarithm of its arguments;
LOG_X=log(x);
* the log10() function takes base 10 logarithm of its arguments;
LOG_10X=log10(x);
*the int() function returns the integer portion of numeric value;
WHOLE_X=int(x);
* min() function returns the smallest non missing values of its arguments;
SMALL=min(X,Y,Z);
* max() function returns the largest non missing values of its arguments;
BIG=max(X,Y,Z);
*mean() function is used to compute the average of non missing values of its arguments ;
AVE=mean(X,Y,Z);
*sum() function is used to compute the sum of non missing values of its arguments ;
SUM=sum(X,Y,Z);
* the N() function returns the number of non missing numeric values among arguments;
NONMISS=N(X,Y,Z);
* datalines statement specifies the starting of inline stream of data;
DATALINES;
1 2 3
4 . 6
2.33 5 .
2.5 2.6 2.7
;

*Here is the Procedure step is used to print data;


title " Using numerical functions to create new variables ";
proc print data=XYZ;
run;
