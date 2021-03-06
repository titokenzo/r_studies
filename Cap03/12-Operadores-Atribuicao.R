# Operadores de Atribuição

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap03")
getwd()

#------------------------------------------------------------------------------

vec1 = 1:4
vec2 <- 1:4

class(vec1)
class(vec2)

typeof(vec1)
typeof(vec2)

mean(x=1:10) #passagem por valor
x #Erro!

mean(x<-1:10) #passagem por referência
x
