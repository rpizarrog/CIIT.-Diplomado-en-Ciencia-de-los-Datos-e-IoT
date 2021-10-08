# Coerción = casting = convertir

var <- 7
var.c <- as.character(var)

var
var.c


res <- 4 + 6.5
is.integer(res)
# [1] FALSE
is.double(res)
# TRUE

is.integer(as.integer(5) + as.integer(7))





