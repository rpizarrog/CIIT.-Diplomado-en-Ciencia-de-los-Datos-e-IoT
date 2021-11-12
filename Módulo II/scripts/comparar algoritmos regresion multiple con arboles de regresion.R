# COMPARAR REGRESION LINEAL MULTIPLE CON ARBOLES DE REGRESION 
# Mismos datos

# **********************************************
# LIBRERÍAS
library(readr)
library(dplyr)  # select, filter, mutate, %>%, group_by sumarize
library(ggplot2)
library(caret)  # Para particionar datos install.packages("caret")

# Librerías para árboles
library(rpart) # Para crear arboles
library (MPV) # Previo install.packages("MPV")
library(tree) # Para crear arboles
library(party) # Para particionar datos
library(rpart.plot) # Para visualizar arbol


# *****************************************
# LOS DATOS
# Datos del valor económico de un jugador de fútbol internacional

datos <- read.csv("datos/fifa_datos.csv", 
                  encoding = "UTF-8")
