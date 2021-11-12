# K Means con los datos de airquality

# lOS DATOS

datos <- airquality # Air NY

datos


# **************************
# PREPARAR LOS DATOS
# Transformar los NA y poner la mediana de cada columna según sea el caso

median(datos$Ozone, na.rm = TRUE)

# Modificar el valor cuando existe un NA y sobreescribe datos
datos <- mutate(.data = datos, Ozone = ifelse(is.na(Ozone), 
                                              median(datos$Ozone, na.rm = TRUE), Ozone))
datos <- mutate(.data = datos, Solar.R = ifelse(is.na(Solar.R), 
                                                median(datos$Solar.R, na.rm = TRUE), Solar.R))
datos <- mutate(.data = datos, Wind = ifelse(is.na(Wind), 
                                             median(datos$Wind, na.rm = TRUE), Wind))
datos <- mutate(.data = datos, Temp = ifelse(is.na(Temp), 
                                             median(datos$Temp, na.rm = TRUE), Temp))
datos <- mutate(.data = datos, Month = ifelse(is.na(Month), 
                                              median(datos$Month, na.rm = TRUE), Month))
datos <- mutate(.data = datos, Day = ifelse(is.na(Day), 
                                            median(datos$Day, na.rm = TRUE), Day))


# Datos listos
datos


# MODELO

modelo <- kmeans(x = datos, 
                 centers = 3, 
                 iter.max = 5)

summary(modelo)


modelo$cluster


datos <- mutate(datos, nuevo_grupo = modelo$cluster)
datos


# Conocer las medias por grupos por columna

tabla.medias <- group_by(datos, nuevo_grupo) %>%
  summarise(m.Ozone = mean(Ozone),
            m.Solar.R = mean(Solar.R),
            m.Wind = mean(Wind), 
            m.Temp = mean(Temp))








