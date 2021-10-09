# Crear funciones en R
faritmeticas <- function(a, b, tipo) {
  if (tipo == 1)  { # suma 
    resultado <- a + b
  }
  if (tipo == 2) { # resta
    resultado <- a - b
  }
  if (tipo == 3) { # multiplicacion
    resultado <- a * b
  }
  if (tipo == 4) { # division
    resultado <- a / b
  }
  
  resultado # return
  
} 

# Mandar llamar la función 

faritmeticas(4,5,3)
# [1] 9

paste(" La suma de 4 y 5 es: ", faritmeticas(4,5))
# [1] " La suma de 4 y 5 es:  9"
suma <- faritmeticas(10, 20)



# Mandar llamar la función 
faritmeticas(5,6,2)
# [1] -1
faritmeticas(5,6,3)
# [1] 30
faritmeticas(5,6,4)
# [1] 0.8333333
faritmeticas(5,6,1)