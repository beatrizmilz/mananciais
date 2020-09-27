# # dados dos anos anteriores
# mananciais <- readr::read_rds("data/mananciais.rds")
#
# # download dos novos dados
# mananciais::raspar_site(ano = 2020, ano_atual = TRUE)
# mananciais::limpar_dados(ano = 2020) %>%
#   readr::write_rds(glue::glue("data/mananciais_2020.rds"),  compress = "xz")
#
# # junta as duas bases
# mananciais_atualizado <-
#   readr::read_rds("data/mananciais_2020.rds") %>%
#   rbind(mananciais)
#
#
# # cria os arquivos de data
# usethis::use_data(mananciais_atualizado, overwrite = T)
