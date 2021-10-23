# Probar crear un html
library(rvest)


html <- minimal_html('<ul>
<li><a href="https://gmail.com" class="important">a</a></li>
<li class="active"><a href="https://siit.itdurango.edu.mx">b</a></li>
<li><a href="https://google.com">b</a></li>
</ul>')

html

html %>% html_elements("a") %>% html_attrs()
html %>% html_elements("a") %>% html_attr("href")
html %>% html_elements("li") %>% html_attr("class")
html %>% html_elements("li") %>% html_attr("class", default = "inactive")


# html_children  
# muestra el contenido de una 
# etiqueta html

algoenhtml <- "<ol>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ol>

<ul>
  <li>Coffee</li>
  <li>Tea</li>
  <li>Milk</li>
</ul>"
html <- minimal_html(algoenhtml)

ol <- html_elements(html, "ol")
ul <- html_elements(html, "ul")

html_children(ol)
html_children(ul)

# Descubriendo un párrafo
url <- "html/html parrafos.html"
html <- read_html(url, encoding = "UTF-8")
p <- html_elements(html, "p")

html_text(p) # Son los párrafos


# Trabajando con selectores css
html <- minimal_html("
<h1>Esto es encabezado</h1>
<h1>Esto es OTRO encabezado</h1>
<p id='first'>Esto es un párrafo con id first</p>
<p class='important'>Esto es un párrafo con etiqueta clase important</p>
")


html %>% html_elements("h1") %>%html_text()

html %>% html_elements("p") %>% html_text()
html %>% html_elements(".important") %>% html_text()
html %>% html_elements("#first") %>% html_text()
