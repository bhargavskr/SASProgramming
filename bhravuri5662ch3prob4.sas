
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 3 Problem 4
           Date: 10/04/2014
           Purpose: Creating a new variable based on Logical Combinations of Existing Data
*/

*Data step begins here which is used to create sas data set;

*libname statement is used to specify the location of an Permanent SAS dataset;
*options is a global statement where fmtsearch is used for accessing a permanent data set with user defined formats;
libname ab "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";
options fmtsearch=(ab);
options yearcutoff=1908;
data HYPERTEN;
* set statement is used for subsetting a sas dataset and with keep= option only those vairiables are read;
set ab.clinical(keep= GENDER DOB VISIT SBP DBP);
* format modifiers to assign the the size of variables explicitly;
* to calculate age  as sas stores date value by counting number of days from January 1,1956;
* the DOB value is subtracted from the visit date  and we get the number of days th
e person lives that value is divided by 365.25 days we get a value with approximate age, of which integer part is displayed;
* if the visit date is not available then age cannot be calculated;
informat HYPER $ 1.;
IF not missing(VISIT) THEN
               AGE= INT((VISIT-DOB)/365.25);
ELSE AGE=.;
* If age is negative then add 100 to the age this is due to problem were sas reads 1908 as  2008;
IF AGE<0 THEN AGE=100+AGE;
*using if then else structure and select structure to assign HYPER variable a value to each observation;
* there are some values where visit date is before the date of birth considering them as incorrect no value is assigned to those observa
tions for HYPER variable;
select (GENDER);
when ("M") DO;
   IF 0<=Age<=30 THEN DO;
        IF DBP>88 or SBP>152 THEN  HYPER="Y";
        ELSE IF MISSING(DBP) and MISSING(SBP) THEN HYPER="";
        ELSE IF (DBP<=88 and missing(SBP)) or (SBP<=152 and missing(DBP)) THEN HYPER="";
        ELSE HYPER="N";
        END;
    ELSE IF 31<=Age<=65 THEN DO;
        IF DBP>92 or SBP>162 THEN  HYPER="Y";
        ELSE IF MISSING(DBP) and MISSING(SBP) THEN HYPER="";
        ELSE IF (DBP<=92 and missing(SBP)) or (SBP<=162 and missing(DBP)) THEN HYPER="";
        ELSE HYPER="N";
        END;
    ELSE IF Age ge 66 THEN DO;
        IF DBP>94 or SBP>166 THEN  HYPER="Y";
        ELSE IF MISSING(DBP) and MISSING(SBP) THEN HYPER="";
        ELSE IF (DBP<=94 and missing(SBP)) or (SBP<=166 and missing(DBP)) THEN HYPER="";
        ELSE HYPER="N";
        END;
    ELSE HYPER="";
END;
when ("F") DO;
   IF 0<=Age<=30 THEN DO;
        IF DBP>86 or SBP>150 THEN  HYPER="Y";
        ELSE IF MISSING(DBP) and MISSING(SBP) THEN HYPER="";
        ELSE IF (DBP<=86 and missing(SBP)) or (SBP<=150 and missing(DBP)) THEN HYPER="";
        ELSE HYPER="N";
        END;
    ELSE IF 31<=Age<=65 THEN DO;
        IF DBP>88 or SBP>158 THEN  HYPER="Y";
        ELSE IF MISSING(DBP) and MISSING(SBP) THEN HYPER="";
        ELSE IF (DBP<=88 and missing(SBP)) or (SBP<=158 and missing(DBP)) THEN HYPER="";
        ELSE HYPER="N";
        END;
    ELSE IF Age ge 66 THEN DO;
        IF DBP>94 or SBP>166 THEN  HYPER="Y";
        ELSE IF MISSING(DBP) and MISSING(SBP) THEN HYPER="";
        ELSE IF (DBP<=92 and missing(SBP)) or (SBP<=164 and missing(DBP)) THEN HYPER="";
        ELSE HYPER="N";
        END;
    ELSE HYPER="";
END;
otherwise HYPER="";
END;
*DROP statment is used so that VISIT and DOB are printed in the output;
DROP VISIT DOB;
*format VISIT mmddyy10. DOB mmddyy10.;
* format statment is used to specify the way date is to be displayed;
run;

*Here the Procedure step is used to print data;

title "Creating new variable based on logical conditions of  existing data";
proc print data=HYPERTEN;
*var statment is used to specify the orderin which the variables are printed;
var GENDER DBP SBP AGE HYPER;
run;
