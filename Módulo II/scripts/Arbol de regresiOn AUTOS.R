# ARBOLES DE REGRESIÓN

# "Se utilizan datos históricos de 2014 2015 de canciones y artistas que estuvieron en el top ranking de 'github rpizarrog' enlace: o se se prefiere del enlace
# para obtener los datos limpios y 
# preparados billboard limpios para 
# este ejercicio."

# "Se construirá un modelo basado 
# en algoritmo de árbol de 
# clasificación que permita 
# interpretar y predecir si un 
# nuevo cantante estará en el top o si
# llegará a ser el número uno en las
# listas de popularidad."

# El conjunto de datos refleja 
# cantantes y bandas que lograron
# un puesto número uno en las listas 
# de Billboard hot y se intenta
# predecir con base en nuevos datos 
# quién será el próximo top a fuerza de 
# Inteligencia Artificial y 
# específicamente machine learning 
# con árboles de decisión 
# y/o árboles de clasificación.
comentarios

# LIBRERIAS
library(readr)   # Leer datos
library(dplyr)   # Operaciones con datos, select, filter, mutate, arrange, summarize group_by %>%
library(knitr)   # Tablas amigables
library(ggplot2) # Gráficos
library(cowplot) # Varios gráficos en un mismo renglón
library(fdth)    # para el calculo de distribución de frecuencias.


# LIBRERÍAS PARA ARBOLES

# PENDIENTE
# 1. CARGAR DATOS

billboard <- read.csv("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/datos/artists_billboard_fix3.csv", 
                  encoding = "UTF-8",
                  stringsAsFactors = TRUE)

# Se trabajarán con datos y estos a su vez quedarán PREPARADOS para no perturbar los datos originales billboard
datos <- data.frame(billboard)

# 2. DESCRIIR LOS DATOS
# Se describen los datos, 
# algunas de las variables se PREPARAN ANTES, 
# se factorizan o categorizan 
# antes de presentar su gráfica de barra

summary(datos)
str(datos)

# Algunos gráficos descriptivos
# top  no top. Será la variable DEPENDIENTE
datos$top <- as.factor(datos$top)

ggplot(data = datos, aes(x=top)) +
  geom_bar(aes(x=top))

table(datos$top)
paste("Hay ", table(datos.preparados$top)[1], "del top 0", 
      " y hay ", table(datos$top)[2],"del top 1") 

# Tipo de artista género del artista
# datos$artist_type <- as.factor(datos$artist_type)

ggplot(data = datos, aes(x=artist_type)) +
  geom_bar(aes(x=artist_type))

table(datos$artist_type)
paste("Hay ", table(datos$artist_type)[1],
    " y hay ", table(datos$top)[2],
    " y hay ", table(datos$top)[3]) 

# mood = Clasificación de tipo de música conforme
# a estados de ánimo de acuerdo a 
# estudios psicológicos

#datos$mood <- as.factor(datos$mood)

ggplot(data = datos, aes(x=mood)) +
  geom_bar(aes(x=mood))

arrange(transform(table(datos$mood)), desc(Freq))

# Los primeros seis con head()
ggplot(data = head(arrange(transform(table(datos$mood)), desc(Freq))), aes(x=Var1, y=Freq)) +
  geom_col()

# tempo = ritmo
# datos$tempo <- as.factor(datos$tempo)

arrange(transform(table(datos$tempo)), desc(Freq))

ggplot(data = datos, aes(x=tempo)) +
  geom_bar(aes(x=tempo))
 

# genre Género musical
# datos$tempo <- as.factor(datos$genre)
# Soundtrack = banda sonora
arrange(transform(table(datos$genre)), desc(Freq))

ggplot(data = datos, aes(x=genre)) +
  geom_bar(aes(x=genre))


# Que hay con agnioNacimento
# Convertir a factor el agnioNacimiento
datos$anioNacimiento <- as.factor(datos$anioNacimiento)

summary(datos)

arrange(transform(table(datos$anioNacimiento)), desc(Freq))

ggplot(data = datos, aes(x=subsrt(anioNacimiento,3,2)) )+
  geom_bar(aes(x=substr(anioNacimiento,3,4)))


# 3. PREPARAR LOS DATOS
# agnioNacimiento
# ¿Que se hace con los años de nacimiento de los artistas?
# Algunos son ceros
# Se requiere un Método de Reconstrucción Estadístico para saber que se hace con
# años de nacimiento de los artistas. 
# Poner valores aleatorios random de una distribución normal 
# porque se comportan bajo esa distribución ("normal") 
# Se agrega una nueva variable llamada datos$anioNacimiento.numero

datos$top <- as.factor(datos$top)
datos$anioNacimiento <- as.factor(datos$anioNacimiento)
datos$anioNacimiento.numero <- as.numeric(as.character(datos$anioNacimiento))
summary(datos)


# A partir de la nueva columna anioNacimiento.numero se agrega Na cuando es IGUAL A CERO
datos <- mutate(datos, anioNacimiento.numero = ifelse(anioNacimiento.numero == 0, NA, anioNacimiento.numero))
summary(datos)
# Se generan media y desviación de los años de nacimiento 
# QUITANDO LOS NA, es decir no contemplando los registros en donde hay NA 
# en el valor del agnioNacimiento.numero
media.agnio.nac <- mean(datos$anioNacimiento.numero, na.rm = TRUE)
desv.agnio.nac <- sd(datos$anioNacimiento.numero, na.rm = TRUE)

# ¿Cómo es la distribución de los datos de fecha de nacimiento?
# Es normal ?? SI
# La variable temporal será un data.frame temporal que serán todas los
# años de nacimiento de los artistas del conjunto de datos que 
# hay edad MAYOR  a cero
# Se muestra su histograma y se observa su comportamiento que es una distribución normal

temporal <- select(datos, anioNacimiento.numero) %>%
  filter(anioNacimiento.numero > 0)
ggplot(data = temporal, mapping = aes(x = anioNacimiento.numero)) +
    geom_histogram(bins = 30)

# Se generan 139 valores aleatorios de una distribución normal
# Generados a partir de la media y desviación 
# de registros que si tienen fecha de nacimiento
# Con mutate se transforma cada valor que no tiene fecha de nacimiento 
# un valor que si tienen conforme a un número aleatorio }
# que está entre la media y la desviación

set.seed(2021)
#anios.rnd.normal <-round(rnorm(n = 139, mean = media.agnio.nac, sd = desv.agnio.nac),0)

datos <- mutate(datos, anioNacimiento.numero = 
                  ifelse(is.na(anioNacimiento.numero), 
                         round(rnorm(n = 1, mean = media.agnio.nac, sd = desv.agnio.nac),0), 
                         anioNacimiento.numero))

# MAPEO DE DATOS 
# Como parte de la preparación de loS datos hay que recodificar algunas
# valoreS de algunas variables, esto es mapear datos CON ALGUNOS CODIGOS CONSISTENTES

# mood = Clasificación de tipo de música conforme
# a estados de ánimo de acuerdo a 
# estudios psicológicos
# hay 23 estados de ánimo de la música

unique(datos$mood) 

# Se recategorizan en 6

otras <- c('Other') # 0
amistad <- c('Easygoing', 'Peaceful' ) # 1
romance <- c('Sensual', 'Romantic') # 2
coraje <- c('Defiant', 'Gritty','Urgent' ) # 3
deseo <- c('Yearning', 'Sophisticated', 'Aggressive', 'Fiery', 'Rowdy','Sentimental', 'Melancholy', 'Brooding') # 4
frescas <- c('Cool', 'Excited','Upbeat', 'Stirring', 'Lively') # 5
energia <- c('Energizing','Empowering')   # 6 

# Un tibble para ver la clasificación
texto = list(otras, amistad, romance, 
             coraje, deseo, frescas, energia)
mood.codigo <- tibble(cod = 0:6, 
                          mood = c('otras', 'amistad', 'romance',
                                   'coraje', 'deseo', 'frescas', 'energia'),
                          txt = texto)

# Se agrega colum a después de mood
datos <- mutate(datos, mood.cod = NA, .after = mood)
datos <- mutate(datos, mood.cod = ifelse(mood %in% energia, 6,mood.cod))
datos <- mutate(datos, mood.cod = ifelse(mood %in% frescas, 5,mood.cod)) 
datos <- mutate(datos, mood.cod = ifelse(mood %in% deseo,4, mood.cod))
datos <- mutate(datos, mood.cod = ifelse(mood %in% coraje, 3,mood.cod))
datos <- mutate(datos, mood.cod = ifelse(mood %in% romance, 2,mood.cod)) 
datos <- mutate(datos, mood.cod = ifelse(mood %in% amistad,1, mood.cod))
datos <- mutate(datos, mood.cod = ifelse(mood %in% otras,0, mood.cod))


# tempo
# Slow Tempo valor de 0,
# Medium Tempo valor de 1,
# Fast Tempo valor de 2
unique(datos$tempo)

datos <- mutate(datos, tempo.cod = NA, .after = tempo)
datos <- mutate(datos, tempo.cod = ifelse(tempo == 'Slow Tempo', 0,tempo.cod))
datos <- mutate(datos, tempo.cod = ifelse(tempo == 'Medium Tempo', 1,tempo.cod))
datos <- mutate(datos, tempo.cod = ifelse(tempo == 'Fast Tempo', 2,tempo.cod))

# genre # Clasificación de género musical
# SounTrack, Jazz, Other valor de 0,
# Electronica, Rock valor de 1,
# Alternative Punk valor de 2
# Por Urban valor de 3
unique(datos$genre)

sonora <- c('Soundtrack', 'Jazz', 'Other') # 0
rock <- c('Rock', 'Electronica', 'Alternative & Punk') # 1
tradicional <- c('Traditional' ) # 2
pop <- c('Urban', 'Pop' ) # 3

# Un tibble para ver la clasificación
texto = list(sonora, rock, tradicional, pop)
genre.codigo <- tibble(cod = 0:3, 
                      genre = c('sonora', 'rock', 'tradicional','pop'),
                      txt = texto)

datos <- mutate(datos, genre.cod = NA, .after = genre)
datos <- mutate(datos, genre.cod = ifelse(genre %in% sonora, 0,genre.cod))
datos <- mutate(datos, genre.cod = ifelse(genre %in% rock, 1,genre.cod))
datos <- mutate(datos, genre.cod = ifelse(genre %in% tradicional, 2,genre.cod))
datos <- mutate(datos, genre.cod = ifelse(genre %in% pop, 3,genre.cod))


# artist_type
# Mixed ambos géneros cantan valor = 1
# Female Femenono valor = 2
# Male MAsculino valor = 3

unique(datos$artist_type)

datos <- mutate(datos, artist_type.cod = NA, .after = artist_type)
datos <- mutate(datos, artist_type.cod = ifelse(artist_type == 'Mixed', 1,artist_type.cod))
datos <- mutate(datos, artist_type.cod = ifelse(artist_type == 'Female', 2,artist_type.cod))
datos <- mutate(datos, artist_type.cod = ifelse(artist_type == 'Male', 3,artist_type.cod))

# durationSeg
# La duración de la canción 

frecuencias <- fdt(x = datos$durationSeg, start = min(datos$durationSeg), 
                   end = max(datos$durationSeg), h = 30)
frecuencias

# <= 150 Valor de 0
# > 150 <= 180 valor de 1
# > 180 <= 210 valor de 2
# > 210 <= 240 valor de 3
# > 240 <= 270 valor de 4
# > 270 <= 300 valor de 5
# > 300 valor de 6

# Clasificar o codificar cada 30 seg aprox..
datos <- mutate(datos, durationSeg.cod = NA, .after = durationSeg)
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg <= 150, 0, durationSeg.cod))
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg > 150 &  durationSeg <= 180, 1, durationSeg.cod))
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg > 180 &  durationSeg <= 210, 2, durationSeg.cod))
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg > 210 &  durationSeg <= 240, 3, durationSeg.cod))
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg > 240 &  durationSeg <= 270, 4, durationSeg.cod))
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg > 270 &  durationSeg <= 300, 5, durationSeg.cod))
datos <- mutate(datos, durationSeg.cod = ifelse(durationSeg > 300, 6, durationSeg.cod))


# Mapping edad en la que llegaron al billboard
# restar el agnio de billboara la fecha de nacimiento year(chart_date) - year(anioNacimiento.numero)
# agnio.chart_date.numero - agnioNacimiento.numeri
# agnio.chart_date.numero, age y age_code

datos <- mutate(datos, agnioChar_date.numero = as.numeric(substr(as.character(chart_date),start = 1,stop = 4)),
                .after = chart_date)
datos <- mutate(datos, age = agnioChar_date.numero - anioNacimiento.numero)

# Códigos de age edad
# MENOR O IGUAL a 21 Valor = 0
# MAYOR DE 21  y MENOR o IGUAL 30 Valor = 1
# MAYOR DE 31  MENOR o IGUAL 40 Valor = 2
# MAYOR DE 30  y MENOR o IGUAL 36 Valor = 3
# MAYOR DE 36  y MENOR o IGUAL 41 Valor = 4
# MAYOR DE 41  y MENOR o IGUAL 46 Valor = 5
# MAYOR DE 46  y MENOR o IGUAL 51 Valor = 6
# MAYOR DE 51  y MENOR o IGUAL 56 Valor = 7
# MAYOR DE 56  y MENOR o IGUAL 61 Valor = 8
# MAYOR DE 61 Valor de 9


frecuencias <- fdt(x = datos$age, start = min(datos$age), end = max(datos$age), h = 4)
frecuencias
# Se clasifica de 4 en cuatro .... años

# Clasificar cada 4 años aprox..
datos <- mutate(datos, age.cod = NA, .after = age)
datos <- mutate(datos, age.cod = ifelse(age <= 21, 0, age.code))
datos <- mutate(datos, age.cod = ifelse(age > 21 & age <= 26, 1, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 26 & age <= 31, 2, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 31 & age <= 36, 3, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 36 & age <= 41, 4, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 41 & age <= 46, 5, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 46 & age <= 51, 6, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 51 & age <= 56, 7, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 56 & age <= 61, 8, age.cod))
datos <- mutate(datos, age.cod = ifelse(age > 61 , 9, age.cod))


datos.billboard.limpios <- select(datos, id, title, artist,
                                 mood, artist,mood.cod, tempo, tempo.cod, genre, genre.cod, 
                                 artist_type, artist_type.cod, durationSeg,durationSeg.cod, 
                                 chart_date, agnioChar_date.numero, 
                                 anioNacimiento, anioNacimiento.numero, age, age.cod, top)


# HASTA AQUI ES EL PROCESO DE LIMPIEZA 
# Se pueden tan solo cargar los datos ya LIMPIOS
# CARGAR DATOS LIMPIOS
datos <- read.csv("https://raw.githubusercontent.com/rpizarrog/diplomado-cd-iot-2021/main/datos/billboard_limpios.csv", 
                  sep = ',', stringsAsFactors = TRUE)
datos


# 4. DATOS DE ENTRENAMIENTO Y DATOS DE VALIDACIÓN



# 5. GENERAR EL ARBOL


# 6.  INTERPRETAR EL ARBOL


# 7. REALIZAR PREDICCIONES


# 8. INTERPRETACIÓN DEL ALGORITMO




