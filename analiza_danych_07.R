library(spatstat)

#1
#lamda - proces intensywnoœci (5 punktów na jednostkê powierzchni)
p_poisson <- rpoispp(lambda = 5, win=(disc(20)))

#beta - proces intensywnoœci (5 punktów na jednostkê powierzchni)
#gamma - parametr interakcji (0.5 dla rozk³adu normalnego)
p_regular <- rStrauss(beta = 5, gamma =0.5 , W = disc(20))
#generuje losowy wzorzec punktow - symuluje realizacje procesu Straussa (równomiernie rozmieszcza punkty)

#kappa - proces intensywnoœci 
#scale - skala odleglosci punktu od srodka klastra
#mu - srednia liczba punktow na klaster
p_cluster <- rThomas(kappa = 0.5, scale = 1, mu=5, win = disc(20))
#deneruje losowy wrzocec punktów - symuluje realizacje klastrowego procesu Thomasa (punkty uk³adaj¹ siê w klastry)

plot(p_poisson)
plot(p_regular)
plot(p_cluster)

#2
hist(nndist(p_poisson))
hist(nndist(p_regular))
hist(nndist(p_cluster))

#3
gp_poisson <- Gest(p_poisson)
gp_regular <- Gest(p_regular)
gp_cluster <- Gest(p_cluster)

#4
plot(gp_poisson)
plot(gp_regular)
plot(gp_cluster)
#w gp_poisson oraz gp_regular dystrybuanty sa do siebie bardzo zblizone, 
#widaæ jedynie niewielkie ró¿nice
#gp_cluster natomiast znacznie rozni sie od pozostalych dystrybuant, 
#na wykresie widac oddzielone skladowe, dystrybuanta jest bardziej nieregularna niz
#dystrybuanty w gp_poisson oraz gp_regular
#krzywe pokazuja prawdopodobienstwo ze punkt ma najblizszego sasiada w odleglosci r

#5
kp_poisson <- Kest(p_poisson, correction="border")
kp_regular <- Kest(p_regular, correction="border")
kp_cluster <- Kest(p_cluster, correction="border")

plot(kp_poisson)
plot(kp_regular)
plot(kp_cluster)

#6
plot(distmap(p_poisson))
plot(distmap(p_regular))
plot(distmap(p_cluster))
