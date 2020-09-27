#"mananciais"

# Dados consolidados (anos terminados) --------

# purrr::walk(c(2000:2019), obter_ano)
# purrr::walk(c(2000:2019), limpar_dados)
# mananciais <- mananciais:::unir_anos(2000:2019)

mananciais <- readr::read_rds("data/mananciais.rds")

# Dados unidos com o ano atual ----------------


# mananciais:::obter_ano(ano = 2020, ano_atual = TRUE) %>%
#   mananciais:::limpar_dados() %>%
#   readr::write_rds(glue::glue("data/mananciais_2020.rds"),  compress = "xz")


mananciais_atualizado <-
  readr::read_rds("data/mananciais_2020.rds") %>%
  rbind(mananciais)




usethis::use_data(mananciais, mananciais_atualizado, overwrite = T)



# readr::write_csv2(mananciais, "docs/data/mananciais.csv")
# readr::write_csv2(mananciais_atualizado, "docs/data/mananciais_atualizado.csv")
