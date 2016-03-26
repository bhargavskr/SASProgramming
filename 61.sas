
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 6 Problem 1
           Date: 11/01/2014
           Purpose: Reading a mixture of numbers and letters from Raw Data
*/

*Data step begins here which is used to create sas data set;
Data TEMP;
* input statement specifies the ways to read the variables;
* informat are used to specify that the variable is character variable and has length of 4 characters;
* double trailing symbol is used to read multiple values from same line tell the pointer to remain in same line until end of line is enc
ountered;

 input TEMPERATURE $  @@;

IF find(TEMPERATURE,"F","i") THEN DO; TEMP_F=input(compress(TEMPERATURE,,"kd"),3.);
 TEMP_C=((TEMP_F-32)*5)/9;
 TEMPERATURE=CAT(PUT(TEMP_C,3.),"C");
END;
* DROP statement is used to prevent the variable from displaying in the output;
DROP TEMP_C TEMP_F;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
32F 42C 137F 84F 20C
;
run;
*Here is the Procedure step is used to print data;


title " Reading a mixture of numbers and letters from raw data";
proc print data=TEMP;
run;
