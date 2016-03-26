
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 5 Problem 2
           Date: 11/1/2014
           Purpose: Choosing Every Third Observation
*/

*Data step begins here which is used to create sas data set;
Data WHOLE;
* Do loops are used to avoid repetitious coding in a data step;
* int() function returns the integer part of the numeric value;
* ranuni() generates random numbers between 0 and 1;
 DO SUBJECT = 1 to 12;
*** Generate uniform random numbers from 1 to 100;
    SCORE=INT(100*RANUNI(0)+1);
    OUTPUT;
 END;
RUN;

DATA THIRDOBS;
*Set statement is used to create a subset of given data set;
SET WHOLE;
* MOD(X,Y) computes modulus arithematic returns remainder;
* _N_ observation counter or counts iterations of data step;
    IF MOD(_N_,3) eq 1 THEN OUTPUT;
RUN;

*Here is the Procedure step is used to print data;


title " Choosing Every Third Observation ";
proc print data=THIRDOBS;
run;
