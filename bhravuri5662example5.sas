/*
    Programmer Name: Bhargav Sai Krishna Ravuri
    Problem Identification: Example5
    Date: 09/01/2014
    Purpose: To display Gender, Age, Height and weight of 5people,find frequency of gender and mean value of Age, Height and weight usin
g comma as delimiter in datalines and null values */

data PersonalInfo5;
infile datalines dsd;
input Gender $ Age Height Weight;
datalines;
M,23,170,67
F,22,165,69
F,23,,56
M,50,155,68
F,23,101,60
;
run;

Title "Display the PersonlInfo";
proc print data=PersonalInfo5;    /* display the data*/
run;

Title " Display Gender Frequency";
proc freq data=PersonalInfo5;          /* finding gender frequency*/
     table Gender;
run;

Title " Display mean of the Age, Height and Weight";
proc means data=PersonalInfo5;           /* finding mean value of Age, Height and Weight*/
   var Age Height Weight;
run;
quit;
