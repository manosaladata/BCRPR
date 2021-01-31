
#' @title importbcrpr
#' @param x A numeric vector
#' @keyword importbcrp
#' @importFrom base sum
#' @export importbcrp
#' @examples
#' importbcrp('PN01205PM','2005-8','2020-9')
  importbcrp<-function(x,y,z){
  # Llamar al Url
  url <-paste('https://estadisticas.bcrp.gob.pe/estadisticas/series/api/',x,'/json/',y,'/',z,'/', sep="")
  # Descargamos el url
  tmp1  <- fromJSON(readLines(url, warn="F"))
  # Cambiamos el formato de los datos y cambiamos el valor de las variables con missing values.
  dato <-as.data.frame(lapply(tmp1$periods, function(y) gsub("n.d.", "-99999.99", y)))
  # Cambiamos el nombre del archivo usando el ID que lo identifica.
  names(dato) <- c("Fecha",paste("",x,"",sep=""))
  #View(dato)
  # Guardar en csv
  #write.csv2(dato, file=paste(x,'.csv', sep=""))
  #  }, error=function(e){})
  return(dato)
}













