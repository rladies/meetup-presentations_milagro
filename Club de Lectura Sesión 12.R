###########################################################################
#------------------Club de Lectura-----------------------
#R para Ciencia de Datos (Wickham y Grolemund)
#R-Ladies Barranquilla, Galapagos, Guayaquil y Milagro

#Sesion 13: Capitulo 24 y 25 (Construcción de modelos y muchos modelos)
#Script por: Naomy Vera y Julissa Magallanes (R-Ladies Milagro)
###########################################################################

##________________Instalar paquetes________________
# Corran este codigo si es que no tienen estos paquetes instalados 
# install.packages("tidyverse")
# install.packages("modelr")
# install.packages("datos")
# install.packages("hexbin")

##________________Cargar paquetes________________
library(tidyverse)
#Tidyverse es un paquete que contiene varios paquetes.
library(modelr)
# Incluido en tidyverse 
#Modelr proporciona funciones que ayudan a crear tuberias elegantes al modelar.
library(datos)
#Datos posee como su nombre lo dice, un conjunto de datos. 
library(hexbin)
#Agrupa y traza agrupaciones hexagonales.

#Vizualizar data 
view(diamantes)
diamantes <- diamantes

#Ejercicio 1
#Relacionando corte y precio 
ggplot(diamantes,aes(corte,precio))+geom_boxplot(colour="red", fill="pink",
                                                 outlier.colour="yellow")
#Relacionando color y precio 
ggplot(diamantes,aes(color,precio))+geom_boxplot(colour="blue", fill="pink",
                                                 outlier.colour="red")
#El peor diamante es J por el color amarillo claro 
#Relacionando claridad y precio 
ggplot(diamantes,aes(claridad,precio))+geom_boxplot(colour="red", fill="pink",
                                                    outlier.colour="yellow")
#La peor claridad corresponde a la I1

#Ejercicio 2
ggplot(diamantes,aes(quilate,precio))+geom_hex(bins=50,colour="purple")

#Un modelo mas sencillo 
diamantes2<-diamantes%>% filter(quilate<=2.5)%>%
  mutate(log_precio=log2(precio),log_quilate=log2(quilate))

#Nueva relacion entre quilates y precio 
ggplot(diamantes2,aes(log_quilate,log_precio))+
  geom_hex(bins=50,colour="purple")

#Disenando un modelo 
mod_diamantes <- lm(log_precio~log_quilate, data=diamantes2)
cuadricula <- diamantes2 %>% 
  data_grid(quilate=seq_range(quilate,20)) %>% 
  mutate(log_quilate=log2(quilate)) %>% 
  add_predictions(mod_diamantes,"log_precio") %>% 
  mutate(precio=2^log_precio)

#Graficando 
ggplot(diamantes2, aes(quilate,precio))+
  geom_hex(bins=50)+
  geom_line(data=cuadricula,colour="green",size=2)

#Analizando residuos 
diamantes2 <- diamantes2 %>% add_residuals(mod_diamantes,"lresid")

#Graficando 
ggplot(diamantes2,aes(log_quilate,lresid))+geom_hex(bins=50)


###EVALUANDO EL MODELO (DISTRIBUCION DE LA VARIABILIDAD/DISPERCION DE DATOS)
#relacionando corte y residuo
ggplot(diamantes2, aes(corte,lresid))+geom_boxplot()
#relacionando color y residuo 
ggplot(diamantes2,aes(color,lresid))+geom_boxplot()
#relacionando claridad y residuo
ggplot(diamantes2,aes(claridad,lresid))+geom_boxplot()

# En este caso trabajaremos a traves de un proceso similar para un conjunto de datos diferente

# El conjunto de datos con el que se trabaja es: 
### `gapminder` su traduccion es paises, para mayor facilidad trabajamos con los datos en español

# Cargamos la data
paises

#Viendo estructura de datos 
#R base
str(paises)

#Tidyverse
glimpse(paises)

# Utilizamos el paquete ggplot2 que incluye algunas funciones como:
# geom_line, geom_boxplot, etc.
# Planteamos un grafico sencillo con ggplot
# usamos la funcion geom_line para hacer un grafico de lineas
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

mod1 <- lm(pib_per_capita ~ anio + continente, data = paises)


#Información sobre el modelo/ resumen 
summary(mod1)


# Utilizando el modelo formamos una cuadricula con la funcion data_grid
# data_grid permite generar una cuadricula de datos
# add_predictions permite agregar predicciones a un marco de datos, utilizando el modelo
cuadricula1 <- paises %>%  
  data_grid(anio, continente) %>% 
  add_predictions(mod1, "pib_per_capita")

# Visualizamos las predicciones
ggplot(paises, aes(x=anio, y=pib_per_capita, color= continente)) + 
  geom_point() +
  geom_line(data = cuadricula1, size=2) +
  facet_wrap(~continente)


# A continuacion calculamos y visualizamos los residuos

paises <- paises %>%  
  add_residuals(mod1)

paises %>%  
  ggplot(aes(anio, resid)) +
  geom_ref_line(h=0, colour = "blue", size=1) +
  geom_point(colour="red", size=1) 

