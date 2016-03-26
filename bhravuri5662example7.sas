/*
   Programmer Name: Bhargav Sai Krishna Ravuri
   Problem Identification: Example
   Date: 09/01/2014
   Purpose: To list Gender, Age, Height and Weight of 4 persons and determine the gender frequenciy and mean of there Age, Height and We
   -ight using filename and using libname
*/
  libname lb "MyLib/";
  data lb.FriendsInfo;
  infile "documents/Prog1ExampleDataSet.txt";
  input Gender $ Age Height Weight;
  run;

  title "Print the Personal Information of the 4 friends";
  proc print data=lb.FriendsInfo;
  run;

  title "Gender Frequency";
  proc freq data=lb.FriendsInfo;
       table Gender;
 run;

  title "Mean of Age, Height and Weight";
  proc means data=lb.FriendsInfo;
     var Age Height Weight;
 run;
 quit;
