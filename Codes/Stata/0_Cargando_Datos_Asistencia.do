
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


cd "$BD_Colegios"

insheet using Chile_colegios_asistencia.csv, delimiter(";") clear


//==================================
// Seleccionar variables
//==================================

keep rbd nom_rbd cod_com_rbd ///
cod_ense cod_ense2 ///
mrun fec_nac_alu cod_com_alu dias_asistidos dias_trabajados



//==================================
// Generando nuevas variables
//==================================

gsort mrun -dias_asistidos 

duplicates tag mrun , generate(duplicados)

gen ones = 1


gen Asist_Palv = .
replace Asist_Palv = 1 if cod_ense2 == 1



gen Asist_Bas_NinJov = .
replace Asist_Bas_NinJov = 1 if cod_ense2 == 2

gen Asist_Bas_Adu = .
replace Asist_Bas_Adu = 1 if cod_ense2 == 3



gen Asist_Espec = .
replace Asist_Espec = 1 if cod_ense2 == 4



gen Asist_Med_NinJov = .
replace Asist_Med_NinJov = 1 if cod_ense2 == 5

gen Asist_Med_Adu = .
replace Asist_Med_Adu = 1 if cod_ense2 == 6



gen Asist_Tec_NinJov = .
replace Asist_Tec_NinJov = 1 if cod_ense2 == 7

gen Asist_Tec_Adu = .
replace Asist_Tec_Adu = 1 if cod_ense2 == 8



//==================================
// Collapsando datos
//==================================


* A nivel de alumnos

collapse (first) rbd nom_rbd cod_com_rbd ///
cod_ense2 dias_asistidos dias_trabajados ///
(mean) ///
ones ///
Asist_Palv ///
Asist_Bas_NinJov Asist_Bas_Adu ///
Asist_Espec ///
Asist_Med_NinJov Asist_Med_Adu ///
Asist_Tec_NinJov Asist_Tec_Adu ///
, by(mrun)




* A nivel de colegios


collapse (first) nom_rbd cod_com_rbd ///
(median) ///
dias_asistidos dias_trabajados ///
(sum) ///
ones ///
Asist_Palv ///
Asist_Bas_NinJov Asist_Bas_Adu ///
Asist_Espec ///
Asist_Med_NinJov Asist_Med_Adu ///
Asist_Tec_NinJov Asist_Tec_Adu ///
, by(rbd)




//==================================
// Renombrando variables
//==================================


rename nom_rbd Asist_nom_rbd
rename cod_com_rbd Asist_cod_com_rbd

rename ones Asist_total


//==================================
// Generando nuevas variables
//==================================


xtile Asist_terc_col = Asist_total, nq(3)



//==================================
// Revisando duplicados
//==================================


duplicates report rbd 


//==================================
// Descriptivos
//==================================

cd "$Resultados_Tablas"


egen Asist_total_nac = total(Asist_total)
disp Asist_total_nac
drop Asist_total_nac


estpost tabstat Asist_total, ///
by(Asist_terc_col) ///
stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat)
esttab using Asistencia_Terciles_Col.rtf, ///
cells("count sum min max p50 mean(fmt(%5.2f)) sd(fmt(%5.2f)) cv(fmt(%5.2f)) skewness(fmt(%5.2f)) kurtosis(fmt(%5.2f))") ///
not nostar unstack nomtitle nonumber nonote noobs label replace




//==================================
// Guardando archivo en dta
//==================================


cd "$Codigos"

save Chile_colegios_asistencia.dta, replace



