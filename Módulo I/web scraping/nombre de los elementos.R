# Obtener nombre de los elementos
url <- "https://rvest.tidyverse.org/articles/starwars.html"
html <- read_html(url)
html %>%
  html_element("div") %>%
  html_children() %>%
  html_name()