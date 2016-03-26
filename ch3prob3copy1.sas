
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

*using Select Structure to assign index to each observation;
select (SIZE);
when ("SMALL") DO; select (MILEAGE);
    if (0<=MILEAGE<=20) then  DO;
      if 1<=RELIABLE<=3 THEN INDEX=1;
      ELSE IF 4<=RELIABLE<=5 THEN INDEX=2;
     ELSE   INDEX=.;
          end;                                          /*  End of DO statement */
    if (21<=MILEAGE<=50) then DO;
      IF 1<=RELIABLE<=3 THEN INDEX=3;
      ELSE IF 4<=RELIABLE<=5 THEN INDEX=4;
      ELSE INDEX=.;
          end;                                                  /*  End of DO statement */
    otherwise;
  END;/*END of select for MILEAGE*/
 END;   /*  End of DO statement */
when ("COMPACT") DO;
  select (MILEAGE) ;
    when (0<=MILEAGE<=15) DO;
      if 1<=RELIABLE<=3 THEN INDEX=1;
      ELSE IF 4<=RELIABLE<=5 THEN INDEX=2;
      ELSE INDEX=.;
          end;                                                                          /*  End of DO statement */
    when (16<=MILEAGE<=50) DO;
      IF 1<=RELIABLE<=3 THEN INDEX=3;
      ELSE IF 4<=RELIABLE<=5 THEN INDEX=4;
      ELSE INDEX=.;
          end;                                                                                  /*  End of DO statement */
    otherwise;
  END;/*END of select for MILEAGE*/
 END;   /*  End of DO statement */
 when ("MID_SIZED") DO;
  select (MILEAGE) ;
    when (0<=MILEAGE<=12) DO;
      if 1<=RELIABLE<=3 THEN INDEX=1;
      ELSE IF 4<=RELIABLE<=5 THEN INDEX=2;
      ELSE INDEX=.;
          end;  /*  End of DO statement */
    when (13<=MILEAGE<=50) DO;
      IF 1<=RELIABLE<=3 THEN INDEX=3;
      ELSE IF 4<=RELIABLE<=5 THEN INDEX=4;
      ELSE INDEX=.;
          end;  /*  End of DO statement */
    otherwise;
  END;  /*END of select for MILEAGE*/
 END;           /*  End of DO statement */
 otherwise;
 END;   /*End of Select for Size*/
 run;
*Here the Procedure step is used to print data;

title "Using logicla statements to compute a new data set variable";
proc print data=CARS_INX;
run;
