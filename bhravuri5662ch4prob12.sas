
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 4 Problem 12
           Date: 10/18/2014
           Purpose: Merging Data from Multiple SAS data sets and selecting Observations
*/



 *libname statement is used to specify the location of an Permanent SAS dataset;
 *options is a global statement where fmtsearch is used for accessing a permanent data set with user defined formats;
 libname ab "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";
 options fmtsearch=(ab);

 *Data step begins here which is used to create sas data set;
 * A new data set is created due to permission error while accessing the clinical data set directly;
data HYPERTEN;
set ab.CLINICAL;
run;


Data TREAD;
* input statement specifies the ways to read the variables here fixed column input is used specifying the column numbers where the val
es can be found;
input ID $1-3
      MINUTES 5-6;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
123 10
811 12
586 14
278 11
193 12
;
run;

DATA FAT;
input ID    $ 1-3
      BODY_FAT 5-6;
DATALINES;
444 14
123 23
919 18
278 20
444 24
811 34
193 30
;
run;

* The obseravations in HYPERTEN TREAD and FAT are sorted according to ID for this sort procedure is used with BY statement;

proc sort data=TREAD;
BY ID;
run;

proc sort data=FAT;
BY ID;
run;

proc sort data=HYPERTEN;
BY ID;
run;

data STUDY;
* To add new variables to data set merge statment is used;
* The in data set option is used to determine which data sets contributed to the current observation;
* present1 and present2 are set to 1 if the TREND data set and FAT data set  contributed to the observation otherwise it is set to 0
  respectively;
merge HYPERTEN TREAD(IN=present1) FAT(IN=present2);
BY ID;
IF present1=1 and present2=1;
run;

*Here is the Procedure step is used to print data;

title "Merging Data from multiple SAS data sets and Selecting Observations";
proc print data=STUDY;
run;
