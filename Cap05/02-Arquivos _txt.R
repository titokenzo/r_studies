# Trabalhando com Arquivos TXT

# Configurando o diretório de trabalho
setwd("d:/Estudos/datascience/RFundamentos/Cap05")
getwd()
#------------------------------------------------------------------------------

# Usando as funções base do R (pacote utils)
search()

# Importando o arquivo com read.table()
?read.table

df1 <- read.table("arquivos/pedidos.txt")
df1
dim(df1)

df1 <- read.table("arquivos/pedidos.txt", header = T, sep = ',')
df1
dim(df1)

# Substituindo os cabeçalhos na carga
df1 <- read.table("arquivos/pedidos.txt", header = T, sep = ',',
                  col.names = c('var1', 'var2', 'var3'))
df1

# Fazendo uma limpeza no momento da carga (parâmentro na.strings)
df1 <- read.table('arquivos/pedidos.txt', header = T, sep = ',',
                  col.names = c('var1', 'var2', 'var3'),
                  na.strings = c('Zico', 'Maradona'))
df1

# Exibindo o resultado da importação
# Por padrão, o R importa os characteres como Factor
str(df1)

df1 <- read.table('arquivos/pedidos.txt', header = T, sep = ',',
                  col.names = c('var1', 'var2', 'var3'),
                  na.strings = c('Zico', 'Maradona'),
                  stringsAsFactors = F)
df1
str(df1)

# Importando arqvuivos com read.csv() e read.csv2()
#------------------------------------------------------------------------------
df2 <- read.csv('arquivos/pedidos.txt')
df2
dim(df2)
str(df2)

df3 <- read.csv2('arquivos/pedidos.txt')
df3
dim(df3)

df3 <- read.csv2('arquivos/pedidos.txt', sep = ',')
df3
dim(df3)

# Importando arquivo com read.delim(
#------------------------------------------------------------------------------
df4 <- read.delim('arquivos/pedidos.txt')
df4

df4 <- read.delim('arquivos/pedidos.txt', sep = ',')
df4
dim(df4)

# Importando / Exportando
#------------------------------------------------------------------------------

# Gerando arquivo
write.table(mtcars, file = 'saida/mtcars.txt')
dir('saida/')

df_mtcars <- read.table('saida/mtcars.txt')
df_mtcars
dim(df_mtcars)

write.table(mtcars, file = 'saida/mtcars2.txt', sep = '|', col.names = NA,
            qmethod = 'double')
list.files('saida/')

read.table('saida/mtcars2.txt')
df_mtcars2 <- read.table('saida/mtcars2.txt')
df_mtcars2

df_mtcars2 <- read.table('saida/mtcars2.txt', sep = '|')
df_mtcars2

df_mtcars2 <- read.table('saida/mtcars2.txt', sep = '|', encoding = 'UTF-8')
df_mtcars2

df_mtcars2 <- read.table('saida/mtcars2.txt', sep = '|', encoding = 'UTF-8',
                         header = T)
df_mtcars2
