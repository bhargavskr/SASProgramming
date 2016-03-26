 /*
         Programmer:  Bhargav Sai Krishna Ravuri
         Problem Identififcation: Chapter 1 Problem 9
         Date: 09/20/2014
         Purpose: Reading Mixed Record types in One Data Step using trailing @ sign.
*/

* DATA Step;


Data SURVEY;
* input statment to read data values of mixed records using trailing @ sign;
input YEAR $ 15-18 @;
*If else structure to define different input statement for data entered in different years;
*  ID: Subject ID, AGE: Subject's Age, GENDER: Subject's Gender, PARTY: Political Party, VOTE: Did you vote in the last election?, NUM_T
V: Number of TV's, YEAR: Survey year;
IF YEAR="1994" THEN
      input ID     $  1-3
            GENDER $  4
            PARTY  $  5
            VOTE   $  6
            NUM_TV   7-8;
ELSE IF YEAR="1995" THEN
      input ID     $ 1-3
            AGE    $ 4-5
            GENDER $ 6
            PARTY  $ 7
            VOTE   $ 8
            NUM_TV  9-10;
/* data values in the column input format
12345678901234567890 */
datalines;
001MRY 3      1994
00923FDY 1    1995
012FDN 2      1994
00518MRN 2    1995
003MDY 4      1994
;
run;

* PROCEDURE STEP;


title "Data of survey administered in 1994 and 1995 containing mixed records";
* Printing data;
proc print data=SURVEY;
run;
