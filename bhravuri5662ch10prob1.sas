

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 10 Problem 1
           Date: 11/08/2014
           Purpose: Selecting the first or last observations per subject
*/

*Data step begins here which is used to create sas data set;
*filenae statement is used to create a file reference which can be utilized with an infile statement; ;

filename  lib "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/CLIN_X.DTA";

data CLIN_X1;
* infile statement is used to identify an external data source and options for the data source;
* pad option is used for short records;
infile lib pad;
* input statement is used  to read data into sas and assign variable names to the variables and describe the location of there values in
 each reocrd and informats are used speicfy the size of the variable and there formats to read the variables;
input @1   ID     $3.
      @4   VISIT  mmddyy6.
      @10  DX     $2.
      @12  HR     3.
      @15  SBP    3.
      @18  DBP    3.
      @21  RX_1   $1.
      @22  RX_2   $1.;
*format statement is used to specify the way in which the variable values are displayed in the output;
format VISIT mmddyy8.;
run;

* sort procedure is used to sort the observations in the data set according to ID ;


proc sort data=CLIN_X1;
BY ID;
run;
* the CLIN_X is printed for reference ;

title "The reference data set";
proc print data=CLIN_X1;
run;

* one data step is used to create two sas data sets FIRST and LAST If the observation is the 1st visit of an ID then the observation is
written to FIRST data set if the observation corresponds to last visit of the ID than the Observation is written to LAST data set if the
re is only one visit by an ID then FIRST.ID and LAST.ID are set to 1 and are written to both data sets;

data FIRST LAST;
   set CLIN_X1;
  by ID;
if FIRST.ID=1 THEN OUTPUT FIRST;

if LAST.ID=1 THEN OUTPUT LAST;

run;

*Here are  the Procedures step is used to print data of LAST and FIRST data sets;

title  " Selecting the first observations per subject";
proc print data=FIRST;
run;


title " Selecting the last observations per subject";
proc print data=LAST;
run;
