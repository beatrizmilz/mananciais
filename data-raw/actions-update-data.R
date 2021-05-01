# Carregar o pipe
library(magrittr, include.only = "%>%")

# buscar os dados
mananciais <-
  mananciais:::obter_ano(ano = 2021,
                         download_local = FALSE,
                         ano_atual = TRUE) %>%
  mananciais:::limpar_dados(df = ., usar_baixados = FALSE, salvar_local = FALSE) %>%
  rbind(mananciais::mananciais_consolidado) %>%
  dplyr::arrange(desc(data))

# adicionar os dados atualizados no pacote
usethis::use_data(mananciais, overwrite = T)

# salvar a versao csv
readr::write_csv2(mananciais, "inst/extdata/mananciais.csv")
# salvar a versao xlsx
writexl::write_xlsx(mananciais, "inst/extdata/mananciais.xlsx")

# gerar o readme
rmarkdown::render("README.Rmd")

# atualizar pagina inicial do pkgdown
pkgdown::build_home()
