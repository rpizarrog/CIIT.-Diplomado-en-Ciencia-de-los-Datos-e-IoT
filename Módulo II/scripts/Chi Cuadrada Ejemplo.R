# Chi Cuadrada

# Los datos
frec <- c(5,20,11,32,7,3)

# Convertirlos a matriz
frec <- matrix(data = frec, nrow = 2, ncol = 3)
frec

# Agregar columnas marginal (totales) con la función apply() y sum()
frec <- cbind(frec, apply(X = frec, 1, FUN = sum))
frec

# Agregar renglón marginal (totales) con la función apply() y sum()
frec <- rbind(frec, apply(X = frec, 2, FUN = sum))
frec

# A partir de la tabla se encuentran las frecuencias teóricas o esperadas
# En lugar de usar la fórmula ft = f * fr (primer renglón) / ft (total de dtos)
# Se usan dos grados de libertad conforme a gl = (nrow(frec) -1) * (ncol(frec) - 1)
# En realidad es menos 1 pero como se tienen renglones y columnas marginales 
# por eso se usa 2
gl = (nrow(frec) -2) * (ncol(frec) - 2)
gl

# El valor de chi cuadrada se saca con la función chisq.test(frec)
# En lugar de sumar todos las frecuencias teóricas menos las frecuencias elevadas al cuadrado
# Como lo indica la fórmula

chiq <- chisq.test(frec)
chiq
# De todos lo que genera chisq.test() interesa el statistic para poderlo comparar
# Con el valor de las tablas
chiq$statistic 

# El valor de las tablas a un porcentaje de confianza se obtiene
# Con la función qchisq(0.95,2); p es nivel de confianza y df grados de liberdas
tabla <- qchisq(p = 0.95,df = gl)
tabla

# Habiendo obtenido estos dos valores, se comparan para rechazar o aeptar la HO

H0 = "H0 No Influye"
H1 = "H1 Si Influye"

# Entonces: 

if (chiq$statistic > tabla.chiq) 
  {
    paste("Se rechaza", H0, " y se acepta", H1) 
  } else {
    paste("Se acepta", H0, "y se rechaza", H1)  
  }
  

