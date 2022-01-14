# Vectores iniciales
carreras <- c("ARQUITECTURA", "ADMINISTRACION", "BIOQUIMICA",
              "CIVIL", "ELECTRICA", "ELECTRONICA",
              "INDUSTRIAL", "INFORMATICA", "MECANICA", 
              "MECATRONICA", "SISTEMAS", "TIC","QUIMICA")
generos <- c('M', 'F')

# semilla inicial

set.seed(1) # No la necesita

getMatriculas <- function(n) {
  c(1:n)
}

getCarreras <- function(n, semilla) {
  set.seed(semilla)
  sample(carreras, n, replace = TRUE)
}

getGeneros <- function(n, semilla) {
  set.seed(semilla)
  sample(generos, n, replace = TRUE)
}

getEdades <- function(n, semilla) {
  set.seed(semilla)
  round(rnorm(n, 21,1))
}

getPromedios <- function(n, semilla) {
  set.seed(semilla)
  round(rnorm(n, 86, sqrt(12)),2)
}

getPesos <- function(generos, semilla) {
  set.seed(semilla)
  pesos <- NULL
  for (gen in generos ) {
    if (gen == 'M') {
      peso <- round(rnorm(1, 80, sqrt(10)),2) # Hombre
    }
    else {
      peso <- round(rnorm(1, 60, sqrt(5)),2)  # Mujer
    }
    pesos <- rbind(pesos, peso)
  }
  return (pesos)
}

getAlturas <- function(generos, semilla) {
  set.seed(semilla)
  alturas <- NULL
  for (gen in generos ) {
    if (gen == 'M') {
      altura <- round(rnorm(1, 180, sqrt(10)),2) # Hombre
    }
    else {
      altura <- round(rnorm(1, 160, sqrt(5)),2)  # Mujer
    }
    alturas <- rbind(alturas, altura)
  }
  return (alturas)
}

genAlumnos <- function(n, semilla) {
  alumnos <- data.frame(matricula = getMatriculas(n))
  alumnos <- cbind(alumnos, carrera = getCarreras(n,semilla))
  alumnos <- cbind(alumnos, genero = getGeneros(n,semilla))
  alumnos <- cbind(alumnos, promedio = getPromedios(n,semilla))
  alumnos <- cbind(alumnos, edad = getEdades(n,semilla))
  alumnos <- cbind(alumnos, peso = getPesos(getGeneros(n,semilla),semilla))
  alumnos <- cbind(alumnos, altura = getAlturas(getGeneros(n,semilla),semilla))
  
  rownames(alumnos) <- c(1:n)
  return(alumnos)
}