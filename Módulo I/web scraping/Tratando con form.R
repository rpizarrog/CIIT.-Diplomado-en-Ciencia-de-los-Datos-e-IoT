# Tratando con form
html <- read_html("http://www.google.com")
search <- html_form(html)[[1]]

search

search <- search %>% html_form_set(q = "web scraping", hl = "en")

# Or if you have a list of values, use !!!
vals <- list(q = "web scraping", hl = "en")
search <- search %>% html_form_set(!!!vals)

# To submit and get result:
## Not run: 
resp <- html_form_submit(search)
read_html(resp)