# Para R Shinny buscar instalar estos paquetes y esperar ... unos minutos
install.packages(c(
  "gapminder", "ggforce", "gh", "globals", "openintro", "profvis", 
  "RSQLite", "shiny", "shinycssloaders", "shinyFeedback", 
  "shinythemes", "testthat", "thematic", "tidyverse", "vroom", 
  "waiter", "xml2", "zeallot" 
))


# Crear un primer R Shinny

library(shiny)
ui <- fluidPage(
  "Hello, world!"
)
server <- function(input, output, session) {
}
shinyApp(ui, server)



# Mensaje

mensaje <- paste("Hola saludos me llamo Rubén Pizarro Gurrola. ",
"Estamos estudiando R Shiny para desarrolar aplicaciones interactivas",
". Para aprender R Shiny se requiere conocer algo de programamación R y algo de estadística",
"y luego para estudiar Machine Lerninng",
"se requiere tanto R, estadística y algo",
"de matemáticas.")
  
mensaje

