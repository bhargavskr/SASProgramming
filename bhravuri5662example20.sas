
 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 8
     Date:09/13/2014
     Purpose: dsd and dlm
*/

libname lib "MyLib/";
data lib.bank;
infile "Documents/bankdata.txt";
input Name @1 $15. @16 Account_Number $5. @21 Acct_Balance 6.  @27 Rate 4.2;
run;

title "3.15 Problem 8";
proc print data=lib.bank;
run;
