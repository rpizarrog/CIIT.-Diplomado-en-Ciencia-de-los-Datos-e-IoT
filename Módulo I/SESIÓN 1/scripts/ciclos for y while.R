# Ciclos en R
for(i in 1:10) {
  print(i)
  if (i==5) {
    print("Es el cinco")
    break # rompe el ciclo
  }
}

for(i in 1:10) {
   print(i)
  if (i == 1 | i == 3 | i == 5 | i == 7) {
    cat(i," Es primo ")
  }

}


# while
i <- 0
while (TRUE) {
  i <- i + 1
  print(i)
  if (i == 1 | i == 3 | i == 5 | i == 7) {
    cat(i," Es primo ")
  }
  
  if (i== 10)
    break
  
}
print ("TErminamos while")




  