#"mananciais"

# Dados consolidados (anos terminados) --------

# purrr::walk(c(2000:2020), obter_ano)
# purrr::walk((2000:2020), limpar_dados, salvar_local = TRUE)
# mananciais_consolidado <- mananciais:::unir_anos(2000:2020)
# readr::write_rds(mananciais_consolidado, "inst/extdata/mananciais_consolidado.rds")

 mananciais_consolidado <- readr::read_rds("inst/extdata/mananciais_consolidado.rds")

# Dados unidos com o ano atual ----------------


 # mananciais:::obter_ano(ano = 2021, ano_atual = TRUE) %>%
 #   mananciais:::limpar_dados(df = ., usar_baixados = FALSE) %>%
 #   readr::write_rds(glue::glue("inst/extdata/mananciais_2021.rds"),  compress = "xz")


mananciais <-
  readr::read_rds("inst/extdata/mananciais_2021.rds") %>%
  rbind(mananciais_consolidado) %>%
  dplyr::arrange(desc(data))




usethis::use_data(mananciais_consolidado, mananciais, overwrite = T)



# readr::write_csv2(mananciais, "inst/extdata/mananciais.csv")
# readr::write_csv2(mananciais_consolidado, "inst/extdata/mananciais_consolidado.csv")



#' Dados sobre os Mananciais
#'
#' Base de dados contendo informações sobre os Sistemas
#' que abastecem a Região Metropolitana de São Paulo
#'
#' @format Uma tibble, contendo:
#' \describe{
#'   \item{data}{Data no formato ano-mês-dia (yyyy-mm-dd)}
#'   \item{sistema}{Nome do sistema de abastecimento público}
#'   \item{volume_porcentagem}{Volume operacional do sistema em porcentagem (%)}
#'   \item{volume_variacao}{Variação em porcentagem (%) do volume operacional do sistema}
#'   \item{volume_operacional}{Volume operacional do sistema em hm³}
#'   \item{pluviometria_dia}{Pluviometria do dia (mm)}
#'   \item{pluviometria_mensal}{Pluviometria acumulada do mês (mm)}
#'   \item{pluviometria_hist}{Pluviometria média histórica mensal (mm)}
#'
#' }
#' @name mananciais
#' @source SABESP - \url{http://mananciais.sabesp.com.br/Situacao}
#' @examples head(mananciais)
#'
"mananciais"

#' @rdname mananciais
"mananciais_consolidado"
