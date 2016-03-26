/*
    Programmer Name : Bhargav Sai Krishna Ravuri
    Problem Identification: Example 1
    Date: 09/10/2014
    Purpose: to list the contents of external file
*/
libname lib "MyLib/";
data lib.studentinfo1;
infile  "WORKBOOK/Prog1ExampleDataSet.txt";
input Gender $ Age Height Weight; run;

title "Printing the contents of external file";
proc print data=lib.studentinfo1;
run;
