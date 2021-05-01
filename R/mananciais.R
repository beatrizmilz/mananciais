#' Mananciais
#'
#' Obter dados atualizados sobre os mananciais
#'
#' @return tibble
#' @export
#'
#' @examples dados_mananciais()
dados_mananciais <- function() {
  readr::read_delim(
    file =
      "https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv",
    locale = readr::locale(
      encoding = "UTF-8",
      decimal_mark = ",",
      grouping_mark = "."
    ),
    col_types = "Dcdddddd",
    delim = ";",
    escape_double = FALSE,
    trim_ws = TRUE
  )
}
