/* dsa_aeds01 */

/* procedure for importing the dataset */
PROC import datafile='/folders/myfolders/cap01/dataset/hour.csv' out=hours 
		dbms=CSV;
run;

/* calculation of mean, median and mode*/
PROC MEANS data=work.hours MEAN MEDIAN MODE;
run;

/* average temperature per weekday */
PROC sql;
	create table tabela_nova as select weekday, (mean(temp)) as Temperatura from 
		WORK.HOURS group by weekday;
quit;

/* alternative solution */
PROC MEANS data=work.hours MEAN;
	class weekday;
	VAR temp;
run;

/* temp variable histogram */
proc univariate data=WORK.HOURS;
	VAR temp;
	histogram;
RUN;