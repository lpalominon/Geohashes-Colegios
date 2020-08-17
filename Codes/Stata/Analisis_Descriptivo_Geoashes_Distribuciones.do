
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
use Geohashes_con_sin_colegios.dta, clear


//==================================
// Generando identificador temporal
//==================================

gen year = 2020
sort month day year

gen edate = mdy(month, day, year)
format edate %td

gen idday = dow( mdy( month, day, year) )

gen nameday = "NA"
replace nameday = "Lunes" 		if idday == 1
replace nameday = "Martes" 		if idday == 2
replace nameday = "Miercoles" 	if idday == 3
replace nameday = "Jueves" 		if idday == 4
replace nameday = "Viernes" 	if idday == 5
replace nameday = "Sabado" 		if idday == 6
replace nameday = "Domingo" 	if idday == 0



//==================================
// Generando nuevas variables
//==================================


gen nvis = n_visitantes_geohash

gen nvis_adm3 = n_visitantes_adm3

gen nvis_adms = nvis - nvis_adm3


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
// Distribucion de los datos por dia
//==================================

cd "$Resultados_Graficos"



gen tip_geo = _merge 

gen yeari = 2020
gen monthi = 03
gen week_day0 = 06
gen week_day1 = 13
gen week_day2 = 18


kdensity nvis if edate == mdy(monthi, week_day1, yeari) , nograph generate(a k)
kdensity nvis if edate == mdy(monthi, week_day1, yeari) , nograph generate(k1) at(a)
kdensity nvis if edate == mdy(monthi, week_day1, yeari) & tip_geo == 0 , nograph generate(k2) at(a)
kdensity nvis if edate == mdy(monthi, week_day1, yeari) & tip_geo == 2 , nograph generate(k3) at(a)
label var k1 "Todos los geohashes"
label var k2 "Geohashes sin colegios"
label var k3 "Geohashes con colegios"
line k1 k2 k3 a, sort ytitle(Densidad) xtitle(Total de visitas)
*graph save Geoashes_13mar20, replace
graph export Geoashes_13mar20.png, width(1200) height(900) replace
drop k1 k2 k3 a k


kdensity nvis if edate == mdy(monthi, week_day2, yeari) , nograph generate(a k)
kdensity nvis if edate == mdy(monthi, week_day2, yeari) , nograph generate(k1) at(a)
kdensity nvis if edate == mdy(monthi, week_day2, yeari) & tip_geo == 0 , nograph generate(k2) at(a)
kdensity nvis if edate == mdy(monthi, week_day2, yeari) & tip_geo == 2 , nograph generate(k3) at(a)
label var k1 "Todos los geohashes"
label var k2 "Geohashes sin colegios"
label var k3 "Geohashes con colegios"
line k1 k2 k3 a, sort ytitle(Densidad) xtitle(Total de visitas)
*graph save Geoashes_18mar20, replace
graph export Geoashes_18mar20.png, width(1200) height(900) replace
drop k1 k2 k3 a k


*gsort - nvis



//==================================
// Tablas descriptivas por dia
//==================================

cd "$Resultados_Tablas"


* Todos los geohashes
*+++++++++++++++++++++++++++++

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
putexcel set "Geohashes_Descriptivos_13mar20_total.xlsx" // remember to specify the full path
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
putexcel set "Geohashes_Descriptivos_18mar20_total.xlsx" // remember to specify the full path
putexcel A1 = matrix(T), names






* Todos sin colegios
*+++++++++++++++++++++++++++++


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
if edate == mdy(monthi, week_day1, yeari) & tip_geo == 0 ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Geohashes_Descriptivos_13mar20_sin_colegios.xlsx" // remember to specify the full path
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
if edate == mdy(monthi, week_day2, yeari) & tip_geo == 0 ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Geohashes_Descriptivos_18mar20_sin_colegios.xlsx" // remember to specify the full path
putexcel A1 = matrix(T), names







* Todos con colegios
*+++++++++++++++++++++++++++++


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
if edate == mdy(monthi, week_day1, yeari) & tip_geo == 2 ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Geohashes_Descriptivos_13mar20_con_colegios.xlsx" // remember to specify the full path
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
if edate == mdy(monthi, week_day2, yeari) & tip_geo == 2 ///
, stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat) long save
mat T = r(StatTotal)'
putexcel set "Geohashes_Descriptivos_18mar20_con_colegios.xlsx" // remember to specify the full path
putexcel A1 = matrix(T), names



