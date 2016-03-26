/*

            Programmer Name: Bhargav Sai krishna Ravuri
            Program Identification: Checking to use lenght before and after input;
            Date: 09/06/2014
            Purpose: Checking the place of length;
*/

libname lib "MyLib/";
data lib.lenght_test;
length Age 3; /*ength Gender $ 1;*/
input Gender $ Age;   length Gender $ 1;
datalines;
M 23
F 33
M 44
;
run;

proc print data=lib.lenght_test;
run;
