
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


cd "$BD_Eventos"

import excel using Chile_eventos.xlsx, sheet("Datos") firstrow clear



//==================================
// Transponer datos
//==================================


reshape long dcc dac, i(cod_comuna) j(daymonth)


//==================================
// Generando variable identificadora de tiempo
//==================================


tostring daymonth, generate(str_geocode)
generate ndigits = length(str_geocode) 


gen month = substr(str_geocode,-2,2)

gen day_1d = substr(str_geocode,1,1) if ndigits == 3 
gen day_2d = substr(str_geocode,1,2) if ndigits == 4 
egen day = concat(day_1d day_2d)
 
destring month, replace
destring day, replace


//==================================
// Generando identificador temporal
//==================================


gen year = 2020
sort month day year

gen edate = mdy(month, day, year)
format edate %td


order cod_comuna Comuna Comuna_new ///
Provincia codregion Region Region_new ///
dcc dac ///
month day year edate daymonth


drop day_1d day_2d ndigits str_geocode month day year daymonth


rename cod_comuna g_adm_3


//==================================
// Guardando archivo en dta
//==================================


cd "$Codigos"

save Chile_eventos.dta, replace



