/*Random Sample*/
proc surveyselect data=train 
samprate=0.80 out=Sample 
outallmethod=srs;
run;

data Sample1;
set Sample;
where selected=1;
run;

data Sample2;
set Sample;
where selected=0;
run;


/*Eliminate influential observations and collinearity. Check residuals are a random cloud. Check qq plot.
Use scatter plot matrix below*/

/*Scatter Plot Matrix
proc sgscatter data = DATASETNAME;
matrix VARIABLE1 VARIABLE2 VARIABLEn;
run; */

