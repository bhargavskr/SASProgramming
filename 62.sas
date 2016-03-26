
Data INVALID;
 input @1 ID $3.
       @4 RESPONSE  $10.;
 IF VERIFY(RESPONSE,'ABCDE ') NE 0 THEN OUTPUT;
DATALINES;
001ABCDEABCDE
002XCCBEBBABC
003A BACECBAA
004abcdeabcde
;
run;
*Here is the Procedure step is used to print data;


title  " Checking for invalid data values ";
proc print;
run;
