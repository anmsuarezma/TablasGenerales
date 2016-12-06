#Librerias 
library(xlsx)
library(openxlsx)
library(extrafont)
#Definir ubicación
setwd("/tmp/SDIS_SIRBE")
#Cargar base de datos
base_sdis <- read.csv("CargueSIRBEVejez.csv",header = T)
#Construir una tabla con dos variables
Frecuencia <- table(base_sdis$NOMTENVIV, base_sdis$EDAD_ACTUAL)
#Hacer filtros de rangos
Temprana <- Frecuencia[, 1:18]
#Nombre de columnas
colnames(Temprana)
#Nombres filas
rownames(Temprana)
Tardia <- Frecuencia[, 19:57]
colnames(Tardia)
rownames(Tardia)
Tardia
Temprana
#Sumar los valores numericos de la filas
SumaTemprana<-rowSums(Temprana)
SumaTardia<-rowSums(Tardia)
#Sumar todos los valores numericos de la variable
TotalTemprana <- sum(SumaTemprana)
TotalTardia <- sum(SumaTardia)
#Calcula el porcentaje
PorcentajeTemprana <- (prop.table(SumaTemprana))
PorcentajeTardia <- (prop.table(SumaTardia))
PorcentajeTTotal <- (prop.table(SumaTardia))
#Unir columnas y contruir una nueva tabla
tablaTemprana <- cbind(SumaTemprana, PorcentajeTemprana)
#Renombrasr columnas
colnames(tablaTemprana ) <- c("Total", "%")
tablaTardia <- cbind(SumaTardia, PorcentajeTardia)
colnames(tablaTardia) <- c("Total", "%")
#Guardar en una tabla nueva
TempranaPrint <- as.table(tablaTemprana)
TardiaPrint <- as.table(tablaTardia)
#Crear lista de imprimibles
lista_de_datos <- list("Vejez Temprana" = TempranaPrint, "Vejez Tardia" = TardiaPrint)
#Imprime a un archivo de formato xlsx
write.xlsx(lista_de_datos, file = "tablas/tabla.xlsx")