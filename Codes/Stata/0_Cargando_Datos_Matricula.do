
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

insheet using Chile_colegios_matricula.csv, delimiter(";") clear


//==================================
// Seleccionar variables
//==================================

keep rbd nom_rbd cod_reg_rbd cod_com_rbd cod_depe cod_depe2 rural_rbd estado_estab ///
mat_ens_1 mat_ens_2 mat_ens_3 mat_ens_4 ///
mat_ens_5 mat_ens_6 mat_ens_7 mat_ens_8 mat_total


//==================================
// Renombrando variables
//==================================


rename nom_rbd Matr_nom_rbd
rename cod_reg_rbd Matr_cod_reg_rbd
rename cod_com_rbd Matr_cod_com_rbd
rename cod_depe Matr_cod_depe
rename cod_depe2 Matr_cod_depe2
rename rural_rbd Matr_rural_rbd
rename estado_estab Matr_estado_estab

rename mat_ens_1 Matr_Palv
rename mat_ens_2 Matr_Bas_NinJov 
rename mat_ens_3 Matr_Bas_Adu
rename mat_ens_4 Matr_Espec
rename mat_ens_5 Matr_Med_NinJov
rename mat_ens_6 Matr_Med_Adu
rename mat_ens_7 Matr_Tec_NinJov
rename mat_ens_8 Matr_Tec_Adu

rename mat_total Mat_total


//==================================
// Eliminando colegios que no tienen matriculados
//==================================

drop if Mat_total == 0
keep if Matr_estado_estab == 1


//==================================
// Generando nuevas variables
//==================================

order Matr_nom_rbd Matr_cod_depe Matr_cod_depe2 ///
Matr_rural_rbd Matr_cod_reg_rbd Matr_cod_com_rbd Matr_estado_estab ///
Matr_Palv ///
Matr_Bas_NinJov Matr_Bas_Adu ///
Matr_Med_NinJov Matr_Med_Adu ///
Matr_Tec_NinJov Matr_Tec_Adu ///
Mat_total Matr_Espec




//==================================
// Generando nuevas variables
//==================================

xtile Mat_terc_col = Mat_total, nq(3)


//==================================
// Revisando duplicados
//==================================


duplicates report rbd 


//==================================
// Descriptivos
//==================================

cd "$Resultados_Tablas"


egen Mat_total_nac = total(Mat_total)
disp Mat_total_nac
drop Mat_total_nac


estpost tabstat Mat_total, ///
by(Mat_terc_col) ///
stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat)
esttab using Matricula_Terciles_Col.rtf, ///
cells("count sum min max p50 mean(fmt(%5.2f)) sd(fmt(%5.2f)) cv(fmt(%5.2f)) skewness(fmt(%5.2f)) kurtosis(fmt(%5.2f))") ///
not nostar unstack nomtitle nonumber nonote noobs label replace


estpost tabstat Mat_total, ///
by(Matr_cod_depe2) ///
stat(n sum mean sd cv min max median skewness kurtosis) ///
col(stat)
esttab using Matricula_Terciles_Col_Dependencia.rtf, ///
cells("count sum min max p50 mean(fmt(%5.2f)) sd(fmt(%5.2f)) cv(fmt(%5.2f)) skewness(fmt(%5.2f)) kurtosis(fmt(%5.2f))") ///
not nostar unstack nomtitle nonumber nonote noobs label replace





//==================================
// Guardando archivo en dta
//==================================

cd "$Codigos"

save Chile_colegios_matricula.dta, replace



