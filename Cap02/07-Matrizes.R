# Matrizes, operações com matrizes e matrizes nomeados

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap02")
getwd()

# Criando matrizes

# Número de linhas (N_elem/nr = nc)
#------------------------------------------------------------------------------
matrix( c(1,2,3,4,5,6), nr=2)
matrix( c(1,2,3,4,5,6), nr=3)
matrix( c(1,2,3,4,5,6), nr=6)

# Número de colunas (N_elem/nc = nr)
#------------------------------------------------------------------------------
matrix( c(1,2,3,4,5,6), nc=2)

# Help
?matrix

# Matrizes precisam ter um número de elementos que seja múltiplo do número de linhas
matrix( c(1,2,3,4,5), nc=2)

# Criando matrizes a partir de vetores e preenchendo a partir das linhas (byrow=T)
#------------------------------------------------------------------------------
meus_dados = c(1:10)
matrix(data=meus_dados, nrow=5, ncol=2, byrow=T)
matrix(data=meus_dados, nrow=5, ncol=2)

# Fatiando a matriz (lin,col)
#------------------------------------------------------------------------------
mat <- matrix( c(2,3,4,5), nr=2)
mat
mat[1,2]
mat[2,2]
mat[1,3]
mat[,2]

# Criando matriz diagonal (todos os elementos=0, exceto a diagonal)
#------------------------------------------------------------------------------
matriz = 1:3
diag(matriz)

# Extraindo vetor de uma matriz diagonal
#------------------------------------------------------------------------------
vetor = diag(matriz)
diag(vetor)

# Transposta da matriz
#------------------------------------------------------------------------------
W <- matrix( c(2,4,8,12), nr=2, ncol=2)
W
t(W)
U <- t(W)
U

# Obtendo uma matriz inversa
#------------------------------------------------------------------------------
solve(W)

# Multiplicação de matrizes
#------------------------------------------------------------------------------
mat1 <- matrix( c(2,3,4,5), nr=2)
mat1
mat2 <- matrix( c(6,7,8,9), nr=2)
mat2
mat1 * mat2
mat1 / mat2
mat1 + mat2
mat1 - mat2

# Multiplicando a matriz com vetor
#------------------------------------------------------------------------------
x = c(1:4)
x
y <- matrix( c(2,3,4,5), nr=2)
y
x * y

# Nomeando a matriz
#------------------------------------------------------------------------------
mat3 <- matrix( c('Terra','Marte','Saturno','Netuno'), nr=2)
mat3
dimnames(mat3) = list( c("Linha1","Linha2"), c("Coluna1","Coluna2"))
mat3

# Identificando linhas e colunas no momento de criação da matriz
matrix( c(1,2,3,4), nr=2, dimnames=list( c("Linha1","Linha2"), c("Coluna1","Coluna2")))

# Combinando matrizes (por linha = rbind, por coluna = cbind)
#------------------------------------------------------------------------------
mat4 <- matrix( c(1,2,3,4), nr=2)
mat4
mat5 <- matrix( c(6,7,8,9), nr=2)
mat5
cbind(mat4, mat5)
rbind(mat4, mat5)

# Desconstruindo a matriz (em vetor)
c(mat4)
