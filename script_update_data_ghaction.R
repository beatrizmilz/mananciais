# Abre o arquivo dos anos passados
mananciais_consolidado <-
  readr::read_rds("data/mananciais_consolidado.rds")

# Faz download dos novos dados, limpa e salva
mananciais:::obter_ano(ano = 2020, ano_atual = TRUE) %>%
  mananciais:::limpar_dados(df = ., usar_baixados = FALSE) %>%
  readr::write_rds(glue::glue("data/mananciais_2020.rds"),  compress = "xz")

# une os novos dados com os dados consolidados
mananciais <-
  readr::read_rds("data/mananciais_2020.rds") %>%
  rbind(mananciais_consolidado)


# cria os arquivos de data
usethis::use_data(mananciais, overwrite = T)

# criar CSV
readr::write_csv2(mananciais, "docs/data/mananciais.csv")
