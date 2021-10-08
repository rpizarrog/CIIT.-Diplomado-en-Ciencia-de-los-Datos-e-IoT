# Nube de palabras

library(XML)
library(RCurl)

html <- getURL("http://www.elpais.com/", followlocation = TRUE)

# Es importante hacer un "parse" del contenido html
doc = htmlParse(html, asText=TRUE)
plain.text <- xpathSApply(doc, "//p", xmlValue)
cat(paste(plain.text, collapse = "\n"))