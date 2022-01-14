# Funciones para gráficos

# Construye diagrama de dispersión 
f_diag.dispersion <- function (datos) { 
  #datos <- data.frame(datos)
  nom.x = colnames(datos[1])
  nom.y = colnames(datos[2])
  
  ggplot() +
    geom_point(aes(x = datos[,1], y = datos[,2]), col='red') +
    geom_vline(xintercept = mean(datos[,1]), col='blue') +
    geom_hline(yintercept = mean(datos[,2]), col='blue') +
    ggtitle(label = paste("Dispersión de ", nom.x, " y ", nom.y) , 
            subtitle = paste("Media ", nom.x, " =", mean(datos[,1]), " , ", "Media ", nom.y, "=", mean(datos[,2])))
}





