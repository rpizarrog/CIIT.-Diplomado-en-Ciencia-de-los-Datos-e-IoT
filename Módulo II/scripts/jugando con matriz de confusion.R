# ENTNDIENDO UNA MATRIZ DE CONFUSION DE 2 x 2

matriz <- matrix(data = c(993, 107, 316, 176),
                 nrow = 2, ncol = 2,byrow =  TRUE)
matriz

accuracy <- (sum(matriz[1,1],matriz[2,2])) / sum(matriz)
accuracy

precision <- matriz[1,2] / (matriz[2,2] + matriz[1,2])
precision
