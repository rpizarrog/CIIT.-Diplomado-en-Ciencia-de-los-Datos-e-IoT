# Regresión Logística multinomial


library(foreign) # Ller datos tal vez .dat
library(nnet) # Modelo de regresión multinomial
library(ggplot2) # Gráficos
library(reshape2) # Reestructurar Agregaciones ... datos 

datos <- read.dta("https://stats.idre.ucla.edu/stat/data/hsbdemo.dta")
