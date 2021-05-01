#' Funcao para atualizar dados de mananciais
#'
#' Usando os dados disponíveis no dados_mananciais(),
#' confere quais são os dias faltantes e busca os mesmos
#'
#' @return Uma tibble
#' @export
#'
#' @examples atualizar_dados()
atualizar_dados <- function() {
  data_inicial <- lubridate::as_date("2000-01-01")
  data_final <- Sys.Date()

  intervalo <- lubridate::as_date(data_inicial:data_final) %>%
    tibble::as_tibble()

  dados_mananciais <- dados_mananciais()

  dados_para_obter <- intervalo %>%
    dplyr::filter(!value %in% dados_mananciais$data) %>%
    dplyr::pull()


  if (length(dados_para_obter) == 0) {
    print("Os dados ja estao atualizados, nao foi necessario atualizar")

    dados_mananciais
  } else {
    mananciais <- purrr::map_dfr(dados_para_obter, obter_dia) %>%
      mananciais:::limpar_dados() %>%
      rbind(dados_mananciais) %>%
      dplyr::arrange(desc(data))

    mananciais
  }
}
