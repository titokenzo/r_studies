# Solução Lista de Exercícios - Capítulo 5

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("D:/Estudo/datascience/RFundamentos/Cap05")
getwd()


# Exercicio 1 - Encontre e faça a correção do erro na instrução abaixo:
write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = N, qmethod = "double")
#------------------------------------------------------------------------------

write.table(mtcars, file = "mtcars2.txt", sep = "|", col.names = NA, qmethod = "double")

# Exercicio 2 - Encontre e faça a correção do erro na instrução abaixo:
library(readr)
df_iris <- read_csv("iris.csv", col_types = matrix(
  Sepal.Length = col_double(1),
  Sepal.Width = col_double(1),
  Petal.Length = col_double(1),
  Petal.Width = col_double(1),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))
#------------------------------------------------------------------------------

df_iris <- read_csv("saida/iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c("setosa", "versicolor", "virginica"))
))
df_iris

# Exercício 3 - Abaixo você encontra dois histogramas criados separadamente.
# Mas isso dificulta a comparação das distribuições. Crie um novo plot que faça a união 
# de ambos histogramas em apenas uma área de plotagem.

# Dados aleatórios
dataset1=rnorm(4000 , 100 , 30)     
dataset2=rnorm(4000 , 200 , 30) 

# Histogramas
par(mfrow=c(1,2))
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")
#------------------------------------------------------------------------------

# Forma 1
hist(cbind(dataset1,dataset2), breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="")

# Forma 2
hist(dataset1, breaks=30 , xlim=c(0,300) , col=rgb(1,0,0,0.5) , xlab="Altura" , ylab="Peso" , main="" )
hist(dataset2, breaks=30 , xlim=c(0,300) , col=rgb(0,0,1,0.5) , xlab="Altura" , ylab="Peso" , main="", add=T)
legend('topright', legend=c('DS1', 'DS2'), col=c(rgb(1,0,0,0.5),rgb(0,0,1,0.5)), pt.cex=2, pch=15)

# Forma 3
library(ggplot2)
g1 <- data.frame(valor=dataset1, grupo="G1")
g2 <- data.frame(valor=dataset2, grupo="G2")
ggplot(g1, aes(valor, fill=grupo, alpha=0.5)) +
  geom_histogram() +
  geom_histogram(data=g2, alpha=0.5)

detach(package:ggplot2)

# Exercício 4 - Encontre e corrija o erro no gráfico abaixo
install.packages("plotly")
library(plotly)
head(iris)

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = Species , marker=list(size=20 , opacity=0.5))
#------------------------------------------------------------------------------

plot_ly(iris, 
        x = ~Petal.Length, 
        y = ~Petal.Width,  
        type="scatter", 
        mode = "markers" , 
        color = ~Species , marker=list(size=20 , opacity=0.5))

detach(package:plotly)

# Exercício 5 - Em anexo você encontra o arquivo exercicio5.png. Crie o gráfico que resulta nesta imagem.
#------------------------------------------------------------------------------

# https://www.r-graph-gallery.com/3d.html
library(plotly)
head(volcano)
# 3D plot:
p <- plot_ly(z = volcano, type = "surface")
p

# Exercício 6 - Carregue o arquivo input.json anexo a este script e imprima o conteúdo no console
# Dica: Use o pacote rjson
#------------------------------------------------------------------------------

library(rjson)
json_data <- fromJSON(file = "arquivos/input.json")
print(json_data)

# Exercício 7 - Converta o objeto criado ao carregar o arquivo json do exercício anterior 
# em um dataframe e imprima o conteúdo no console.
#------------------------------------------------------------------------------

df <- as.data.frame(json_data)
print(df)

# Exercício 8 - Carregue o arquivo input.xml anexo a este script.
# Dica: Use o pacote XML
#------------------------------------------------------------------------------
install.packages("XML")
library(XML)
xml_data <- xmlParse(file="arquivos/input.xml")
xml_data

# Exercício 9 - Converta o objeto criado no exercício anterior em um dataframe
#------------------------------------------------------------------------------

df2 <- xmlToDataFrame(data)
df2

# Exercício 10 - Carregue o arquivo input.csv em anexo e então responda às seguintes perguntas:
#------------------------------------------------------------------------------
df3 <- read.table("arquivos/input.csv", header = T, sep = ',')
print( is.data.frame(df3) )

# Pergunta 1 - Quantas linhas e quantas colunas tem o objeto resultante em R?
print( dim(df3) )

# Pergunta 2 - Qual o maior salário?
max_pos <- which.max(df3[, 'salary'])
max_val <- df3[max_pos, c('id','name','salary', 'start_date', 'dept')]

# OU
max_val2 <- max( df3$salary )

print( max_val['salary'] )
print( max_val2 )

# Pergunta 3 - Imprima no console o registro da pessoa com o maior salário.
print( max_val )
print( subset(df3, salary==max_val2) )

# Pergunta 4 - Imprima no console todas as pessoas que trabalham no departamento de IT.
df_ti <- subset(df3, dept=='IT')
print( df_ti )

# Pergunta 5 - Imprima no console as pessoas do departamento de IT com salário superior a 600. 
df_600 <- subset(df3, dept=='IT' & salary>600)
print( df_600 )
