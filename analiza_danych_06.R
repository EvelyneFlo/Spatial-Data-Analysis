library(spatstat)
library(ggplot2)
install.packages("ggpmisc")
library(ggpmisc)

#1)
data <- murchison
data

#2)
ggplot() + 
  geom_point(aes(data$gold$x, data$gold$y), color="red")+
  geom_point(aes(data$faults$ends$x0, data$faults$ends$y0), color="blue", size=1)+
  geom_point(aes(data$greenstone$xrange, data$greenstone$yrange), color="green", size = 4)

class(data$gold) # a point pattern dataset in the two-dimensional plane.
class(data$faults) #  a spatial pattern of line segments in the plane
class(data$greenstone) #  an observation window in the two-dimensional plane

#3)
summary(data$gold)

#4)
ggplot() + 
  geom_point(aes(data$gold$x, data$gold$y), color="red")

#5)
qc <- quadratcount(data$gold, 5, 5)
class(qc)
plot(qc)
plot(data$gold, add=TRUE)

#6)
quadrat.test(data$gold, 5, 5)
# p-value < 2.2e-16 - odrzucamy hipoteze zerowa

#7)
dg <- density(data$gold)

#8)
persp(dg)
contour(dg)

#9)
ggplot() + 
  geom_point(aes(data$gold$x, data$gold$y), color="red") + 
  geom_point(aes(data$faults$ends$x0, data$faults$ends$y0), color="blue", size=1)

#10)
dm <- distmap(data$faults)
plot(dm)

#11)
plot(rhohat(data$gold, dm))

#12)
df <- distfun(data$faults)

#13)
df(400000,7000000)
plot(df)
