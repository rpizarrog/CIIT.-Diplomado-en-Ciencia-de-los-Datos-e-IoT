# install.packages("fdth")
library(fdth)

# Tablas de frecuencias

# Tablas de frecuecias para datos cualtitativos

estados <- c("DURANGO", "DURANGO", "VERACRUZ", "PUEBLA", 
            "QUERETARO", rep("BAJA CALIFORNIA SUR", 4), 
            "CD. MEXICO", "CD. MEXICO", "DURANGO", "PUEBLA",
            "VERACRUZ", "QUERETARO")
estados


tabla <- fdt_cat(x = estados)
tabla


barplot(height = tabla$f, names.arg = tabla$Category)



            

