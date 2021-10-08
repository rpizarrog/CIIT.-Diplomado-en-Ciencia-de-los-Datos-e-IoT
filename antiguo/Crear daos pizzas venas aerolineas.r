# Cargar datos Pizzas
restaurantes <- c(1:10)
estudiantes <- c(2,6,8,8,12,16,20,20,22,26)
ventas <- c(58,105,88,118,117,137,157,169,149,202)

datos.pizzas <- data.frame(restaurantes,estudiantes,ventas)
datos.pizzas


semanas <- c(1:10)
comerciales <- c(2,5,1,3,4,1,5,3,4,2)
ventas <- c(50,57,41,54,54,38,63,48,59,46)

datos.ventas <- data.frame(semanas,comerciales,ventas)
datos.ventas


datos.aerolineas <- read_csv("~/Mis clases ITD/Semestre Enero Junio 2020/Analisis Inteligente de Datos/datos/rutas millas tarifas de vuelos.csv")


write.csv(datos.pizzas, file = "datos/pizzas.csv")
write.csv(datos.ventas, file = "datos/ventas.csv")
write.csv(datos.aerolineas, file = "datos/aerolineas.csv")


