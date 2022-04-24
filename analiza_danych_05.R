install.packages("ggplot2")
library(ggplot2)

install.packages("tidyverse")
library(tidyverse)

install.packages("spatstat")
library(spatstat)

#1
points_rec <- data.frame(runif(200, min = 0, max = 1), runif(200, min=0, max=2))
colnames(points_rec) <- c("x", "y")


#2
ggplot(points_rec, aes(x, y)) + 
  geom_point()


#3
ggplot(points_rec, aes(x, y)) + 
  geom_point() +
  coord_fixed()

#4
r_squared <- runif(300, min = 0, max = 100)
angle <- runif(300, min = 0, max = 2*pi)

points_circle <- data.frame(sqrt(r_squared)*cos(angle), sqrt(r_squared)*sin(angle))
colnames(points_circle) <- c("x", "y")

#5
plot(disc(radius = 10))
points(points_circle$x, points_circle$y)

#6
ppp_circle <- ppp(points_circle$x, points_circle$y, window = disc(radius = 10))
quadrat.test(ppp_circle)
#p-value = 0.8328 - nie odrzucamy hipotezy zerowej

#7
circle <- disc(radius = 10)
rpoispp(lambda = 500/(pi*100), win=circle)
#469 points