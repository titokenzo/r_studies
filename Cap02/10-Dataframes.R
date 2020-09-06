# Dataframes e Operações com Dataframes

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap02")
getwd()

# Criando um dataframe vazio
#------------------------------------------------------------------------------
df <- data.frame()
class(df)
df

#  Criando vatores vazios
nomes <- character()
idades <- numeric()
itens <- numeric()
codigos <- integer()

df <- data.frame( c(nomes,idades,itens,codigos) )
df

# Criando vetores
pais = c("Portugal","Inglaterra","Irlanda","Egito","Brasil")
nome = c("Bruno","Tiago","Amanda","Bianca","Marta")
altura = c(1.88, 1.76, 1.53, 1.69, 1.68)
codigo = c(5001, 2183, 4702, 7965, 8890)

# Criando um dataframe de diversos vetores
pesquisa = data.frame( pais, nome, altura, codigo)
pesquisa

# Adicionando um novo vetor a um dataframe existente
olhos = c("verde", "azul", "azul", "castanho", "castanho")
pesq = cbind(pesquisa,olhos)
pesq

# Informações sobre o dataframe
str(pesq)
dim(pesq)
length(pesq)

# Obtendo um vetor de um dataframe
pesq$pais
pesq$nome

# Extraindo um único valor
pesq[1,1]
pesq[3,2]

# Número de linhas e colunas
nrow(pesq)
ncol(pesq)

# Primeiros elementos do dataframe
head(pesq)
head(mtcars)

# Últimos elementos do dataframe
tail(pesq)
tail(mtcars)

# Data frames built-in do R
?mtcars
mtcars
View(mtcars)

# Filtro para um subset de dados que atentem a um critério
pesq[altura<1.60,]
pesq[altura<1.60, c('codigo','olhos')]
pesq

#  Dataframes nomeados
names(pesq) <- c("País", "Nome", "Altura", "Código", "Olhos")
pesq

colnames(pesq) <- c("Var1", "Var2", "Var3", "Var4", "Var5")
rownames(pesq) <- c("Obs1", "Obs2", "Obs3", "Obs4", "Obs5")
pesq

# Carregando aquivos CSV (arquivo pacientes.csv feito a mão)
?read.csv
pacientes <- data.frame(read.csv(file="pacientes.csv"), header=TRUE, sep=",")

# Visualizando o dataset
View(pacientes)
head(pacientes)
summary(pacientes)

# Visualizando as variáveis
pacientes$Diabete
pacientes$status
pacientes$Status

# Histograma
hist(pacientes$Idade)

# Combinando dataframes
dataset_final <- merge(pesq, pacientes)
dataset_final
