 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 5
     Date:09/13/2014
     Purpose: dsd and dlm
*/
libname lib "MyLib/";
data lib.XY;
infile  datalines;
input x y @@;
z=100+5*x+2*x**2-25*y+y**2;
datalines;
1 2 3 6 5 9 9 11
run;

title "3.15 Problem 5";
proc print data=lib.XY;
run;
