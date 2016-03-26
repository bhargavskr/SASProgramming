
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 3 Problem 4
           Date: 10/04/2014
           Purpose: Creating a new variable based on Logical Combinations of Existing Data
*/

*Data step begins here which is used to create sas data set;
libname ab "/Network/Servers/mozart.stat.wvu.edu/bayes/abilling/public_html/";
data HYPERTEN;
set ab.clinical;
*input statment is used to read data from the external file, assign names to variables and describe the location of thei values in each
data record;
* format modifiers to assign the the size of variables explicitly and column pointer is used to place the pointer at the column where th
e variable starts;
* to calculate age  as sas stores date value by counting number of days from January 1,1956;
* the DOB value is subtracted from the visit variable and we get the number of days th
e person lives that value is divided by 365.25 days we get a value with approximate age, of which integer part is displayed;
*format HYPER $ 1.GENNDER $1.;
*AGE= INT((VISIT-DOB)/365.25);
*using if then else structure to assign age groups to each observation;
/*select (GENDER);
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
END;                                       */
* format statment is used to specify the way date is to be displayed;
run;

*Here the Procedure step is used to print data;

title "Creating new variable based on logical conditions of  existing data";
proc contents  data=HYPERTEN varnum;
run;
