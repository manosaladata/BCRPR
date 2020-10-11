##############################################
##                                          ##
##          BCRPR PACKAGE                   ##
##                                          ##
##############################################

#install.packages(c("httr", "jsonlite"))
library(httr)
library(jsonlite)

res = GET("https://estadisticas.bcrp.gob.pe/estadisticas/series/api/PN01288PM/json")
res
## Tomando JSON data
rawToChar(res$content)
data = fromJSON(rawToChar(res$content))
names(data)
data$periods

#############################################
  

per=GET("https://estadisticas.bcrp.gob.pe/estadisticas/series/api/PN01288PM-PN01289PM/json/2013-1/2016-9")
per
## Tomando JSON data
rawToChar(per$content)
data = fromJSON(rawToChar(per$content))
names(data)
data$periods



install.packages('jsonlite')
install.packages('ggplot2')
install.packages('tidyverse')
install.packages('lubridate')
install.packages('dplyr')
install.packages("readxl")
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

importbcrp<-function(x,y,z){
 for (i in x) {
  # Indicamos el ID, el formato, las fechas y el idioma. Llamamos "url" a esta combinación
  url <-paste('https://estadisticas.bcrp.gob.pe/estadisticas/series/api/',x,'/json/',y,'/',z,'/', sep="") 
  # Descargamos el url indicado
  tmp1  <- fromJSON(readLines(url, warn="F"))
  # Cambiamos el formato de los datos y cambiamos el valor de las variables con missing values.
  dato <-as.data.frame(lapply(tmp1$periods, function(y) gsub("n.d.", "-99999.99", y))) 
  # Cambiamos el nombre del archivo usando el ID que lo identifica.
  names(dato) <- c("Fecha",paste("",x,"",sep=""))
  View(dato)
  write.table(dato, file=paste(x,'.dta', sep=""))
 }
}


importbcrp('PN01205PM','2005-8','2020-9')









metadato <- c('PN03371FQ','PN03372FQ','PN03373FQ')

for (i in 1:length(metadato)){
  #  tryCatch({
  # Indicamos el ID, el formato, las fechas y el idioma. Llamamos "url" a esta combinación
  url <-paste('https://estadisticas.bcrp.gob.pe/estadisticas/series/api/',metadato[i],'/json/1940/2018/ing', sep="") 
  # Descargamos el url indicado
  tmp1  <- fromJSON(readLines(url, warn="F"))
  # Cambiamos el formato de los datos y cambiamos el valor de las variables con missing values.
  dato <-as.data.frame(lapply(tmp1$periods, function(y) gsub("n.d.", "-99999.99", y))) 
  # Cambiamos el nombre del archivo usando el ID que lo identifica.
  names(dato) <- c("name",paste("",metadato[i],"",sep=""))
  # Creamos un nuevo documento indicando el formato
  # El formato "dta" se usa en el software Stata
  write.dta(dato, file=paste(metadato[i],'.dta', sep=""))
  # El formato "csv" se puede usar en distintos softwares incluído Excel
  write.csv2(dato, file=paste(metadato[i],'.csv', sep=""))
  #  }, error=function(e){})
}











