
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mananciais

<!-- badges: start -->

[![R build
status](https://github.com/beatrizmilz/mananciais/workflows/R-CMD-check/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

O objetivo deste pacote é disponibilizar a base de dados sobre volume
armazenado em mananciais de abastecimento público na Região
Metropolitana de São Paulo (SP - Brasil).

Os dados foram obtidos no [Portal dos
Mananciais](http://mananciais.sabesp.com.br/Situacao) da
[SABESP](http://site.sabesp.com.br/site/Default.aspx).

Este pacote foi derivado de um código web scraping desenvolvido pela
equipe da [Curso-R](https://www.curso-r.com/), em uma
[live](https://youtu.be/jvZIxrMmOcQ), e o código original está
disponível [neste
link](https://github.com/curso-r/lives/blob/master/drafts/20200730_scraper_sabesp.R).

## Instalação

Este pacote pode ser instalada através do [GitHub](https://github.com/)
utilizando:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
```

## Como usar?

Existem dois arquivos disponíveis, em que a diferença é o período dos
dados. Caso você não utilize `R` e queira ter acesso aos dados em
formato `.csv`, os mesmos podem ser acessados através dos links a
seguir. Lembrete: o arquivo foi salvo em formato “separado por ponto e
vírgula”, e com encoding “UTF-8”.

  - `mananciais_consolidado` - 2000 à 2019 - [Baixar versão
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais_consolidado.csv)

  - `mananciais` - 2000 à 2020 (parcial) - [Baixar versão
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv).
    Esse arquivo é atualizado através de um workflow no [GitHub
    Actions](https://github.com/beatrizmilz/mananciais/actions).

Abaixo segue um exemplo das bases disponíveis:

``` r
library(mananciais)

str(mananciais)
#> tibble [46,468 x 8] (S3: tbl_df/tbl/data.frame)
#>  $ data               : Date[1:46468], format: "2020-01-01" "2020-01-01" ...
#>  $ sistema            : chr [1:46468] "Cantareira" "Alto Tietê" "Guarapiranga" "Cotia" ...
#>  $ volume_porcentagem : num [1:46468] 40.3 76.6 64 73.4 82.6 97.6 58.8 40.4 76.4 63.6 ...
#>  $ volume_variacao    : num [1:46468] -0.1 -0.2 -0.5 -0.4 -0.3 -0.5 -0.1 0.1 -0.2 -0.4 ...
#>  $ volume_operacional : num [1:46468] 396 429.2 109.6 12.1 92.7 ...
#>  $ pluviometria_dia   : num [1:46468] 0.2 0 0.6 0 0 0 0 16.6 10.2 1.6 ...
#>  $ pluviometria_mensal: num [1:46468] 0.2 0 0.6 0 0 0 0 16.8 10.2 2.2 ...
#>  $ pluviometria_hist  : num [1:46468] 263 246 229 225 251 ...

str(mananciais_consolidado)
#> tibble [44,529 x 8] (S3: tbl_df/tbl/data.frame)
#>  $ data               : Date[1:44529], format: "2000-01-01" "2000-01-01" ...
#>  $ sistema            : chr [1:44529] "Cantareira" "Alto Tietê" "Guarapiranga" "Cotia" ...
#>  $ volume_porcentagem : num [1:44529] 47.1 50.9 36 18.8 81 73.2 47.8 51.4 36.4 18.8 ...
#>  $ volume_variacao    : num [1:44529] 0.3 0.1 0 0.9 0.4 -0.2 0.7 0.5 0.4 0 ...
#>  $ volume_operacional : num [1:44529] 365.51 196.03 64.8 2.65 91.69 ...
#>  $ pluviometria_dia   : num [1:44529] 30.9 26 47.2 0 0 5.2 29.1 47.3 9.2 33.2 ...
#>  $ pluviometria_mensal: num [1:44529] 30.9 26 47.2 0 0 5.2 60 73.3 56.4 33.2 ...
#>  $ pluviometria_hist  : num [1:44529] 255 238 225 218 235 ...
```

Caso você queira utilizar a base mais atual, sem que seja necessário
reinstalar o pacote, recomendo que utilize o seguinte código:

``` r
mananciais <- readr::read_csv2("https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv")
#> i Using ',' as decimal and '.' as grouping mark. Use `read_delim()` for more control.
#> 
#> -- Column specification -------------------------------------------------------------
#> cols(
#>   data = col_date(format = ""),
#>   sistema = col_character(),
#>   volume_porcentagem = col_double(),
#>   volume_variacao = col_double(),
#>   volume_operacional = col_double(),
#>   pluviometria_dia = col_double(),
#>   pluviometria_mensal = col_double(),
#>   pluviometria_hist = col_double()
#> )
```

### Exemplo de tabela

``` r
mananciais %>% 
  dplyr::arrange(desc(data)) %>% 
  head(7) %>%
  knitr::kable()
```

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2020-10-09 | Cantareira   |                39.4 |            \-0.2 |           386.59327 |               7.3 |                 11.0 |              127.8 |
| 2020-10-09 | Alto Tietê   |                58.5 |            \-0.2 |           327.97351 |               6.4 |                 11.6 |              113.4 |
| 2020-10-09 | Guarapiranga |                45.3 |              0.0 |            77.59042 |               3.4 |                 14.8 |              114.9 |
| 2020-10-09 | Cotia        |                61.7 |            \-0.1 |            10.17398 |               2.4 |                 11.6 |              113.5 |
| 2020-10-09 | Rio Grande   |                77.3 |            \-0.1 |            86.70788 |               6.0 |                 17.6 |              133.2 |
| 2020-10-09 | Rio Claro    |                57.0 |            \-0.4 |             7.79603 |               4.4 |                 20.6 |              176.1 |
| 2020-10-09 | São Lourenço |                63.0 |            \-0.2 |            55.94841 |               1.8 |                  9.0 |              141.2 |
