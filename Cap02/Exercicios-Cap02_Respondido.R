# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("D:/Projetos/datascience/RFundamentos/Cap02")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros
vetor <- seq(1:30)
vetor

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros
matriz <- matrix(1:16,nrow=4,ncol=4)
matriz

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente
lista <- list(vetor,matriz) 
lista

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat
?read.table
df <- data.frame(read.table("http://data.princeton.edu/wws509/datasets/effort.dat"))
df
class(df)
View(df)

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")
names(df) <- c("config", "esfc", "chang")
df

# Exercício 6 - Imprima na tela o dataframe iris, 
# verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset
iris
view(iris)
dim(iris)
summary(iris)
str(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
plot(iris$Sepal.Length, iris$Sepal.Width)

# Exercício 8 - Usando a função subset, 
# crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()
?subset
iris_subset <- subset(iris,subset = Sepal.Length > 7)
iris_subset

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), 
# divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()
install.packages("dplyr")
library(dplyr)
?slice
iris_copy <- iris
df <- slice(iris_copy,1:15)
df

# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e 
# retorne apenas valores em que Sepal.Length > 5
# Dica: Use o RSiteSearch para aprender como usar a função filter
RSiteSearch("filter")
filter(df,Sepal.Length > 5)
