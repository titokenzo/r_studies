# Scatterplots - Gráficos de Dispersão

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap04")
getwd()

# O Scatterplot, ou gráfico de dispersão, permite avaliar a relação entre duas variáveis (duas colunas)
# Variável independente, no eixo X
# Variável dependente, no eixo Y
# Quando X cresce, o que acontecerá ao Y?
#------------------------------------------------------------------------------

# Define os dados
# O set.seed() permite repetir os dados "aleatórios" em diferentes momentos e ambientes
set.seed(67)
?set.seed

# Geram valores "aleatórios" (a partir do seed acima)
x = rnorm(10, 5, 7)
y = rpois(10, 7)
z = rnorm(10, 6, 7)
t = rpois(10, 9)

# Cria o plot
plot(x, y, col=123, pch=10, main="Multi Scatterplot", 
     col.main="red", cex.main=1.5, 
     xlab="Variável independente", ylab="Variável dependente")

# Adiciona outros dados
points(z, t, col="blue", pch=4)

# Adiciona outros dados
points(y, t, col=777, pch=9)

# Cria legenda
legend(-6, 5.9, legend=c("Nível 1", "Nível2", "Nível 3"), 
       col=c(123, "blue", 777), 
       pch=c(10, 4, 9), cex=0.65, bty="n")

