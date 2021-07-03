/* dsa_aeds01 */

/* procedure for importing the dataset. */
PROC import datafile= "/folders/myfolders/cap01/dataset/dataset_ex02.csv" out=dataset 
		dbms=CSV;
		
/* three colors of the best-selling vehicles. */
PROC FREQ DATA= dataset;
TABLE cor;
run;

/* year of the best-selling vehicles. */
PROC FREQ DATA= dataset;
TABLE ano;
run;

/* barplot of the year of the best selling vehicles. */
PROC CHART DATA= dataset;
VBAR ano / descending;
run;
quit;

/* percentage of sales of vehicles with automatic transmission.  */
PROC FREQ DATA= dataset;
TABLE transmissao;
run;

/* pie chart of sales of vehicles with automatic transmission.  */
PROC CHART DATA= dataset;
PIE transmissao;
run;

/* percentage of sales of vehicles by model.  */
PROC FREQ DATA= dataset;
TABLE modelo;
run;

/* percentage of sales of vehicles by price.  */
PROC FREQ DATA= dataset ORDER=freq;
TABLE preco;
run;

/* total vehicles per year and transmission  */
PROC FREQ DATA= dataset ORDER=freq;
TABLE ano*transmissao / LIST;
run;

/* statistical summary */
PROC FREQ DATA= dataset;
TABLE ano*transmissao / CHISQ;
run;

/* barplot total vehicles per year and transmission  */
PROC SGPLOT DATA= dataset;
VBAR ano / GROUP=transmissao GROUPDISPLAY=cluster;
TITLE "Total sales vehicles per year and transmission";
run;

