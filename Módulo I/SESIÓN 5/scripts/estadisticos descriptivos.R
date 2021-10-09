# Estadística descritiva

edades <- c(-2, 199, 30, 34, 54, 65, 45, 65, 45, 43, 45, 54, 20, 25, 50, 40, 54, 23, 32)
edades

# Media de edades
# Sumar
suma <- sum(edades)

n <- length(edades)
suma
n

promedio <- suma / n
promedio

media.edades <- mean(x = edades)
promedio; media.edades

# MEDIANA
# Se ordenan los datos y se localiza el valor que está a mitad d elos datos
edades
sort(edades)

mediana.edades <- median(edades)
mediana.edades

# Dispersión de las edades
plot(sort(edades))

boxplot(edades)


# Cuartiles
edades; sort(edades)


# Cuartiles al 25% 50% = mediana, 75%
cuartiles <- quantile(x = edades, probs = c(0.25, 0.50, 0.75))
cuartiles


# Resumir los estadísticos eleentales
summary(edades)


RI <- cuartiles[3] - cuartiles[1]
RI


# MAximos y mínimos en R
max(edades)
min(edades)






