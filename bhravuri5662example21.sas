
 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 9
     Date:09/13/2014
     Purpose: dsd and dlm
*/

libname lib "MyLib/";
data lib.Cache;
infile "Documents/Cache.txt";
input @1 Name $ 1-20 @22 LongDeg 2. @24 LongMin 6.3 @30 LatDeg 2. @32 LatMin 6.3;
run;

title "3.15 Problem 9";
proc print data=lib.Cache;
run;
