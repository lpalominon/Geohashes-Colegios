

//==================================
// Comandos preliminares
//==================================

set more off

clear all

set excelxlsxlargefile on

set maxvar 32760, permanently

set matsize 11000, permanently


//==================================
// Instalando paquetes necesarios
//==================================

*ssc inst tab_chi, replace
*ssc install diff, replace
*ssc install outreg2, replace
*ssc install rdrobust, replace


//==================================
// Carpetas de trabajo
//==================================

*global Personal "C:\Users\BS\Documents\Github"
global Personal "C:\Users\Admin\Documents\Github"

global Raiz "$Personal\Geohashes-Colegios"


global BD = "$Raiz\Data"
global BD_Colegios = "$BD\Colegios"
global BD_Eventos = "$BD\Eventos"
global BD_Socioeconomicos = "$BD\Socioeconomicos"
global BD_Finales = "$BD\Finales"


global Codigos = "$Raiz\Codes\Stata"


global Resultados = "$Codigos\Resultados"
global Resultados_Tablas = "$Resultados\Tablas"
global Resultados_Graficos = "$Resultados\Graficos"



//==================================
// Corriendo todos los do files
//==================================

* Cargando datos a nivel de escuelas

qui do "$Codigos\0_Cargando_Datos_Colegios.do"
qui do "$Codigos\0_Cargando_Datos_Matricula.do"
qui do "$Codigos\0_Cargando_Datos_Asistencia.do"

qui do "$Codigos\0_Juntando_Datos_Colegios.do"


* Cargando datos a nivel de comunas

qui do "$Codigos\0_Cargando_Datos_Eventos.do"
qui do "$Codigos\0_Cargando_Datos_Socioeconomicos.do"




