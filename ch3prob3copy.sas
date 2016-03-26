

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 3 Problem 3
           Date: 10/04/2014
           Purpose: To use select statments to compute a new data set variable
*/

*Data step begins here which is used to create sas data set;

data CARS_INX;
* infile statment is used to read data records from external file called CARS.DTA;
* pad option used to specify short records;
infile "/Network/Servers/mozart.stat.wvu.edu/bayes/bhravuri/WORKBOOK/CARS.DTA" pad;
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

*using Select Structure  and if else structure to assign index to each observation;
select (SIZE);
when ("SMALL") DO;
  IF 0<=MILEAGE<=20 and 1<=RELIABLE<=3 THEN INDEX=1;
  ELSE IF 0<=MILEAGE<=20 and 4<=RELIABLE<=5 THEN INDEX=2;
  ELSE IF 21<=MILEAGE<=50 and 1<=RELIABLE<=3 THEN INDEX=3;
  ELSE IF 21<=MILEAGE<=50 and 4<=RELIABLE<=5 THEN INDEX=4;
  ELSE INDEX=.;
  END;
when ("COMPACT") DO;
 IF 0<=MILEAGE<=15 and 1<=RELIABLE<=3 THEN INDEX=1;
 ELSE IF 0<=MILEAGE<=15 and 4<=RELIABLE<=5 THEN INDEX=2;
 ELSE IF 16<=MILEAGE<=50 and 1<=RELIABLE<=3 THEN INDEX=3;
 ELSE IF 16<=MILEAGE<=50 and 4<=RELIABLE<=5 THEN INDEX=4;
ELSE INDEX=.;
END;
when ("MID_SIZED") DO;
  IF 0<=MILEAGE<=12 and 1<=RELIABLE<=3 THEN INDEX=1;
  ELSE IF 0<=MILEAGE<=12 and 4<=RELIABLE<=5 THEN INDEX=2;
  ELSE IF 13<=MILEAGE<=50 and 1<=RELIABLE<=3 THEN INDEX=3;
  ELSE IF 13<=MILEAGE<=50 and 4<=RELIABLE<=5 THEN INDEX=4;
  ELSE INDEX=.;
END;
otherwise INDEX=.;
end;
run;
*Here the Procedure step is used to print data;

title "Using select statements to compute a new data set variable";
proc print data=CARS_INX;
run;
