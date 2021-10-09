# Medidas de dispersión 

edades <- c(45, 45, 30, 34, 54, 65, 45, 65, 45, 43, 45, 54, 20, 25, 50, 40, 54, 23, 32)
edades


summary(edades)

# Dispersión
plot(edades)

# Varianza
varianza <- var(edades)

desv.std <- sqrt(varianza)
desv.std



# Desviación 
# sqrt(varianza)