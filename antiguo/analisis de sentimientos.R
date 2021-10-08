# Análisis de sentimientos
# Librerías

library(readr)
library(tidyverse) # Varos paquetes readr dplyr
library(tidytext)  # Manipulación de textos
library(tm)        # Minería de datos  
library(lubridate) # Para fechas
library(zoo)       # Para visualziación de datos
library(scales)    # Para visualziación de datos

tuits <- read.csv("datos/tuits_candidatos.csv", 
                        stringsAsFactors = F, 
                        fileEncoding = "latin1") 

afinn <- read.csv("datos/lexico_afinn.en.es.csv")


# Gema para visualziaci´pn de datos
tema_graf <-
  theme_minimal() +
  theme(text = element_text(family = "serif"),
        panel.grid.minor = element_blank(),
        strip.background = element_rect(fill = "#EBEBEB", colour = NA),
        legend.position = "none",
        legend.box.background = element_rect(fill = "#EBEBEB", colour = NA))

# Separar la fecha
prueba.separados <- separate(data = tuits, into = c("Fecha", "Hora"), sep = " ", col = created_at)


tuits <- tuits %>%
  separate(created_at, into = c("Fecha", "Hora"), sep = " ") %>%
  separate(Fecha, into = c("Dia", "Mes", "Periodo"), sep = "/",
           remove = FALSE) %>%
  mutate(Fecha = dmy(Fecha),
         Semana = week(Fecha) %>% as.factor(),
         text = tolower(text)) %>%
  filter(Periodo == 2018)

tuits_afinn <- 
  tuits %>%
  unnest_tokens(input = "text", output = "Palabra") %>%
  inner_join(afinn, ., by = "Palabra") %>%
  mutate(Tipo = ifelse(Puntuacion > 0, "Positiva", "Negativa")) %>% 
  rename("Candidato" = screen_name)




tuits_afinn <- 
  tuits %>%
  unnest_tokens(input = "text", output = "Palabra") %>%
  inner_join(afinn, ., by = "Palabra") %>%
  mutate(Tipo = ifelse(Puntuacion > 0, "Positiva", "Negativa")) %>% 
  rename("Candidato" = screen_name)


