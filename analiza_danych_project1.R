library(ggplot2)
library(sp)
library(raster)
library(rgdal)

#wczytanie punktów i zmiana ich projekcji
dane <- readxl::read_excel("zestaw1.xlsx")
head(dane)

coords <- SpatialPoints(cbind(dane$Long, dane$Lat), proj4string = CRS("+proj=longlat"))

data <- spTransform(coords, CRS("+init=epsg:2178"))
data_df <- data.frame(data)
colnames(data_df) <- c("Lon", "Lat")

write.csv(data_df, "dane1_przeksztalcone.csv")

#generate tesselation -> osiedla -> hexa -> 25
#etrs 1989
#clip  -> siatka z poprzedniego -> osiedla
#spatial join -> siatka przycieta -> punkty projected
#generate plik -> symbology, dac kolor i odhaczyc punkty

# II
#spatial join -> osiedla -> punkty -> run



#wczytanie obiektu shapefile
osiedla <- shapefile("./dane/dane/osiedla.shp")
head(osiedla)

#wyswietlenie wspolrzednych naniesionych na shapefile
map <- ggplot() + 
  geom_polygon(data=osiedla, aes(x=long, y=lat, group=group, fill=id), show.legend = F) + 
  scale_fill_grey() + 
  coord_fixed()
map + geom_point(data=data_df, aes(x=Lon, y=Lat), alpha=0.5)

update.packages('Rcpp')
library(Rcpp)
library(dbscan)

#DBSCAN 
set.seed(220)  # Setting seed
dbscan1 <- dbscan(data_df, eps=0.5, minPts = 5)
map + geom_point(data=data_df, aes(x=Lon, y=Lat, color = dbscan1$cluster), alpha=0.5, show.legend = F) 
+ scale_color_viridis_c()

#HDBSCAN
#OPTICS

