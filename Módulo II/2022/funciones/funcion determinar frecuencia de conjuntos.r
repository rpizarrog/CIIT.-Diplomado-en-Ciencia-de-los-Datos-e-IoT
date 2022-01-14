fdeterminar.frecuencia <- function(n, N) {
  frecuencia <- round(n/N * 100, 2)
  paste(frecuencia, "%")
}