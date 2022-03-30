#-------GRAFICANDO CON PLOT Y GGPLOT2-------
#---------Taller de Graficos de R---------
#----------R_Ladies Milagro----------
###Expositoras: Naomy Vera y Julissa Magallanes

#---------PRIMERA PARTE----------
#-----GRAFICANDO CON PLOT-----

###---Estableciendo dominio---###
x <- (-10:10)
####_____Graficando f. lineal-----####
f1 <- 5*x+3
plot(x,f1)

####_____Graficando f. cuadratica-----####
f2 <- x^2
plot(x,f2, 
     type = "l")

####_____Graficando f. cubica-----####
f3 <- x^3
plot(x,f3,
     type="o")

#############################################################################
#type="p"    Dibuja puntos individuales (opcion por defecto)
#type="l"    Dibuja lineas
#type="b"    Dibuja puntos y lineas
#type="o"    Dibuja puntos atravesados por lineas
#type="h"    Dibuja con lineas verticales
#type="S"    Casi lo mismo
#type="n"    No dibuja nada.
#############################################################################

####_____Graficando funciones trigonometricas-----####
####-----SENO-----
x1 <- seq(0,2*pi,length=100)
pi
y1 <- sin(x1)
plot(x1,y1)

####-----COSENO-----
y2 <- cos(x1)
plot(x1,y2, 
     type="o")

####-----TANGENTE-----
y3 <- tan(x1)
plot(x1,y3, 
     type="l",
     col="purple",
     lwd=2)

#############################################################################
#type=    Tipo de linea
#lds=     Grosor de la linea
#Col=""   Color 
#xlab=""  Etiqueta para el eje x
#ylab=""  Etiqueta para el eje  y
#main=""  Titulo del grafico
#sub=""   Subtitulo del grafico
#grid()   Cuadriculas
#Text()   Establcer texto en un punto de la grafica
#axes=F   Suprime la generacion de los ejes
#col.main Color del título
#col.sub  Color del subtítulo
#col.lab  Color de las etiqetas de los ejes
#col.axis Color de las etiquetas de los ticks
#############################################################################

###-----Oferta Agregada-----###
y <-seq(100,600 ,length=15)
p <- seq(10,100, length=15)
plot(y,p,
     type = "o",
     lwd=2,
     col="blue",
     main = "CURVA DE LA OFERTA AGREGADA",
     xlab = "Produccion",
     ylab = "Nivel de precios")

###-----Demanda Agregada-----###
p1<- seq(100,10, length=15)
plot(y,p1,
     type = "o",
     lwd=2,
     col="red",
     main = "CURVA DE LA DEMANDA AGREGADA",
     xlab = "Produccion",
     ylab = "Nivel de precios")
grid(col="pink")

###-----Oferta y Demanda Agregada-----###
par(bg="azure")
plot(y,p,
     type = "o",
     lwd=2,
     col="purple",
     main = "CURVA DE LA OFERTA Y DEMANDA AGREGADA",
     xlab = "Produccion",
     ylab = "Nivel de precios")

points(y,p1,
       type = "o",
       lwd=2,
       col="red")

###-----Punto de equilibrio-----###
Z <- data.frame(y,p,p1)
Z[p1==p,]

points(350,55,
       pch=19,
       cex=2)
#cex me permite cambiar el tamano de punto

text(350,65,
     label = "Equilibrio")

###--------Cargando una data--------###
PIB <- read.delim("clipboard", dec=",")
CP <- read.delim("clipboard", dec = ",")
#read.delim se usa normalmente para leer archivos de texto delimitados
#clipboard me ayudara a importar esos datos 

###--------Grafica del crecimiento del PIB para Italia-------###
###--------Atachando la base--------####
attach(PIB)
###---------Grafica de barras---------####
barplot(IT,
        names.arg = seq(1990,2020),
        xlab="Años",
        main="Crecimiento del PIB para Italia",
        sub="Porcentaje Anual",
        col=rainbow(11),
        horiz = T,
        las=1)

###--------Grafica del crecimiento del PIB para Ecuador-------###
par(bg="lightcyan")
plot(x=PIB$Date, y=PIB$ECU, 
     type = "s",
     xlab="Anios",
     ylab="Crecimiento del PIB",
     main = " ECUADOR",
     lwd=3,
     sub="Porcentaje Anual", 
     las=1,
     col="maroon4",
     col.main="purple",
     col.sub="purple2",
     col.lab="purple4",
     col.axis="blue",
     fg="blue")
#Las me permite cambiar la orientacion de los ejes

###--------Grafica del crecimiento del PIB para Tuquia-------###
par(bg="white")
plot(x=PIB$Date, y=PIB$TUR, type = "h", col="green3", lwd=3,
     xlab="Anios",
     ylab="Crecimiento del PIB",
     main = "TURQUIA",
     sub="Porcentaje Anual")

###--------Grafica de la Inflacion-------###
attach(CP)
plot(Date, Inflación, type="o", col="green", lwd=2, main="INFLACION ")

###--------Grafico del Desempleo-------###
plot(Date, Desempleo, type="o", col="purple", lwd=2, main="DESEMPLEO")

###--------Grafica de la Curva de Phillips-------###
plot(Desempleo, Inflación)

plot(Desempleo, Inflación, pch=17, col="salmon",
     main = "Curva de Phillips",
     sub="De forma anual")

#La Curva de Phillips representa la relacion inversa
#entre la inflacion y el desempleo de un pais 

#############################################################################
###--------Cargar Librerias-------###
#install.packages("openxlxsx")
library(openxlsx)

###--------Cargar data-------###
file.choose()
nueva.data <- read.xlsx("C:\\Users\\Usuario\\Desktop\\R\\R-Económico\\Introducción\\BASES_DATOS_BASES\\DEP_2016_BP.xlsx")

#####-----Diagrama de tarta-----#####
attach(nueva.data)
table(TIPO.DE.ENTIDAD)
#table me permite hacer un conteo rapido de lo que
#contiene una determinada variable.

pie(table(TIPO.DE.ENTIDAD),
    main="Tipo de Entidad")

#####-----Filtrando data-----#####
data2<- nueva.data[nueva.data$REGION=="COSTA" , ]
data2<- nueva.data[nueva.data$REGION=="COSTA" &
                           nueva.data$CANTON=="MILAGRO",]

attach(data2)
pie(table(ENTIDAD),
    main="Tipo de Entidad",
    col = rainbow(10),
    density = 30, angle = 50)

#install.packages("lessR")
library(lessR)
PieChart(ENTIDAD,
         data=data2)

#---------SEGUNDA PARTE----------
#-----GRAFICANDO CON GGPLOT2-----

#Instalar los siguientes paquetes en caso de no tenerlos
#install.packages("readxl)
#install.packages("tidyverse")

#Cargar paquetes
library(readxl)
library(tidyverse)

#Importar base de datos
#Datos obtenidos del INEC
#Permite observar la ruta de la base de datos
file.choose()

data1 <- read_xlsx("C:\\Users\\Lenovo\\Desktop\\DATA22.xlsx")

#Usando el paquete de ggplot2
#Grafico de dispersion
ggplot(data1,aes(Año, Inflacion)) + geom_point(colour="purple2",size=2)

#Grafico de lineas 
ggplot(data1,aes(Año, Inflacion)) + geom_line(colour="green1", size=3)+
  ggtitle("Tasa inflacionaria de Ecuador")

#Grafico de columnas
ggplot(data1,aes(Año, Inflacion)) + geom_col(colour="olivedrab", fill="green1")

#Diagrama de cajas y bigotes
ggplot(data1,aes(Año, Inflacion)) + geom_boxplot(colour="purple3")

#Grafico de area
ggplot(data1,aes(Año, Inflacion)) + geom_area(colour="purple2",fill="plum1")

#Grafico de poligono
ggplot(data1,aes(Año, Inflacion)) + geom_polygon(colour="purple2",fill="plum1")

##Histograma
ggplot(data1) + 
  geom_histogram(aes(x= Inflacion), colour="olivedrab", fill="green1")

# Grafico de barras, usamos Barplot 
#Se asignan las variables x e y. 
#Se debe cambiar el stat por defecto 
#(recordamos que este es contar el número de observaciones de cada valor).
#El nuevo stat es identity que consiste en dejar la variable asignada a y 
#(es decir, las frecuencias) tal y como está sin modificar nada.

#Grafico de barras opcion por defecto
ggplot(data1,aes(x=Inflacion)) + 
  geom_bar( width=0.5)

#El argumento stat modifica la opción por defecto
ggplot(data1,aes(x= Año, y= Inflacion)) + 
  geom_bar(stat = "identity", width=0.5) 

#Agregando los años para cada barra
ggplot(data1,aes(x= Año, y= Inflacion)) + 
  geom_bar(stat = "identity", colour="black", fill= "darkslategray1", 
           width=0.5) +
  scale_x_continuous(breaks = seq(min(data1$Año),max(data1$Año,1)))

#Mejorando el aspecto de la grafica
ggplot(data1,aes(x=Año, y=Inflacion)) + 
  geom_bar(stat = "identity", colour="black", fill= "darkslategray1", width=0.5) +
  scale_x_continuous(breaks = seq(min(data1$Año),max(data1$Año,1))) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

#Representando puntos y lineas
ggplot(data1, aes(x=Año, y=Inflacion)) + 
  geom_line(colour="dodgerblue1", size=2)+
  geom_point(colour="darkorange1", size=4)

#Agregando titulo, subtitulo, informacion
ggplot(data1, aes(x=Año, y=Inflacion)) + 
  geom_line(colour="dodgerblue1", size=2)+
  geom_point(colour="darkorange1", size=4)+
  labs(title="Evolucion de la tasa inflacionaria en Ecuador",
       subtitle = "De 1990 hasta 2021",
       caption = "Elaboracion propia con datos del INEC",
       y="Tasa de inflacion anual",
       x="Año")

##Relacionemos dos variables
#Usemos datos del Banco Mundial 
#Instalar paquete
#install.packages("WDI")
library(WDI)

#Codigos en el Banco Mundial
# SL.UEM.TOTL.ZS :Desempleo, total (% de la población activa total) (estimación modelado OIT)
# FP.CPI.TOTL.ZG :Inflación, precios al consumidor (% anual)

# Cargar datos desde WDI a R
# Utilizamos el codigo ISO de Ecuador

#Indicador de referencia
ind.ref=c("SL.UEM.TOTL.ZS","FP.CPI.TOTL.ZG")

datos<-WDI(country = "ECU", indicator = ind.ref, start = 2000, 
           end = 2020, extra = FALSE, cache = NULL)
view(datos)

#Cambiando nombres de las columnas
names(datos) = c("Codigo_iso", "Pais", "Año", "Desempleo", "Inflacion")

names(datos)

view(datos)

#Planteemos un grafico sencillo 

#Grafico de dispersion
ggplot(datos, aes(Desempleo, Inflacion)) + 
  geom_point(colour="darkblue", size=2)

#Grafico de lineas
ggplot(datos,aes(Desempleo, Inflacion)) + 
  geom_line(colour="darkorange1", size=2)

#Ambos
ggplot(datos, aes(Desempleo, Inflacion), start=2001) + 
  geom_line(colour="darkorange1", size=1) + 
  geom_point(colour="darkblue", size=2, alpha=1/2)

#Grafico 
#geom_smooth usa distintos metodos para estimar 
#la media condicionada (curva de regresion) de una variable por otra, 
#incluyendo el metodo de minimos cuadrados

#El grado/nivel de transparencia es util cuando hay muchos puntos

ggplot(datos, aes(Desempleo,Inflacion))+
  geom_point(colour="darkblue", size=2, alpha=1/2) +
  geom_smooth(colour="dodgerblue4")  # Opcion por defecto

ggplot(datos, aes(Desempleo,Inflacion))+
  geom_point(col = "darkblue", size = 3, alpha = 1/4) +
  geom_smooth(colour="dodgerblue4", method = 'lm') # Añade la recta de minimo

## De todos los paises 
ind.ref=c("SL.UEM.TOTL.ZS","FP.CPI.TOTL.ZG")

datos_todos<-WDI(indicator = ind.ref, start = 2000, 
                 end = 2020, extra = FALSE, cache = NULL)

#Cambiando nombres de las columnas

names(datos_todos) = c("Codigo_iso", "Pais", "Año", "Desempleo", "Inflacion")

names(datos_todos)

##Filtrar data 

nueva.data <- filter(datos_todos,`Pais`=="Spain")

##Grafico
ggplot(nueva.data, aes(Desempleo, Inflacion))+
  geom_line(colour="darkorange1", size=1)+
  geom_point(colour="darkblue", size=2)

##Grafico de densidad
ggplot(nueva.data, aes(x= Desempleo)) +
  geom_density(fill="lightskyblue", color="lightskyblue4", alpha=0.8)

ggplot(nueva.data, aes(x= Inflacion)) +
  geom_density(fill="aquamarine1", color="aquamarine4", alpha=0.8)

#Visualizar ambas variables en una sola grafica
ggplot(nueva.data) +
  geom_density(aes(x= Desempleo),fill="lightskyblue", 
               color="lightskyblue4", alpha=0.8) + 
  geom_density(aes(x= Inflacion), fill="aquamarine1", 
               color="aquamarine4", alpha=0.8)

#Mejorando el aspecto del grafico
ggplot(nueva.data) +
  geom_density(aes(x= Desempleo),fill="lightskyblue", 
               color="lightskyblue4", alpha=0.8) + 
  geom_density(aes(x= Inflacion), fill="aquamarine1", 
               color="aquamarine4", alpha=0.8)+
  labs(title="Visualizando la forma de distribucion de la inflacion y el desempleo",
       subtitle = "Correspondiente a España",
       y="Densidad",
       x="Inflación y Desempleo")

#Grafico animado
#Paises Latinos

##Instalar paquetes
#install.packages("gganimate")
library(gganimate)

#install.packages("gifski")
library(gifski)

ind.ref=c("SL.UEM.TOTL.ZS","FP.CPI.TOTL.ZG")

paises_latinos<-WDI(country = c("AR","BR","CL","CO","ECU"), indicator = ind.ref, start = 2000, 
                    end = 2020, extra = FALSE, cache = NULL)

#Cambiando nombres de las columnas

names(paises_latinos) = c("Codigo_iso", "Pais", "Año", "Desempleo", "Inflacion")

names(paises_latinos)

##Evolucion de la Inflacion en algunos paises latinos

paises_latinos %>% 
  group_by(Año,Pais) %>% 
  ggplot(aes(x= Año, 
             y= Inflacion, 
             color= Pais)) +
  geom_line(size=1) +
  transition_reveal(Año)

##Evolucion del Desempleo en algunos paises latinos

paises_latinos %>% 
  group_by(Año,Pais) %>% 
  ggplot(aes(x= Año, 
             y= Desempleo, 
             color= Pais)) +
  geom_line(size=1) +
  transition_reveal(Año)

#Mejorar el gráfico animado

paises_latinos %>% 
  group_by(Año,Pais) %>% 
  ggplot(aes(x= Año, 
             y= Desempleo, 
             color= Pais)) +
  geom_line(size=2) + 
  geom_point(size=4)+
  labs(title = "Evolucion de la tasa de desempleo en {frame_along}", 
       subtitle = "En paises latinamericanos") +
  theme_minimal()+
  transition_reveal(Año)


