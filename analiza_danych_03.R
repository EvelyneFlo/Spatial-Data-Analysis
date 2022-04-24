#a)  Czym jest hipoteza statystyczna? Zdefiniuj hipotezę H0 oraz H1 
#    stwierdzenie dotyczące rozkładu populacji
#    H0 - mówi, że nie ma żadnej różnicy.
#    H1 - mówi, że różnica jednak jest

#b)  Czym jest poziom istotności α?
#    Prawdopodobieństwo popełnienia błędu pierwszego rodzaju w sytuacji, 
#    gdy hipoteza zerowa była prawdziwa

#c)  Co oznacza, że rozkład jest normalny?
#    rozkład prawdopodobieństwa w kształcie dzwonu, inaczej Gaussa
#    większość przypadków zbliżona jest do średniej,
#    zdecydowana mniejszość to przypadki brzegowe

#d) Czym jest dystrybuanta?
#   funkcja ciągła określająca prawdopodobieństwo, że zajdzie zdarzenie
#   nie większe od ustalonej wartości



library(dplyr)
library(ggplot2)
library(sp)
library(base)

#1)
A = seq(-2,2,0.01)
dnormA=dnorm(A)
dnormA_df = data.frame(dnormA)
ggplot(dnormA_df, aes(A,dnormA)) + geom_line()

#2)
pnormA=pnorm(A)
pnorm_df=data.frame(pnormA)
ggplot(pnorm_df, aes(A,pnormA)) + geom_line()

#3)
glebs <- readRDS("ca_geo.rds")
class(glebs)
glebs_df <- data.frame(glebs)

#4)
range(glebs_df$pH, na.rm = TRUE)
mean(glebs_df$pH, na.rm = TRUE)
median(glebs_df$pH, na.rm = TRUE)
sd(glebs_df$pH, na.rm = TRUE)
IQR(glebs_df$pH, na.rm = TRUE)

#5)
hist(glebs_df$pH)

#6)
density(glebs_df$pH, na.rm=TRUE)

#7)
ggplot(glebs_df, aes(pH))+
  geom_boxplot(na.rm=TRUE)+ 
  stat_boxplot(coef = 1.5, na.rm=TRUE)

#8)
glebs_df_norm = scale(glebs_df$pH)
hist(glebs_df_norm)

#9)
shapiro.test(glebs_df_norm)
#p-value = 6.04e-09 < 5% - odrzucamy hipotezę zerową