# Crear un vector de nombres
# y Acceder a posiciones con los valores del vector
nombres = c("Julio Eliud Ayala Reyes",
"Simón Sánchez Trinidad",
"Armando De La Hoya Lazalde", 
"MIGUEL ANGEL GUERRERO CRESPO",
"Aldo Daniel Sánchez Ruelas",
"Ana Victoria Santes Palacios",
"José de Jesús Santes Palacios",
"Miguel Angel Elizalde Cruz",
"Sergio Alejandro Pérez Rodríguez",
"Francisco Javier Hernández Hernández",
"José Rubén Espino Nájera",
"Efrén Armando Osorio Ramírez",
"Héctor Eduardo Arellano Cárdenas",
"JUAN CARLOS HERNÁNDEZ VALENZUELA",
"Rafael Chaidez Rosas",
"Williams Zumaya Higuera",
"Adriana González Arano",
"Omar Moreno Garibaldi",
"Antonio Meza arellano",
"MARIA CRISTINA VAZQUEZ OLVERA",
"Ricardo Aguilar Garay",
"Jaime Garcia Espejel",
"José Alonso Nochebuena Mercado",
"Carlos Antonio Diaz Castañeda",
"Marily Méndez Espino")


# Acceder
nombres[16]

nombres[c(1,2,3,4,5)]

nombres[10:15]


# Preguntar por algún nombre
posicion = which(nombres == 'Héctor Eduardo Arellano Cárdenas')

nombres[posicion]

