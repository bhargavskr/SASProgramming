
/*

     Programmer Name: Bhargav Sai krishna Ravuri
     Problem Identification: Chapter 2 Problem 3
     Date: 09/27/2014
     Purpose: To read more than one raw data file using FILEVAR= option to create a single SAS Data Set
*/

* The data step begins here where a temporary sas dataset is created;

data DEMOG_12;
* : format modifier is used to read value according to informat but when delimiter is encountered;
input ExternalFile : $100.;
*infile statment used to specify the location of raw data external file and also can be used specify options for reading raw data;
*to read multiple raw external data files using FILEVAR= option;
* end= option is used in infile statement where last is set to 1 when end of file is reached;
infile dummy FILEVAR=ExternalFile end=last;
* input statment assigns variables describes the location of there values in each record and variable is in list input format;
* format modifiers are used to specify the desired length that should be allcated to a variable rather then default values;
* variables are arranged in fixed column format so column pointers are used to reference the starting column of variable ;
do until (last);
input
     @1   ID         $3.
     @4   DOB   mmddyy6.
     @10  GENDER     $1.
     @11  STATE      $2.
     @13  EMPLOYED   $1.;
output;
end;
* format statment is used to specify the format in which the value is to be displayed;
format DOB mmddyy8.;
* Reading filenames using in stream data;
datalines;
/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/DEMOG1.DTA
/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/DEMOG2.DTA
;
run;

* The Procedure Step used to print the data ;

title "To read raw data from more than one external data file using FILEVAR=, create sas data set and print the data";
* EMPLOYED 0:NO 1:YES M:MALE F:FEMALE;
proc print data=DEMOG_12;
run;
