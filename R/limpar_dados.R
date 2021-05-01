#' Limpar dados.
#'
#' Pode ser usada com o pipe ( `%>%` ) (veja exemplo abaixo).
#' A limpeza consiste em: retirar colunas desnecessárias ou repetidas, altera o
#' tipo de algumas variáveis.
#'
#' @param df Tibble a ser limpa. OPCIONAL. Caso for limpar dados que já foram
#' baixados localmente, este argumento não é necessário.
#' @param ano Numérico. OPCIONAL. Utilizado caso queira limpar dados baixados
#' anteriormente.
#' @param usar_baixados Lógico.  Caso `usar_baixados = TRUE`, utilizará os dados
#'  baixados anteriormente.
#' @param diretorio_download Texto. OPCIONAL. Local onde os arquivos brutos
#' estão salvos, caso `usar_baixados = TRUE`. Ex: `"data-raw/"`
#' @param salvar_local Lógico.  Caso `salvar_local = TRUE`, irá salvar o
#' resultado localmente, como um arquivo `.rds`.
#' @param diretorio_salvar Texto. OPCIONAL. Local onde salvar os arquivos
#' limpos, caso `salvar_local = TRUE`. Ex: `"data-raw/data-clean/"`
#'
#' @return Retorna um tibble com os dados limpos.
#'
#' @examples # mananciais:::obter_dia("2020-09-26") %>% mananciais:::limpar_dados(df = ., usar_baixados = FALSE)
limpar_dados <- function(ano, df,
                         usar_baixados = TRUE,
                         diretorio_download = "data-raw/",
                         salvar_local = FALSE,
                         diretorio_salvar = "data-raw/data-clean/") {
  if (usar_baixados == TRUE) {
    df <-
      readr::read_rds(glue::glue("{diretorio_download}mananciais_{ano}.rds"))
  }


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

  if (salvar_local == TRUE) {
    dados_limpos %>%
      # Exportar
      readr::write_rds(glue::glue("{diretorio_salvar}mananciais_{ano}.rds"),
        compress = "xz"
      )
  }

  return(dados_limpos)
}
