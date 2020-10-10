
Consideraciones computacionales
=========================================

Todos los códigos de esta investigación se han corrido en una laptop HP que tiene las siguientes características:

- Procesador: Intel(R) Xeon(R)
- RAM:32 GB
- Nucleos físicos: 4
- Nucleos virtuales: 8
- Velocidad inicial: 2.9GHz 


Replicando resultados
=========================================

Los pasos para replicar los resultados son los siguientes:


1) Correr el do file de stata llamado "+Outcall_Colegios"

- Este script ejecuta todos los do files que cargan y juntan los datos a nivel de colegios en un solo archivo que va ser usado en la siguiente fase. 

- Este script también ejecuta otros do files que generan bases de datos en .dta a nivel de comunas que serán usadas en pasos posteriores.

- Este script tarda en ejecutarse alrededor de 5 minutos.

2) Correr los códigos de python de la carpeta "Analisis colegios"

- Estos scripts son usados para juntar la base de datos a nivel de escuelas con la base de datos a nivel de geohashes que tienen visitas. Esta nueva base de datos será usada en el análisis de visitas a escuelas.

- Todos los script han sido ejecutados en Jupyer y tardan alrededor de 20 minutos

3)  Correr el do file de stata llamado "+Outcall_ColegiosGeohashes"

- Este script ejecuta do files que generan distintas bases de datos de interés (visitas a nivel nacional, visitas a nivel regional, visitas a nivel de comunas, etc.)

- Este script también ejecuta los do files que generan los gráficos y tablas de resultados del análisis de visitas a escuelas.

- Este script tarda en ejecutarse alrededor de 4 horas.

4) Los resultados finales se almacenan en la carpeta "..\Geohashes-Colegios\Codes\Stata"

