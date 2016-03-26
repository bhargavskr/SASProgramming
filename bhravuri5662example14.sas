/*
        Programmer Name: Bhargav Sai krishna Ravuri
        Problem Identfication: 3.15 Problem 2
        Date: 09/13/2014
        Purpose: Informats
*/

libname lib "MyLib/";
data lib.Vote;
infile "Documents/Political.csv" dsd;
input State $ Party $ Age;
run;

title "Data Political";
proc print data=lib.Vote;
run;

title "Frequency";
proc freq data=lib.Vote;
  table party;
run;
