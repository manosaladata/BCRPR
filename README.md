<!-- README.md is generated from README.Rmd. Please edit that file -->
BCRPR 
=============================================================================

[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)

BCRPR es un paquete disenado para trabajar facilmente con data publica del BCRP. 
Aprende a utilizarlo en <https://manosaladata.github.io/BCRPR/>.

Instalacion
-----------

### Instalacion para principiantes

Lo primero que debemos hacer es instalar primero R en este
[enlace](https://cran.r-project.org/bin/windows/base/) y luego RStudio
en este [enlace](https://download1.rstudio.org/RStudio-1.1.453.exe).
Posteriormente dentro de la consola se debera poner los siguientes
scripts

# Los paquetes nuevos son instalados a traves de la funcion install.packages(), siempre entre comillas

    install.packages("jsonlite")
    install.packages("ggplot2")
    install.packages("lubridate")
    install.packages("tidyr")
    install.packages("stringr)")
    install.packages("foreign")
    install.packages("readxl")
    install.packages("devtools")
    install.packages("tidyverse")
    install.packages("dplyr")
    install.packages("plyr")
    devtools::install_github("manosaladata/BCRPR")

### Instalacion para R Users

Instalemos primero los paquetes necesarios de forma inteligente! Usemos
la siguiente funcion: copiala y pega en tu consola de R, o ponlo en un
script y usa control control + enter.

    # Instala la ultima version de nuestro paquete usando
    devtools::install_github("manosaladata/BCRPR")

Activacion de paquetes
----------------------

### Activacion para principiantes

Utilicemos la funcion `library()` para activar los paquetes instalados.

    require(jsonlite)
    require(ggplot2)
    require(lubridate)
    require(stringr)
    library(foreign)
    library(readxl)
    library(tidyverse)
    require(tidyr)
    library(dplyr)
    require(plyr)


A probar el paquete!
--------------------

El paquete cuenta con data de los bancos y lo puedes usar facilmente
utilizando el siguiente script:

    library(BCRPR)
    inflacion<-importbcrp('PM05217PA','2010','2020')
    plot(inflacion,type = "o",main = "Inflación Anual 2010-2020")


![Aquí la descripción de la imagen por si no carga](https://github.com/manosaladata/BCRPR/blob/master/Rplot.png)


Codigo de conducta
------------------

Por favor considerar que este paquete cuenta con un [Codigo de Conducta
del Contribuidor](CODE_OF_CONDUCT.md). Al participar en este proyecto o
utilizarlo, se asume que estas de acuerdo con estos terminos.
