

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 13 Problem 2
           Date: 11/15/2014
           Purpose: Using Variable labels as column headings
*/



 *libname statement is used to specify the location of an Permanent SAS dataset;
 *options is a global statement where fmtsearch is used for accessing a permanent data set with user defined formats;
 libname ab "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";
 options fmtsearch=(ab);
*Here are  the Procedures step is used to print data;

title  'Using variable labels as column headings';
* obs= option is used to print first n observations of data set and noobs option is used to remove the obs cloumn in output;
proc print data=ab.CLINICAL(obs=10) label noobs ;
* noobs option is used to remove the OBS column;

*var statement is used to specify the order and which variables are to be displayed;
VAR ID DOB VISIT PRIM_DX;
* label statement is used to make the lisiting more readable by using variable labels instead of variable names for this label option ;
* must also be specified in the proc print statement;
LABEL ID="Patient ID"
      DOB="Date of Birth"
      VISIT= "DAte of Visit"
      PRIM_DX="PRIMARY DX";
* format statement is used to change the appearance of values in the listing;
format DOB VISIT date7.;
run;
