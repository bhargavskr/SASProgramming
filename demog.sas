/*
    Programmer Name:Bhargav Sai krishna
    Problem Identification:Demog. sas
    Date:09/01/2014
    Purpose:The program reads in data on weight and height (in inches and pounds, respectively) and computes a body masss index for each
  person
*/

data demographic;
infile "documents/Prog1ExampleDataSet.txt";
input Gender $ Age Height Weight;
* Compute body mass index;
BMI= (Weight/2.2)/(Height*.0245)**2;
proc print data=demographic;
run;
quit;
