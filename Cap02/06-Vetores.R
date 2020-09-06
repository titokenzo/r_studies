# Vetores, operações com vetores e vetores nomeados

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap02")
getwd()

# Vetor de string
#------------------------------------------------------------------------------
vetor_caracter = c("Data", "Science", "Academy")
vetor_caracter

# Vetores de floats
#------------------------------------------------------------------------------
vetor_numerico = c(1.90, 45.3, 300.5)
vetor_numerico

# Vetor de valores comlpexos 
#------------------------------------------------------------------------------
Vetor_complexo = c(5.2+3i, 3.8+4i)
Vetor_complexo

# Vetor de valores lógicos
#------------------------------------------------------------------------------
vetor_logico = c(TRUE,FALSE,TRUE,FALSE,FALSE)
vetor_logico

# Vetor de números inteiros
#------------------------------------------------------------------------------
vetor_integer = c(2,4,6)
vetor_integer

# Utilizando seq()
#------------------------------------------------------------------------------
vetor1 = seq(1:10)
vetor1
is.vector(vetor1)

# Utilizando rep()
#------------------------------------------------------------------------------
vetor2 = rep(1:5)
vetor2
is.vector(vetor2)

# Indexação de vetores
#------------------------------------------------------------------------------
a <- c(1,2,3,4,5)
a
a[1]
a[6]

b <- c("Data","Science","Academy")
b
b[1]
b[2]
b[3]

# Combinando vetores
#------------------------------------------------------------------------------
v1 = c(2,3,5)
v2 = c("aa","bb","cc","dd","ee")
c(v1,v2)

# Operações com vetores
#------------------------------------------------------------------------------
x = c(1,3,5,7)
y = c(2,4,6,8)

x * 5
x + y
x - y
x * y
x / y

# Somando vetores com número diferente de elementos
# A operação cicla o vetor menor para atingir o tamanho do vetor maior
#------------------------------------------------------------------------------
alfa = c(10,20,30)
beta = c(1,2,3,4,5,6,7,8,9)
alfa + beta

# Vetor nomeado
#------------------------------------------------------------------------------
v = c("Nelson", "Mandela")
v
names(v) = c("Nome","Sobrenome")
v
v["Nome"]
