# Operadores básicos, relacionais e lógicos em R

# Obs.: Caso tenha problemas com a acentuação, consulte este llink:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("d:/Projetos/datascience/RFundamentos/Cap02")
getwd()

# Operadores básicos

# Soma
7 + 7

# Subtração
7 - 4

# Multiplicação
5 * 5

# Divisão
8 / 4

# Potência
3^2
3**2

# Módulo (resto da divisão)
16 %% 3

# Operadores Ralacionais

# Atribuindo variáveis
x = 7
y = 5

# Operadores
x > 8
x < 8
x <= 8
x >= 8
x == 8
x != 8

# Operadores lógicos

# And
(x==8) & (x==6)
(x==7) & (x>=5)
(x==8) & (x==5)

# Or
(x==8) | (x==6)
(x==8) | (x>=5)

# Not
x > 8
print(!x > 8)
