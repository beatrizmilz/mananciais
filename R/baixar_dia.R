#' Title
#'
#' @param dia
#'
#' @return
#' @export
#'
#' @examples
baixar_dia <- function(dia) {

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


  final <- sistemas %>% dplyr::mutate(data_original = data_json)

  return(final)
}
