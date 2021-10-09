# Condicionales

num1 = 40
num2 <- 50  # Asignación
60 -> num3  # Asignación
76 -> num4

# if (expresion que compara valor con una variables o variables)
if (num1 > num2) {
  paste(num1, " es mayor que", num2)
} else {
  paste(num1, " es NO es mayor que", num2)
}

# | operador OR
if (num1 > num2 | num3 > num4)
  paste(num1, " es mayor que ",num2, " o ", num3, " es mayor que ",num4)
else
  paste(num1, " NO es mayor que ",num2, " o ", num3, " NO es mayor que ",num4)

  
# & OPERADOR AND
if (num1 < num2 & num3 < num4 ) {
  paste("Los valores de ", num1, " y ", 
    num3,"son menores que", num2, " y ", 
    num4, " respectivamente") }

# ! NEGACION
if (num1 < num2)
  paste(num1, " es MENOR que ", num2)


if (!(num1 > num2))
  paste(num1, " es MENOR que ", num2)

    
    