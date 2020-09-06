# Carregando e Analisando DAdos do MySQL com Linguagem R

# Configurando o diretório de trabalho
setwd("D:/Estudo/datascience/RFundamentos/Cap06")
getwd()
#------------------------------------------------------------------------------

install.packages("RMySQL")
install.packages("ggplot2")
install.packages("dbplyr")
library(RMySQL)
library(ggplot2)
library(dbplyr)
library(dplyr)

# Antes de trabalhar com MySQL e R, acesse o shell do MySQL (no terminal) e digite
# ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'dsa1234';

# Conexão com o banco de dados
con = dbConnect(MySQL(), user = 'r_user', password = '123456', dbname = 'titanicDB', host = 'localhost')

# Query
sql <- "SELECT pclass, survived, avg(age) as media_idade FROM titanic WHERE survived=1 GROUP BY pclass, survived"
dbGetQuery(con, sql)

# Plot
dados <- dbGetQuery(con, sql)
head(dados)
class(dados)
ggplot(dados, aes(pclass, media_idade)) +
  geom_bar(stat = "identity")

# Conectando no MySQL com dplyr
#------------------------------------------------------------------------------
?src_mysql
con2 <- src_mysql(dbname = "titanicdb", user = "r_user", password = "123456", host = "localhost")

# Coletando e agrupando os dados
# Nota: comando para concatenar funções num único comando =>> %>%
dados2 <- con2 %>%
  tbl('titanic') %>%
  select(pclass, sex, age, survived, fare) %>%
  filter(survived == 0) %>%
  collect()
head(dados2)

# Manipulando dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  select(pclass, sex, survived) %>%
  group_by(pclass, sex) %>%
  summarise(survival_ratio = avg(survived)) %>%
  collect()
View(dados2)

# Plot
ggplot(dados2, aes(pclass, survival_ratio, color=sex, group=sex)) +
  geom_point(size=3) +
  geom_line()

# Sumarizando os dados
dados2 <- con2 %>%
  tbl('titanic') %>%
  filter(fare > 150) %>%
  select(pclass, sex, age, fare) %>%
  group_by(pclass, sex) %>%
  summarise(avg_age = avg(age), avg_fare=avg(fare))
head(dados2)

#------------------------------------------------------------------------------
# Para outros bancos de dados use RODBC
#------------------------------------------------------------------------------
