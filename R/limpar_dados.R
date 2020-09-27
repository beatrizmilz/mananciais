#' Title
#'
#' @param df
#'
#' @return
#' @export
#'
#' @examples
limpar_dados <- function(ano,
                         diretorio_download = "data-raw/",
                         diretorio_salvar = "data-raw/data-clean/") {
  tabela_raw <-
    readr::read_rds(glue::glue("{diretorio_download}mananciais_{ano}.rds"))


  # colocar um if aqui, pois a limpeza depende. dados antigos não tem tantas colunas

  dados_limpos <-
    tabela_raw %>%
    dplyr::mutate(
      volume_porcentagem = readr::parse_number(volume_porcentagem_ar, locale = readr::locale(decimal_mark = ",")),
      volume_variacao = volume_variacao_num,
      prec_dia = readr::parse_number(prec_dia        , locale = readr::locale(decimal_mark = ",")),
      prec_mensal  = readr::parse_number(prec_mensal        , locale = readr::locale(decimal_mark = ",")),
      prec_hist = readr::parse_number(prec_hist        , locale = readr::locale(decimal_mark = ","))
    ) %>%
    dplyr::select(
      data,
      nome,
      volume_porcentagem,
      volume_variacao,
      volume_operacional,
      prec_dia:prec_hist
    )

    dados_limpos %>%
    # Exportar
    readr::write_rds(glue::glue("{diretorio_salvar}mananciais_{ano}.rds"),
                     compress = "xz")

  return(dados_limpos)
}
