# Operações com Strings

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap02")
getwd()

# String

# Operações básicas
#------------------------------------------------------------------------------
texto <- "isto é uma string"
texto

x = as.character(3.14)
x
class(x)

# Concatenando Strings
nome = "Nelson"; sobrenome = "Mandela"
paste(nome,sobrenome)
cat(nome,sobrenome)
# paste(nome, sobrenome, sep="")

# Formatando a saída
sprintf("A %s é nota %d", "Data Science Academy", 10)

# Extrainda parte da String
texto <- "Isso é uma String!"
substr(texto,start=12,stop=17)
?substr

# Contando o número de caracteres
nchar(texto)

# Alterando a capitalização
tolower("Histogramas e Elementos de Dados")
toupper("Histogramas e Elementos de Dados")

# Usando stringr
#------------------------------------------------------------------------------
library(stringr)

# Dividindo uma string em caracteres
strsplit("Histograma e Elementos de Dados",NULL)
?strsplit

# Dividindo uma string em caracteres, após o caracter espaço
strsplit("Histogramas e Elementos de Dados", " ")

string1 <- c("Esta é a primeira parte da minha string e será a primeira parte do meu vetor",
             "Aqui a minha string continua, mas será transformada no segundo vetor")
string1

string2 <- c("Precisamos testar outras strings - @???!$",
             "Análise de Dados em R")
string2

# Adicionando duas strings
str_c(c(string1,string2),sep="")

# Podemos contar quantas vezes um caracter aparece no texto
str_count(string2,"s")

# Localiza a primeira e última posição em que o caracter aparece na string
str_locate_all(string2,"s")

# Substitui a primeira ocorrência de um caracter (espaço)
str_replace(string2,"\\s","")

# Substitui todas as ocorrências de um caractere
str_replace_all(string2,"\\s","")

# Detectando padrões nas strings
string1 <- "17 jan 2001"
string2 <- "1 jan 2001"
padrao <- "jan 20"
grepl(pattern=padrao, x=string1)
?grepl
padrao <- "jan20"
grepl(pattern=padrao, x=string1)
