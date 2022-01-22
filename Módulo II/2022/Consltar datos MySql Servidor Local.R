# Conectar Mysql

install.packages("RMySQL")


library(RMySQL)

usuario <- "rpizarro"
servidor <- "localhost"
bd <- "rh"


# Conectar

mysqlconnection = dbConnect(MySQL(), 
                            user = "rpizarro", 
                            password = 'rpizarro', 
                            dbname = "rh",
                            host = "localhost")

consulta = dbSendQuery(mysqlconnection, "select * from personal")

datos <- data.frame(fetch(consulta))

datos



