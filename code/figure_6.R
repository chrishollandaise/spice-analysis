data <- read.csv("samples.csv")

boxplot(data$spice_number~data$continent,xlab="Continent", ylab="Number of Spices")
