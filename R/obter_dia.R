#' Obtém dados de um único dia.
#'
#' A tibble que retorna é a versão original obtida na API, ou seja, não foi limpa.
#'
#' @param dia Uma string com data, no formato ano-mês-dia. Ex: "2020-09-27"
#'
#' @return Retorna uma tibble com dados dos mananciais para o dia informado
#' @examples mananciais:::obter_dia("2020-09-26")
#'

obter_dia <- function(dia) {

  url <-
    paste0("http://mananciais.sabesp.com.br/api/Mananciais/ResumoSistemas/",
           dia)

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


  final <- sistemas %>% dplyr::mutate(
    data_original = data_json,
    dia_busca = dia,
     data = lubridate::dmy(data_original$value),
     data_valida = dplyr::case_when(dia_busca == data ~ TRUE,
                                    dia_busca != data ~ FALSE)
  ) %>%
    dplyr::filter(data_valida == TRUE) %>%
    dplyr::select(-data_valida, -dia_busca)

  return(final)
}
