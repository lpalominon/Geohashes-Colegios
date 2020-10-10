
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
// Datos agregados
//==================================


* Mean
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Colapsando datos

collapse ///
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
, by(edate)





* Graficando

cd "$Resultados_Graficos"

graph twoway (line nvis edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate, lcolor(black) mcolor(black) lwidth(medthin))  ///
			 (line nvis_vec edate,  lcolor(green) mcolor(green) lwidth(medthin) ///
			 	ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#55) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.5)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.5)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia.png, width(1500) height(900) replace



graph twoway (line h_7am_8am edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate, lcolor(black) mcolor(black) lwidth(medthin))  ///
			 (line h_7am_8am_vec edate,  lcolor(green) mcolor(green) lwidth(medthin) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#55) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.5)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.5)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate, lcolor(black) mcolor(black) lwidth(medthin))  ///
			 (line h_12pm_1pm_vec edate,  lcolor(green) mcolor(green) lwidth(medthin) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#55) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.5)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.5)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate, lcolor(black) mcolor(black) lwidth(medthin))  ///
			 (line h_3pm_4pm_vec edate,  lcolor(green) mcolor(green) lwidth(medthin) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#55) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.5)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.5)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm.png, width(1500) height(900) replace






//==================================
// Datos a nivel de grupos de regiones - Nivel de educacion
//==================================


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Periodo de analisis


gen yeari = 2020

gen monthi1 = 03
gen monthi2 = 04

gen week_day1 = 01
gen week_day2 = 06

keep if edate > mdy(monthi1, week_day1, yeari) & edate < mdy(monthi2, week_day2, yeari) 

drop yeari /// 
monthi1 ///
monthi2 ///
week_day1 ///
week_day2


* Colapsando datos

collapse ///
(first) ///
Ntnived ///
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
, by(tnived edate)



* Graficando

cd "$Resultados_Graficos"

graph twoway (line nvis edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line nvis_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(Ntnived, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia_Ntnived.png, width(1500) height(900) replace





graph twoway (line h_7am_8am edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_7am_8am_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(Ntnived, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am_Ntnived.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_12pm_1pm_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(Ntnived, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm_Ntnived.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_3pm_4pm_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(Ntnived, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm_Ntnived.png, width(1500) height(900) replace





//==================================
// Datos a nivel de grupos de regiones - Inicio de año academico
//==================================


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Periodo de analisis


gen yeari = 2020

gen monthi1 = 03
gen monthi2 = 04

gen week_day1 = 01
gen week_day2 = 06

keep if edate > mdy(monthi1, week_day1, yeari) & edate < mdy(monthi2, week_day2, yeari) 

drop yeari /// 
monthi1 ///
monthi2 ///
week_day1 ///
week_day2


* Colapsando datos

collapse ///
(first) ///
IAEsc ///
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
, by(ID_IAEsc edate)



* Graficando

cd "$Resultados_Graficos"

graph twoway (line nvis edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line nvis_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(IAEsc, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia_IAEsc.png, width(1500) height(900) replace




graph twoway (line h_7am_8am edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_7am_8am_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(IAEsc, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am_IAEsc.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_12pm_1pm_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(IAEsc, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm_IAEsc.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_3pm_4pm_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(IAEsc, compact xrescale yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm_IAEsc.png, width(1500) height(900) replace





//==================================
// Datos a nivel de grupos de regiones - Separado por inicio de año academico
//==================================


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Periodo de analisis


gen yeari = 2020

gen monthi1 = 03
gen monthi2 = 04

gen week_day1 = 01
gen week_day2 = 06

keep if edate > mdy(monthi1, week_day1, yeari) & edate < mdy(monthi2, week_day2, yeari) 

drop yeari /// 
monthi1 ///
monthi2 ///
week_day1 ///
week_day2


* Colapsando datos

collapse ///
(first) ///
IAEsc ///
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
, by(ID_IAEsc edate)



* Graficando

cd "$Resultados_Graficos"

tab IAEsc


* Mar02


graph twoway (line nvis edate if IAEsc == "Mar 02", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate if IAEsc == "Mar 02", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate if IAEsc == "Mar 02", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line nvis_vec edate if IAEsc == "Mar 02",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia_IAEsc_Mar02.png, width(1500) height(900) replace



graph twoway (line h_7am_8am edate if IAEsc == "Mar 02", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate if IAEsc == "Mar 02", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate if IAEsc == "Mar 02", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_7am_8am_vec edate if IAEsc == "Mar 02",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am_IAEsc_Mar02.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate if IAEsc == "Mar 02", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate if IAEsc == "Mar 02", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate if IAEsc == "Mar 02", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_12pm_1pm_vec edate if IAEsc == "Mar 02",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm_IAEsc_Mar02.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate if IAEsc == "Mar 02", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate if IAEsc == "Mar 02", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate if IAEsc == "Mar 02", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_3pm_4pm_vec edate if IAEsc == "Mar 02",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm_IAEsc_Mar02.png, width(1500) height(900) replace



* Mar04


graph twoway (line nvis edate if IAEsc == "Mar 04", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate if IAEsc == "Mar 04", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate if IAEsc == "Mar 04", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line nvis_vec edate if IAEsc == "Mar 04",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia_IAEsc_Mar04.png, width(1500) height(900) replace



graph twoway (line h_7am_8am edate if IAEsc == "Mar 04", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate if IAEsc == "Mar 04", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate if IAEsc == "Mar 04", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_7am_8am_vec edate if IAEsc == "Mar 04",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am_IAEsc_Mar04.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate if IAEsc == "Mar 04", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate if IAEsc == "Mar 04", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate if IAEsc == "Mar 04", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_12pm_1pm_vec edate if IAEsc == "Mar 04",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm_IAEsc_Mar04.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate if IAEsc == "Mar 04", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate if IAEsc == "Mar 04", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate if IAEsc == "Mar 04", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_3pm_4pm_vec edate if IAEsc == "Mar 04",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm_IAEsc_Mar04.png, width(1500) height(900) replace



* Mar05


graph twoway (line nvis edate if IAEsc == "Mar 05", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate if IAEsc == "Mar 05", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate if IAEsc == "Mar 05", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line nvis_vec edate if IAEsc == "Mar 05",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia_IAEsc_Mar05.png, width(1500) height(900) replace



graph twoway (line h_7am_8am edate if IAEsc == "Mar 05", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate if IAEsc == "Mar 05", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate if IAEsc == "Mar 05", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_7am_8am_vec edate if IAEsc == "Mar 05",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am_IAEsc_Mar05.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate if IAEsc == "Mar 05", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate if IAEsc == "Mar 05", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate if IAEsc == "Mar 05", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_12pm_1pm_vec edate if IAEsc == "Mar 05",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm_IAEsc_Mar05.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate if IAEsc == "Mar 05", lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate if IAEsc == "Mar 05", lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate if IAEsc == "Mar 05", lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_3pm_4pm_vec edate if IAEsc == "Mar 05",  lcolor(green) mcolor(green) lwidth(medium) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#35) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm_IAEsc_Mar05.png, width(1500) height(900) replace






//==================================
// Datos a nivel de region - Todas las regiones
//==================================


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Periodo de analisis


gen yeari = 2020

gen monthi1 = 03
gen monthi2 = 04

gen week_day1 = 01
gen week_day2 = 06

keep if edate > mdy(monthi1, week_day1, yeari) & edate < mdy(monthi2, week_day2, yeari) 

drop yeari /// 
monthi1 ///
monthi2 ///
week_day1 ///
week_day2


* Colapsando datos

collapse ///
(first) ///
NOM_ADM1N ///
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
, by(COD_ADM1 edate)



* Graficando

cd "$Resultados_Graficos"

graph twoway (line nvis edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line nvis_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line nvis_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line nvis_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(NOM_ADM1N, compact yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#17) /// 62 110
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_dia_regiones.png, width(1500) height(900) replace





graph twoway (line h_7am_8am edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_7am_8am_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_7am_8am_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_7am_8am_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(NOM_ADM1N, compact yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#17) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_7am8am_regiones.png, width(1500) height(900) replace



graph twoway (line h_12pm_1pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_12pm_1pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_12pm_1pm_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_12pm_1pm_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(NOM_ADM1N, compact yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#17) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_12pm1pm_regiones.png, width(1500) height(900) replace



graph twoway (line h_3pm_4pm edate, lcolor(blue) mcolor(blue) lwidth(medthin))  ///
			 (line h_3pm_4pm_sc edate, lcolor(red) mcolor(red) lwidth(medthin))  ///
			 (line h_3pm_4pm_cc edate, lcolor(black) mcolor(black) lwidth(medium))  ///
			 (line h_3pm_4pm_vec edate,  lcolor(green) mcolor(green) lwidth(medium) ///
			 by(NOM_ADM1N, compact yrescale note("")) ///
				ylabel(, angle(horizontal)) ///
				ylabel(, format(%18.2fc)) ///
				ylabel(, labsize(vsmall)) ///
				ytitle("Número promedio de visitas") ///
				ylabel(, grid) ///
				xlabel(, angle(vertical)) ///
				xlabel(, labsize(vsmall)) ///
				xtitle("") ///
				xlabel(, format(%tdm_D)) ///
				xlabel(, grid) ///
				xlabel(#17) ///
				tline(02mar2020, lp(dash) lc(orange)) tmlabel(02mar2020 "Ape. Esc.", add labsize(1.7)) ///
				tline(04mar2020, lp(dash) lc(orange))  ///
				tline(05mar2020, lp(dash) lc(orange))  ///
				tline(16mar2020, lp(dash) lc(brown)) tmlabel(16mar2020 "Cie. Esc.", add labsize(1.7)) ///
				xlabel(, labgap(medium)) ///
				legend(order(1 "Todos los geohashes" ///
				2 "Geohashes sin colegios" ///
				3 "Geohashes con colegios" ///
				4 "Geohashes vecinos de colegios")) ///
				graphregion(color(white)) ///
			  )
graph export Visitas_mean_3pm4pm_regiones.png, width(1500) height(900) replace






