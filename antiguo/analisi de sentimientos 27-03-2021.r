# Analizar un solo Tweet
library(janeaustenr)
library(readr)
library(tibble)
library(tidytext)


tuits <- c("Trabajando unidos las obras llegan a todos los mpios y logramos más para quien menos tiene. En #ElOro fortalecemos la conectividad con la pavimentación de C. Hidalgo y C. Juárez, en beneficio de 3 mil 500 habitantes.",
          "Estimado amigo @nachoperaltacol, mi solidaridad para ti, deseando que tengas una plena y pronta recuperación. 
Un abrazo a la distancia.",
          "Felicito al Ing. Rogelio Soto, por su nombramiento como Presidente del Consejo Directivo de la Unión Ganadera Regional #Durango.

Te deseo el mayor de los éxitos y reitero el compromiso de seguir generando oportunidades de desarrollo, para los ganaderos del estado.
¡Enhorabuena!",
          "Todo listo para recibir mañana al Presidente de la República, Andrés Manuel 
@lopezobrador_
.

En compañía de Carlos Sánchez director de infraestructura de 
@INSABI_mx
, visitamos el Hospital General de #GómezPalacio, supervisamos las áreas de Imagenología, Hemodinamia y Cirugía.",
          "Hoy inició la aplicación de la vacuna contra #COVID19 para adultos mayores en #GómezPalacio, sumando 29 mpios en proceso. 

Hoy en compañía del delegado 
@EdgarMorGar
 de 
@GobMxDgo
, constatamos el proceso de vacunación en la Unidad Médica #86 de 
@Tu_IMSS
, en el ejido La Esmeralda.")

datos.tuits <- data.frame(tuits)

# Quitamos los "@"
datos.tuits$tuits <- gsub(x = datos.tuits$tuits,
                          pattern = "@", replacement = "")
datos.tuits

# Quitamos los \n
datos.tuits$tuits <- gsub(x = datos.tuits$tuits,
                          pattern = "\n", replacement = "")
                          
datos.tuits

# Quitamos los #
datos.tuits$tuits <- gsub(x = datos.tuits$tuits,
                          pattern = "#", replacement = "")

datos.tuits

# Quitamos !
datos.tuits$tuits <- gsub(x = datos.tuits$tuits,
                          pattern = "!", replacement = "")

datos.tuits


# Convertilo a tibbet
tb_tuits <- tibble(datos.tuits)
tb_tuits



