/*
    Programmer Name: Bhargav Sai Krishna Ravuri
    Problem Identification: Example3
    Date: 09/01/2014
    Purpose: To display Gender, Age, Height and weight of8 people,find frequency of gender and mean value of Age, Height and weight
*/

data PersonalInfo3;
infile datalines;
input Gender $ Age Height Weight;
datalines;
M 23 170 67
F 22 165 69
F 25 173 72
M 50 155 68
F 23 101 60
M 65 220 72
F 35 133 65
M 15 166 71
;
run;

Title "Display the PersonlInfo";
proc print data=PersonalInfo3;     /* display the data*/
run;

Title " Display Gender Frequency";
proc freq data=PersonalInfo3;           /* finding gender frequency*/
     table Gender;
run;

Title " Display mean of the Age, Height and Weight";
proc means data=PersonalInfo3;            /* finding mean value of Age, Height and Weight*/
   var Age Height Weight;
run;
quit;
