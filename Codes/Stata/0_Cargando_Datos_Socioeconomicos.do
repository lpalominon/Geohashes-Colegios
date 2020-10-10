
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


cd "$BD_Socioeconomicos"
use Chile_Educacion_Comunas.dta, clear



//==================================
// Guardando archivo en dta
//==================================


cd "$Codigos"

save Chile_Educacion_Comunas.dta, replace



