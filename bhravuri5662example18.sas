 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 6
     Date:09/13/2014
     Purpose: dsd and dlm
*/

libname lib "MyLib/";
data lib.bank;
infile "Documents/bankdata.txt";
input Name $ 1-15 Account_Number $ 16-20 Acct_Balance 21-26 Rate 27-30;
run;

title "3.15 Problem 6";
proc print data=lib.bank;
run;
