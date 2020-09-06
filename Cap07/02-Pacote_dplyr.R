# Pacote DPLYR

# Configurando o diretório de trabalho
setwd("D:/Estudo/datascience/RFundamentos/Cap07")
getwd()
#------------------------------------------------------------------------------

# Instalando os pacotes
#install.packages("readr")
#install.packages("dplyr")
library(readr)
library(dplyr)

# Carregando o dataset
sono_df <- read_csv("arquivos/sono.csv")
View(sono_df)
head(sono_df)
class(sono_df)
str(sono_df)

# Função glimpse() pode ser usada no lugar da função str()
#------------------------------------------------------------------------------
glimpse(sono_df)

# Aplicando mutate()
# Simulando a criação de uma coluna "peso_libras" sem alterar o dataset
glimpse(mutate(sono_df, peso_libras = sono_total / 0.45359237))

# Contagem e histograma
count(sono_df, cidade)
hist(sono_df$sono_total)

# Amostragem (10 linhas aleatórias)
#------------------------------------------------------------------------------
sample_n(sono_df, size = 10)

# Selecionando so campos com select()
#------------------------------------------------------------------------------
sleepData <- select(sono_df, nome, sono_total)
head(sleepData)
class(sleepData)
select(sono_df, nome)
select(sono_df, nome:cidade)
select(sono_df, nome:pais)

# Filtrando os dados com filter()
#------------------------------------------------------------------------------
filter(sono_df, sono_total >= 16)
filter(sono_df, sono_total >= 16, peso >=80)
filter(sono_df, cidade %in% c("Recife", "Curitiba"))

# Ordenando os dados com arrange()
#------------------------------------------------------------------------------
sono_df %>% arrange(cidade) %>% head()

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  head()

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, sono_total) %>%
  filter(sono_total >= 16)

sono_df %>%
  select(nome, cidade, sono_total) %>%
  arrange(cidade, desc(sono_total)) %>%
  filter(sono_total >= 16)

# Testando novas medidas com mutate()
#------------------------------------------------------------------------------
head(sono_df)
sono_df %>%
  mutate(novo_indice = sono_total / peso) %>%
  head()
head(sono_df)

sono_df %>%
  mutate(novo_indice = sono_total / peso, peso_libras = peso / 0.45359237) %>%
  head

# Resumindo os dados com summarize()
#------------------------------------------------------------------------------
sono_df %>%
  summarize(media_sono = mean(sono_total))

sono_df %>%
  summarize(media_sono = mean(sono_total), 
            min_sono = min(sono_total), 
            max_sono = max(sono_total),
            total = n())

# group_by()
sono_df %>%
  group_by(cidade) %>%
  summarize(avg_sono = mean(sono_total),
            min_sono = min(sono_total),
            max_sono = max(sono_total),
            total = n())

# Operador: %>%
#------------------------------------------------------------------------------
head(select(sono_df, nome, sono_total))

sono_df %>%
  select(nome, sono_total) %>%
  head

sono_df %>%
  mutate(novo_indice = round(sono_total * peso)) %>%
  arrange(desc(novo_indice)) %>%
  select(cidade, novo_indice)

sono_df
