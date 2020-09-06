# Solução Lista de Exercícios - Capítulo 6

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("D:/Estudo/datascience/RFundamentos/Cap06")
getwd()


# Exercicio 1 - Instale e carregue os pacotes necessários para trabalhar com SQLite e R
#------------------------------------------------------------------------------
install.packages( c('dbplyr', 'RSQLite') )
library(RSQLite)
library(dbplyr)
library(dplyr)

# Exercicio 2 - Crie a conexão para o arquivo mamiferos.sqlite em anexo a este script
#------------------------------------------------------------------------------
mamiferos <- dbConnect(RSQLite::SQLite(), 'arquivos/mamiferos.sqlite')

# Exercicio 3 - Qual a versão do SQLite usada no banco de dados?
# Dica: Consulte o help da função src_dbi()
#------------------------------------------------------------------------------
dbGetInfo(mamiferos)
# ** OU **
src_dbi(mamiferos)

# Exercicio 4 - Execute a query abaixo no banco de dados e grave em um objeto em R:
# SELECT year, species_id, plot_id FROM surveys
#------------------------------------------------------------------------------
sql = 'SELECT year, species_id, plot_id FROM surveys'
res <- dbSendQuery(mamiferos, sql)
#dados = fetch(res, n = -1)
# ** OU **
res <- tbl(mamiferos, sql(sql))

# Exercicio 5 - Qual o tipo de objeto criado no item anterior?
#------------------------------------------------------------------------------
class(res)
#class(dados) # dataframe

# Exercicio 6 - Já carregamos a tabela abaixo para você. 
# Selecione as colunas species_id, sex e weight com a seguinte condição:
# Condição: weight < 5
pesquisas <- tbl(mamiferos, "surveys")
#------------------------------------------------------------------------------

saida <- pesquisas %>%
  filter(weight < 5) %>%
  select(species_id, sex, weight)

# Exercicio 7 - Grave o resultado do item anterior em um objeto R. 
# O objeto final deve ser um dataframe
#------------------------------------------------------------------------------
df <- as.data.frame(saida)
class(df)
View(df)

# Exercicio 8 - Liste as tabelas do banco de dados carregado
#------------------------------------------------------------------------------
dbListTables(mamiferos)

# Exercicio 9 - A partir do dataframe criado no item 7, crie uma tabela no banco de dados
#------------------------------------------------------------------------------
dbWriteTable(mamiferos, "pesquisa", saida)
#db_drop_table(mamiferos, "pesquisa")
#dbRemoveTable(mamiferos, "pesquisa")

# Exercicio 10 - Imprima os dados da tabela criada no item anterior
#------------------------------------------------------------------------------
print( dbReadTable(mamiferos, "pesquisa") )
