/*
    Programmer Name: Bhargav Sai Krishna Ravuri
    Problem Identification: Example4
    Date: 09/01/2014
    Purpose: To display Gender, Age, Height and weight of8 people,find frequency of gender and mean value of Age, Height and weight usin
g selected column numbers excluding */

data PersonalInfo6;
infile datalines;
input Gender $ 1 Age 2-3 Weight 7-8;
datalines;
M2317067
F2216569
F2517372
F2310160
M6522072
;
run;

Title "Display the PersonlInfo";
proc print data=PersonalInfo6;    /* display the data*/
run;

Title " Display Gender Frequency";
proc freq data=PersonalInfo6;          /* finding gender frequency*/
     table Gender;
run;

Title " Display mean of the Age, Height and Weight";
proc means data=PersonalInfo6;           /* finding mean value of Age, Height and Weight*/
   var Age Weight;
run;
quit;
