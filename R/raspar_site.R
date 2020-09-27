#' Title
#'
#' @param ano
#' @param ano_atual
#'
#' @return
#' @export
#'
#' @examples
raspar_site <-
  function(ano,
           ano_atual = FALSE,
           diretorio_download = "data-raw/",
           download_local = TRUE) {

    if (ano_atual == FALSE) {
      dias <-  purrr::set_names(lubridate::as_date(
        lubridate::as_date(glue::glue("{ano}-01-01")):lubridate::as_date(glue::glue("{ano}-12-31"))
      ))
    } else {
      # ano_atual = TRUE
      dias <- purrr::set_names(lubridate::as_date(
        lubridate::as_date(glue::glue("{ano}-01-01")):lubridate::as_date(Sys.Date())
      ))
    }

    tabela_sem_filtro <-
      purrr::map_dfr(dias, baixar_dia, .id = "dia")


    tabela_filtrada <- tabela_sem_filtro %>%
      dplyr::mutate(
        data = lubridate::dmy(data_original$value),
        data_valida = dplyr::case_when(dia == data ~ TRUE,
                                       dia != data ~ FALSE)
      ) %>%
      dplyr::filter(data_valida == TRUE)


    tabela_filtrada %>%
      # Exportar
      readr::write_rds(glue::glue("{diretorio_download}mananciais_{ano}.rds"),
                       compress = "xz")

    return(tabela_filtrada)
  }
