
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
// Datos finales - Comunas
//==================================

* Mean

cd "$Codigos"
use BD_Visitas_Comunas_mean.dta, clear

merge m:m g_adm_3 edate using Chile_eventos, force
drop _merge

replace dcc = 0 if dcc == .
replace dac = 0 if dac == .

tab dcc
tab dac

order COD_ADM1 NOM_ADM1 COD_ADM3 NOM_ADM3 ///
codregion Region Region_new Provincia g_adm_3 Comuna Comuna_new ///
IAEsc edate idday nameday ///
dcc dac ///
ngeohashes ngeohashes_sc ngeohashes_cc ngeohashes_vec ncolegios ///
nvis ///
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
nvis_sc  ///
h_7am_8am_sc ///
h_8am_9am_sc  ///
h_9am_10am_sc  ///
h_10am_11am_sc  ///
h_11am_12pm_sc  ///
h_12pm_1pm_sc  ///
h_1pm_2pm_sc  ///
h_2pm_3pm_sc  ///
h_3pm_4pm_sc  ///
h_4pm_5pm_sc  ///
h_5pm_6pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_8am_9am_cc ///
h_9am_10am_cc ///
h_10am_11am_cc ///
h_11am_12pm_cc ///
h_12pm_1pm_cc ///
h_1pm_2pm_cc ///
h_2pm_3pm_cc ///
h_3pm_4pm_cc ///
h_4pm_5pm_cc ///
h_5pm_6pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_8am_9am_vec ///
h_9am_10am_vec ///
h_10am_11am_vec ///
h_11am_12pm_vec ///
h_12pm_1pm_vec ///
h_1pm_2pm_vec ///
h_2pm_3pm_vec ///
h_3pm_4pm_vec ///
h_4pm_5pm_vec ///
h_5pm_6pm_vec 



drop COD_ADM1 NOM_ADM1 COD_ADM3 NOM_ADM3 ///
Region Comuna

rename g_adm_3 COD_ADM3
rename Comuna_new NOM_ADM3
rename Provincia NOM_ADM2
rename codregion COD_ADM1
rename Region_new NOM_ADM1



sort COD_ADM3 edate 
tsset COD_ADM3 edate


sort COD_ADM3 edate
bys COD_ADM3: replace COD_ADM1 = COD_ADM1[_n-1] if COD_ADM1[_n] == .
bys COD_ADM3: replace NOM_ADM1 = NOM_ADM1[_n-1] if NOM_ADM1[_n] == ""
bys COD_ADM3: replace NOM_ADM2 = NOM_ADM2[_n-1] if NOM_ADM2[_n] == ""
bys COD_ADM3: replace NOM_ADM3 = NOM_ADM3[_n-1] if NOM_ADM3[_n] == ""



gen NOM_ADM1N = "NA"
replace NOM_ADM1N = "Tarapacá" if COD_ADM1 == 1
replace NOM_ADM1N = "Antofagasta" if COD_ADM1 == 2
replace NOM_ADM1N = "Atacama" if COD_ADM1 == 3
replace NOM_ADM1N = "Coquimbo" if COD_ADM1 == 4
replace NOM_ADM1N = "Valparaíso" if COD_ADM1 == 5
replace NOM_ADM1N = "O'Higgins" if COD_ADM1 == 6
replace NOM_ADM1N = "Maule" if COD_ADM1 == 7
replace NOM_ADM1N = "Bío-Bío" if COD_ADM1 == 8
replace NOM_ADM1N = "Araucanía" if COD_ADM1 == 9
replace NOM_ADM1N = "Lagos" if COD_ADM1 == 10
replace NOM_ADM1N = "Aysén" if COD_ADM1 == 11
replace NOM_ADM1N = "Magallanes Antártida" if COD_ADM1 == 12
replace NOM_ADM1N = "Santiago" if COD_ADM1 == 13
replace NOM_ADM1N = "Ríos" if COD_ADM1 == 14
replace NOM_ADM1N = "Arica Parinacota" if COD_ADM1 == 15
replace NOM_ADM1N = "Ñuble" if COD_ADM1 == 16


replace IAEsc = "Mar 05" if NOM_ADM1N == "Magallanes Antártica-Mar05"
gen ID_IAEsc = .
replace ID_IAEsc = 1 if IAEsc == "Mar 02"
replace ID_IAEsc = 2 if IAEsc == "Mar 04"
replace ID_IAEsc = 3 if IAEsc == "Mar 05"



gen NIngreso = "NA"
replace NIngreso = "Ingresos altos" if COD_ADM1 == 1
replace NIngreso = "Ingresos altos" if COD_ADM1 == 2
replace NIngreso = "Ingresos altos" if COD_ADM1 == 3
replace NIngreso = "Ingresos altos" if COD_ADM1 == 4
replace NIngreso = "Ingresos altos" if COD_ADM1 == 5
replace NIngreso = "Ingresos altos" if COD_ADM1 == 6
replace NIngreso = "Ingresos medios altos" if COD_ADM1 == 7
replace NIngreso = "Ingresos medios altos" if COD_ADM1 == 8
replace NIngreso = "Ingresos medios altos" if COD_ADM1 == 9
replace NIngreso = "Ingresos altos" if COD_ADM1 == 10
replace NIngreso = "Ingresos altos" if COD_ADM1 == 11
replace NIngreso = "Ingresos altos" if COD_ADM1 == 12
replace NIngreso = "Ingresos altos" if COD_ADM1 == 13
replace NIngreso = "Ingresos medios altos" if COD_ADM1 == 14
replace NIngreso = "Ingresos medios altos" if COD_ADM1 == 15
replace NIngreso = "Ingresos medios altos" if COD_ADM1 == 16


gen ID_NIngreso = .
replace ID_NIngreso = 1 if NIngreso == "Ingresos altos"
replace ID_NIngreso = 2 if NIngreso == "Ingresos medios altos"



drop if ID_IAEsc == .



//==================================
// Guardando datos a nivel de comuna 
//==================================


cd "$Codigos"
save BD_Visitas_Comunas_mean_previo.dta, replace
*export excel using "BD_Visitas_Comunas_mean_previo.xlsx", firstrow(variables) replace



//==================================
// Cruzando con otros datos a nivel de comuna
//==================================

* Modificando datos

cd "$Codigos"
use Chile_Educacion_Comunas.dta, clear


xtile tnived = educacion, nq(3)
replace tnived = 0 if tnived == .

tabstat educacion, by(tnived) stat(n sum mean sd cv min max median skewness kurtosis) col(stat)


sort codigocomuna
gen COD_ADM3 = codigocomuna


sort educacion
gen Ntnived = "NA"
replace Ntnived = "Nivel de educación - Bajo" if tnived == 1
replace Ntnived = "Nivel de educación - Medio" if tnived == 2
replace Ntnived = "Nivel de educación - Alto" if tnived == 3



cd "$Codigos"
save Chile_Educacion_Comunas_new.dta, replace
*export excel using "Chile_Educacion_Comunas_new.xlsx", firstrow(variables) replace



* Cargando datos 

cd "$Codigos"
use BD_Visitas_Comunas_mean_previo.dta, clear


* Juntando datos


merge m:m COD_ADM3 using Chile_Educacion_Comunas_new, force
drop _merge

drop if COD_ADM1 == .




*Guardando datos

cd "$Codigos"
save BD_Visitas_Comunas_mean_final.dta, replace
*export excel using "BD_Visitas_Comunas_mean_final.xlsx", firstrow(variables) replace







