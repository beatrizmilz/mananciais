library(mananciais)
library(ggplot2) # pacote para criar gráficos
library(dplyr) # pacote para manipulação de dados
library(magrittr, include.only = "%>%") # carregar o pipe
mananciais <- mananciais::dados_mananciais()
grafico <- mananciais %>%
  dplyr::mutate(ano = lubridate::year(data)) %>%
  dplyr::filter(sistema == "Cantareira") %>%
  ggplot() +
  geom_line(aes(x = data, y = volume_porcentagem), color =
              "#FFFFFF") +
  scale_y_continuous(breaks = c(-25, 0, 25, 50, 75, 100)) +
  theme_void() +
  theme_transparent()


library(hexSticker)
imgurl <- system.file("figures/cat.png", package = "hexSticker")
sticker(
  grafico,
  package = "mananciais",
  p_y = 0.7,
  p_size = 8,
  p_color =  "#FFFFFF",
  s_x = 1,
  s_y = 1.2,
  s_width = 1.7,
  h_fill = "#3e7dab",
  h_color = "#FFFFFF",
  dpi = 300,
  filename = "man/figures/hexlogo.png"

)
