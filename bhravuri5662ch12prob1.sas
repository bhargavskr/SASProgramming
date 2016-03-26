

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 12 Problem 1
           Date: 11/15/2014
           Purpose: Creating Simple Numeric and Character Formats
*/

*Data step begins here which is used to create sas data set;
* proc format is used to define text that will be associated with values of sas variables that is create user defined formats ;

proc format;
value $GENDERFMT "M"="Male"
                 "F"="FEMALE";
value AGEGROUPFMT 1="0 to 20"
                  2="21 to 40"
                  3="41 to 61"
                  4="GREATER THAN 60";

value $QUESFMT "1"="Strongly Disagree"
                 "2"="Disagree"
                 "3"="No Option"
                 "4"="Agree"
                 "5"="Strongly Agree";
run;



data SURVEY;
* infile statement is used to identify where the data can be read here the data is availabele instream and options for the data source;
infile datalines;
* input statement is used  to read data into sas and assign variable names to the variables and describe the location of there values in
 each reocrd and informats are used speicfy the size of the variable and there formats to read the variables;
input @1   ID       $3.
      @4   GENDER   $1.
      @5  AGEGROUP  1.
      @6  QUES1     $1.
      @7  QUES2     $1.
      @8  QUES3     $1.;
*format statement is used to specify the way in which the variable values are displayed in the output by linking user defined formats  ;
* with variables;
format GENDER $GENDERFMT.
       AGEGROUP AGEGROUPFMT.
       QUES1-QUES3  $QUESFMT.;
* datalines statement speicify the start of instream data;
datalines;
001M1123
002F3452
003M2421
004F4531
;
run;

* proc print is used to display the data;

title "Creating simple numeric and character formats ";
proc print data=SURVEY;
run;
