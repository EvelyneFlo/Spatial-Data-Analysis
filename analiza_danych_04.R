install.packages("MASS")
install.packages("ggpubr")
library(MASS)
library(ggplot2)
library(dplyr)
library(ggpubr)

#1
head(cats)
plot(cats$Bwt, cats$Hwt)

#2
cov = sum( (cats$Bwt-mean(cats$Bwt))*(cats$Hwt-mean(cats$Hwt)) )/(nrow(cats)-1)
cov

#3
cov(cats$Bwt, cats$Hwt)
cor(cats$Bwt, cats$Hwt)

#4
#korelacja:
# > 0 korelacja dodatnia� gdy warto�� X ro�nie to Y te�
# = 0 brak korelacji� gdy X ro�nie to Y czasem ro�nie a czasem maleje
# < 0 korelacja ujemna� gdy X ro�nie to Y maleje

#5
cor.test(cats$Bwt, cats$Hwt, method = "pearson")

#6
cats_mod <- lm(Hwt~Bwt, data = cats)

#7
ggscatter(cats, "Bwt", "Hwt", cor.method = "pearson", add = "reg.line", conf.int = TRUE, cor.coef = TRUE )

