# Pie Chart - Gráfico de Pizza

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap04")
getwd()

#------------------------------------------------------------------------------
?pie

# Criando as fatias
fatias <- c(40, 20, 40)

# Nomeando os labels
paises <- c('Brasil', 'Argentina', 'Chile')

# Unindo: labels e fatias
paises <- paste(paises, fatias)

# Incluindo mais detalhes no label
paises <- paste(paises, "%", sep="")

colors()

# Construindo um gráfico
pie(fatias, labels=paises, 
    col=c("darksalmon", "gainsboro", "lemonchiffon4"),
    main="Distribuição de Vendas")

pie(fatias, labels=paises, 
    col=c("darksalmon", "gainsboro", "lemonchiffon4"),
    main="Distribuição de Vendas", clockwise=T)

# Tabalhando com dataframes
#------------------------------------------------------------------------------
?iris
attach(iris)
Values = table(Species)
labels = paste(names(Values))
pie(Values, labels=labels, main="Distribuição de Espécies")

# 3D
#------------------------------------------------------------------------------
install.packages("plotrix")
library(plotrix)

pie3D(fatias, labels=paises, explode=0.08, theta=1.1,
      col = c("steelblue", "tomato2", "tan3"),
      main = "Distribuição de Vendas")
