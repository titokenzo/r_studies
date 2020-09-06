# Fatores e Dataframes - Compreendendo a ordem dos fatores

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap03")
getwd()

# Níveis do Fatores
#------------------------------------------------------------------------------
# Internamente, o R armazena valores inteiros e faz um mapeamento para as strings (em ordem)
# e agrupa as estatísticas por níveis.

# Criando vetores
vec1 <- c(1001,1002,1003,1004,1005)
vec2 <- c(0,1,1,0,2)
vec3 <- c('Verde','Laranja','Azul','Laranja','Verde')

# Unindo os vetores em um dataframe
df <- data.frame(vec1, vec2, vec3)
df

# Verificando que o R categorizou a última coluna como fator
str(df)

# Verificando os níveis do fator. Perceba que os níveis estão categorizados em ordem alfabética
levels(df$vec3)

# criando uma outra coluna e atribuindo labels
df$cat1 <- factor( df$vec3, labels=c('cor2','cor1','cor3') )
df

# Internamente, os fatores são registrados como inteiros, mas a ordenação segue a ordem alfabética
# das strings
str(df)

# Veja como foi feita a atribuição:
# (ordem alfabética das cores:) Azul, Laranja, Verde
# Associação com os labels (na ordem em que se apresentam): Azul = cor2, Laranja=cor1, Verde=cor3

# Criando uma outra coluna e atribuindo labels
# Ao aplicarmos a função factor() a coluna vec2, internammente o R classificou em ordem alfabética
# e quando atribuímos os labels, foi feita a associação
df$cat2 <- factor(df$vec2, labels=c('Divorciado','Casado','Solteiro'))
df
str(df)
levels(df$cat2)
