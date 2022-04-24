#1
A <- seq(1,20)
B <- seq(20,1)
C<- A+B
C

#2
D <- seq(0,100,11)
D

#3
rivers_data <- c(sum(rivers), mean(rivers), median(rivers), var(rivers), sd(rivers), min(rivers), max(rivers)) 
rivers_data

#4
hist(rivers, breaks=20)

#5
gravity <- read.delim("gravity.txt")
gravity

#a
colnames(gravity) <- c("x", "grav_modeled", "grav_measured")
gravity

#b
install.packages("ggplot2")
library(ggplot2)

ggplot(gravity)+
  geom_line(aes(x, grav_modeled), col="red", lwd=2)+
  geom_point(aes(x,grav_measured), col="blue", size=2, shape=23)+
  labs(x="X [m]", y="gravity [mGal]")

#6
my_function <- function(x,y){
  result <- 1
  for(i in 1:y){
    result <- result * x
  }
  print(result)
  
}

my_function(3,4)

#7
table <- data.frame("imie" = c("Kasia", "Ewa", "Jan", "Piotr"),
                    "plec" = c("K","K","M","M"),
                    "kierunek" = c("GF", "GIN", "INF", "GF"),
                    "rok" = c(3,1,2,4))
table

#8
summary(diamonds)
dim(diamonds)


#9
install.packages("dplyr")
library(dplyr)

carat0.8 <- filter(diamonds, diamonds$carat>0.8)
carat0.8

#10
arrange(carat0.8, desc(carat))
