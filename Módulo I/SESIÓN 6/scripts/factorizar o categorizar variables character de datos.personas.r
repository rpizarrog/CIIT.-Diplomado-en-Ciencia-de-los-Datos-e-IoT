# Simular con datos.personas
source("https://raw.githubusercontent.com/rpizarrog/CIIT.-Diplomado-en-Ciencia-de-los-Datos-e-IoT/main/M%C3%B3dulo%20I/SESI%C3%93N%206/scripts/generar%20personas.r", 
       encoding = "UTF-8")

# Variables numéricas 1,2,3,4... 10.5, 3.15
# Variable character "Hola", "Saludos, "NUEVO LEÓN"
# Variables categóricas o factor
# la Función as.factor() catgoriza valores character

datos.personas$genero <- as.factor(datos.personas$genero)
datos.personas$estado <- as.factor(datos.personas$estado)
datos.personas$feliz <- as.factor(datos.personas$feliz)

summary(datos.personas)