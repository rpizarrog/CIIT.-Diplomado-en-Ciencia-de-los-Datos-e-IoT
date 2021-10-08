# Manejo de listas
numeros <- c(1,4,5,6)
numeros

nombres <- c("Ruben", "Javer", "Jose")
nombres


milista <- c(list(numeros), list(nombres))
milista

# Convertir listas vectores
losnumeros <- unlist(milista[[1]])
losnumeros


class(milista)


# De ejemplo de WEB
my_list <- list(l1 = c(1, 3, 5, 7),                
                l2 = c(1, 2, 3),                    
                l3 = c(1, 1, 10, 5, 8, 65, 90))   

my_list

# Apply unlist R function
print(unlist(my_list)) 


