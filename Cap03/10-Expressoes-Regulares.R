# Expressões Regulares

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap03")
getwd()

# Expressões regulares = padrões de texto
# Utilizado para fazer buscas ou encontrar partes de um texto em um maior
#------------------------------------------------------------------------------

?grep
#grep(pattern, x, ignore.case = FALSE, perl = FALSE, value = FALSE, fixed = FALSE, useBytes = FALSE, invert = FALSE)
#grepl(pattern, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#sub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#gsub(pattern, replacement, x, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#regexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#gregexpr(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)
#regexec(pattern, text, ignore.case = FALSE, perl = FALSE, fixed = FALSE, useBytes = FALSE)

str <- c("Expressões", "regulares", "em linguagem R",
         "permitem a busca de padrões", "e exploração de textos",
         "podemos buscar padrões em dígitos", 
         "como por exemplo", 
         "10992451280")
length(str)
str

# grep() - Retorna o índice ou o item (F/T)
?grep
grep("ex", str, value = F)
grep("ex", str, value = T)
grep("\\d", str, value = F)
grep("\\d", str, value = T)

# grepl() - Retorna TRUE/FALSE
grepl("\\d+", str)
grepl("\\D", str)

# gsub() - substituir
gsub("em", "***", str)
gsub("ex", "EX", str, ignore.case = T)

# sub() - substituir
sub("em", "EM", str)

# regexpr()
frase <- "Isso é uma string."
regexpr(pattern="u", frase)

# gregexpr()
gregexpr(pattern="u", frase)

str2 <- c("2678 é maior que 45 - @???!$",
          "vamos escrever 14 scripts R")
str2

# gsub()
gsub("\\d", "", str2)
gsub("\\D", "", str2)
gsub("\\s", "", str2)
gsub("[iot]", "Q", str2)
gsub("[[:punct:]]", "", str2)
