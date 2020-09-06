# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("D:/Projetos/datascience/RFundamentos/Cap03")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho
?getwd
list.files()

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números
v1 <- c(letters[1:6])
v2 <- c(TRUE, TRUE, FALSE, TRUE, FALSE, FALSE)
v3 <- c(1:6)
df <- data.frame(v1, v2, v3)
df

# Exercício 3 - Considere o vetor abaixo. 
# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.
# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34)
vec1

for(i in vec1){
  print(i)
  if(i>10){
    print("Este número é maior que 10")
  }else if(i==10){
    print("Este número é igual a 10")
  }else{
    print("Este número é menor que 10")
  }
}

# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2
for(i in lst2){
  print(i)
}
# OU
for(i in 1:length(lst2)){
  print(lst2[[i]])
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise
mat3 <- mat1 * mat2
mat3

# Multiplicação de matrizes
mat4 <- mat1 %*% mat2
mat4

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos
vetor <- c(1:6)
names(vetor) <- c('Um','Dois','Três','Quatro','Cinco','Seis')
vetor

matriz <- matrix(vetor, nr=3, dimnames=list( c("Linha1","Linha2","Linha3"), c("Coluna1","Coluna2")))
matriz

lista <- list(Matriz=matriz, Vetor=vetor, Lógico=TRUE)
lista

df <- as.data.frame(matriz)
df
# OU
df <- data.frame(c('A','B','C'),c(5,8,7),c(TRUE,TRUE,FALSE))
colnames(df) <- c('Caracteres','Numeros','Lógicos')
rownames(df) <- c('L1','L2','L3')
df

# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

?sample
mat3 = mat2
muda <- sort(sample(mat2, size=50))
muda
for(i in muda){
  idx = which(mat2==i, arr.ind = TRUE)
  mat3[idx] <- NA
}
mat3
# OU
mat4 = mat2
mat4[sample(1:50, 10)] = NA
mat4

# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
# Soma por linha
apply(mat1, 1, sum)
rowSums(mat1)
# Soma por coluna
apply(mat1, 2, sum)
colSums(mat1)

# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a
sort(a)
# OU order(a)
a[order(a)]

# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1

for(i in mat1){
  if(i>15)  
    print(i)
}
