

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 13 Problem 1
           Date: 11/15/2014
           Purpose: Preparing a simple "No frills"  report
*/



 *libname statement is used to specify the location of an Permanent SAS dataset;
 *options is a global statement where fmtsearch is used for accessing a permanent data set with user defined formats;
 libname ab "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";
 options fmtsearch=(ab);
*Here are  the Procedures step is used to print data;

title  'Preparing a simple "No frills" Report';
* obs= option is used to print first n observations of data set;
proc print data=ab.CLINICAL(obs=10);
* ID statement is used to replace the OBS column with the variable specified;
ID ID;
*var statement is used to specify the order and which variables are to be displayed;
VAR  DOB VISIT PRIM_DX;
run;
