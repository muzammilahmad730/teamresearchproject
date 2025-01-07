library(readr)
gpa_iq <- read_csv("gpa_iq.csv")
df <- gpa_iq


# Create the histogram
hist <- hist(df$gpa, freq = TRUE, 
                  col = "skyblue", main = "Histogram of GPA",
                  xlab = "GPA", ylab = "Frequency")

mean_gpa <- mean(df$gpa)
sd_gpa <- sd(df$gpa)

#Measure values for normal curve
x_values <- seq(min(df$gpa), max(df$gpa), length = 100)
normal_curve <- dnorm(x_values, mean = mean_gpa, sd = sd_gpa)

# Scaling the normal curve to match it to the frequency
scaled_normal_curve <- normal_curve * diff(hist$breaks[1:2]) * sum(hist$counts)

# Adding the normal curve to the histogram
lines(x_values, scaled_normal_curve, col = "pink", lwd =2)

# Plot followed by trend line
plot(df$iq, df$gpa, xlab = "IQ", ylab = "GPA", main = "Scatterplot of IQ and GPA")  
abline(lm(df$gpa ~ df$iq), col = "pink") 

