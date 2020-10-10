
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
// Datos a nivel de region - Todas las regiones
//==================================


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
NOM_ADM3 educacion tnived Ntnived ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(COD_ADM3 edate)


xtile nivedn = educacion, nq(2)



//==================================
// Differences in Differences
//==================================


* Ejemplo por defecto
*++++++++++++++++++++

/*

webuse grunfeld, clear
gen treated = 0
replace treated=1 if company>5
*because this dataset has a time var already, we replace the values here
replace time = 0 
replace time = 1 if year>=1940
diff mvalue, t(treated) p(time)

*/



* Aplicacion
*++++++++++++++++++++++


cd "$Resultados_Tablas"


gen time = (edate > mdy(03, 15, 2020))
gen treated = (nivedn > 1) // Grupo de regiones

gen did = time*treated
reg nvis time treated did, r
reg nvis time##treated, r
diff nvis, t(treated) p(time)
diff nvis, t(treated) p(time) robust



* Todo el día

diff nvis, t(treated) p(time) robust
outreg2 using "DIFF_dia.doc", nocons dec(4)

diff nvis_sc, t(treated) p(time) robust
outreg2 using "DIFF_dia.doc", nocons dec(4)

diff nvis_cc, t(treated) p(time) robust
outreg2 using "DIFF_dia.doc", nocons dec(4)

diff nvis_vec, t(treated) p(time) robust
outreg2 using "DIFF_dia.doc", nocons dec(4) append 




* 7am - 8am


diff h_7am_8am, t(treated) p(time) robust
outreg2 using "DIFF_7am8am.doc", nocons dec(4)

diff h_7am_8am_sc, t(treated) p(time) robust
outreg2 using "DIFF_7am8am.doc", nocons dec(4)

diff h_7am_8am_cc, t(treated) p(time) robust
outreg2 using "DIFF_7am8am.doc", nocons dec(4)

diff h_7am_8am_vec, t(treated) p(time) robust
outreg2 using "DIFF_7am8am.doc", nocons dec(4)


* 3pm - 4pm


diff h_3pm_4pm, t(treated) p(time) robust
outreg2 using "DIFF_3pm4pm.doc", nocons dec(4)

diff h_3pm_4pm_sc, t(treated) p(time) robust
outreg2 using "DIFF_3pm4pm.doc", nocons dec(4)

diff h_3pm_4pm_cc, t(treated) p(time) robust
outreg2 using "DIFF_3pm4pm.doc", nocons dec(4)

diff h_3pm_4pm_vec, t(treated) p(time) robust
outreg2 using "DIFF_3pm4pm.doc", nocons dec(4)




//==================================
// Regresion discontinua
//==================================


* Ejemplo por defecto
*++++++++++++++++++++

/*

* rdrobust
* rdbwselect
* rdplot

use rdrobust_senate.dta, clear
summarize vote margin

rdplot vote margin, ///
 graph_options(title(RD Plot - Senate elections data) ///
 ytitle(Vote share in election at time t+1) ///
 xtitle(Vote share in election at time t))

 
rdplot vote margin, binselect(es) ///
 graph_options(title(RD plot - Senate elections data) ///
 ytitle(Vote share in election at time t+1) ///
 xtitle(Vote share in election at time t))
 
 
rdplot vote margin, binselect(qsmv) ///
 graph_options(title(RD plot - Senate elections data) ///
 ytitle(Vote share in election at time t+1) ///
 xtitle(Vote share in election at time t)) 
 

rdrobust vote margin
rdrobust vote margin, all

rdbwselect vote margin, all

rdrobust vote margin, kernel(uniform)
rdrobust vote margin, bwselect(mserd)
rdrobust vote margin, p(2) q(3) 


*/



* Aplicacion
*++++++++++++++++++++++






