#--------CONGRESO INTERNACIONAL DE ECONOMIA II--------
#--------INTRODUCCION A LA PROGRAMACION EN R--------

#Operaciones matematicas sencillas
#Operadores aritmeticos
1+2
1/2
2*3

#Asignar valores 
#Existen dos formas de asignar valores dentro de R
x=3
x

#Utilizamos el operador de asignacion que es " <- "
x <- 4
x

#En este caso observamos que nuestra variable es numerica
#Si queremos saber que tipo de variable es x
class(x)

#Otro ejemplo
y = 1:100
y = y/10

#Podemos realizar un grafico utilizando un plot sencillo
plot(cos(y))

#Si le asignamos a 'y' un objeto que no es numerico
#obtenemos otro tipo de variable
y <- "Hola soy y"
class(x)

#Operadores comparativos
x <- 5
y <- 2

# Ahora le preguntamos a R si x es mayor que y 
x > y
x < y
x == y 
x != y

#------VECTORES------
#Son secuencias de objetos de la misma clase atómica
#Usamos la función combinar 'c()' para crear vectores

c(4,2,-8) #Hemos creado un vector sin asignarlo a una variable 

#Podemos asignarlo de varias formas
u <- c(4,2,-8)
assign("v", c(4,2,-8))
p = c(4,2,-8)

#Ahora formemos un vector asignandole un nombre para acceder 
#por medio de ese nombre a los elementos individuales del vector

frutas <- c(15, 100, 2, 30)
frutas

#Asociemos esos valores con el nombre de la fruta 
names(frutas) <- c("naranja", "pera", "manzana", "durazno")
frutas

#Otra forma de nombrar los elemento de un vector
frutas <- c(naranja=15, pera=100, manzana=2, durazno=30)
frutas

#Podemos acceder a los elementos individuales del vector mediante su nombre
frutas["durazno"]

#Para cambiar el valor de una de las frutas 
frutas["naranja"] <- 25
frutas

#Operaciones sencillas con vectores
w <- 2 + 3 # Resulta en un vector de longitud 1
w

w <- c(2, 3) - c(5, 1) # Resulta en un vector de longitud 2
w

v <- c(4, 5, 6, 7, 8, 9, 10) * c(1, 2, 1, 2, 1, 2, 1)
v

v <- c(2, -3, 4)
w <- 2 * (v^2) # Dos veces el cuadrado de v
w

#------MATRICES------
#Una matriz es una tabla bidimensional de números en cantidades abstractas  
#Para R, una matriz es un vector con un atributo adicional: dim

#Formemos un vector con 20 números
m <- 11:30

# Para convertirlo en matriz simplemente se especifica el
# atributo dim
dim(m) <- c(4, 5) # 4 renglones y 5 columnas
m

#Le preguntamos a R que tipo de variable es m
class(m)

#Cambiamos la dimension de la matriz
dim(m) <- c(5, 4) # ahora 5 renglones y 4 columnas
m

# Y el elemento en el renglon 3 y columna 2 es:
m[3, 2]
# acceso al mismo elemento, como vector, con un solo índice
m[8] 

#Otra forma de construir matrices es mediante las funciones
#rbind() y cbind(), dando ya sea los renglones individuales o las columnas individuales

m1 <- rbind(c(1, 3, -5), c(0, -1, 60))
m1

m2 <- cbind(c(1, 3, -5), c(0, -1, 60))

#Otra forma de construir matrices es mediante 
#la función primitiva matrix()
m <- matrix(11:30, nrow = 5, ncol = 4)
m

#Se les pueden asignar nombres a los renglones y las columnas de una matriz
rownames(m) <- c("uno", "dos", "tres", "cuatro", "cinco")
colnames(m) <- c("UNO", "DOS", "TRES", "CUATRO")
m

#Operaciones sencillas con matrices
#Definimos dos matrices con la misma dimension y las multiplicamos
a <- matrix(1:15, nrow = 5, ncol = 3)
a

b <- rbind(1:3, 3:1, c(1, 1, 1), c(2, 2, 2), c(3, 3, 3))
b 

a * b 




