/*

    Programmer Name: Bhargav Sai krishna Ravuri
    Problem Identification: Checking input with $ for character variable with informat statement
    Data: 09/06/2014
    Purpose: Example
*/

libname lib "MyLib/";
data lib.Check_Input;
Informat Gender $1.;
input Gender Age;
datalines;
M 23
F 22
M 33
;

proc print data=lib.Check_Input;
title "Checking input statment with informat statment";
run;
