 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 1
     Date:09/13/2014
     Purpose: Informat statment
*/

libname lib "MyLib/";
data lib.InformatProb1;
infile "Documents/Prog3_15Prob1.txt";
input Gender $1. M1 M2 M3 M4;
Avg=(M1+M2+M3+M4)/4;
run;

title "3.15 Problem 1";
proc print data=lib.InformatProb1;
run;
