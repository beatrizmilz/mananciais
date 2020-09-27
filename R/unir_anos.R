#' Unir bases de anos
#'
#' Usa os dados salvos localmente. A função não está adaptada para usar com pipe ( %>% ).
#'
#' @param anos Quais anos deseja unir. Ex: `2000:2019`
#' @param usar_baixados Lógico. Caso `usar_baixados = TRUE`, utilizará os dados baixados anteriormente.
#' @param diretorio_salvar Texto. OPCIONAL. Local onde salvar os arquivos limpos, caso `salvar_local = TRUE`. Ex: `"data/"`
#' @param diretorio_dados Caso `usar_baixados = TRUE`, utilizará os dados baixados anteriormente. Informar em qual diretório os arquivos estão salvos.  Ex: `"data-raw/data-clean/"`
#' @param salvar_local Lógico. Caso `salvar_local = TRUE`, irá salvar o resultado no diretório informado no argumento `diretorio_salvar`
#'
#' @return Retorna um tibble com os dados unidos.
#'
#' @examples # mananciais:::unir_anos(2000:2019)
#'
unir_anos <-  function(anos,
                        usar_baixados =  TRUE,
                        diretorio_dados = "data-raw/data-clean/",
                        salvar_local = FALSE,
                        diretorio_salvar = "inst/extdata/"
                        ) {


  df <- glue::glue("{diretorio_dados}mananciais_{anos}.rds") %>%
    purrr::map(readr::read_rds) %>%
    purrr::reduce(rbind)

  if (salvar_local == TRUE) {
    df %>% readr::write_rds(glue::glue("{diretorio_salvar}mananciais_consolidado.rds"),
                            compress = "xz")
  }


  return(df)
}
