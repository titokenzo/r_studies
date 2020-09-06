# Boxplots - Gráficos de Dispersão

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap04")
getwd()

# O Boxplot, box-and-whisker plot
# permite avaliar a relação entre duas variáveis (duas colunas), estatisticamente
# Média, Mediana, 1o quartil, 2o quartil, 3o quartil, etc.
#------------------------------------------------------------------------------

?boxplot
?sleep #dataset sobre sono (extra, group, ID)

# Permite utilizar as colunas sem especificar o nome do dataset
attach(sleep)

# Construção do boxplot (relação entre as variáveis 'extra' e 'group')
sleepboxplot = boxplot(data=sleep, extra ~ group, main="Duração do Sono", 
                       col.main="red", ylab="Horas", xlab="Droga")

# Cálculo da média
medias = by(extra, group, mean)

# Adiciona a média ao gráfico
points(medias, col="red")

# Boxplot horizontal
horizontalboxplot = boxplot(data=sleep, extra ~ group,
                            ylab="", xlab="", horizontal=T)

horizontalboxplot = boxplot(data=sleep, extra ~ group,
                            ylab="", xlab="", horizontal=T,
                            col=c("blue", "red"))
