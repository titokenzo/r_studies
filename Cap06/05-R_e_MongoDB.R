# Trabalhando com R e MongoDB

# Configurando o diretório de trabalho
setwd("D:/Estudo/datascience/RFundamentos/Cap06")
getwd()
#------------------------------------------------------------------------------

# RMongoDB
# Instalação do pacote
install.packages("devtools")
library(devtools)
install_github("mongosoup/rmongodb", force=T)
library(rmongodb)

# Criando a conexão
help("mongo.create")
con <- mongo.create()

# Checando a conexão
if(mongo.is.connected(con)==TRUE){
  mongo.get.databases(con)
}

# Armazena o nome de uma das coleções
coll <- "users.contatos"

# Contando os registros em uma coleção
mongo.count(con, coll)

# Buscando um registro em uma coleção
mongo.find.one(con, coll)

# Obtendo um vetor de valores distintos das chaves de uma coleção
res <- mongo.distinct(con, coll, "city")
head(res)

# Obtendo um vetor de valores distintos das chaves de uma coleção
# E gerando um histograma
pop <- mongo.distinct(con, coll, "pop")
hist(pop)

# Contando os elementos
nr <- mongo.count(con, coll, list('pop' = list('$lte' = 2)))
print(nr)

# Buscando todos os elementos
pops <- mongo.find.all(con, coll, list('pop' = list('$lte' = 2)))
head(pops, 2)

# Encerrando a conexão
mongo.destroy(con)

# Criando e validando um arquivo json
#------------------------------------------------------------------------------
library(jsonlite)
json_arquivo <- '{"pop":{"$lte":2}, "pop":{"$gte":1}}'
cat(prettify((json_arquivo)))

validate(json_arquivo)

