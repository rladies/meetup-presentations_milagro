install.packages("tidyverse")
install.packages("datos")
install.packages("lubridate")
install.packages("modelr")

# En este caso trabajaremos a través de un proceso similar para un conjunto de datos diferente

# Llamando bibliotecas
library(tidyverse)
library(modelr)
library(lubridate)
library(datos)

# El conjunto de datos con el que se trabaja es: 
### `gapminder_es`
|Variable       |Clase               |Descripción |
  |:--------------|:-------------------|:-----------|
  |pais           |factor              |Países incluidos en esta selección de datos (142 niveles) |
  |continente      |factor            |Continente en que se encuentra el país (5 niveles) |
  |anio        |entero            |Desde 1952 a 2007. Datos cada 5 años |
  |esperanza_de_vida | numérica | Esperanza de vida al nacer, en años |
  |poblacion | entero | Población
|pib_per_capita | numérica | PIB per cápita (en dólares estadounidenses, ajustados según inflación)

# Cargamos la data
gapminder <- readr::read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-24/gapminder_es.csv")

# Seleccionamos un conjunto de datos utilizando la función de filter
# La función filter nos permite filtrar filas según una condición
ECU <- filter(paises, pais == "Ecuador")

# Utilizamos el paquete ggplot2 que incluye algunas funciones como:
# geom_line, geom_boxplot, etc.
# Planteamos un gráfico sencillo con ggplot, usamos la función geom_line para hacer un gráfico de lineas
# Planteamos la evolución del pib_per_capita a través de los años en el Ecuador
ECU %>%
  ggplot(aes(anio, pib_per_capita)) +
  geom_line(size=1, colour="red")

# Para crear gráficos de cajas o boxplot utilizamos geom_boxplot. 
# Este gráfico permite conocer rápidamente tanto la dispersión, como la asimetría, 
# el centro y los datos atípicos de una variable. 
ggplot(ECU, aes(anio, pib_per_capita)) + 
  geom_boxplot()

###---------Ajustando el modelo----------
mod1 <- lm(pib_per_capita ~ anio , data = ECU)

#Infomarcion sobre el modelo resumen 
summary(mod1)

# Utilizando el modelo formamos una cuadricula con la funcion data_grid
# data_grid permite generar una cuadrícula de datos
# add_predictions permite agregar predicciones a un marco de datos, utilizando el modelo
cuadricula1 <- ECU %>% 
  data_grid(anio) %>% 
  add_predictions(mod, "pib_per_capita")

# Formamos una caja de bigotes con las variables de análisis
ggplot(ECU, aes(x= anio, y=pib_per_capita)) + 
  geom_boxplot() +
  geom_point(data = cuadricula1, colour = "red", size = 1)

ggplot(ECU, aes(x= anio, y=pib_per_capita)) + 
  geom_point(data = cuadricula1, colour = "purple", size = 2)

# A continuación calculamos y visualizamos los residuos:
ECU <- ECU %>% 
  add_residuals(mod1)
ECU %>% 
  ggplot(aes(anio, resid)) + 
  geom_ref_line(h = 0, colour="blue", size = 1) + 
  geom_line(colour="red", size = 1)









###---------Ajustando el modelo----------
mod <- lm(esperanza_de_vida ~ anio , data = ECU)

#Infomarcion sobre el modelo resumen 
summary(mod)

# Utilizando el modelo formamos una cuadricula con la funcion data_grid
# data_grid permite generar una cuadrícula de datos
# add_predictions permite agregar predicciones a un marco de datos, utilizando el modelo
cuadricula <- ECU %>% 
  data_grid(anio) %>% 
  add_predictions(mod, "esperanza_de_vida")

# Formamos una caja de bigotes con las variables de análisis
ggplot(ECU, aes(anio, esperanza_de_vida)) + 
  geom_boxplot() +
  geom_point(data = cuadricula, colour = "red", size = 1)

# A continuación calculamos y visualizamos los residuos:
ECU <- ECU %>% 
  add_residuals(mod)
ECU %>% 
  ggplot(aes(anio, resid)) + 
  geom_ref_line(h = 0, colour="blue", size = 1) + 
  geom_line(colour="red", size = 1)
