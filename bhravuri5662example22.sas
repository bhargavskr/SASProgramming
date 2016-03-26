
 /*
     Programmer Name: Bhargav Sai Krishna
     Problem: 3.15 Problem 10
     Date:09/13/2014
     Purpose: dsd and dlm
*/

libname lib "MyLib/";
data lib.stock;
infile "Documents/stockprices.txt";
input @1 stock $4. @5 PurDate mmddyy10. @15 PurPrice dollar6.1 @21 Number 4. @25 SellDate mmddyy10. @35 SellPrice dollar6.1;
format Purdate mmddyy10. SellDate mmddyy10. PurPrice dollar6.1 SellPRice dollar6.1;
run;

title "3.15 Problem 10";
proc print data=lib.stock;
run;
