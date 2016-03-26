
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 3 Problem 2
           Date: 10/04/2014
           Purpose: To use logical statments to compute a new data set variable
*/

*Data step begins here which is used to create sas data set;

data CARS_INX;
* infile statment is used to read data records from external file called CARS.DTA;
infile "/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/CARS.DTA";
*input statment is used to read data from the external file, assign names to variables and describe the location of their values in each
data record;
*informat modifiers are used to assign the the size of variables explicitly and column pointer is used to place the pointer at the
 column where the variable starts;
input @1  SIZE      $9.
      @11 MANUFACT  $9.
      @22 MODEL     $9.
      @38 MILEAGE    2.
      @50 RELIABLE   1.;
* Using and logical operator to check multiple conditions and then assign a variable its value;

*using if then else structure to assign index to each observation;
IF SIZE="SMALL" THEN DO;
  IF 0<=MILEAGE<=20 and 1<=RELIABLE<=3 THEN INDEX=1;
  ELSE IF 0<=MILEAGE<=20 and 4<=RELIABLE<=5 THEN INDEX=2;
  ElSE IF 21<=MILEAGE<=50 and 1<=RELIABLE<=3 THEN INDEX=3;
  ELSE IF 21<= MILEAGE<=50 and 1<=RELIABLE<=5 THEN INDEX=4;
  ELSE INDEX=.;
END;
ELSE IF SIZE="COMPACT" THEN DO;
 IF 0<=MILEAGE<=15 and 1<=RELAIBLE<=3 THEN INDEX=1;
 ELSE IF 0<=MILEAGE<=15 and 4<=RELIABLE<=5 THEN INDEX=2;
 ELSE IF 16<=MILEAGE<=50 and 1<=RELIABLE<=3 THEN INDEX=3;
 ELSE IF 16<=MILEAGE<=50 and 4<=RELIABLE<=5 THEN INDEX=4;
ELSE INDEX=.;
END;
ELSE IF SIZE="MID-SIZED" THEN DO;
  IF 0<=MILEAGE<=12 and 1<=RELIABLE<=3 THEN INDEX=1;
  ELSE IF 0<=MILEAGE<=12 and 4<=RELIABLE<=5 THEN INDEX=2;
  ELSE IF 13<=MILEAGE<=50 and 1<=RELIABLE<=3 THEN INDEX=3;
  ELSE IF 13<=MILEAGE<=50 and 4<=RELIABLE<=5 THEN INDEX=4;
  ELSE INDEX=.;
END;
ELSE INDEX=.;
run;
*Here the Procedure step is used to print data;

title "Using logicla statements to compute a new data set variable";
proc print data=CARS_INX;
run;
