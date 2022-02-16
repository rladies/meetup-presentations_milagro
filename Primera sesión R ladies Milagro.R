#--------TALLER DE R BASICO--------
#----INTRODUCCI�N A R FUNDAMENTOS DESDE 0----
#------R LADIES CAPITULO MILAGRO-------

# Mi directorio de trabajo

#Para conocer el directorio de trabajo al cual esta enrutado 
#el proyecto de R, se debe ejecutar el comando getwd()

getwd()

#tambien se lo puede realizar desde files > More > Go to working directory





#Cambiando directorio de trabajo 

#Si desea enrutar el proyecto a otro directorio en donde por 
#ejemplo se encuentre el archivo que desee importar se debe ejecutar

# el comando: setwd(especifiar la ruta de trabajo)
#recuerde que tiene que usar o bien // o \ y debe ir todo en "

setwd("C://Users//Jhanelly Chala//Documents//PROGRAMAS R Y PHYTON//VisualizaciÃ³n de datos con R//BASES")
# Tambien se lo puede realizar desde:
#files>(busca la carpeta que desea)>more>set as working directoria


#NOTA: Cuando cierre R el directorio nuevamente será el anterior



#Creando carpetas

# Para crear una carpeta se usa dir.create()
#si desea hacerlo en la misma ruta q especificó solo se coloca
#entre comillas el nombre con el q quiere q se guarde
dir.create("Luna")
# Si desea crear en otra ruta diferente entonces debe
#especificar la ruta  ,  elnombre del archivo
dir.create("C:\\Users\\Jhanelly Chala\\Documents\\PROGRAMAS R Y PHYTON", "lola")




#haciendo un grafico con la finalidad de que se visualice en PLOTS
# runif crea valores en lo q por default el minimo es 0 y maximo 1
hist(runif(100),
     col="steelblue")




# Instalando paqueterias
## Se realiza con la finalidad de usar funciones que no vienen
#en las paqueterias base de R

# con comando: install.packages("nombre de la libreria")
install.packages("GGally")

#Tambien se puede realizar desde:Packages>install




#Llamando paqueterias
# si ya esta instalada la paqueteria para usarla se debe aplicar
# comando: library(nombre de la paqueteria)

library(readxl)

#Tambien se puede realizar desde Packages> se coloca un visto en 
#la libreria deseada




#help
#para obtener ayuda sobre un paquete, funcion, etc, se usa:
# ?nombre de la funcion, help(nombre de la funcion)
?matrix
help(matrix)


## tambien desde la opción help



#Creando vectores
# Un vector es un elemnto basíco en la estructura de R,
#tiene solo una dimenson y de un solo tipo
x=2
2->x
x<-2 

a<- c("Año1", "Año2", "Año3", "Año4") 

b <- c(2000, 1150, 1190, 2010)


z <- c("hola", 1.2)
#  caracter > complejo > numerico > entero > logico



###Uniendo mis vectores###
## Tienen que ser de la misma dimension
##Se usa la función data.frame

PIB_POR_AÑOS <- data.frame(a,b)
#Si quiero observar los datos: View(nombre del objeto)
View(PIB_POR_AÑOS)

#PIB POR AÑOS ---- ERROR

#cambiando el nombre  a las columnas y filas
colnames(PIB_POR_AÑOS) <- c("Años","PIB")
rownames(PIB_POR_AÑOS) <- c("fila1", "fila2", "fila3","fila4")




#PALABRAS RESERVADAS
#Existen palabras reservadas con las que no se puede nombrar a los
#objetos
help("reserved")


#Imprimiendo objetos 
#Con esto se logra visualizar en la consola los objetos creados 
##De forma explicita
print(PIB_POR_AÑOS)
##De forma implicita
PIB_POR_AÑOS


# R es sensible a mayus y minus
#Por ejemplo si para imprimir objetos ponía PIB_por_Años- sale error




#Borrando variables
##Por si se desea liberar espacio en la RAM
#Borrando un objeto
rm(z)
#Borrando más de un objeto
rm(list = c("x","y"))





# Como copiar y pegar datos ---- tambien se puede importar pero se 
#observará más adelante


crecimiento_desempleo<- read.delim("clipboard", dec=",") 
View(crecimiento_desempleo)




#Operaciones aritmeticas -, +,*, /, ^ 


#Cantidad 1=2000  Precio= 3
#Cantidad 2= 3000 Precio 4

(2000*3)+(3000*4)


#IPC año1= 0.36   IPC año2= 0.55

#inflacion= (IPC año actul-IPC año anterior)/IPC año anterior

((0.55-0.36)/0.36)*100


#Potencia
56^2

#lOgaritmo natural
log(10)


#logaritmo base 10
log(10,10)


#Operaciones logicas

#OPERADOR SIGNIFICADO
#> mayor que
#< menor que
#>= mayor o igual
#<= menor o igual
#== igual que
#!= distinto que 

año1 <- 125
año2 <- 314
año3 <- 123


#OPERADORES LÃGICOS
#Los operadores lÃ³gicos son: "y", "o", "no" 
#& 
# | 
#! 


año1<año2 & año2<año3





####Ejemplos de usos de R #####
#En r se pueden hacer muchas cosas estadísticas como por ejemplo
#calcular la correlación que se utilza para conocer que tan fuerte
#es la relación entre dos variables


### El ejemplo es sobre la ley de Okun la cual establece que existe 
#una relación negativa entre la tasa de crecimiento de la producción
# y las variaciones de la tasa de desempleo
cor(crecimiento_desempleo$Crecimiento,crecimiento_desempleo$Desempleo)


###Tambien se puede observar la correlación mediante un gráfico
#install.packages("GGally")
library(GGally)
ggpairs(
  crecimiento_desempleo[,-1],
  diag = list(continuous = wrap("densityDiag",fill=4, color = "blue", alpha=0.5)),
  lower = list(continuous = wrap("points", color= "blue", alpha = 0.5)))

##Para conocer el modelo de regresión
lm(crecimiento_desempleo$Desempleo~crecimiento_desempleo$Crecimiento)




