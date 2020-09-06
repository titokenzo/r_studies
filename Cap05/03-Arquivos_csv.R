# Trabalhando com Arquivos CSV

# Configurando o diretório de trabalho
setwd("d:/Estudos/datascience/RFundamentos/Cap05")
getwd()
#------------------------------------------------------------------------------
# O pacote 'util' pode ser usado nos arquivos TXT e CSV (visto anteriormente)

# Usando o pacote readr
install.packages("readr")
library(readr)

# Abre o prompt para escolher o arquivo
meu_arquivo <- read_csv(file.choose())

# Importando arquivos
#------------------------------------------------------------------------------
# *Vou manter o nome do arquivo numa variável para digitar menos*
arq = 'arquivos/temperaturas.txt'

df1 <- read_table(arq, col_names = c('DAY', 'MONTH', 'YEAR', 'TEMP'))
head(df1)
View(df1)
str(df1)

read_lines(arq, skip = 0, n_max = -1L)
read_file(arq)

# Exportando e Importando
#------------------------------------------------------------------------------
write_csv(iris, 'saida/iris.csv')
dir('saida/')

# Tipos utilizados para carregar cada uma das coluns:
# col_integer()
# col_double()
# col_logical()
# col_character()
# col_factor()
# col_skip()
# col_date() (alias = "D"), col_datetime() (alias = "T"), col_time() ("t")

df_iris <- read_csv("saida/iris.csv", col_types = list(
  Sepal.Length = col_double(),
  Sepal.Width = col_double(),
  Petal.Length = col_double(),
  Petal.Width = col_double(),
  Species = col_factor(c('setosa', 'versicolor', 'virginica'))
))
dim(df_iris)
str(df_iris)
View(df_iris)

# Manipulando arquivos csv
#------------------------------------------------------------------------------
df_cad <- read_csv('arquivos/cadastro.csv')
View(df_cad)

install.packages("dplyr")
library(dplyr)
options(warn = -1)

#df_cad <- tbl_df(df_cad) -- *depreciado*
df_cad <- as_tibble(df_cad)
head(df_cad)
View(df_cad)

write_csv(df_cad, 'saida/df_cad_bkp.csv')

# Importando vários arquivos simultaneamente
#------------------------------------------------------------------------------
list.files()
lista_arquivos <- list.files('arquivos/', full.names = T)
class(lista_arquivos)
lista_arquivos

# Quero apenas os arquivos com a palavra 'pedido' no nome
lista_arquivos <- grep("pedido", 
                       list.files('arquivos/', full.names = T), 
                       value = T)
lista_arquivos

lista_arquivos2 <- lapply(lista_arquivos, read_csv)
class(lista_arquivos2)
str(lista_arquivos2)
lista_arquivos2

# Parsing (permite ajustar formatos de datas)
#------------------------------------------------------------------------------
parse_date('01/02/15', '%m/%d/%y')
parse_date('01/02/15', '%d/%m/%y')
parse_date('01/02/34', '%y/%m/%d')

locale('en')
locale('fr')
locale('pt')

