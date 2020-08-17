
//==================================
// Comandos preliminares
//==================================

set more off

clear all



//==================================
// Cargando datos
//==================================


cd "$BD_Colegios"


insheet using Chile_colegios_geohash_con_visitas.csv, clear


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


//==================================
// Eliminando variables que no son utiles
//==================================

drop geometry _merge year



//==================================
// Guardando archivo en dta
//==================================


cd "$Codigos"

save Chile_colegios_geohash_con_visitas.dta, replace

