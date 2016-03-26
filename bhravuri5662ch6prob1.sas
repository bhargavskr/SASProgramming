

 /*
           Programmer Name: Bhargav Sai Krishna Ravuri
           Problem Identification: Chapter 6 Problem 1
           Date: 11/01/2014
           Purpose: Reading a mixture of numbers and letters from Raw Data
*/

*Data step begins here which is used to create sas data set;
Data TEMP;
* input statement specifies the ways to read the variables;
* informat are used to specify that the variable is character variable and has length of 4 characters;
* double trailing symbol is used to read multiple values from same line tell the pointer to remain in same line until end of line is enc
ountered;

 input TEMPERATURE $  @@;

IF find(TEMPERATURE,"F","i") THEN DO; TEMP_F=input(compress(TEMPERATURE,,"kd"),3.);
 TEMP_C=((TEMP_F-32)*5)/9;
 TEMPERATURE=CAT(PUT(TEMP_C,3.),"C");
END;
* DROP statement is used to prevent the variable from displaying in the output;
DROP TEMP_C TEMP_F;
* datalines statement specifies the starting of inline stream of data;
DATALINES;
32F 42C 137F 84F 20C
;
run;
*Here is the Procedure step is used to print data;


title " Reading a mixture of numbers and letters from raw data";
proc print data=TEMP;
run;


*find() function is used to search for a string if the string is found it returns the first position where the string occurs else 0;
* do statement is used to execute multiple statements at a time ;
* compress() function allows to remove characters from a chracter values, the first argument is the character value from which chracters
 are removed, 2nd argument is the list of characters that are to be removed, 3rd argument is the modifer where kd refer to keep digits;
*the input() function converts character variable to numeric variable, the first argument specifies the characer variable that is to be
converted to numeric, 2nd argument specifes the how to read the numeric variable;
*put() function is used to convert numeric variable to character variable and 1st argument specifies the value to be converted and 2nd a
rgument specifies the how to read the character variable;
*cat() function takes two or more arguments and concatenates them;
* The 1st argument to find() is the string that must be searched, 2nd argument is the string to be searched, 3rd argument is the modifie
r that alters how the search work "i" indicates to ignore case;
