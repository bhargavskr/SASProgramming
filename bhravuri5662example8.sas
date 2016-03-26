/*
   Programmer Name: Bhargav Sai Krishna Ravuri
   Problem IDentification: Example 8
   Date:09/05/2014
   Purpose: To check whether infile command with external file with commas will work or not.
*/

libname lib "Mylib/";
data lib.class;
infile "Documents/Prog8ExampleDataSet.txt" dlm=",";
input Gender $  Age Height Weight;
run;

proc print data=lib.class;
title "checking with external file with commas";
run;
