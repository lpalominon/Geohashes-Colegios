
//==================================
// Comandos preliminares
//==================================

set more off

clear all


//==================================
// Especificar el tipo de datos - Evita errores al exportar datos
//==================================

set type double


//==================================
// Cargando datos
//==================================


cd "$Codigos"
use Chile_colegios_geohash_con_visitas_new.dta, clear


//==================================
// Declarando datos tipo panel
//==================================

sort cod_escuela_pais edate
tsset cod_escuela_pais edate


//==================================
// Carpeta de guardado de resultad
//==================================

cd "$Resultados_Tablas"


//==================================
// Renombrando variables
//==================================

rename n_visitantes_0 h_12am_1am
rename n_visitantes_1 h_1am_2am
rename n_visitantes_2 h_2am_3am
rename n_visitantes_3 h_3am_4am
rename n_visitantes_4 h_4am_5am
rename n_visitantes_5 h_5am_6am
rename n_visitantes_6 h_6am_7am
rename n_visitantes_7 h_7am_8am
rename n_visitantes_8 h_8am_9am
rename n_visitantes_9 h_9am_10am
rename n_visitantes_10 h_10am_11am
rename n_visitantes_11 h_11am_12pm
rename n_visitantes_12 h_12pm_1pm
rename n_visitantes_13 h_1pm_2pm
rename n_visitantes_14 h_2pm_3pm
rename n_visitantes_15 h_3pm_4pm
rename n_visitantes_16 h_4pm_5pm
rename n_visitantes_17 h_5pm_6pm
rename n_visitantes_18 h_6pm_7pm
rename n_visitantes_19 h_7pm_8pm
rename n_visitantes_20 h_8pm_9pm
rename n_visitantes_21 h_9pm_10pm
rename n_visitantes_22 h_10pm_11pm
rename n_visitantes_23 h_11pm_12am


//==================================
// Tablas descriptivas por dia y hora
//==================================

gen yeari = 2020
gen monthi = 03
gen week_day0 = 06
gen week_day1 = 13
gen week_day2 = 18


tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day0, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Colegios_Descriptivos_06mar20_dia.xlsx", replace // remember to specify the full path
putexcel A1 = matrix(T), names 



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day1, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Colegios_Descriptivos_13mar20_dia.xlsx", replace // remember to specify the full path
putexcel A1 = matrix(T), names



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day2, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Colegios_Descriptivos_18mar20_dia.xlsx", replace // remember to specify the full path
putexcel A1 = matrix(T), names 


drop yeari monthi ///
week_day0 ///
week_day1 ///
week_day2



//==================================
// Tablas descriptivas por dia y semana
//==================================

replace idday = 7 if idday == 0


* Semana lunes 09/03/20 - domingo 15/03/20
*+++++++++++++++++++++++

gen yeari = 2020
gen monthi = 03
gen week_day1 = 08
gen week_day2 = 16

*keep if edate > mdy(monthi, week_day1, yeari) & edate < mdy(monthi, week_day2, yeari)


tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate > mdy(monthi, week_day1, yeari) & edate < mdy(monthi, week_day2, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(idday) long  


drop yeari monthi ///
week_day1 ///
week_day2



* Semana lunes 16/03/20 - domingo 22/03/20
*+++++++++++++++++++++++

gen yeari = 2020
gen monthi = 03
gen week_day1 = 15
gen week_day2 = 23


tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate > mdy(monthi, week_day1, yeari) & edate < mdy(monthi, week_day2, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(idday) long 


drop yeari monthi ///
week_day1 ///
week_day2



//==================================
// Tablas descriptivas por dia y tipo de colegio
//==================================


gen yeari = 2020
gen monthi = 03
gen week_day1 = 13
gen week_day2 = 18



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day1, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(cod_depe) long 



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day2, yeari) ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(cod_depe) long 


drop yeari monthi ///
week_day1 ///
week_day2





//==================================
// Tablas descriptivas - Comuna San Bernardo 
//==================================

* A nivel de comuna
*+++++++++++++++++++

gen yeari = 2020
gen monthi = 03
gen week_day1 = 13
gen week_day2 = 18


tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Colegios_Descriptivos_13mar20_SanBernardo.xlsx", replace // remember to specify the full path
putexcel A1 = matrix(T), names



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Colegios_Descriptivos_18mar20_SanBernardo.xlsx", replace // remember to specify the full path
putexcel A1 = matrix(T), names 


drop yeari monthi ///
week_day1 ///
week_day2




* Por semana
*+++++++++++++++++++

* Semana lunes 09/03/20 - domingo 15/03/20

gen yeari = 2020
gen monthi = 03
gen week_day1 = 08
gen week_day2 = 16


tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate > mdy(monthi, week_day1, yeari) & edate < mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(idday) long  


drop yeari monthi ///
week_day1 ///
week_day2



* Semana lunes 16/03/20 - domingo 22/03/20


gen yeari = 2020
gen monthi = 03
gen week_day1 = 15
gen week_day2 = 23


tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate > mdy(monthi, week_day1, yeari) & edate < mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(idday) long 


drop yeari monthi ///
week_day1 ///
week_day2



* Por dia y tipo de colegio
*+++++++++++++++++++


gen yeari = 2020
gen monthi = 03
gen week_day1 = 13
gen week_day2 = 18



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(cod_depe) long 



tabstat nvis nvis_adm3 nvis_adms ///
h_12am_1am ///
h_1am_2am ///
h_2am_3am ///
h_3am_4am ///
h_4am_5am ///
h_5am_6am ///
h_6am_7am ///
h_7am_8am ///
h_8am_9am ///
h_9am_10am ///
h_10am_11am ///
h_11am_12pm ///
h_12pm_1pm ///
h_1pm_2pm ///
h_2pm_3pm ///
h_3pm_4pm ///
h_4pm_5pm ///
h_5pm_6pm ///
h_6pm_7pm ///
h_7pm_8pm ///
h_8pm_9pm ///
h_9pm_10pm ///
h_10pm_11pm ///
h_11pm_12am ///
if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) by(cod_depe) long 


drop yeari monthi ///
week_day1 ///
week_day2





