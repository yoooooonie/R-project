fah <- readline("Fahrenheit ?")
fah <- as.numeric(fah)
print(paste("Fahrenheit=", fah))
cel <- (fah-32)/1.8
print(paste("Celsius=",cel))