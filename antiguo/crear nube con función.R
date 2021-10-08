crear_nube <- function(texto) {
  # texto <- readLines("datos/discurso de MH.txt")
  texto = iconv(texto, to="ASCII//TRANSLIT")
  texto = Corpus(VectorSource(texto)) 
  
  ########### LIMPIAMOS NUESTRO TEXTO CON EL COMANDO tm_map
  
  #ponemos todos los datos a minuscula (A!=a)
  discurso=tm_map(texto, tolower)
  
  #quitamos los espacios en blanco
  discurso =tm_map(discurso, stripWhitespace)
  
  #quitamos la puntuacion
  discurso = tm_map(discurso, removePunctuation)
  
  #quitamos los numeros
  discurso = tm_map(discurso, removeNumbers)
  
  #mostramos palabras vacias y genericas conectores
  stopwords("spanish")
  
  #quitamos palabras genericas
  discurso=tm_map(discurso, removeWords,stopwords("spanish"))
  
  #tambien podemos tener nuestra propia lista de palabras a quitar
  
  ############### DATA FRAME DE PALABRAS CON SU FRECUENCIA
  
  #Creamos matriz de letras
  letras= TermDocumentMatrix(discurso)
  findFreqTerms(letras, lowfreq=5)
  matrix=as.matrix(letras)
  
  #lo ordenamos y sumamos las letras de nuestra matriz
  vector <- sort(rowSums(matrix),decreasing=TRUE) 
  
  #creamos la data con las palabras y su frecuencia
  dataletras <- data.frame(word= names(vector),frequencia=vector) 
  
  # lo nombra y le da formato de data.frame
  
  
  ################ GRAFICAMOS FRECUENCIA DE LAS PALABRAS
  
  barplot(dataletras[1:10,]$freq, las = 2, names.arg = dataletras[1:10,]$word,
          col ="blue", main ="PALABRAS M?S FRECUENTES", ylab = "Frecuencia de palabras")
  
  
  ############ GRAFICAMOS LA NUBE DE PALABRAS
  wordcloud(words = dataletras$word, freq = dataletras$freq, min.freq = 2,
            max.words=70)
  
  #en el centro la palabra mas importante, 
  wordcloud(words = dataletras$word, freq = dataletras$freq, min.freq = 2,
            max.words=70, random.order=FALSE, rot.per=0.2, 
            colors=brewer.pal(8, "Dark2"))
}


texto <- readLines("datos/discurso de MH.txt")
crear_nube(texto)



