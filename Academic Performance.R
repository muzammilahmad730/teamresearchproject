setwd("C:/Users/Venom/Desktop/R")
data <- read.csv("gpa_iq.csv")
head(data)
summary(data)
str(data)
colSums(is.na(data))


plot(data$gpa, data$iq, main = "Scatter Plot: GPA vs IQ",
     xlab = "GPA",
     ylab = "IQ",
     col = "blue",
     pch = 19)
  
hist(data$gpa, main = "GPA Distribution", xlab = "GPA",
     col = "skyblue",
     border = "black")

hist(data$iq, main = "IQ Distribution", xlab = "IQ",
     col = "lightgreen",
     border = "black")


mean_gpa <- mean(data$gpa)
sd_gpa <- sd(data$gpa)


hist(data$gpa, main = "GPA Distribution with Normal Distribution Overlay", xlab = "GPA", 
     col = "skyblue", 
     border = "black", 
     breaks = 50,   
     probability = TRUE,   
     ylim = c(0, 0.5))    

curve(dnorm(x, mean = mean(data$gpa), sd = sd(data$gpa)),
      col = "red",
      lwd = 4,
      add = TRUE)  
       
    


