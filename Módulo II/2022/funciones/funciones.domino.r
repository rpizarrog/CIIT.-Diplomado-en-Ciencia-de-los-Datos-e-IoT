# LAs librerías necesarias
library(gtools)
library(dplyr)

# Repartir siete fichas de dominó
f.fichas.domino <- function() {
  domino <- c("0","1","2","3","4","5","6")
  fichas <- combinations(7, 2, domino, repeats.allowed = TRUE)
  
  fichas <- paste(fichas[,1], fichas[,2], sep = '')
  fichas
  
  fichas.combinadas <- data.frame(combinations(28, 7, fichas))
  names(fichas.combinadas) <- c("F1", "F2", "F3", "F4", "F5", "F6", "F7")
  
  fichas <- mutate(fichas.combinadas, VF1 = as.numeric(substr(F1,1,1))+as.numeric(substr(F1,2,2)),
                   VF2 = as.numeric(substr(F2,1,1))+as.numeric(substr(F2,2,2)),
                   VF3 = as.numeric(substr(F3,1,1))+as.numeric(substr(F3,2,2)),
                   VF4 = as.numeric(substr(F4,1,1))+as.numeric(substr(F4,2,2)),
                   VF5 = as.numeric(substr(F5,1,1))+as.numeric(substr(F5,2,2)),
                   VF6 = as.numeric(substr(F6,1,1))+as.numeric(substr(F6,2,2)),
                   VF7 = as.numeric(substr(F7,1,1))+as.numeric(substr(F7,2,2)))
  
  
  fichas <- mutate(fichas, suma = VF1+VF2+VF3+VF4+VF5+VF6+VF7)
  fichas <- select(fichas, F1, F2, F3, F4, F5, F6, F7, suma)
  fichas
  

}

f.repartir.fichas.domino <- function(fichas) {
  cuales.fichas <- sample(1:nrow(fichas), size = 1, replace = FALSE)
  repartir <- fichas[cuales.fichas,]
  repartir
}

f.n.combinaciones <- function(n,r) {
  Cn <- factorial(n) / (factorial(r) * factorial(n-r))
  Cn
}



# Generar las combinaciones llamando a la función 
# que hace las combinaciones de las 28 fichas de dominó en 
# grupos de siete
fichas <- f.fichas.domino()


# Se puede simular una repartición de siete fichas
mis.fichas <- f.repartir.fichas.domino(fichas)
