#--------CONGRESO INTERNACIONAL DE ECONOMIA II--------
#-----INTRODUCCION A LA PROGRAMACION EN R PARA ECONOMISTAS-----

###Cargando librerias###
library(openxlsx)
#Es un paquete que nos permite leer, escribir y editar archivos xlsx
library(dplyr)
#Es un paquete que permite manipular un DaraFrame a partir de verbos 
library(lubridate)
#Es un paquete que facilita el analisis y manipulacion de fechas

#Paquetes que se usaran en la segunda parte
library(tidyverse)
#Tidyverse es un paquete que contiene varios paquetes
library(modelr)
# Incluido en tidyverse 
#Modelr proporciona funciones que ayudan a crear tuberias elegantes al modelar
library(datos)
#Datos posee como su nombre lo dice, un conjunto de datos

#-------PRIMERA PARTE-------
#PROCESAMIENTO DE UNA BASE DE DATOS EXTENSA Y CALCULO DE MEDIDAS ESTADISTICAS BÁSICAS
#Se utiliza la función 'file.choose' para que el R nos indique la ruta 
#en la cual se encuentra el archivo o base de datos que queremos cargar
file.choose()

###Cargando data###
data1 <- read_excel("C:\\Users\\Lenovo\\Desktop\\DEP_2016_BP (1).xlsx")

###Visualizando data###
View(data1)

###Filtrando informacion###
#Filtrando por bancos grandes
#Filtro la informacion a partir del tipo de entidad, donde analizare unicamente a los Bancos grandes
nueva.base <- filter(data1,`TIPO DE ENTIDAD`=="BANCOS GRANDES")
#Filter es una funcion que nos permite filtrar filas según una condición.
#De 67432 observaciones filtre mi data a 34239 observaciones

#Filtrando por region-SIERRA
#Puedo reducir aun mas mi data de analisis
#Filtro la informacion a partir del tipo de entidad
#donde analizare unicamente a los Bancos grandes de la region sierra. 
nueva.base <- filter(data1,`TIPO DE ENTIDAD`=="BANCOS GRANDES"&
                       `REGION`=="SIERRA")
#De 34239 observaciones filtre mi data a 14149 observaciones

#Filtrando por deposito >1000
#Continuo reduciendo mi data
nueva.base <- filter(data1,`TIPO DE ENTIDAD`=="BANCOS GRANDES"&
                       `REGION`=="SIERRA"&
                       `TIPO DE DEPOSITO`=="Depósitos de ahorro" &
                       `SALDO`>= 1000)

#De 14149 observaciones filtre mi data a tan solo 938 observaciones

#R nos ayuda a calcular cierta informacion estadistica
###Calculando media###
mean(nueva.base$SALDO)
#La media hace referencia al promedio total de los datos analizados 

###Calculando mediana### 
median(nueva.base$SALDO)
#La mediana es un estadistico que representa la posicion central de los datos 

#Calculando desviacion estandar
sd(nueva.base$SALDO)
#La desviacion estandar es una medida que muestra la dispersión media de una variable

#Resumen de las medidas estadisticas de la variable SALDO
summary(nueva.base$SALDO)

#Para mostrar todos los decimales 
options(scipen = 999)

#-------SEGUNDA PARTE------
#INTRODUCCION EN EL MODELADO ESTADISTICO Y PREDICCION

# El conjunto de datos con el que se trabaja es: 
### `gapminder` solo que su traduccion es paises
#para mayor facilidad trabajamos con los datos en español

# Cargamos la data
paises <- paises

#Viendo estructura de datos 
#R base
str(paises)

#Tidyverse
glimpse(paises)

# Seleccionamos un conjunto de datos utilizando la funcion de filter
# La funcion filter nos permite filtrar filas segun una condicion
ECU <- filter(paises, pais == "Ecuador")

# Utilizamos el paquete ggplot2 que incluye algunas funciones como:
# geom_line, geom_boxplot, etc.
# Planteamos un grafico sencillo con ggplot, usamos la funcion geom_line 
# para hacer un grafico de lineas
# Planteamos la evolucion del pib_per_capita a traves de los años en el Ecuador
ECU %>%
  ggplot(aes(anio, pib_per_capita)) +
  geom_line(size=1, colour="red") + 
  ggtitle("Evolución del pib per cápita del Ecuador")

###---------Construccion de un modelo lineal----------
#Trabajamos con una variable predictora
mod1 <- lm(pib_per_capita ~ anio , data = ECU)

#Infomarcion sobre el modelo resumen 
summary(mod1)

# Utilizando el modelo formamos una cuadricula con la funcion data_grid
# data_grid permite generar una cuadricula de datos
# add_predictions permite agregar predicciones a un marco de datos, utilizando el modelo
cuadricula1 <- ECU %>% 
  data_grid(anio) %>% 
  add_predictions(mod1, "pib_per_capita")

# Visualizamos las predicciones
ggplot(ECU, aes(x= anio, y=pib_per_capita)) + 
  geom_point(data = ECU , colour = "purple", size = 2) + 
  geom_line(data = cuadricula1)

# A continuacion calculamos y visualizamos los residuos:
ECU <- ECU %>% 
  add_residuals(mod1)

ECU %>% 
  ggplot(aes(anio, resid)) + 
  geom_ref_line(h = 0, colour="blue", size = 1) + 
  geom_line(colour="red", size = 1)

#En este caso intentamos demostrar como se es posible trabajar con más 
#de una variable predictora
#Trabajamos con dos variables predictoras

# Planteamos la evolucion del pib_per_capita a traves de los años de los paises 

paises %>%
  ggplot(aes(anio, pib_per_capita, group = pais)) +
  geom_line(alpha = 1 / 3) +
  ggtitle("Evolución del pib per cápita de los paises")

# Para crear graficos de cajas o boxplot utilizamos geom_boxplot. 
# Este grafico permite conocer rapidamente tanto la dispersion, como la asimetria, 
# el centro y los datos atipicos de una variable. 

#Dispersion datos por anio 
ggplot(paises, aes(anio, pib_per_capita)) + 
  geom_boxplot(aes(group = anio))

#Dispersion datos por anio y continente
ggplot(paises, aes(anio, pib_per_capita)) + 
  geom_boxplot(aes(group = anio, color = continente))+
  facet_wrap(~continente)

# Crear un modelo lineal con dos variables predictoras
mod2 <- lm(pib_per_capita ~ anio + continente, data = paises)

#Información sobre el modelo/ resumen 
summary(mod2)

# Crear una cuadricula 
# Añadir predicciones en base al modelo planteado
cuadricula2 <- paises %>%  
  data_grid(anio, continente) %>% 
  add_predictions(mod2, "pib_per_capita")

# Visualizar estas predicciones
ggplot(paises, aes(x=anio, y=pib_per_capita, color= continente)) + 
  geom_point() +
  geom_line(data = cuadricula2, size=2) +
  facet_wrap(~continente)

# Calcular y visualizar los residuos 
paises <- paises %>%  
  add_residuals(mod2)

paises %>%  
  ggplot(aes(anio, resid)) +
  geom_ref_line(h=0, colour = "blue", size=1) +
  geom_point(colour="red", size=1) 


