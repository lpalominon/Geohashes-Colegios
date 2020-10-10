
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
use Chile_colegios.dta, clear



//==================================
// Juntando datos
//==================================


merge m:m rbd using Chile_colegios_asistencia, force
drop _merge


merge m:m rbd using Chile_colegios_matricula, force
drop _merge


//==================================
// Revisando duplicados
//==================================


duplicates report rbd 



//==================================
// Guardando archivo en dta
//==================================


cd "$BD_Colegios"

save Chile_colegios_original_new.dta, replace



