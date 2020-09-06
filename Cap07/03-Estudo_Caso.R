# Estudo de Caso - Limpando, Transformando e Manipulando Dados de Voos

# Configurando o diretório de trabalho
setwd("D:/Estudo/datascience/RFundamentos/Cap07")
getwd()
#------------------------------------------------------------------------------

# Instalando pacote hflights (dados de voos de Houston)
install.packages("hflights")
library(hflights)
library(dplyr)
?hflights

# Criando um objeto tbl
?tbl_df
flights <- tbl_df(hflights)
flights
# resumo dos dados
str(flights)
glimpse(flights)

# Visualizando como dataframe
data.frame(head(flights))

# Filtrando os dados com slice ([lin, col])
flights[flights$Month == 1 & flights$DayofMonth == 1, ]

# Aplicando filter
filter(flights, Month == 1, DayofMonth == 1)
filter(flights, UniqueCarrier == "AA" | UniqueCarrier == "UA")
filter(flights, UniqueCarrier %in% c("AA", "UA"))

# Select 
# (colunas: Year até DayofMonth e outras que contenham, no nome, Taxi ou Delay)
select(flights, Year:DayofMonth, contains("Taxi"), contains("Delay"))

# Organizando os dados
flights %>%
  select(UniqueCarrier, DepDelay) %>%
  arrange(DepDelay)

flights %>%
  select(Distance, AirTime) %>%
  mutate(Speed = Distance/AirTime*60)

head(with(flights, tapply(ArrDelay, Dest, mean, na.rm = T)))
head(aggregate(ArrDelay ~ Dest, flights, mean))

flights %>%
  group_by(Month, DayofMonth) %>%
  tally(sort = T)

