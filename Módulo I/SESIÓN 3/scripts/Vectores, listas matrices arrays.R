# Estructuras de datos

# Vectores
edades <- c(43, 54, 36, 34, 23, 43, 54)
edades

nombres <- c("Juan", "Lety", "Jesús", "Lucy", "OScar", "Pedro", "Aracely")

class(edades)
class(nombres)

n <- length(nombres) # cantidad de elementos
n

nombres[4:n]

# Ordenar
nombres[order(nombres, decreasing = FALSE)]
sort(x = nombres, decreasing = FALSE)

# Acceder a vectores
nombres
nombres[-3]

nombres[which(nombres == "Jesús")]


# Listas
milista <- list(edades, nombres)
milista

milista[[1]]

milista[[2]][1:3]


# Matrices
mimatriz <- matrix(data = c(4,3,5,4,6,5,7,6,5,2,3,4), 
                 nrow = 2, ncol = 6, byrow = TRUE)
mimatriz


matA <- matrix(c(4,3,4,5), nrow = 2, ncol = )
matA

matB <- matrix(c(3,1,2,4,5,4), nrow = 3, ncol= 2)
matB

# Agregar dos elementos a edades
edades <- c(edades, c(43,25))
edades

mat.edades <- matrix(edades, nrow = 3, 
                     ncol = 3, 
                     byrow = TRUE)
mat.edades


# Cálculo de matrices
matA <- matrix(c(4,3,4,5), nrow = 2, ncol = )
matA

matB <- matrix(c(3,1,2,4,5,4,6), nrow = 3, ncol= 2)
matB

# Multipicar matrices
matB %*% matA

matA * 2


# Acceder a elementos de una matrices
mimatriz
mimatriz[1,1]   # Renglon, Columna
mimatriz[1,c(2,4,6)]
mimatriz[2,]



nrow(mimatriz) # renglones
ncol(mimatriz) # columnas
dim(mimatriz) # dimensiones

class(mimatriz)

# Arrays o arreglos

miarreglo <- array(c(2,3,4,5,6,5,6,5,2))
miarreglo

class(miarreglo)

# cbind se utiliza para agregar un columna a un objeto
# objeto es un array
miarreglo <- cbind(miarreglo, edades)
miarreglo

# Acceder a elementos de un arreglo
miarreglo[,'edades']
miarreglo[c(2,4,6), 'edades']

# Modificar el nombre de una columna
# en arreglos
colnames(miarreglo) <- c('hermanos', 'edades')
miarreglo

# Agregar un nuevo renglon
miarreglo <- rbind(miarreglo, c(4,50))
miarreglo

miarreglo[c(2:5),c('hermanos','edades')] # renglon, columna
