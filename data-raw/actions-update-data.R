install.packages(".")
# Carregar o pipe
library(magrittr, include.only = "%>%")

# Checar se é necessário atualizar
resposta_atualizar <- mananciais:::checar_se_necessario_atualizar()

# Se for necessário atualizar, realizar os passos abaixo
if (resposta_atualizar == FALSE) {
  return("Os dados ja estao atualizados, nao foi necessario atualizar")
} else{
  # buscar os dados
  mananciais <- mananciais:::atualizar_dados()

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
}
