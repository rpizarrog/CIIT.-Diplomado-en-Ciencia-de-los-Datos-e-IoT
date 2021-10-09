# install.packages("fdth")
library(fdth)

# Tablas de frecuencias

# Tablas de frecuencias para datos cuantitativos
edades <- c(45, 45, 30, 34, 54, 65, 45, 65, 45, 43, 45, 54, 20, 25, 50, 40, 54, 23, 32)
tabla <- fdt(edades, 
             start = min(edades), 
             end = max(edades)+10, 
             h = 10)
tabla


hist(edades)


# Tablas de frecuecias para datos cualtitativos


