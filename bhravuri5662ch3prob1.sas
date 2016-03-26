
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 3 Problem 1
           Date: 10/04/2014
           Purpose: To record Age values using IF-THEN/ELSE Statments
*/

*Data step begins here which is used to create sas data set;

data RECODE(DROP=refdate);
* infile statment is used to read data records from external file called DEMOG1.DTA;
infile "/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/DEMOG1.DTA";
*input statment is used to read data from the external file, assign names to variables and describe the location of thei values in each
data record;
* format modifiers to assign the the size of variables explicitly and column pointer is used to place the pointer at the column where th
e variable starts;
informat refdate mmddyy7.;
input @1  ID       $3.
      @4  DOB      mmddyy6.
      @10 GENDER   $1.
      @11 STATE    $2.
      @13 EMPLOYED $1.;
* to calculate age  as sas stores date value by counting number of days from January 1,1956, a new variable is created and the value for
  January 1, 1996 is recordedin refdate variable. the DOB value is subtracted from the refdate variable and we get the number of days th
e person lives that value is divided by 365 days we get a value with approximate age, which is rounded of to nearest integer;
refdate="01JAN96"D;
AGE= round((refdate-DOB)/365.25,1);
*using if then else structure to assign age groups to each observation;
IF 0<=AGE<=20 THEN AGEGROUP=1;
ELSE IF 21<=AGE<=40 THEN AGEGROUP=2;
ELSE IF 41<=AGE<=60 THEN AGEGROUP=3;
ELSE IF AGE>61 THEN AGEGROUP=4;
* format statment is used to specify the way date is to be displayed;
format DOB mmddyy8.;
run;

*Here the Procedure step is used to print data;

title "Recording age values using IF THEN ELSE Construct";
proc print data=RECODE;
run;
