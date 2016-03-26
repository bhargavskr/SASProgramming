

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 12 Problem 2
           Date: 11/15/2014
           Purpose: Creating Numeric and Character Formats using several methods to specify ranges
*/

*Data step begins here which is used to create sas data set;
* proc format is used to define text that will be associated with values of sas variables that is create user defined formats ;

proc format;
value AGEFMT      LOW-<20="Less than 20"
                  20-<40="20 to less than 40"
                  40-<60="40 to less than 60"
                  60-HIGH="60 and above";
value  CODEFMT    1="Not Insured"
                  2="Gold Star Insurance"
                  3="Blue Star Insurance"
                  4="State Insurance"
                  5="Medicare" ;
value $PAYFMT    "1","3","5"="Bill Paid"
                 "2"="30 Days Overdue"
                 "X","Y"="Error in Billing"
                 "4"="Collection Agency";

run;



data SURVEY_2;
* infile statement is used to identify where the data can be read here the data is availabele instream and options for the data source;
infile datalines;
* input statement is used  to read data into sas and assign variable names to the variables and describe the location of there values in
 each reocrd and informats are used speicfy the size of the variable and there formats to read the variables;
input @1   ID       $3.
      @5   AGE   5.
      @10 CODE  1.
      @12 PAY     $1.;

*format statement is used to specify the way in which the variable values are displayed in the output by linking user defined formats  ;
* with variables;
format AGE  AGEFMT.
       CODE CODEFMT.
       PAY  $PAYFMT.;
* datalines statement speicify the start of instream data;
datalines;
001 23.0 1 1
002 55.9 2 3
003 60.1 3 2
004 12.5 1 5
005 19.1 5 X
;
run;

* proc print is used to display the data;

title "Creating numeric and character formats using sevaral methods to specify ranges ";
proc print data=SURVEY_2;
run;
