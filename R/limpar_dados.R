#' Title
#'
#' @param df
#'
#' @return
#' @export
#'
#' @examples
limpar_dados <- function(ano,
                         diretorio_download = "data-raw"
                         ) {



  # colocar um if aqui, pois a limpeza depende. dados antigos não tem tantas colunas

  dados_limpos <-
    dados_data_valida %>%  select(data, sistema_id:volume_operacional, prec_dia:prec_hist) %>%
    mutate(
      volume_porcentagem_ar = readr::parse_number(volume_porcentagem_ar, locale = readr::locale(decimal_mark = ",")),
      volume_variacao_str = readr::parse_number(volume_variacao_str , locale = readr::locale(decimal_mark = ",")),
      prec_dia = readr::parse_number(prec_dia        , locale = readr::locale(decimal_mark = ",")),
      prec_mensal  = readr::parse_number(prec_mensal        , locale = readr::locale(decimal_mark = ",")),
      prec_hist = readr::parse_number(prec_hist        , locale = readr::locale(decimal_mark = ","))
    )


  return(dados_limpos)
}
