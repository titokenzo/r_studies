# Trabalhando com Arquivos Excel

# Configurando o diretório de trabalho
setwd("d:/Estudos/datascience/RFundamentos/Cap05")
getwd()
#------------------------------------------------------------------------------

# Instalar o Java - JDK
# Instalar o interpretador Pearl

# ********** Pacotes que requerem o Java: **********
# XLConnect
# xlsx
# rJAva

# ********** Pacotes que requerem o Perl: **********
# gdata

# Instalando pacotes (usam o JDK)
#------------------------------------------------------------------------------
install.packages('rJava')
install.packages('xlsx')
install.packages("XLConnect")
install.packages("readxl")
install.packages("gdata")
library(rJava)

# Obs.: Alguns pacotes possuem o mesmo nome de funções. Para evitar problemas,
# carregue e use os pacotes de forma individual (um de cada vez)

# Lista os worksheets no arquivo Excel
#------------------------------------------------------------------------------
library(readxl)
arq = "arquivos/UrbanPop.xlsx"
excel_sheets(arq)

# Lendo a planilha do Excel
read_excel(arq)
head(read_excel(arq))
read_excel(arq, sheet = "Period2")
read_excel(arq, sheet = 3)
read_excel(arq, sheet = 4)

# Importando uma worksheet para um dataframe
df <- read_excel(arq, sheet = 3)
head(df)

# Importando tadas as worksheets
df_todas <- lapply(excel_sheets(arq), read_excel, path = arq)
df_todas
class(df_todas)

# Pacote XLConnect
#------------------------------------------------------------------------------
detach(package:readxl)
library(XLConnect)

# Utilizando Namespace
arq1 = XLConnect::loadWorkbook(arq)
df1 = readWorksheet(arq1, sheet = "Period1", header = T)
df1
class(df1)

# Pacote xlsx
#------------------------------------------------------------------------------
detach(package:XLConnect)
library(xlsx)
?xlsx

?read.xlsx
df2 <- read.xlsx(arq, sheetIndex = 1)
df2

# Pacote gdata
#------------------------------------------------------------------------------
detach(package:xlsx)
library(gdata)

arq3 <- xls2csv("arquivos/planilha1.xlsx", sheet = 1, na.strings = "EMPTY")
arq3
read.csv(arq3)
