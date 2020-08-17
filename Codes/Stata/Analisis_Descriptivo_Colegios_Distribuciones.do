
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
use Chile_colegios_geohash_con_visitas.dta, clear


//==================================
// Declarando datos tipo panel
//==================================

sort cod_escuela_pais edate
tsset cod_escuela_pais edate


//==================================
// Generando nuevas variables
//==================================


gen nvis = n_visitantes_geohash

gen nvis_adm3 = n_visitantes_adm3

gen nvis_adms = nvis - nvis_adm3


//==================================
// Carpeta de guardado de resultad
//==================================

cd "$Resultados_Graficos"


//==================================
// Distribucion de los datos por dia
//==================================


* Semana lunes 02/03/20 - domingo 08/03/20
*+++++++++++++++++++++++

gen yeari = 2020
gen monthi = 03
gen week_day1 = 02
gen week_day2 = 03
gen week_day3 = 04
gen week_day4 = 05
gen week_day5 = 06
gen week_day6 = 07
gen week_day7 = 08


kdensity nvis if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity nvis if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity nvis if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity nvis if edate == mdy(monthi, week_day3, yeari), nograph generate(k3) at(a)
kdensity nvis if edate == mdy(monthi, week_day4, yeari), nograph generate(k4) at(a)
kdensity nvis if edate == mdy(monthi, week_day5, yeari), nograph generate(k5) at(a)
kdensity nvis if edate == mdy(monthi, week_day6, yeari), nograph generate(k6) at(a)
kdensity nvis if edate == mdy(monthi, week_day7, yeari), nograph generate(k7) at(a)
label var k1 "Lunes"
label var k2 "Martes"
label var k3 "Miércoles"
label var k4 "Jueves"
label var k5 "Viernes"
label var k6 "Sábado"
label var k7 "Domingo"
line k1 k2 k3 k4 k5 k6 k7 a, sort ytitle(Densidad) xtitle(Total de visitas a colegios)
*graph save Visitas_02mar20_08mar20_total, replace
graph export Visitas_02mar20_08mar20_total.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 a k


kdensity nvis_adm3 if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity nvis_adm3 if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity nvis_adm3 if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity nvis_adm3 if edate == mdy(monthi, week_day3, yeari), nograph generate(k3) at(a)
kdensity nvis_adm3 if edate == mdy(monthi, week_day4, yeari), nograph generate(k4) at(a)
kdensity nvis_adm3 if edate == mdy(monthi, week_day5, yeari), nograph generate(k5) at(a)
kdensity nvis_adm3 if edate == mdy(monthi, week_day6, yeari), nograph generate(k6) at(a)
kdensity nvis_adm3 if edate == mdy(monthi, week_day7, yeari), nograph generate(k7) at(a)
label var k1 "Lunes"
label var k2 "Martes"
label var k3 "Miércoles"
label var k4 "Jueves"
label var k5 "Viernes"
label var k6 "Sábado"
label var k7 "Domingo"
line k1 k2 k3 k4 k5 k6 k7 a, sort ytitle(Densidad) xtitle(Visitas a colegios provenientes de adm3)
*graph save Visitas_02mar20_08mar20_adm3, replace
graph export Visitas_02mar20_08mar20_adm3.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 a k



kdensity nvis_adms if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity nvis_adms if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity nvis_adms if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity nvis_adms if edate == mdy(monthi, week_day3, yeari), nograph generate(k3) at(a)
kdensity nvis_adms if edate == mdy(monthi, week_day4, yeari), nograph generate(k4) at(a)
kdensity nvis_adms if edate == mdy(monthi, week_day5, yeari), nograph generate(k5) at(a)
kdensity nvis_adms if edate == mdy(monthi, week_day6, yeari), nograph generate(k6) at(a)
kdensity nvis_adms if edate == mdy(monthi, week_day7, yeari), nograph generate(k7) at(a)
label var k1 "Lunes"
label var k2 "Martes"
label var k3 "Miércoles"
label var k4 "Jueves"
label var k5 "Viernes"
label var k6 "Sábado"
label var k7 "Domingo"
line k1 k2 k3 k4 k5 k6 k7 a, sort ytitle(Densidad) xtitle(Visitas a colegios provenientes de otras adms)
*graph save Visitas_02mar20_08mar20_adms, replace
graph export Visitas_02mar20_08mar20_adms.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 a k


*gsort + nvis
gsort - nvis
*gsort - nvis_adm3
*gsort - nvis_adms


drop yeari monthi ///
week_day1 ///
week_day2 ///
week_day3 ///
week_day4 ///
week_day5 ///
week_day6 ///
week_day7


* Semana lunes 09/03/20 - domingo 15/03/20
*+++++++++++++++++++++++

gen yeari = 2020
gen monthi = 03
gen week_day1 = 09
gen week_day2 = 10
gen week_day3 = 11
gen week_day4 = 12
gen week_day5 = 13
gen week_day6 = 14
gen week_day7 = 15
 

kdensity nvis if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity nvis if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity nvis if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity nvis if edate == mdy(monthi, week_day3, yeari), nograph generate(k3) at(a)
kdensity nvis if edate == mdy(monthi, week_day4, yeari), nograph generate(k4) at(a)
kdensity nvis if edate == mdy(monthi, week_day5, yeari), nograph generate(k5) at(a)
kdensity nvis if edate == mdy(monthi, week_day6, yeari), nograph generate(k6) at(a)
kdensity nvis if edate == mdy(monthi, week_day7, yeari), nograph generate(k7) at(a)
label var k1 "Lunes"
label var k2 "Martes"
label var k3 "Miércoles"
label var k4 "Jueves"
label var k5 "Viernes"
label var k6 "Sábado"
label var k7 "Domingo"
line k1 k2 k3 k4 k5 k6 k7 a, sort ytitle(Densidad) xtitle(Total de visitas a colegios)
*graph save Visitas_09mar20_15mar20_total, replace
graph export Visitas_09mar20_15mar20_total.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 a k



drop yeari monthi ///
week_day1 ///
week_day2 ///
week_day3 ///
week_day4 ///
week_day5 ///
week_day6 ///
week_day7



* Semana lunes 16/03/20 - domingo 22/03/20
*+++++++++++++++++++++++

gen yeari = 2020
gen monthi = 03
gen week_day1 = 16
gen week_day2 = 17
gen week_day3 = 18
gen week_day4 = 19
gen week_day5 = 20
gen week_day6 = 21
gen week_day7 = 22
 

kdensity nvis if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity nvis if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity nvis if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity nvis if edate == mdy(monthi, week_day3, yeari), nograph generate(k3) at(a)
kdensity nvis if edate == mdy(monthi, week_day4, yeari), nograph generate(k4) at(a)
kdensity nvis if edate == mdy(monthi, week_day5, yeari), nograph generate(k5) at(a)
kdensity nvis if edate == mdy(monthi, week_day6, yeari), nograph generate(k6) at(a)
kdensity nvis if edate == mdy(monthi, week_day7, yeari), nograph generate(k7) at(a)
label var k1 "Lunes"
label var k2 "Martes"
label var k3 "Miércoles"
label var k4 "Jueves"
label var k5 "Viernes"
label var k6 "Sábado"
label var k7 "Domingo"
line k1 k2 k3 k4 k5 k6 k7 a, sort ytitle(Densidad) xtitle(Total de visitas a colegios)
*graph save Visitas_16mar20_22mar20_total, replace
graph export Visitas_16mar20_22mar20_total.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 a k



drop yeari monthi ///
week_day1 ///
week_day2 ///
week_day3 ///
week_day4 ///
week_day5 ///
week_day6 ///
week_day7



* Ratio [lunes 16/03/20 - domingo 22/03/20] / [lunes 09/03/20 - domingo 15/03/20]
*+++++++++++++++++++++++

sort cod_escuela_pais edate
tsset cod_escuela_pais edate

bys cod_escuela_pais: g cnvis = nvis[_n] / nvis[_n-7]
bys cod_escuela_pais: g cnvis_adm3 = nvis_adm3[_n] / nvis_adm3[_n-7]
bys cod_escuela_pais: g cnvis_adms = nvis_adms[_n] / nvis_adms[_n-7]

gen yeari = 2020
gen monthi = 03
gen week_day1 = 16
gen week_day2 = 17
gen week_day3 = 18
gen week_day4 = 19
gen week_day5 = 20
gen week_day6 = 21
gen week_day7 = 22



kdensity cnvis if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity cnvis if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity cnvis if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity cnvis if edate == mdy(monthi, week_day3, yeari), nograph generate(k3) at(a)
kdensity cnvis if edate == mdy(monthi, week_day4, yeari), nograph generate(k4) at(a)
kdensity cnvis if edate == mdy(monthi, week_day5, yeari), nograph generate(k5) at(a)
kdensity cnvis if edate == mdy(monthi, week_day6, yeari), nograph generate(k6) at(a)
kdensity cnvis if edate == mdy(monthi, week_day7, yeari), nograph generate(k7) at(a)
label var k1 "Lunes"
label var k2 "Martes"
label var k3 "Miércoles"
label var k4 "Jueves"
label var k5 "Viernes"
label var k6 "Sábado"
label var k7 "Domingo"
line k1 k2 k3 k4 k5 k6 k7 a, sort ytitle(Densidad) xtitle(Crecimiento visitas a colegios)
*graph save Visitas_16mar20_22mar20_total_c, replace
graph export Visitas_16mar20_22mar20_total_c.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 a k



*gsort + nvis
gsort - nvis
*gsort - nvis_adm3
*gsort - nvis_adms


drop yeari monthi ///
week_day1 ///
week_day2 ///
week_day3 ///
week_day4 ///
week_day5 ///
week_day6 ///
week_day7



//==================================
// Distribucion de los datos por hora
//==================================


sort cod_escuela_pais edate
tsset cod_escuela_pais edate

egen mean_nvis_7am3pm = rmean(n_visitantes_7 n_visitantes_8 ///
n_visitantes_9 n_visitantes_10 n_visitantes_11 n_visitantes_12 ///
n_visitantes_13 n_visitantes_14 n_visitantes_15)

gen namadm1 = "NA"
replace namadm1 = "Tarapacá" if g_adm_1 == 1
replace namadm1 = "Antofagasta" if g_adm_1 == 2
replace namadm1 = "Atacama" if g_adm_1 == 3
replace namadm1 = "Coquimbo" if g_adm_1 == 4
replace namadm1 = "Valparaíso" if g_adm_1 == 5
replace namadm1 = "O'Higgins" if g_adm_1 == 6
replace namadm1 = "Maule" if g_adm_1 == 7
replace namadm1 = "Bío-Bío" if g_adm_1 == 8
replace namadm1 = "Araucanía" if g_adm_1 == 9
replace namadm1 = "Lagos" if g_adm_1 == 10
replace namadm1 = "Aysén" if g_adm_1 == 11
replace namadm1 = "Magallanes y Antártica" if g_adm_1 == 12
replace namadm1 = "Santiago" if g_adm_1 == 13
replace namadm1 = "Ríos" if g_adm_1 == 14
replace namadm1 = "Arica y Parinacota" if g_adm_1 == 15
replace namadm1 = "Ñuble" if g_adm_1 == 16


gen yeari = 2020
gen monthi = 03
gen week_day0 = 06
gen week_day1 = 13
gen week_day2 = 18



* Horario de colegio - nacional
*++++++++++++++++


kdensity n_visitantes_7 if edate == mdy(monthi, week_day0, yeari), nograph generate(a k)
kdensity n_visitantes_7 if edate == mdy(monthi, week_day0, yeari), nograph generate(k1) at(a)
kdensity n_visitantes_8 if edate == mdy(monthi, week_day0, yeari), nograph generate(k2) at(a)
kdensity n_visitantes_9 if edate == mdy(monthi, week_day0, yeari), nograph generate(k3) at(a)
kdensity n_visitantes_10 if edate == mdy(monthi, week_day0, yeari), nograph generate(k4) at(a)
kdensity n_visitantes_11 if edate == mdy(monthi, week_day0, yeari), nograph generate(k5) at(a)
kdensity n_visitantes_12 if edate == mdy(monthi, week_day0, yeari), nograph generate(k6) at(a)
kdensity n_visitantes_13 if edate == mdy(monthi, week_day0, yeari), nograph generate(k7) at(a)
kdensity n_visitantes_14 if edate == mdy(monthi, week_day0, yeari), nograph generate(k8) at(a)
kdensity n_visitantes_15 if edate == mdy(monthi, week_day0, yeari), nograph generate(k9) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day0, yeari), nograph generate(k10) at(a)
label var k1 "7am-8am"
label var k2 "8am-9am"
label var k3 "9am-10am"
label var k4 "10am-11am"
label var k5 "11am-12pm"
label var k6 "12pm-1pm"
label var k7 "1pm-2pm"
label var k8 "2pm-3pm"
label var k9 "3pm-4pm"
label var k10 "Promedio 7am-4pm"
line k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a, sort ytitle(Densidad) xtitle(Visitas a colegios por hora)
*graph save Visitas_06mar20_total_horas, replace
graph export Visitas_06mar20_total_horas.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a k




kdensity n_visitantes_7 if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity n_visitantes_7 if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity n_visitantes_8 if edate == mdy(monthi, week_day1, yeari), nograph generate(k2) at(a)
kdensity n_visitantes_9 if edate == mdy(monthi, week_day1, yeari), nograph generate(k3) at(a)
kdensity n_visitantes_10 if edate == mdy(monthi, week_day1, yeari), nograph generate(k4) at(a)
kdensity n_visitantes_11 if edate == mdy(monthi, week_day1, yeari), nograph generate(k5) at(a)
kdensity n_visitantes_12 if edate == mdy(monthi, week_day1, yeari), nograph generate(k6) at(a)
kdensity n_visitantes_13 if edate == mdy(monthi, week_day1, yeari), nograph generate(k7) at(a)
kdensity n_visitantes_14 if edate == mdy(monthi, week_day1, yeari), nograph generate(k8) at(a)
kdensity n_visitantes_15 if edate == mdy(monthi, week_day1, yeari), nograph generate(k9) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day1, yeari), nograph generate(k10) at(a)
label var k1 "7am-8am"
label var k2 "8am-9am"
label var k3 "9am-10am"
label var k4 "10am-11am"
label var k5 "11am-12pm"
label var k6 "12pm-1pm"
label var k7 "1pm-2pm"
label var k8 "2pm-3pm"
label var k9 "3pm-4pm"
label var k10 "Promedio 7am-4pm"
line k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a, sort ytitle(Densidad) xtitle(Visitas a colegios por hora)
*graph save Visitas_13mar20_total_horas, replace
graph export Visitas_13mar20_total_horas.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a k


kdensity n_visitantes_7 if edate == mdy(monthi, week_day2, yeari), nograph generate(a k)
kdensity n_visitantes_7 if edate == mdy(monthi, week_day2, yeari), nograph generate(k1) at(a)
kdensity n_visitantes_8 if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
kdensity n_visitantes_9 if edate == mdy(monthi, week_day2, yeari), nograph generate(k3) at(a)
kdensity n_visitantes_10 if edate == mdy(monthi, week_day2, yeari), nograph generate(k4) at(a)
kdensity n_visitantes_11 if edate == mdy(monthi, week_day2, yeari), nograph generate(k5) at(a)
kdensity n_visitantes_12 if edate == mdy(monthi, week_day2, yeari), nograph generate(k6) at(a)
kdensity n_visitantes_13 if edate == mdy(monthi, week_day2, yeari), nograph generate(k7) at(a)
kdensity n_visitantes_14 if edate == mdy(monthi, week_day2, yeari), nograph generate(k8) at(a)
kdensity n_visitantes_15 if edate == mdy(monthi, week_day2, yeari), nograph generate(k9) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day2, yeari), nograph generate(k10) at(a)
label var k1 "7am-8am"
label var k2 "8am-9am"
label var k3 "9am-10am"
label var k4 "10am-11am"
label var k5 "11am-12pm"
label var k6 "12pm-1pm"
label var k7 "1pm-2pm"
label var k8 "2pm-3pm"
label var k9 "3pm-4pm"
label var k10 "Promedio 7am-4pm"
line k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a, sort ytitle(Densidad) xtitle(Visitas a colegios por hora)
*graph save Visitas_18mar20_total_horas, replace
graph export Visitas_18mar20_total_horas.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a k




* Horario de colegio - Comuna San Bernardo
*++++++++++++++++


kdensity n_visitantes_7 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(a k)
kdensity n_visitantes_7 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k1) at(a)
kdensity n_visitantes_8 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k2) at(a)
kdensity n_visitantes_9 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k3) at(a)
kdensity n_visitantes_10 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k4) at(a)
kdensity n_visitantes_11 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k5) at(a)
kdensity n_visitantes_12 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k6) at(a)
kdensity n_visitantes_13 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k7) at(a)
kdensity n_visitantes_14 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k8) at(a)
kdensity n_visitantes_15 if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k9) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day0, yeari) & comuna == "San Bernardo" , nograph generate(k10) at(a)
label var k1 "7am-8am"
label var k2 "8am-9am"
label var k3 "9am-10am"
label var k4 "10am-11am"
label var k5 "11am-12pm"
label var k6 "12pm-1pm"
label var k7 "1pm-2pm"
label var k8 "2pm-3pm"
label var k9 "3pm-4pm"
label var k10 "Promedio 7am-4pm"
line k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a, sort ytitle(Densidad) xtitle(Visitas a colegios por hora)
*graph save Visitas_06mar20_total_horas_SanBernardo, replace
graph export Visitas_06mar20_total_horas_SanBernardo.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a k




kdensity n_visitantes_7 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(a k)
kdensity n_visitantes_7 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k1) at(a)
kdensity n_visitantes_8 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k2) at(a)
kdensity n_visitantes_9 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k3) at(a)
kdensity n_visitantes_10 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k4) at(a)
kdensity n_visitantes_11 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k5) at(a)
kdensity n_visitantes_12 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k6) at(a)
kdensity n_visitantes_13 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k7) at(a)
kdensity n_visitantes_14 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k8) at(a)
kdensity n_visitantes_15 if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k9) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day1, yeari) & comuna == "San Bernardo" , nograph generate(k10) at(a)
label var k1 "7am-8am"
label var k2 "8am-9am"
label var k3 "9am-10am"
label var k4 "10am-11am"
label var k5 "11am-12pm"
label var k6 "12pm-1pm"
label var k7 "1pm-2pm"
label var k8 "2pm-3pm"
label var k9 "3pm-4pm"
label var k10 "Promedio 7am-4pm"
line k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a, sort ytitle(Densidad) xtitle(Visitas a colegios por hora)
*graph save Visitas_13mar20_total_horas_SanBernardo, replace
graph export Visitas_13mar20_total_horas_SanBernardo.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a k


kdensity n_visitantes_7 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(a k)
kdensity n_visitantes_7 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k1) at(a)
kdensity n_visitantes_8 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k2) at(a)
kdensity n_visitantes_9 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k3) at(a)
kdensity n_visitantes_10 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k4) at(a)
kdensity n_visitantes_11 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k5) at(a)
kdensity n_visitantes_12 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k6) at(a)
kdensity n_visitantes_13 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k7) at(a)
kdensity n_visitantes_14 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k8) at(a)
kdensity n_visitantes_15 if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k9) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day2, yeari) & comuna == "San Bernardo" , nograph generate(k10) at(a)
label var k1 "7am-8am"
label var k2 "8am-9am"
label var k3 "9am-10am"
label var k4 "10am-11am"
label var k5 "11am-12pm"
label var k6 "12pm-1pm"
label var k7 "1pm-2pm"
label var k8 "2pm-3pm"
label var k9 "3pm-4pm"
label var k10 "Promedio 7am-4pm"
line k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a, sort ytitle(Densidad) xtitle(Visitas a colegios por hora)
*graph save Visitas_18mar20_total_horas_SanBernardo, replace
graph export Visitas_18mar20_total_horas_SanBernardo.png, width(1200) height(900) replace
drop k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 a k









* Promedio en horario de colegio - nacional
*++++++++++++++++

kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day1, yeari), nograph generate(a k)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day1, yeari), nograph generate(k1) at(a)
kdensity mean_nvis_7am3pm if edate == mdy(monthi, week_day2, yeari), nograph generate(k2) at(a)
label var k1 "13-03-20"
label var k2 "18-03-20"
line k1 k2 a, sort ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm)
*graph save Visitas_13mar20_18mar20_7am4pm_promedio, replace
graph export Visitas_13mar20_18mar20_7am4pm_promedio.png, width(1200) height(900) replace
drop k1 k2 a k


* Promedio horario de colegio - region
*++++++++++++++++


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day1, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(namadm1)
graph export Visitas_13mar20_7am4pm_promedio_regiones.png, width(1200) height(900) replace


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day2, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(namadm1)
graph export Visitas_18mar20_7am4pm_promedio_regiones.png, width(1200) height(900) replace



* Promedio horario de colegio - urbano rural
*++++++++++++++++

gen catcol = "NA"
replace catcol = "Rural" if rural_rbd == 1
replace catcol = "Urbano" if rural_rbd == 0


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day1, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(catcol)
graph export Visitas_13mar20_7am4pm_promedio_urbrur.png, width(1200) height(900) replace


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day2, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(catcol)
graph export Visitas_18mar20_7am4pm_promedio_urbrur.png, width(1200) height(900) replace


* Promedio horario de colegio - Pago matricula
*++++++++++++++++

twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day1, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(pago_matricula)
graph export Visitas_13mar20_7am4pm_promedio_pagmatr.png, width(1200) height(900) replace


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day2, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(pago_matricula)
graph export Visitas_18mar20_7am4pm_promedio_pagmatr.png, width(1200) height(900) replace


* Promedio horario de colegio - Pago mensualidad
*++++++++++++++++

twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day1, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(pago_mensual)
graph export Visitas_13mar20_7am4pm_promedio_pagmens.png, width(1200) height(900) replace


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day2, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(pago_mensual)
graph export Visitas_18mar20_7am4pm_promedio_pagmens.png, width(1200) height(900) replace



* Promedio horario de colegio - Tipo de colegio
*++++++++++++++++

gen tipcol_dep = "NA"
replace tipcol_dep = "Corp. Municipal" if cod_depe == 1
replace tipcol_dep = "Municipal DAEM" if cod_depe == 2
replace tipcol_dep = "Particular Subv." if cod_depe == 3
replace tipcol_dep = "Particular Pagado" if cod_depe == 4
replace tipcol_dep = "Corp. Adm. Delegada" if cod_depe == 5
replace tipcol_dep = "Serv. Local de Educación" if cod_depe == 6


gen tipcol_dep2 = "NA"
replace tipcol_dep2 = "Municipal" if cod_depe2 == 1
replace tipcol_dep2 = "Particular Subv." if cod_depe2 == 2
replace tipcol_dep2 = "Particular Pagado." if cod_depe2 == 3
replace tipcol_dep2 = "Corp. Adm. Delegada" if cod_depe2 == 4
replace tipcol_dep2 = "Serv. Local de Educación" if cod_depe2 == 5




twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day1, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(tipcol_dep2)
graph export Visitas_13mar20_7am4pm_promedio_tipcol.png, width(1200) height(900) replace


twoway histogram mean_nvis_7am3pm, color(*1.2) || ///
kdensity mean_nvis_7am3pm ///
if edate == mdy(monthi, week_day2, yeari) ///
, ytitle(Densidad) xtitle(Visitas a colegios 7am - 4pm) by(tipcol_dep2)
graph export Visitas_18mar20_7am4pm_promedio_tipcol.png, width(1200) height(900) replace


drop yeari monthi ///
week_day0 ///
week_day1 ///
week_day2 



//==================================
// Guardado de datos
//==================================


cd "$Codigos"

save Chile_colegios_geohash_con_visitas_new.dta, replace




//==================================
// Eliminar variables que no se va usar
//==================================

drop v1 row_number agno dgv_rbd mrun rut_sostenedor p_juridica ///
cod_adm1 nom_reg_rbd_a cod_pro_rbd cod_adm3 nom_adm3 cod_deprov_rbd ///
nom_deprov_rbd cod_depe cod_depe2 rural_rbd convenio_pie ///
ens_01 ens_02 ens_03 ens_04 ens_05 ens_06 ens_07 ens_08 ens_09 ens_10 ///
ens_11 matricula estado_estab ori_religiosa ori_otro_glosa ///
pago_matricula pago_mensual laty longx geohash cod_comuna ///
g_adm_1 g_adm_3 month day n_visitantes_geohash n_visitantes_adm3 ///
semana laboral idday nameday nvis_adm3 nvis_adms cnvis_adm3 cnvis_adms 



//==================================
// Transponer datos
//==================================

*reshape wide PA, i(IDDIST) j(Year)
*reshape long PA, i(IDDIST) j(Year)


sort cod_escuela_pais edate
tsset cod_escuela_pais edate

reshape wide nvis cnvis mean_nvis_7am3pm ///
n_visitantes_0 n_visitantes_1 ///
n_visitantes_2 n_visitantes_3 n_visitantes_4 n_visitantes_5 ///
n_visitantes_6 ///
n_visitantes_7 n_visitantes_8 ///
n_visitantes_9 n_visitantes_10 n_visitantes_11 n_visitantes_12 ///
n_visitantes_13 ///
n_visitantes_14 n_visitantes_15 ///
n_visitantes_16 n_visitantes_17 ///
n_visitantes_18 n_visitantes_19 n_visitantes_20 n_visitantes_21 ///
n_visitantes_22 n_visitantes_23 ///
, i(cod_escuela_pais) j(edate)


order cod_escuela_pais nom_rbd comuna namadm1 ///
nvis* cnvis* mean_nvis_7am3pm* ///
n_visitantes_0* n_visitantes_1* ///
n_visitantes_2* n_visitantes_3* n_visitantes_4* n_visitantes_5* ///
n_visitantes_6* ///
n_visitantes_7* n_visitantes_8* ///
n_visitantes_9* n_visitantes_10* n_visitantes_11* n_visitantes_12* ///
n_visitantes_13* ///
n_visitantes_14* n_visitantes_15* ///
n_visitantes_16* n_visitantes_17* ///
n_visitantes_18* n_visitantes_19* n_visitantes_20* n_visitantes_21* ///
n_visitantes_22* n_visitantes_23*




//==================================
// Guardado de datos
//==================================


cd "$Codigos"

*save Chile_colegios_geohash_con_visitas_matlab.dta, replace
export delimited using Chile_colegios_geohash_con_visitas_matlab.csv, replace
*export excel using Chile_colegios_geohash_con_visitas_matlab.xlsx, firstrow(variables) replace



