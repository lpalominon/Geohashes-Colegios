
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
use Geohashes_con_sin_colegios_new.dta, clear



//==================================
// Seleccionando variables
//==================================

rename namadm1 NOM_ADM1

keep id_geohash /// 
geohash tipo_geohash_col tipo_geohash_matr tipo_geohash_vec ///
ngeohashes ngeohashes_sc ngeohashes_cc ngeohashes_vec ncolegios ///
COD_ADM1 NOM_ADM1 g_adm_3 COD_ADM3 NOM_ADM3 ///
COD_ESCUELA_PAIS Matr_nom_rbd laty longx ///
IAEsc idday nameday ///
nvis ///
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
edate  




order id_geohash /// 
geohash tipo_geohash_col tipo_geohash_matr tipo_geohash_vec ///
ngeohashes ngeohashes_sc ngeohashes_cc ngeohashes_vec ncolegios ///
COD_ADM1 NOM_ADM1 g_adm_3 COD_ADM3 NOM_ADM3 ///
COD_ESCUELA_PAIS Matr_nom_rbd laty longx ///
nvis ///
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
IAEsc idday nameday ///
edate



//==================================
// Generando nuevas variables
//==================================


gen nvis_sc = nvis if tipo_geohash_col == "Sin colegios - Col"
gen h_7am_8am_sc = h_7am_8am if tipo_geohash_col == "Sin colegios - Col"
gen h_8am_9am_sc = h_8am_9am if tipo_geohash_col == "Sin colegios - Col"
gen h_9am_10am_sc = h_9am_10am if tipo_geohash_col == "Sin colegios - Col"
gen h_10am_11am_sc = h_10am_11am if tipo_geohash_col == "Sin colegios - Col"
gen h_11am_12pm_sc = h_11am_12pm if tipo_geohash_col == "Sin colegios - Col"
gen h_12pm_1pm_sc = h_12pm_1pm if tipo_geohash_col == "Sin colegios - Col"
gen h_1pm_2pm_sc = h_1pm_2pm if tipo_geohash_col == "Sin colegios - Col"
gen h_2pm_3pm_sc = h_2pm_3pm if tipo_geohash_col == "Sin colegios - Col"
gen h_3pm_4pm_sc = h_3pm_4pm if tipo_geohash_col == "Sin colegios - Col"
gen h_4pm_5pm_sc = h_4pm_5pm if tipo_geohash_col == "Sin colegios - Col"
gen h_5pm_6pm_sc = h_5pm_6pm if tipo_geohash_col == "Sin colegios - Col"


gen nvis_cc = nvis if tipo_geohash_col == "Con colegios - Col"
gen h_7am_8am_cc = h_7am_8am if tipo_geohash_col == "Con colegios - Col"
gen h_8am_9am_cc = h_8am_9am if tipo_geohash_col == "Con colegios - Col"
gen h_9am_10am_cc = h_9am_10am if tipo_geohash_col == "Con colegios - Col"
gen h_10am_11am_cc = h_10am_11am if tipo_geohash_col == "Con colegios - Col"
gen h_11am_12pm_cc = h_11am_12pm if tipo_geohash_col == "Con colegios - Col"
gen h_12pm_1pm_cc = h_12pm_1pm if tipo_geohash_col == "Con colegios - Col"
gen h_1pm_2pm_cc = h_1pm_2pm if tipo_geohash_col == "Con colegios - Col"
gen h_2pm_3pm_cc = h_2pm_3pm if tipo_geohash_col == "Con colegios - Col"
gen h_3pm_4pm_cc = h_3pm_4pm if tipo_geohash_col == "Con colegios - Col"
gen h_4pm_5pm_cc = h_4pm_5pm if tipo_geohash_col == "Con colegios - Col"
gen h_5pm_6pm_cc = h_5pm_6pm if tipo_geohash_col == "Con colegios - Col"


gen nvis_vec = nvis if tipo_geohash_vec == "Vecinos sin colegios"
gen h_7am_8am_vec = h_7am_8am if tipo_geohash_vec == "Vecinos sin colegios"
gen h_8am_9am_vec = h_8am_9am if tipo_geohash_vec == "Vecinos sin colegios"
gen h_9am_10am_vec = h_9am_10am if tipo_geohash_vec == "Vecinos sin colegios"
gen h_10am_11am_vec = h_10am_11am if tipo_geohash_vec == "Vecinos sin colegios"
gen h_11am_12pm_vec = h_11am_12pm if tipo_geohash_vec == "Vecinos sin colegios"
gen h_12pm_1pm_vec = h_12pm_1pm if tipo_geohash_vec == "Vecinos sin colegios"
gen h_1pm_2pm_vec = h_1pm_2pm if tipo_geohash_vec == "Vecinos sin colegios"
gen h_2pm_3pm_vec = h_2pm_3pm if tipo_geohash_vec == "Vecinos sin colegios"
gen h_3pm_4pm_vec = h_3pm_4pm if tipo_geohash_vec == "Vecinos sin colegios"
gen h_4pm_5pm_vec = h_4pm_5pm if tipo_geohash_vec == "Vecinos sin colegios"
gen h_5pm_6pm_vec = h_5pm_6pm if tipo_geohash_vec == "Vecinos sin colegios"




//==================================
// Guardando archivo en dta
//==================================

cd "$Codigos"

save BD_Visitas.dta, replace


//==================================
// Collapsando datos a nivel de comunas
//==================================

* Promedio
*+++++++++++++

cd "$Codigos"
use BD_Visitas.dta, clear

collapse (first) geohash tipo_geohash_col ///
COD_ADM1 NOM_ADM1 g_adm_3 COD_ADM3 NOM_ADM3 ///
COD_ESCUELA_PAIS Matr_nom_rbd laty longx ///
IAEsc idday nameday ///
(sum) ///
ncolegios ///
(mean) ///
ngeohashes ngeohashes_sc ngeohashes_cc ngeohashes_vec ///
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
h_5pm_6pm_vec ///
, by(id_geohash edate)



collapse (first) COD_ADM1 NOM_ADM1 COD_ADM3 NOM_ADM3 ///
IAEsc idday nameday ///
(sum) ///
ngeohashes ngeohashes_sc ngeohashes_cc ngeohashes_vec ncolegios ///
(mean) ///
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
h_5pm_6pm_vec ///
, by(g_adm_3 edate)


cd "$Codigos"
save BD_Visitas_Comunas_mean.dta, replace




* Sum
*+++++++++++++

cd "$Codigos"
use BD_Visitas.dta, clear

collapse (first) geohash tipo_geohash_col ///
COD_ADM1 NOM_ADM1 g_adm_3 COD_ADM3 NOM_ADM3 ///
COD_ESCUELA_PAIS Matr_nom_rbd laty longx ///
IAEsc idday nameday ///
(sum) ///
ncolegios ///
(mean) ///
ngeohashes ngeohashes_sc ngeohashes_cc ngeohashes_vec ///
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
h_5pm_6pm_vec ///
, by(id_geohash edate)



collapse (first) COD_ADM1 NOM_ADM1 COD_ADM3 NOM_ADM3 ///
IAEsc idday nameday ///
(sum) ///
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
h_5pm_6pm_vec ///
, by(g_adm_3 edate)


cd "$Codigos"
save BD_Visitas_Comunas_sum.dta, replace





//==================================
// Collapsando datos a nivel de colegios
//==================================


/*

* Suma
*+++++++++++++

cd "$Codigos"
use BD_Visitas.dta, clear

collapse (first) geohash tipo_geohash_col ///
COD_ADM1 NOM_ADM1 g_adm_3 COD_ADM3 NOM_ADM3 ///
COD_ESCUELA_PAIS Matr_nom_rbd laty longx ///
IAEsc idday nameday ///
(mean) ///
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
h_5pm_6pm_vec ///
, by(id_geohash edate)



collapse (first) COD_ADM1 NOM_ADM1 g_adm_3 COD_ADM3 NOM_ADM3 ///
Matr_nom_rbd laty longx ///
IAEsc idday nameday ///
(sum) ///
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
h_5pm_6pm_vec ///
, by(COD_ESCUELA_PAIS edate)


cd "$Codigos"
save BD_Visitas_Colegios_sum.dta, replace

*/


