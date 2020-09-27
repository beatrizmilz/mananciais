#' Title
#'
#' @param anos
#' @param diretorio_dados
#' @param diretorio_salvar
#'
#' @return
#' @export
#'
#' @examples
unir_dados <-  function(anos,
                        diretorio_dados = "data-raw/data-clean/",
                        diretorio_salvar = "data/") {


  df <- glue::glue("{diretorio_dados}mananciais_{anos}.rds") %>%
    purrr::map(readr::read_rds) %>%
    purrr::reduce(rbind)

  df %>% readr::write_rds(glue::glue("{diretorio_salvar}mananciais.rds"),
                          compress = "xz")

  return(df)
}
