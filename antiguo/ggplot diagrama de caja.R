# Diagrama de caja o bigote con ggplot

# Construir los datos de personas profesiones y edades
edades1 <- round(rnorm(n = 50, mean = 18, sd = 2))
edades2 <- round(rnorm(n = 25, mean = 30, sd = 5))
edades3 <- round(rnorm(n = 25, mean = 50, sd = 10))

edades <- c(edades1, edades2, edades3)
edades

profesiones <- c("ABOGADO", "MEDICO", "INGENIERO", "LICENCIADO", "AGRONOMO")


profesionistas <- sample(x = profesiones, 
                         size = 100,prob = c(0.40, 0.10, 0.30, 0.15, 0.05), 
                         replace = TRUE)

personas <- data.frame(profesionistas, edades)
personas


# Factorizar profesionistas
personas$profesionistas <- factor(personas$profesionistas)


# Diagrama de caja

# Usando plot() paquete base
plot(x = personas$profesionistas, y = personas$edades)

library(ggplot2)

# Crear un diagrama de caja con plotplot

boxplot(x = personas) # del paquete base


ggplot(data = personas, mapping = aes(y = edades, 
                    fill=factor(profesionistas) ) ) +
  geom_boxplot()







