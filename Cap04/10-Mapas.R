# Mapas

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap04")
getwd()

#------------------------------------------------------------------------------

# Instala os pacotes
install.packages(c("ggplot2", "maps", "mapdata"))

# Carrega os pacotes
library(ggplot2)
library(maps)
library(mapdata)

# Função para buscar as coordenadas dos países
?map_data
mapa <- map_data("world")

# Visualizando o dataframe
dim(mapa)
View(mapa)

# Gerando o mapa
ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group)) +
  coord_fixed(1.3)

ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = NA, color = "blue") +
  coord_fixed(1.3)

gg1 <- ggplot() + 
  geom_polygon(data = mapa, aes(x = long, y = lat, group = group), fill = "seagreen1", color = "blue") +
  coord_fixed(1.3)
gg1

# Marcando alguns pontos no mapa
# Podemos usar um "shapefile" (IBGE disponibiliza alguns)
labs <- data.frame(
  long = c(69.24140, -2.8456051),
  lat = c(-78.38995, 22.44512),
  names = c("Ponto1", "Ponto2"),
  stringsAsFactors = F
)

# Pontos no mapa
gg1 + 
  geom_point(data = labs, aes(x = long, y = lat), color = "black", size = 2) + 
  geom_point(data = labs, aes(x = long, y = lat), color = "yellow", size = 2)

# Divisão por países
ggplot(data = mapa) + 
  geom_polygon(aes(x = long, y = lat, fill = region, group = group), color = "white") + 
  coord_fixed(1.3) + 
  guides(fill = F)

# rMaps
# http://rmaps.github.io
