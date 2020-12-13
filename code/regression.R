library(ggplot2)
library(RColorBrewer)

data <- read.csv("samples.csv")
#Set up 
g <- ggplot(data, aes(x=spice_number, y=income)) + 
  geom_point(aes(col=continent), shape = 16, size=2) + #This plots the points 
 # geom_smooth(method="lm", col="firebrick", size=1) + #This is the line on the plot
  coord_cartesian(xlim=c(0,50), ylim=c(0, 6000)) +
  scale_colour_brewer(palette = "Dark2") +
  labs(title="Income Vs Number of Spices", y="Income", x="Number of Spices")# Add Title and Labels
plot(g)

#plot(data$spice_number, data$income)