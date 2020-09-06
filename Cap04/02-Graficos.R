# Gráficos em R - Base Plotting System

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap04")
getwd()

# Lista de pacotes base carregados
#------------------------------------------------------------------------------
search()

# Demo
demo("graphics")

# Plot básico
x = 5:7
y = 8:10
plot(x,y)
?plot

altura <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)
plot(altura, largura)

# Plotando um dataframe
?lynx
plot(lynx)
plot(lynx, ylab="Plots com dataframes", xlab="")
plot(lynx, ylab="Plots com dataframes", xlab="Observações")
plot(lynx, main="Plots com Dataframes", col="red")
plot(lynx, main="Plot com Dataframes", col="red", col.main=52, cex.main=1.5)

# Histograma (distribuição de frequência)
#------------------------------------------------------------------------------
library(datasets)
hist(warpbreaks$breaks)

# Boxplot
#------------------------------------------------------------------------------
airquality
transform(airquality, Month=factor(Month))
?transform
boxplot(Ozone ~ Month, airquality, xlab="Month", ylab="Ozone (ppb)")

# Especificando os parâmetros
#------------------------------------------------------------------------------
# col - cor do plot
# lty - tipo de linha
# lwd - largura da linha
# pch - símbolo do plot
# xlab - label do eixo x
# ylab - label do eixo y
# las - orientação dos labels dos eixos
# bg - background color
# mfrow - número de plots por linha
# mfcool - número de plots por coluna

# Funções básicas de plot
#------------------------------------------------------------------------------
# plot() - scatterplot (dispersão)
# lines - adiciona linhas ao gráfico
# points() - adiciona pontos ao gráfico
# text() - adiciona label ao gráfico
# title() - adiciona título ao gráfico

?par
par()
par('pch')
par('lty')

x = 2:4
plot(x, pch="c")

data = 1:8
par(mfrow=c(2,2), col.axis="red")
plot(data, las=0, xlab="xlab", ylab="ylab", main="LAS = 0")
plot(data, las=1, xlab="xlab", ylab="ylab", main="LAS = 1")
plot(data, las=2, xlab="xlab", ylab="ylab", main="LAS = 2")
plot(data, las=3, xlab="xlab", ylab="ylab", main="LAS = 3")
legend("topright", pch=1, col=c("blue","red"), legend=c("Var1","Var2"))
par(mfrow=c(1,1))

# Core disponíveis
colors()

# Salvando os gráficos
#------------------------------------------------------------------------------
# png
png("Grafico1.png", width=500, height=500, res=72)

plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, main="Gráfico gerado a partir do Iris")
dev.off()

# pdf
pdf("Grafico2.pdf")
plot(iris$Sepal.Length, iris$Petal.Length, col=iris$Species, main="Gráfico gerado a partir do Iris")
dev.off()

# Estendendo as funções do plot
#------------------------------------------------------------------------------
install.packages("plotrix")
library(plotrix)
?plotrix

par(mfrow=c(1,1), col.axis="red")
plot(1:6, las=3, xlab="lty 1:6", ylab="", main="Mais opções ao plot")
ablineclip(v=1, lty=1, col="sienna2", lwd=2)
ablineclip(v=2, lty=1, col="sienna2", lwd=2)
ablineclip(v=3, lty=1, col="sienna2", lwd=2)
ablineclip(v=4, lty=1, col="sienna2", lwd=2)
ablineclip(v=5, lty=1, col="sienna2", lwd=2)
ablineclip(v=6, lty=1, col="sienna2", lwd=2)
ablineclip(v=7, lty=1, col="sienna2", lwd=2)

plot(lynx)
plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n")

# Dois plots juntos
#------------------------------------------------------------------------------
par(mar=c(4,3,3,3), col.axis="black")

plot(cars$speed, type="s", col="red", bty="n", xlab="Cars ID", ylab="")
text(8, 14, "Velocidade", cex=0.85, col="red")

par(new=T)

plot(cars$dist, type="s", bty="n", ann=F, axes=F, col="darkblue")
axis(side=4)
text(37, 18, "Distância", cex=0.85, col="darkblue")
title(main="Velocidade x Distância")

# Plots a apartir de datasets
#------------------------------------------------------------------------------
df <- read.csv('pibpercap.csv', stringsAsFactors = F)
df_1982 <- subset(df, ano==1982)
plot(expectativa ~ pibpercap, data=df_1982, log="x")
View(df)

# Nomes para as colunas
#------------------------------------------------------------------------------
mycol <- c(Asia="tomato", Europe="chocolate4", Africa="dodgerblue2", Americas="darkgoldenrod1", Oceania="green4")
plot(expectativa ~ pibpercap, data=df_1982, log="x", col=mycol[continente])

# Função para a escala
#------------------------------------------------------------------------------
mycex <- function(var, r, f=sqrt){
  x = f(var)
  x_scaled = (x - min(x))/(max(x) - min(x))
  r[1] + x_scaled * (r[2] - r[1])
}

plot(expectativa ~ pibpercap, data=df_1982, log="x", col=mycol[continente], cex=mycex(pop, r=c(0.2, 10)))

  