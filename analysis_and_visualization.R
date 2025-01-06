library(readr)
gpa_iq <- read_csv("gpa_iq.csv")
df <- gpa_iq

#Is there is a correlation between GPA and IQ?

#check the data - if it is normal or not

# Create the histogram
hist <- hist(df$gpa, freq = TRUE, 
                  col = "blue", main = "Histogram of GPA",
                  xlab = "GPA", ylab = "Frequency")

# Calculate mean and standard deviation of the data
mean_gpa <- mean(df$gpa)
sd_gpa <- sd(df$gpa)

#Measure values for normal curve
x_values <- seq(min(df$gpa), max(df$gpa), length = 100)
normal_curve <- dnorm(x_values, mean = mean_gpa, sd = sd_gpa)

# Scaling the normal curve to match it to the frequency
scaled_normal_curve <- normal_curve * diff(hist$breaks[1:2]) * sum(hist$counts)

# Adding the normal curve to the histogram
lines(x_values, scaled_normal_curve, col = "red", lwd =2)

# Plot followed by trend line
plot(df$iq, df$gpa, xlab = "IQ", ylab = "GPA", main = "Scatterplot of IQ and GPA")  
abline(lm(df$gpa ~ df$iq), col = "red") 

