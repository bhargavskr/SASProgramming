
 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 5 Problem 8
           Date: 11/01/2014
           Purpose: Performing some simple trignometric functions
*/

*Data step begins here which is used to create sas data set;
Data TRIGNO_VALUES;
* input statement specifies the ways to read the variables;
input DEGREE RADIAN SINE COSINE TANGENT;
*SINE COSINE AND TANGENT VALUES for angles in RADIANS;
SIN_RAD=sin(RADIAN);
COSINE_RAD=cos(RADIAN);
TANGENT_RAD=tan(RADIAN);
*Calculating the radians equvivalent of Degree so as to computes its SINE COSINE AND TANGENT values as COS(), SIN(), TAN() functions acc
ept angles in radians;
RADI=(DEGREE*3.141592)/180;
* Calculating the values for SINE COSINE and TANGENt For DEGREE;
SIN_DEG=sin(RADI);
COSINE_DEG=cos(RADI);
TANGENT_DEG=tan(RADI);
*Calculating the RADIAN AND DEGREE  of the SINE Value;
ANG_RAD_SIN=ARSIN(SINE);
ANG_DEG_SIN=(ANG_RAD_SIN*180)/3.141592;
*Calculating the RADIAN AND DEGREE of the COSINE Value;;
ANG_RAD_COS=ARCOS(COSINE);
ANG_DEG_COS=(ANG_RAD_COS*180)/3.141592;
* Calculating the RADIAN AND DEGREE of the TANGENT Value;
ANG_RAD_TAN=ATAN(TANGENT);
ANG_DEG_TAN=(ANG_RAD_TAN*180)/3.141592;
*DROP Statement prevents the specidied variable from the output;
DROP RADI;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
30 1 .5 .5 .5
45 3.14159 1 1 1
0 .5708 .707 .707 0
390 10 .003 .003 .003
;
run;
*Here is the Procedure step is used to print data;


title " Performing Some Simple Trignometric Computations";
proc print data=TRIGNO_VALUES;
run;
