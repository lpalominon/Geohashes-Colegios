
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

insheet using Chile_colegios_original.csv, delimiter(";") clear


//==================================
// Revisando duplicados
//==================================


duplicates report rbd 


//==================================
// Guardando archivo en dta
//==================================


cd "$Codigos"

save Chile_colegios.dta, replace



