 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 7
     Date:09/13/2014
     Purpose: dsd and dlm
*/

libname lib "MyLib/";
data lib.Cache;
infile "Documents/Cache.txt";
input Name $ 1-20 LongDeg 22-23 LongMin 24-29 LatDeg 30-31 LatMin 32-37;
run;

title "3.15 Problem 7";
proc print data=lib.Cache;
run;
