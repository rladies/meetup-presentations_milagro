#--------TALLER DE R BASICO--------
#----INTRODUCCIÓN A R FUNDAMENTOS DESDE 0----
#------R LADIES CAPITULO MILAGRO-------

#haciendo un grafico con la finalidad de que se visualice en PLOTS
# runif crea valores en lo q por default el minimo es 0 y maximo 1
hist(runif(100),
     col="steelblue")


# Instalando paqueterias
## Se realiza con la finalidad de usar funciones que no vienen
#en las paqueterias base de R

# con comando: install.packages("nombre de la libreria")
install.packages("askpass")

#Tambien se puede realizar desde:Packages>install


#Llamando paqueterias
# si ya esta instalada la paqueteria para usarla se debe aplicar
# comando: library(nombre de la paqueteria)

library(askpass)

#Tambien se puede realizar desde Packages> se coloca un visto en 
#la libreria deseada




#help
#para obtener ayuda sobre un paquete, funcion, etc, se usa:
# ?nombre de la funcion, help(nombre de la funcion)
?matrix
help(matrix)
??GGally

## tambien desde la opciÃ³n help



#Creando vectores
# Un vector es un elemento basico en la estructura de R,
#tiene solo una dimension y de un solo tipo
x=2

2->x

z<-3 

#Operador de asignación
#alt + guion (<-)

a<- c("Anio1", "Anio2", "Anio3", "Anio4") 

b <- c(2000, 1150, 1190, 2010)


z <- c("hola", 1.2)


#  caracter > complejo > numerico > entero > logico



###Uniendo mis vectores###
## Tienen que ser de la misma dimension
##Se usa la funcion data.frame

PIB_POR_ANIOS <- data.frame(a,b)

#Si quiero observar los datos: View(nombre del objeto)
View(PIB_POR_ANIOS)

#PIB POR ANIOS ---- ERROR

#cambiando el nombre  a las columnas y filas
colnames(PIB_POR_ANIOS) <- c("Anios","PIB")
rownames(PIB_POR_ANIOS) <- c("fila1", "fila2", "fila3","fila4")

# Como copiar y pegar datos ---- tambien se puede importar pero se 
#observara mas adelante


crecimiento_desempleo<- read.delim("clipboard", dec=",") 
View(crecimiento_desempleo)




#Operaciones aritmeticas -, +,*, /, ^ 

#PIB nominal
#Producto 1=2000  Precio= 3
#Producto 2= 3000 Precio 4


(2000*3)+(3000*4)


#IPC aÃ±o1= 0.36   IPC anio2= 0.55

#inflacion= (IPC anio actul-IPC anio anterior)/IPC anio anterior

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

anio1 <- 125
anio2 <- 314
anio3 <- 123


#OPERADORES LOGICOS
#Los operadores logicos son: "y", "o", "no" 
#& 
# | 
#! 

anio1>anio2

anio1<anio2 & anio2<anio3








#PALABRAS RESERVADAS
#Existen palabras reservadas con las que no se puede nombrar a los
#objetos
help("reserved")


#Imprimiendo objetos 
#Con esto se logra visualizar en la consola los objetos creados 
##De forma explicita
print(PIB_POR_ANIOS)
##De forma implicita
PIB_POR_ANIOS



# R es sensible a mayusculas y minusculas
#Por ejemplo si para imprimir objetos pondria PIB_por_Anios- 
#sale error




#Borrando variables
##Por si se desea liberar espacio en la RAM
#Borrando un objeto
rm(z)
#Borrando mÃ¡s de un objeto
rm(list = c("x","y"))










