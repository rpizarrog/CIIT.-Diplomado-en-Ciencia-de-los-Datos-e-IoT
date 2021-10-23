# Que dicen los párrafos de un HTML

url <- "html/html parrafos.html"
html <- read_html(url, encoding = "UTF-8")

html_encoding_guess(html)


p <- html_element(html, "p") # Solo el primero
html_text(p)

html %>% html_elements("p") %>%html_text()

ps <- html_elements(html, "p") # Solo el primero
html_text(ps) # Son los párrafos