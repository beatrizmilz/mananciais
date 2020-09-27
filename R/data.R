#"mananciais"

# Dados consolidados (anos terminados) --------

# purrr::walk(c(2000:2019), obter_ano)
# purrr::walk(c(2000:2019), limpar_dados)
# mananciais <- mananciais:::unir_anos(2000:2019)

mananciais_consolidado <- readr::read_rds("data/mananciais_consolidado.rds")

# Dados unidos com o ano atual ----------------


# mananciais:::obter_ano(ano = 2020, ano_atual = TRUE) %>%
#   mananciais:::limpar_dados() %>%
#   readr::write_rds(glue::glue("data/mananciais_2020.rds"),  compress = "xz")


mananciais <-
  readr::read_rds("data/mananciais_2020.rds") %>%
  rbind(mananciais_consolidado)




usethis::use_data(mananciais_consolidado, mananciais, overwrite = T)



 # readr::write_csv2(mananciais, "docs/data/mananciais.csv")
 # readr::write_csv2(mananciais_consolidado, "docs/data/mananciais_consolidado.csv")
