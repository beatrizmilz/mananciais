#' Limpar dados.
#'
#' Pode ser usada com o pipe ( `%>%` ) (veja exemplo abaixo).
#' A limpeza consiste em: retirar colunas desnecessárias ou repetidas, altera o
#' tipo de algumas variáveis.
#'
#' @param df Tibble a ser limpa.
#'
#' @return Retorna um tibble com os dados limpos.
#'
#' @examples mananciais:::obter_dia("2020-09-26") %>% mananciais:::limpar_dados()
limpar_dados <- function(df) {

  dados_limpos <-
    df %>%
    dplyr::mutate(
      volume_porcentagem = readr::parse_number(
        volume_porcentagem_ar,
        locale = readr::locale(decimal_mark = ",")
      ),
      volume_variacao = volume_variacao_num,
      pluviometria_dia = readr::parse_number(
        prec_dia,
        locale = readr::locale(decimal_mark = ",")
      ),
      pluviometria_mensal = readr::parse_number(
        prec_mensal,
        locale = readr::locale(decimal_mark = ",")
      ),
      pluviometria_hist = readr::parse_number(
        prec_hist,
        locale = readr::locale(decimal_mark = ",")
      )
    ) %>%
    dplyr::rename(sistema = nome) %>%
    dplyr::select(
      data,
      sistema,
      volume_porcentagem,
      volume_variacao,
      volume_operacional,
      pluviometria_dia:pluviometria_hist
    )


  return(dados_limpos)
}
