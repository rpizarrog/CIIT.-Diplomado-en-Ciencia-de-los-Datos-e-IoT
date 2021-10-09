# Acceder a elementos de vectores 
# Crear una función para crear datos
f.crear.nombres.edades.procedencias <- function() {
  c(50, 43, 24, 54, 65, 76) -> edades
  c("Rubén", "Paty", "Olga", "Luis", "MAry", "Jorge") -> nombres
  procedencias <- c("CD JUAREZ", "DURANGO", "QUERETARO", "TIJUANA", "MULEGE", "MAZATLAN")
  
  
  datos <- data.frame(nombres, edades, procedencias)
  datos
}


# Cargar una función creada previamente y 
# almacenada en Disco Duro