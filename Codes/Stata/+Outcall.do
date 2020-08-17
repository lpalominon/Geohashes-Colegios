

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

*ssc install outreg2, replace


//==================================
// Carpetas de trabajo
//==================================

global Personal "C:\Users\BS\Documents\Github"

global Raiz "$Personal\Geohashes-Colegios"


global BD = "$Raiz\Data"
global BD_Colegios = "$BD\Colegios"


global Codigos = "$Raiz\Codes\Stata"


global Resultados = "$Codigos\Resultados"
global Resultados_Tablas = "$Resultados\Tablas"
global Resultados_Graficos = "$Resultados\Graficos"





//==================================
// Corriendo todos los do files
//==================================

* Datos 

* qui do "$Codigos\Cargando_Datos_Colegios.do"


* Datos descriptivo

*qui do "$Codigos\Analisis_Descriptivo.do"



* Regresiones




