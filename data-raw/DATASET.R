# "mananciais"

# Dados consolidados (anos terminados) --------

# purrr::walk(c(2000:2020), obter_ano)
# purrr::walk((2000:2020), limpar_dados, salvar_local = TRUE)
# mananciais_consolidado <- mananciais:::unir_anos(2000:2020)

mananciais_consolidado <- load("data/mananciais_consolidado.rda")

# Dados unidos com o ano atual ----------------


# mananciais:::obter_ano(ano = 2021, ano_atual = TRUE) %>%
#   mananciais:::limpar_dados(df = ., usar_baixados = FALSE) %>%
#   readr::write_rds(glue::glue("inst/extdata/mananciais_2021.rds"),  compress = "xz")


mananciais <-
  # readr::read_rds("inst/extdata/mananciais_2021.rds") %>%
  rbind(mananciais_consolidado) %>%
  dplyr::arrange(desc(data))




usethis::use_data(mananciais_consolidado, mananciais, overwrite = T)



# readr::write_csv2(mananciais, "inst/extdata/mananciais.csv")
# readr::write_csv2(mananciais_consolidado, "inst/extdata/mananciais_consolidado.csv")
