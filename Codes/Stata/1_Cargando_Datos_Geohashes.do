
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
// Juntando datos
//==================================


merge m:m geohash using Geohashes_con_colegios_vecinos, force
drop _merge


//==================================
// Generando identificadores de tipo de geohash
//==================================


* Tipo de geohash a nivel de colegios

gen id_merge = merge_colegios 

gen name_merge = "NA"
replace name_merge = "Left" if id_merge == 0
replace name_merge = "Both" if id_merge == 2

gen tipo_geohash_col = "NA"
replace tipo_geohash_col = "Sin colegios - Col" if id_merge == 0
replace tipo_geohash_col = "Con colegios - Col" if id_merge == 2

drop if tipo_geohash_col == "NA"

drop id_merge name_merge

tab tipo_geohash_col


* Tipo de geohash a nivel de colegios con matricula


gen tipo_geohash_matr = "NA"
replace tipo_geohash_matr = "Con colegios - Matr" if Mat_total != .
replace tipo_geohash_matr = "Sin colegios - Matr" if Mat_total == .

tab tipo_geohash_matr


* Tipo de geohash vecinos de colegios

gen id_merge = merge_vecinos

gen tipo_geohash_vec = "NA"
replace tipo_geohash_vec = "Vecinos sin colegios" if id_merge == 0
replace tipo_geohash_vec = "Vecinos con colegios" if id_merge == 2
replace tipo_geohash_vec = "No vecinos" if tipo_geohash_vec == "NA"

drop id_merge

tab tipo_geohash_vec



//==================================
// Eliminando variables originales que no se utilizan
//==================================

drop index row_number geometry


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

replace idday = 7 if idday == 0


* Eliminando primer dia por ser domingo

egen firstdate = min(edate)
format firstdate %td
drop if edate == firstdate
drop firstdate

tab nameday


//==================================
// Renombrando variables
//==================================

rename n_visitantes_geohash nvis
rename n_visitantes_adm3 nvis_adm3 
gen nvis_adms = nvis - nvis_adm3

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
// Generando nuevas variables
//==================================



* Identificadores
*+++++++++++++++++++++++++++++

egen id_geohash = group(geohash)
egen id_col = group(COD_ESCUELA_PAIS)

sum id_geohash id_col


* Nombrando regiones
*+++++++++++++++++++++++++++++

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




* Nombrando categorias de colegios - Urbano Rural
*+++++++++++++++++++++++++++++
 
* Todos los colegios

gen idcatcol = rural_rbd
replace idcatcol = 1 if idcatcol == 1 // Rural
replace idcatcol = 2 if idcatcol == 0 // Urbano

gen namcatcol = "NA"
replace namcatcol = "Rural" if idcatcol == 1
replace namcatcol = "Urbano" if idcatcol == 2

tab namcatcol


* Colegios con matricula

gen idcatcol_Matr = Matr_rural_rbd

replace idcatcol_Matr = 1 if idcatcol_Matr == 1 // Rural
replace idcatcol_Matr = 2 if idcatcol_Matr == 0 // Urbano

gen namcatcol_Matr = "NA"
replace namcatcol_Matr = "Rural" if idcatcol_Matr == 1
replace namcatcol_Matr = "Urbano" if idcatcol_Matr == 2

tab namcatcol_Matr



* Conteo de geohashes y colegios 
*+++++++++++++++++++++++++++++

gen ngeohashes = 1
gen ngeohashes_sc = 1 if tipo_geohash_col == "Sin colegios - Col"
gen ngeohashes_cc = 1 if tipo_geohash_col == "Con colegios - Col"
gen ngeohashes_vec = 1 if tipo_geohash_vec == "Vecinos sin colegios"


gen ncolegios = 1 if id_col != .



* Fechas de Cuarentenas
*+++++++++++++++++++++++++++++


gen IAEsc = ""
replace IAEsc = "Mar 02" if namadm1 == "Atacama"
replace IAEsc = "Mar 02" if namadm1 == "Valparaíso"
replace IAEsc = "Mar 02" if namadm1 == "Magallanes y Antártica"

replace IAEsc = "Mar 04" if namadm1 == "Maule"
replace IAEsc = "Mar 04" if namadm1 == "Araucanía"
replace IAEsc = "Mar 04" if namadm1 == "Lagos"
replace IAEsc = "Mar 04" if namadm1 == "Santiago"
replace IAEsc = "Mar 04" if namadm1 == "Ríos"


replace IAEsc = "Mar 05" if namadm1 == "Tarapacá"
replace IAEsc = "Mar 05" if namadm1 == "Antofagasta"
replace IAEsc = "Mar 05" if namadm1 == "Coquimbo"
replace IAEsc = "Mar 05" if namadm1 == "O'Higgins"
replace IAEsc = "Mar 05" if namadm1 == "Bío-Bío"
replace IAEsc = "Mar 05" if namadm1 == "Aysén"
replace IAEsc = "Mar 05" if namadm1 == "Arica y Parinacota"
replace IAEsc = "Mar 05" if namadm1 == "Ñuble"




//==================================
// Guardando archivo en dta
//==================================


cd "$Codigos"

save Geohashes_con_sin_colegios_new.dta, replace



