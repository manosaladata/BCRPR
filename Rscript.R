##############################################
##                                          ##
##          BCRPR PACKAGE                   ##
##                                          ##
##############################################

install.packages("devtools")
library(devtools)
install.packages("roxygen2")
library(roxygen2)
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

