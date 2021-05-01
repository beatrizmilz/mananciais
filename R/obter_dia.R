#' Obtém dados de um único dia.
#'
#' Dados disponíveis a partir do dia 01 de janeiro de 2000.
#' A tibble que retorna é a versão original obtida na API, ou seja, não foi
#' limpa.
#' A fonte dos dados é atualizada todos os dias, às 09h00 (Horário de Brasília).
#' Portanto, caso utilize essa função com a data atual e antes deste horário,
#' a tibble retornada não terá nenhuma linha.
#' O mesmo acontecerá se utilizar uma data futura, ou data anterior ao início
#' dos dados disponíveis.
#'
#' @param dia Uma string com data, no formato ano-mês-dia. Ex: `"2020-09-27"`
#'
#' @return Retorna uma tibble com dados dos mananciais para o dia informado
#' @examples # mananciais:::obter_dia("2020-09-26")
#' @examples # mananciais:::obter_dia("2020-09-26")
obter_dia <- function(dia) {
  url <-
    paste0(
      "http://mananciais.sabesp.com.br/api/Mananciais/ResumoSistemas/",
      dia
    )

  url_get <- httr::GET(url)


  json_dia <- httr::content(url_get, "text") %>%
    jsonlite::fromJSON(simplifyDataFrame = TRUE)


  sistemas <- json_dia %>%
    purrr::pluck("ReturnObj", "sistemas") %>%
    tibble::as_tibble() %>%
    janitor::clean_names()



  data_json <- json_dia %>%
    purrr::pluck("ReturnObj", "DataString") %>%
    tibble::as_tibble() %>%
    janitor::clean_names()


  final <- sistemas %>%
    dplyr::mutate(
      data_original = data_json,
      dia_busca = dia,
      data = lubridate::dmy(data_original$value),
      data_valida = dplyr::case_when(
        dia_busca == data ~ TRUE,
        dia_busca != data ~ FALSE
      )
    ) %>%
    dplyr::filter(data_valida == TRUE) %>%
    dplyr::select(-data_valida, -dia_busca)

  print(glue::glue("Dia baixado com sucesso: {dia}"))

  return(final)
}
