# Probando WEB Scrapping
# install.packages("rvest")
library(rvest)

url <- "http://www.bolsamadrid.es/esp/aspx/Mercados/Precios.aspx?indice=ESI100000000"
contenido <- read_html(url)
contenido <- html_nodes(contenido, "table")

contenido

length(contenido)

sapply(contenido, function(x) dim(html_table(x, fill = TRUE)))

tabla <- html_table(contenido[[5]])
tabla


class(tabla)

