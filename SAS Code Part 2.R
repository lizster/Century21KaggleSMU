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

/*Put everything in the model
proc reg ;
model LogSales = VARIABLE1 VARIABLE2 VARIABLEn;
run;*/

/*Check Cook's D visual to identify data that has high leverage. 
Don't simply rely on the height of the bars, check the axis to determine the range*/

/*If we need to delete an observation based on hat matrix value:
data NEW DATANAME;
set PREVIOUS DATASET;
if _n_ = OBSERVATION NUMBER TO DELETE then delete;
run;*/

/*After deleting then re-run to check if variance inflation dropped
proc reg data = NEW DATANAME;
model logSales = VARIABLES;
run;*/

/*Variance inflation Factor VIF can help us understand collinearity*/

/*Around the 14:00 mark of our video for 14.9 Dr. Magee talks about validating the data with another data set.
We should follow this
Train is used to build the model and test is used to test the model*/

/*Cross validate
proc glmselect data = DATASET USED TO BUILD MODEL;
model logSales = VARIABLES / selection=Forward (stop=CV) cvmethod=random(5) stats=adjrsq;
run;
Re-run with backward and stepwise*/
