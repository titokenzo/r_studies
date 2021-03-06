# Bar Plots

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap04")
getwd()

#------------------------------------------------------------------------------
?barplot

# Preparando os dados
dados <- matrix(c(652,1537,598,242,36,46,38,21,218,327,106,67), nrow=3, byrow=T)
dados

# Nomeando linhas e colunas
colnames(dados) <- c("0","1-150","151-300",">300")
rownames(dados) <- c("Jovem","Adulto","Idoso")
dados

# Construindo o barplot
barplot(dados, beside=T)

# Construindo o plot - Stacked Bar Plot
# As 3 faixas de idade são representadas na mesma coluna para as diferentes quantidades
barplot(dados, col=c("steelblue1","tan3","seagreen3"))

# Crie uma legenda para o gráfico anteriro
?legend
legend(x= "topright", legend = c("Jovem","Adulto","Idoso"),
       pch = 0,
       col = c("steelblue1","tan3","seagreen3"))

# Agora temos uma coluna para cada faixa etária, mas na mesma faixa de quantidade
barplot(dados, beside=T, col=c("steelblue1","tan3","seagreen3"), legend = c("Jovem","Adulto","Idoso"))

# Com a Transposta da matriz, invertemos as posições entre faixa etária e faixa de quantidade
barplot(t(dados), beside=T, col=c("steelblue1","tan3","seagreen3","peachpuff1"), legend=c("0","1-150","151-300",">300"))

