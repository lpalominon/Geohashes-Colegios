

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


* Cargando y manipulando datos a nivel de geohashes y colegios

qui do "$Codigos\1_Cargando_Datos_Geohashes.do"
qui do "$Codigos\2_Generando_BD.do"
qui do "$Codigos\3_Generando_BD_Final.do"


* Analisis descriptivo

qui do "$Codigos\4_Descriptivos.do"
qui do "$Codigos\5_Crecimiento.do"


* Regresiones

qui do "$Codigos\6_Regresiones.do"



