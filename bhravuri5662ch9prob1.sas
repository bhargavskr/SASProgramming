

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 9 Problem 1
           Date: 11/08/2014
           Purpose: Copying values from one observation to another observation
*/

*Data step begins here which is used to create sas data set;
*filenae statement is used to create a file reference which can be utilized with an infile statement; ;
filename lib "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/DIALYSIS.DTA";

data DIALYSIS1;
* infile statement is used to identify an external data source and options for the data source;
infile lib;
* input statement is used  to read data into sas and assign variable names to the variables and describe the location of there values in
 each reocrd and informats are used speicfy the size of the variable and there formats to read the variables;
 input @1  ID       $3.
      @4  GENDER   $1.
      @5  DOB      mmddyy8.
      @13 VISIT    1.
      @14 HR       3.
      @17 SBP      3.
      @20 DBP      3.;
*format statement is used to specify the way in which the variable values are displayed in the output;
format DOB mmddyy8.;
run;
* sort procedure is used to sort the observations in the data set according to ID and VISIT;

proc sort data=DIALYSIS1;
BY ID VISIT;

* A new data set is created to assign the Gender and DOB values to observations were visit is more than 1;


Data DIALYSIS_ALL;
*Set Statment is used read vaiables from a existing sas data set keep option allows only the specifed variable in the new dataset;
   set DIALYSIS1;
    BY ID;
* retain statement is used to remember the values of variables until needed later;
RETAIN GENDER1 DOB1;
* the FIRST.ID is set to 1 for the 1st observation of each ID;
IF FIRST.ID=1 THEN DO;
GENDER1=GENDER;
DOB1=DOB;
END;

GENDER=GENDER1;
DOB=DOB1;


*Drop statement is used to prevent the specified variables from displaying in the output;


Drop DOB1 GENDER1;
run;
*Here is the Procedure step is used to print data;


title  "Copying values from one observation to another observation ";
proc print data=DIALYSIS_ALL;
run;
