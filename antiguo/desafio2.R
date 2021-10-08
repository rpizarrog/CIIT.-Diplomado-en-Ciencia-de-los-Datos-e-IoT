# Desafío
# Desarrollar y ejecutar un programa que recorra 
# una variable por medio de un bucle desde uno hasta 20 
# e imprimir un mensaje de saludo de una variable, 
# al llegar al número 15 imprimir un segundo mensaje y 
# continuar con el recorrido.

mensaje1 <- "Hola estamos en ciclo"
mensaje2 <- "Otro mensaje"
for(i in 1:20) {
  if (i<15) {
    cat(mensaje1, i, "\n") 
  } else {
    cat(mensaje2, i, "\n")
  }
}

