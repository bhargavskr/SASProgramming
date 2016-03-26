

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 7 Problem 3
           Date: 11/08/2014
           Purpose: Computing Approximate Ages in years
*/

*Data step begins here which is used to create sas data set;
* libname statment is used to specify the permanent library where  sas datasets are located;
libname  lib "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";

Data AGE;
*Set Statment is used read vaiables from a existing sas data set keep option allows only the specifed variable in the new dataset;
  set lib.CLINICAL(KEEP=ID DOB VISIT);
 *Calculating AGE1 (rounded to nearest year between date1 and date2);
 AGE1=round(('01JAN96'D-DOB)/365.25,1);
 * calculating age2 with fractional part of year dropped;
 AGE2=int((VISIT-DOB)/365.25);
 *calculating age3 which is rounded to nearest half year as of the date the program is run for which today() function is used;
 AGE3=round((today()-DOB)/365.25,0.5);
* IF STATEMENT is used to avoid the negative age values;
IF AGE1<0 THEN   AGE1=.;
 IF AGE2<0 THEN AGE2=AGE2+100;
 IF AGE3<0 THEN AGE3=.;
*format statement is used to specify the way in which the variable values are displayed in the output;
format DOB VISIT worddate18.;

run;
*Here is the Procedure step is used to print data;


title  " Computing approximate age in years";
proc print data=AGE;
run;
