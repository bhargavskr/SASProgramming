/*

        Programmer Name: Bhargav Sai Krishna Ravuri
        Problem Identification: Check for white spaces
        Date:09/05/2014
        Purpose: To check whether spaces are complusary or not
*/

libname lib "MyLib/";
data lib.spaces;
infile"Documents/Prog8ExampleDataSet.txt" dlm=",";
Input Gender $ Age Height Weight;
run;

title "spaces";
proc print data=lib.spaces;
run;
