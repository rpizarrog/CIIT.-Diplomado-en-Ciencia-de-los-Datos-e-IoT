# Manejo de matrices
matA <- matrix(nrow = 3, ncol = 4, 
               data = 1:12, byrow = TRUE)
matA

# Acceder a los elementos de una matriz
matA[1,]

matA[2,2]

matA[3,4]

matMult <- matA * 2
matMult

matB <- matrix(nrow = 4, ncol = 3, 
                data = 1:12, byrow = FALSE)
matB

matA[2,]



A.por.B <- matA %*% matB
A.por.B


# 1 + 4 + 9 + 16 ....



