# Trabalhando com R e SQLite

# Configurando o diretório de trabalho
setwd("D:/Estudo/datascience/RFundamentos/Cap06")
getwd()
#------------------------------------------------------------------------------

install.packages("RSQLite")
library(RSQLite)

# Remover o banco SQLite, caso exista - não é obrigatório
unlink("saida/exemplo.db")

# Criando driver e conexão ao banco de dados
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "saida/exemplo.db")
dbListTables(con)

# Criando uma tabela e carregando com dados do dataset mtcars
dbWriteTable(con, "mtcars", mtcars, row.names = T)

# Listando uma tabela
dbListTables(con)
dbExistsTable(con, "mtcars")
dbExistsTable(con, "mtcars2")
dbListFields(con, "mtcars")

# Lendo o conteúdo da tabele
dbReadTable(con, "mtcars")

# Criando apenas a definição da tabela
dbWriteTable(con, "mtcars2", mtcars[0,], row.names = T)
dbListTables(con)
dbReadTable(con, "mtcars2")

# Executando consultas no banco de dados (resgata TODOS o resultado)
query = "SELECT row_names FROM mtcars"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados
class(dados)

# Executando consultas no banco de dados (iterando o rersultado)
query = "SELECT row_names FROM mtcars"
rs = dbSendQuery(con, query)
while( !dbHasCompleted(rs) ){
  dados = fetch(rs, n = 1)
  print( dados$row_names )
}

# Executando consultas no banco de dados
query = "SELECT disp, hp FROM mtcars WHERE disp>160"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

# Executando consultas no banco de dados
query = "SELECT row_names, avg(hp) FROM mtcars GROUP BY row_names"
rs = dbSendQuery(con, query)
dados = fetch(rs, n = -1)
dados

# Criando uma tabela a partir de um arquivo
#------------------------------------------------------------------------------
dbWriteTable(con, "iris", "arquivos/iris.csv", sep = ",", header = T)
dbListTables(con)
dbReadTable(con, "iris")

# Encerrando a conexão
dbDisconnect(con)

# Carregando dados no banco de dados
# http://dados.gov.br/dataset/indice-nacional-de-precos-ao-consumidor-amplo-15-ipca-15
#------------------------------------------------------------------------------
drv = dbDriver("SQLite")
con = dbConnect(drv, dbname = "saida/exemplo.db")

dbWriteTable(con, "indices", "arquivos/indice.csv", sep = "|", header = T)
dbListTables(con)
df <- dbReadTable(con, "indices")
str(df)
sapply(df, class)

hist(df$setembro)
df_mean <- unlist( lapply( df[, c(4, 5, 6, 7, 8)], mean ) )
df_mean

dbDisconnect(con)
