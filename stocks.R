library(ggplot2)
library(tidyverse)
library(readxl)

le_dado <- function(file, sheet_name) {
  
  my_data <- read_excel(
    file, 
    sheet = sheet_name)  
  result_df <- tibble(Data = my_data$Date, Close = my_data$Close)
  
  return(result_df)
}

divo11_df <- le_dado(
  "/home/flavioyuan/Documentos/R/Projetos/Econometric_models/data/stocks.xlsx",
  "DIVO11")

petr4_df <- le_dado(
  "/home/flavioyuan/Documentos/R/Projetos/Econometric_models/data/stocks.xlsx",
  "PETR4")

ggplot() +
  labs(
    title = "Cotacoes",
    subtitle = "Serie temporal",
    x = "Data",
    y = "Cotação"
  ) +
  geom_line(data = petr4_df,
            mapping = aes(x = Data, y = Close)
          ) +
  geom_line(data = divo11_df,
            mapping = aes(x = Data, y = Close),
            color="red"
  )
