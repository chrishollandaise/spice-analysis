# importing anova test.csv
data = read.csv("anova_test.csv", header = TRUE)

# conduct and print out results of anova test
one.way = aov(data$income~data$spice_range)
summary(one.way)

# Information about anova groups
# Group: 0-4 Variance: 1226906.8884493671 n=80
# Group: 5-8 Variance: 3917726.7826086953 n=23
# Group: 9-16 Variance: 1952047.5236842106 n=20
# Group: 17-52 Variance: 2151885.412087912 n=14