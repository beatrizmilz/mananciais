#' Obtém dados de um ano.
#'
#' A tibble que retorna é a versão original obtida na API, ou seja, não foi limpa.
#'
#' Essa função demora alguns minutos para executar.
#'
#' @param ano  Numérico. Qual é o ano que deve ser feito o download. Ex: 2019.
#' @param ano_atual  Lógico. Se quiser obter dados de anos anteriores, deve ser FALSE. Se quiser obter dados do ano atual, deve ser TRUE. Por padrão, é FALSE.
#' @param download_local Lógico. Se for TRUE, uma cópia dos dados baixados será salvo localmente.
#' @param diretorio_download Diretório onde o arquivo final deve ser salvo. Ex: "data-raw/"
#'
#'
#' @return Retorna um tibble com os dados do ano.
#'
#' @examples  mananciais:::obter_ano(2019, download_local = FALSE)
#' @examples  mananciais:::obter_ano(2020, ano_atual = TRUE, download_local = FALSE)
obter_ano <-
  function(ano,
           ano_atual = FALSE,
           download_local = TRUE,
           diretorio_download = "data-raw/") {
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

    tabela <-
      purrr::map_dfr(dias, mananciais:::obter_dia, .id = "dia")

    if (download_local == TRUE) {
      tabela %>%
        # Exportar
        readr::write_rds(glue::glue("{diretorio_download}mananciais_{ano}.rds"),
                         compress = "xz")
    }


    return(tabela)
  }
