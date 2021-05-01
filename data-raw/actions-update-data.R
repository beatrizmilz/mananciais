# Carregar o pipe
library(magrittr, include.only = "%>%")

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
