/*
    Programmer Name: Bhargav Sai Krishna Ravuri
    Problem Identification: Example2
    Date: 09/01/2014
    Purpose: To display Gender, Age, Height and weight of 4 people
*/

data PersonalInfo2;
infile datalines;
input Gender $ Age Height Weight;
datalines;
M 11 100 30
F 20 170 60
F 21 169 55
;
run;

title "Print Information of 3 people";
proc print data=PersonalInfo2;
run;
quit;
