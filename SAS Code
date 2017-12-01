/*Using the Train data*/
 
/*Subsetting the data to only include "Edwards", "BrkSide", and "NAmes"*/
/*Creating a new variable `liv` that is the GrLivArea divided by 100
to put the living area variable in terms of 100 square feet */

/*Data is loaded into SAS as RETrain*/
 
data RE;
set RETrain;
if (Neighborhood = "Edwards") OR (Neighborhood = "BrkSide") OR (Neighborhood = "NAmes");
liv = GrLivArea/100;
run;
 
/*Check the Assumptions*/
proc glm data = RE plots=all;
class Neighborhood (ref="NAmes");
model SalePrice = liv | Neighborhood / solution;
run;
 
/*We are going to try a log transformation*/
/*Logging both the SalePrice and the GrLivArea variables
allows the model to fit the assumptions*/
data logRE;
set RE;
logSales = log(SalePrice);
logLiv = log(liv);
run;
 
proc glm data = logRE plots=all;
class Neighborhood (ref="NAmes");
model logSales = logliv | Neighborhood / solution;
run;
 
 
/*Full Model (indicator variables included)*/
proc glm data=logRE;
class Neighborhood (ref="NAmes");
model logSales = logLiv | Neighborhood / solution;
run;
 
 
/*Reduced Model (no indicator variables)*/
proc glm data=logRE;
class Neighborhood;
model logSales = logLiv Neighborhood / solution;
run;


/*Confidence Intervals*/

/*create dataset of just neighborhoods NAmes, Edwards, & BrkSide; log values*/
/*create new columns of 0's and 1's to specify neighborhood of interest*/
data train1;
set train;
where neighborhood eq 'NAmes' | neighborhood eq 'Edwards' | neighborhood eq 'BrkSide';
LogLiv = log(GrLivArea/100);
LogSales = log(SalePrice);
if neighborhood eq 'Edwards' then ed = 1;
else ed = 0;
if neighborhood eq 'BrkSide' then br = 1;
else br = 0;
run;

/*get covariance matrix*/
proc reg data=train1;
model logSales = ed br GrLivArea100 / covb;
run;

/*get confidence intervals for NAmes estimate*/
proc glm data=train1 plots=ALL;
class Neighborhood(ref=“NAmes”);
model logSales = Neighborhood | GrLivArea100 / solution clparm;
run;
