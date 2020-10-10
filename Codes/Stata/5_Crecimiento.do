
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


* 13 - 16 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Colapsando datos

collapse ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(edate)




* Generando tasas de crecimiento

gen di = 12
gen df = 15

sort edate
gen nvis_x = (nvis[df] / nvis[di] - 1)*100
gen nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
gen nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
gen nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


gen h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
gen h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
gen h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
gen h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


gen h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
gen h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
gen h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
gen h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

gen h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
gen h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
gen h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
gen h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100



* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas durante todo el día") ///
name(g1, replace) nodraw




graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas entre 7am y 8am") ///
name(g2, replace) nodraw



graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas entre 12pm y 1pm") ///
name(g3, replace) nodraw


graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas entre 3pm y 4pm") ///
name(g4, replace) nodraw



grc1leg g1 g2 g3 g4, legendfrom(g1) 
graph export Variacion_visitas_dia_13mar16mar_nacional.png, width(1500) height(900) replace 





* 13 - 27 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear


* Colapsando datos

collapse ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(edate)



* Generando tasas de crecimiento

gen di = 12
gen df = 26

sort edate
gen nvis_x = (nvis[df] / nvis[di] - 1)*100
gen nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
gen nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
gen nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


gen h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
gen h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
gen h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
gen h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


gen h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
gen h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
gen h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
gen h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

gen h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
gen h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
gen h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
gen h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100




* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas durante todo el día") ///
name(g1, replace) nodraw




graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas entre 7am y 8am") ///
name(g2, replace) nodraw



graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas entre 12pm y 1pm") ///
name(g3, replace) nodraw


graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("Visitas entre 3pm y 4pm") ///
name(g4, replace) nodraw



grc1leg g1 g2 g3 g4, legendfrom(g1) 
graph export Variacion_visitas_dia_13mar27mar_nacional.png, width(1500) height(900) replace 





//==================================
// Datos a nivel de grupos de regiones - Nivel de educacion
//==================================


* 13 - 16 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
Ntnived ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(tnived edate)




* Generando tasas de crecimiento

gen di = 12
gen df = 15

sort tnived edate
bys tnived: g nvis_x = (nvis[df] / nvis[di] - 1)*100
bys tnived: g nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
bys tnived: g nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
bys tnived: g nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


bys tnived: g h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
bys tnived: g h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
bys tnived: g h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
bys tnived: g h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


bys tnived: g h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
bys tnived: g h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
bys tnived: g h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
bys tnived: g h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

bys tnived: g h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
bys tnived: g h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
bys tnived: g h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
bys tnived: g h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100



* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_dia_Ntnived.png, width(1500) height(900) replace 





graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_7am8am_Ntnived.png, width(1500) height(900) replace 




graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_12pm1pm_Ntnived.png, width(1500) height(900) replace 



graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_3pm4pm_Ntnived.png, width(1500) height(900) replace 





* 13 - 27 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
Ntnived ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(tnived edate)



* Generando tasas de crecimiento

gen di = 12
gen df = 26


sort tnived edate
bys tnived: g nvis_x = (nvis[df] / nvis[di] - 1)*100
bys tnived: g nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
bys tnived: g nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
bys tnived: g nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


bys tnived: g h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
bys tnived: g h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
bys tnived: g h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
bys tnived: g h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


bys tnived: g h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
bys tnived: g h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
bys tnived: g h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
bys tnived: g h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

bys tnived: g h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
bys tnived: g h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
bys tnived: g h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
bys tnived: g h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100




* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_dia_Ntnived.png, width(1500) height(900) replace 





graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_7am8am_Ntnived.png, width(1500) height(900) replace 




graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_12pm1pm_Ntnived.png, width(1500) height(900) replace 



graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
by(Ntnived, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_3pm4pm_Ntnived.png, width(1500) height(900) replace 







//==================================
// Datos a nivel de grupos de regiones - Inicio de año academico
//==================================


* 13 - 16 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
IAEsc ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(ID_IAEsc edate)




* Generando tasas de crecimiento

gen di = 12
gen df = 15

sort ID_IAEsc edate
bys ID_IAEsc: g nvis_x = (nvis[df] / nvis[di] - 1)*100
bys ID_IAEsc: g nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
bys ID_IAEsc: g nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
bys ID_IAEsc: g nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


bys ID_IAEsc: g h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
bys ID_IAEsc: g h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
bys ID_IAEsc: g h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
bys ID_IAEsc: g h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


bys ID_IAEsc: g h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
bys ID_IAEsc: g h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
bys ID_IAEsc: g h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
bys ID_IAEsc: g h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

bys ID_IAEsc: g h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
bys ID_IAEsc: g h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
bys ID_IAEsc: g h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
bys ID_IAEsc: g h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100



* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_dia_IAEsc.png, width(1500) height(900) replace 





graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_7am8am_IAEsc.png, width(1500) height(900) replace 




graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_12pm1pm_IAEsc.png, width(1500) height(900) replace 



graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_3pm4pm_IAEsc.png, width(1500) height(900) replace 




* 13 - 27 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
IAEsc ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(ID_IAEsc edate)



* Generando tasas de crecimiento

gen di = 12
gen df = 26


sort ID_IAEsc edate
bys ID_IAEsc: g nvis_x = (nvis[df] / nvis[di] - 1)*100
bys ID_IAEsc: g nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
bys ID_IAEsc: g nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
bys ID_IAEsc: g nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


bys ID_IAEsc: g h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
bys ID_IAEsc: g h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
bys ID_IAEsc: g h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
bys ID_IAEsc: g h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


bys ID_IAEsc: g h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
bys ID_IAEsc: g h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
bys ID_IAEsc: g h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
bys ID_IAEsc: g h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

bys ID_IAEsc: g h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
bys ID_IAEsc: g h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
bys ID_IAEsc: g h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
bys ID_IAEsc: g h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100



* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_dia_IAEsc.png, width(1500) height(900) replace 





graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_7am8am_IAEsc.png, width(1500) height(900) replace 




graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_12pm1pm_IAEsc.png, width(1500) height(900) replace 



graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
by(IAEsc, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_3pm4pm_IAEsc.png, width(1500) height(900) replace 








//==================================
// Datos a nivel de region - Todas las regiones
//==================================


* 13 - 16 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
NOM_ADM1N ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(COD_ADM1 edate)




* Generando tasas de crecimiento

gen di = 12
gen df = 15

sort NOM_ADM1N edate
bys NOM_ADM1N: g nvis_x = (nvis[df] / nvis[di] - 1)*100
bys NOM_ADM1N: g nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
bys NOM_ADM1N: g nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
bys NOM_ADM1N: g nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


bys NOM_ADM1N: g h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
bys NOM_ADM1N: g h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
bys NOM_ADM1N: g h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
bys NOM_ADM1N: g h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


bys NOM_ADM1N: g h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
bys NOM_ADM1N: g h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
bys NOM_ADM1N: g h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
bys NOM_ADM1N: g h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

bys NOM_ADM1N: g h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
bys NOM_ADM1N: g h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
bys NOM_ADM1N: g h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
bys NOM_ADM1N: g h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100



* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_dia_regiones.png, width(1500) height(900) replace 




graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_7am8am_regiones.png, width(1500) height(900) replace 




graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_12pm1pm_regiones.png, width(1500) height(900) replace 



graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar16mar_3pm4pm_regiones.png, width(1500) height(900) replace 





* 13 - 27 marzo
*++++++++++++++++++++++++++++


* Cargando datos

cd "$Codigos"
use BD_Visitas_Comunas_mean_final.dta, clear



* Colapsando datos

collapse ///
(first) ///
NOM_ADM1N ///
(mean) ///
nvis ///
h_7am_8am ///
h_12pm_1pm ///
h_3pm_4pm ///
nvis_sc  ///
h_7am_8am_sc ///
h_12pm_1pm_sc  ///
h_3pm_4pm_sc  ///
nvis_cc  ///
h_7am_8am_cc ///
h_12pm_1pm_cc ///
h_3pm_4pm_cc ///
nvis_vec  ///
h_7am_8am_vec ///
h_12pm_1pm_vec ///
h_3pm_4pm_vec ///
, by(COD_ADM1 edate)



* Generando tasas de crecimiento

gen di = 12
gen df = 26


sort NOM_ADM1N edate
bys NOM_ADM1N: g nvis_x = (nvis[df] / nvis[di] - 1)*100
bys NOM_ADM1N: g nvis_sc_x = (nvis_sc[df] / nvis_sc[di] - 1)*100
bys NOM_ADM1N: g nvis_cc_x = (nvis_cc[df] / nvis_cc[di] - 1)*100
bys NOM_ADM1N: g nvis_vec_x = (nvis_vec[df] / nvis_vec[di] - 1)*100


bys NOM_ADM1N: g h_7am_8am_x = (h_7am_8am[df] / h_7am_8am[di] - 1)*100
bys NOM_ADM1N: g h_7am_8am_sc_x = (h_7am_8am_sc[df] / h_7am_8am_sc[di] - 1)*100
bys NOM_ADM1N: g h_7am_8am_cc_x = (h_7am_8am_cc[df] / h_7am_8am_cc[di] - 1)*100
bys NOM_ADM1N: g h_7am_8am_vec_x = (h_7am_8am_vec[df] / h_7am_8am_vec[di] - 1)*100


bys NOM_ADM1N: g h_12pm_1pm_x = (h_12pm_1pm[df] / h_12pm_1pm[di] - 1)*100
bys NOM_ADM1N: g h_12pm_1pm_sc_x = (h_12pm_1pm_sc[df] / h_12pm_1pm_sc[di] - 1)*100
bys NOM_ADM1N: g h_12pm_1pm_cc_x = (h_12pm_1pm_cc[df] / h_12pm_1pm_cc[di] - 1)*100
bys NOM_ADM1N: g h_12pm_1pm_vec_x = (h_12pm_1pm_vec[df] / h_12pm_1pm_vec[di] - 1)*100

bys NOM_ADM1N: g h_3pm_4pm_x = (h_3pm_4pm[df] / h_3pm_4pm[di] - 1)*100
bys NOM_ADM1N: g h_3pm_4pm_sc_x = (h_3pm_4pm_sc[df] / h_3pm_4pm_sc[di] - 1)*100
bys NOM_ADM1N: g h_3pm_4pm_cc_x = (h_3pm_4pm_cc[df] / h_3pm_4pm_cc[di] - 1)*100
bys NOM_ADM1N: g h_3pm_4pm_vec_x = (h_3pm_4pm_vec[df] / h_3pm_4pm_vec[di] - 1)*100



* Graficando

cd "$Resultados_Graficos"


graph bar ///
nvis_x ///
nvis_sc_x ///
nvis_cc_x ///
nvis_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_dia_regiones.png, width(1500) height(900) replace 





graph bar ///
h_7am_8am_x ///
h_7am_8am_sc_x ///
h_7am_8am_cc_x ///
h_7am_8am_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_7am8am_regiones.png, width(1500) height(900) replace 




graph bar ///
h_12pm_1pm_x ///
h_12pm_1pm_sc_x ///
h_12pm_1pm_cc_x ///
h_12pm_1pm_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.1fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_12pm1pm_regiones.png, width(1500) height(900) replace 



graph bar ///
h_3pm_4pm_x ///
h_3pm_4pm_sc_x ///
h_3pm_4pm_cc_x ///
h_3pm_4pm_vec_x ///
, /// 
by(NOM_ADM1N, compact xrescale yrescale note("")) ///
ylabel(, angle(horizontal)) ///
ylabel(, format(%18.2fc)) ///
ylabel(,labsize(tiny)) ///
ylabel(, grid) ///
ylabel(#10) ///
legend(order(1 "Todos los geohashes" ///
			 2 "Geohashes sin colegios" ///
			 3 "Geohashes con colegios" ///
			 4 "Geohashes vecinos de colegios")) ///
bar(1, color(blue)) ///
bar(2, color(red)) ///
bar(3, color(black)) ///
bar(4, color(green)) ///
blabel(bar, position(inside) format(%18.1f) color(white)) ///
ytitle("Variación de visitas (%)") ///
title("") 
graph export Variacion_visitas_dia_13mar27mar_3pm4pm_regiones.png, width(1500) height(900) replace 






