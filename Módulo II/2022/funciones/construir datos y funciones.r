library(dplyr)
set.seed(2020)

# Función para crear un conjunto d edatos que serán las personas 
fatividad.aletoria <- function(actividad, datos, size) {
  n <- nrow(datos)
  cuales <- sample(1:n, size)
  datos[cuales, actividad] = 'SI'
  datos
}

# Funcion par CASO 10
# Recibe el conjunto de datos y un nombre de variable
# Devuelve el subconjunto de datos
f.obten.subconjunto <- function(personas, variable) {
  
  if (variable == 'masculino') {
    conjunto <- filter(personas, generos == 'M') 
  }
  if (variable == 'femenino') {
    conjunto <- filter(personas, generos == 'F') 
  }
  if (variable == 'ajedrez') {
    conjunto <- filter(personas, ajedrez == 'SI') 
  }
  if (variable == 'beisbol') {
    conjunto <- filter(personas, beisbol == 'SI') 
  }
  if (variable == 'tiro.arco') {
    conjunto <- filter(personas, tiro.arco == 'SI')
  }  
  if (variable == 'pesas') {
    conjunto <- filter(personas, pesas == 'SI') 
  }
  if (variable == 'futbol') {
    conjunto <- filter(personas, futbol == 'SI')
  }   
  if (variable == 'softbol') {
    conjunto <- filter(personas, softbol == 'SI')
  }
  if (variable == 'atletismo') {
    conjunto <- filter(personas, atletismo == 'SI') 
  }
  if (variable == 'folklorico') {
    conjunto <- filter(personas, folklorico == 'SI') 
  }
  if (variable == 'tahitiano') {
    conjunto <- filter(personas, tahitiano == 'SI') 
  }  
  if (variable == 'teatro') {
    conjunto <- filter(personas, teatro == 'SI') 
  }  
  if (variable == 'rondalla') {
    conjunto <- filter(personas, rondalla == 'SI') 
  }  
  if (variable == 'pantomima') {
    conjunto <- filter(personas, pantomima == 'SI')
  }  
  
  
  conjunto 
}


nombres <- c("JUAN", "JOSÉ LUIS", "JOSÉ", "MARÍA GUADALUPE", "FRANCISCO",
             "GUADALUPE", "MARÍA", "JUANA", "ANTONIO", "JESÚS", 
             "MIGUEL ÁNGEL", "PEDRO", "ALEJANDRO", "MANUEL", "MARGARITA", 
             "MARÍA DEL CARMEN", "JUAN CARLOS", "ROBERTO", "FERNANDO", "DANIEL",
             "CARLOS","JORGE", "RICARDO", "MIGUEL", "EDUARDO", 
             "JAVIER","RAFAEL", "MARTÍN", "RAÚL", "DAVID", 
             "JOSEFINA","JOSÉ ANTONIO", "ARTURO","MARCO ANTONIO", "JOSÉ MANUEL", 
             "FRANCISCO JAVIER","ENRIQUE", "VERÓNICA", "GERARDO","MARÍA ELENA",
             "LETICIA","ROSA", "MARIO", "FRANCISCA", "ALFREDO", 
             "TERESA", "ALICIA", "MARÍA FERNANDA","SERGIO", "ALBERTO", 
             
             "LUIS", "ARMANDO","ALEJANDRA", "MARTHA","SANTIAGO", 
             "YOLANDA", "PATRICIA", "MARÍA DE LOS ÁNGELES", "JUAN MANUEL","ROSA MARÍA", 
             "ELIZABETH", "GLORIA", "ÁNGEL","GABRIELA","SALVADOR",
             "VÍCTOR MANUEL", "SILVIA", "MARÍA DE GUADALUPE", "MARÍA DE JESÚS", "GABRIEL", 
             "ANDRÉS", "ÓSCAR", "GUILLERMO", "ANA MARÍA", "RAMÓN", 
             "MARÍA ISABEL", "PABLO", "RUBEN", "ANTONIA", "MARÍA LUISA",
             "LUIS ÁNGEL", "MARÍA DEL ROSARIO", "FELIPE", "JORGE JESÚS", "JAIME",
             "JOSÉ GUADALUPE", "JULIO CESAR", "JOSÉ DE JESÚS", "DIEGO", "ARACELI",
             "ANDREA", "ISABEL", "MARÍA TERESA", "IRMA", "CARMEN", 
             "LUCÍA", "ADRIANA", "AGUSTÍN", "MARÍA DE LA LUZ", "GUSTAVO")
generos <- c('M', 'M', 'M', 'F', 'M', 
             'F', 'F', 'F', 'M', 'M', 
             'M', 'M', 'M', 'M', 'F',
             'F', 'M', 'M', 'M', 'M',
             'M', 'M', 'M', 'M', 'M', 
             'F', 'M', 'M', 'M', 'M', 
             'M', 'M', 'F', 'M', 'F', 
             'F', 'F', 'M', 'F', 'M', 
             'F', 'F', 'M', 'F', 'M', 
             'F', 'F', 'F', 'M', 'M', 
             
             'M', 'M', 'F', 'F', 'M',
             'F', 'F', 'F', 'M', 'F', 
             'F', 'F', 'M', 'F', 'M',
             'M', 'F', 'F', 'F', 'M',
             'M', 'M', 'M', 'F', 'M',
             'F', 'M', 'M', 'F', 'F',
             'M', 'F', 'M', 'M', 'M',
             'M', 'M', 'M', 'M', 'M',
             'F', 'F', 'F', 'F', 'F',
             'F', 'F', 'M', 'F', 'M'
)


# Crear conjunto  de datos personas
personas <- data.frame(nombres, generos)

# Definir actividades deportivas y Culturales
deportivas <- c("Ajedrez", "Béisbol", "Tiro con arco", "Pesas", "Fútbol", "Softbol", "Atletismo")
culturales <- c("Folklórico", "Tahitiano", "Teatro", "Rondalla", "Pantomima")


# Agregar columnas deportivas a personas
personas <- cbind(personas, "ajedrez" = "NO")
personas <- cbind(personas, "beisbol" = "NO")
personas <- cbind(personas, "tiro.arco" = "NO")
personas <- cbind(personas, "pesas" = "NO")
personas <- cbind(personas, "futbol" = "NO")
personas <- cbind(personas, "softbol" = "NO")
personas <- cbind(personas, "atletismo" = "NO")

# Agregar columnas culturles a personas
personas <- cbind(personas, "folklorico" = "NO")
personas <- cbind(personas, "tahitiano" = "NO")
personas <- cbind(personas, "teatro" = "NO")
personas <- cbind(personas, "rondalla" = "NO")
personas <- cbind(personas, "pantomima" = "NO")

# personas


personas <- fatividad.aletoria('ajedrez', personas, sample(10:15,1))
personas <- fatividad.aletoria('beisbol', personas, sample(10:25,1))
personas <- fatividad.aletoria('tiro.arco', personas, sample(10:15,1))
personas <- fatividad.aletoria('pesas', personas, sample(10:15,1))
personas <- fatividad.aletoria('futbol', personas, sample(10:25,1))
personas <- fatividad.aletoria('softbol', personas, sample(10:25,1))
personas <- fatividad.aletoria('atletismo', personas, sample(10:25,1))

personas <- fatividad.aletoria('folklorico', personas, sample(10:25,1))
personas <- fatividad.aletoria('tahitiano', personas, sample(10:15,1))
personas <- fatividad.aletoria('teatro', personas, sample(10:15,1))
personas <- fatividad.aletoria('rondalla', personas, sample(10:25,1))
personas <- fatividad.aletoria('pantomima', personas, sample(10:15,1))

