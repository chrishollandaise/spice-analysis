library(readxl)

data <- read_excel("samples.csv")

View(data)
data$has_spices
has_spices = 0
no_spices = 0

for (n in data$has_spices){
  if(n==1){
    has_spices= has_spices+1}
  if(n==0){
    no_spices= no_spices+1}}
print(has_spices)
print(no_spices)

# Create data for the graph.
x <- c(has_spices,no_spices)
labels <- c("Family have spices", "Family do not have spice")
piepercent<- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent, main = "Pie chart of having spices all over the world",col = rainbow(length(x)))
legend("topright", c("Family have spices", "Family do not have spice"), cex = 0.55,
       fill = rainbow(length(x)))
has_spices_asia = 0
no_spices_asia = 0
asia = subset(data, continent == "Asia")
print(asia)
for (n in asia$has_spices){
  if(n==1){
    has_spices_asia= has_spices_asia+1}
  if(n==0){
    no_spices_asia= no_spices_asia+1}}
print(has_spices_asia)
print(no_spices_asia)

# Create data for the graph.
x <- c(has_spices_asia,no_spices_asia)
labels <- c("Family have spices", "Family do not have spice")
piepercent<- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent, main = "Pie chart of having spices in Asia",col = rainbow(length(x)))
legend("topright", c("Family have spices", "Family do not have spice"), cex = 0.55,
       fill = rainbow(length(x)))


has_spices_America = 0
no_spices_America = 0
America= subset(data, continent == "The Americas")
for (n in America$has_spices){
  if(n==1){
    has_spices_America= has_spices_America+1}
  if(n==0){
    no_spices_America= no_spices_America+1}}

# Create data for the graph.
x <- c(has_spices_America,no_spices_America)
labels <- c("Family have spices", "Family do not have spice")
piepercent<- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent, main = "Pie chart of having spices in The Americas",col = rainbow(length(x)))
legend("topright", c("Family have spices", "Family do not have spice"), cex = 0.55,
       fill = rainbow(length(x)))

has_spices_Africa = 0
no_spices_Africa = 0
Africa= subset(data, continent == "Africa")
for (n in Africa$has_spices){
  if(n==1){
    has_spices_Africa= has_spices_Africa+1}
  if(n==0){
    no_spices_Africa= no_spices_Africa+1}}

# Create data for the graph.
x <- c(has_spices_Africa,no_spices_Africa)
labels <- c("Family have spices", "Family do not have spice")
piepercent<- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent, main = "Pie chart of having spices in Africa",col = rainbow(length(x)))
legend("topright", c("Family have spices", "Family do not have spice"), cex = 0.55,
       fill = rainbow(length(x)))


has_spices_Europe = 0
no_spices_Europe = 0
Europe= subset(data, continent == "Europe")
for (n in Europe$has_spices){
  if(n==1){
    has_spices_Europe= has_spices_Europe+1}
  if(n==0){
    no_spices_Europe= no_spices_Europe+1}}

# Create data for the graph.
x <- c(has_spices_Europe,no_spices_Europe)
labels <- c("Family have spices", "Family do not have spice")
piepercent<- round(100*x/sum(x), 1)

# Plot the chart.
pie(x, labels = piepercent, main = "Pie chart of having spices in Europe",col = rainbow(length(x)))
legend("topright", c("Family have spices", "Family do not have spice"), cex = 0.55,
       fill = rainbow(length(x)))

print(has_spices_asia)
print(no_spices_asia)
print(has_spices_America)
print(no_spices_America)
print(has_spices_Africa)
print(no_spices_Africa)
print(has_spices_Europe)
print(no_spices_Europe)

#create the data
spices <- c(rep("yes",has_spices_asia),rep("no",no_spices_asia),
            rep("yes",has_spices_America),rep("no",no_spices_America),
            rep("yes",has_spices_Africa),rep("no",no_spices_Africa),
            rep("yes",has_spices_Europe),rep("no",no_spices_Europe))
continent <- c(rep("asia",has_spices_asia+no_spices_asia),
               rep("america",has_spices_America+no_spices_America),
               rep("africa",has_spices_Africa+no_spices_Africa),
               rep("europe",has_spices_Europe+no_spices_Europe))

#putting those data into table
data <- data.frame(continent, spices)

#make the hemoglobin in the order
data$spices <- ordered(data$spices, levels=c("yes","no"))

#check the data frame
head(data)
dim(data)
n <- dim(data)[1]
data[sample(n,10),]

#Creating a summary table
table <- table(data$continent,data$spices)
table

#Chi sq test
chisq.test(table)