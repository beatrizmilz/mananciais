
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
[SABESP](http://site.sabesp.com.br/site/Default.aspx), através dos dados
disponíveis na
[API](http://mananciais.sabesp.com.br/api/Mananciais/ResumoSistemas/2020-01-01).

Este pacote foi derivado de um código web scraping desenvolvido pela
equipe da [Curso-R](https://www.curso-r.com/), em uma
[live](https://youtu.be/jvZIxrMmOcQ), e o código original está
disponível [neste
link](https://github.com/curso-r/lives/blob/master/drafts/20200730_scraper_sabesp.R).

## Instalação

A versão em desenvolvimento deste pacote pode ser instalada através do
[GitHub](https://github.com/) utilizando:

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
#> tibble [46,482 × 8] (S3: tbl_df/tbl/data.frame)
#>  $ data               : Date[1:46482], format: "2020-10-05" "2020-10-05" ...
#>  $ sistema            : chr [1:46482] "Cantareira" "Alto Tietê" "Guarapiranga" "Cotia" ...
#>  $ volume_porcentagem : num [1:46482] 40.3 59.3 45.7 62.5 77.9 59.1 63 40.5 59.5 45.8 ...
#>  $ volume_variacao    : num [1:46482] -0.2 -0.2 -0.1 -0.2 -0.1 -0.5 0.2 -0.2 -0.2 -0.3 ...
#>  $ volume_operacional : num [1:46482] 395.5 332.2 78.3 10.3 87.4 ...
#>  $ pluviometria_dia   : num [1:46482] 0 0 0 0 0.6 0 0.4 0.1 0.1 0.4 ...
#>  $ pluviometria_mensal: num [1:46482] 0.7 1.3 5.2 3 6.6 6.2 1.4 0.7 1.3 5.2 ...
#>  $ pluviometria_hist  : num [1:46482] 128 113 115 114 133 ...

str(mananciais_consolidado)
#> tibble [44,529 × 8] (S3: tbl_df/tbl/data.frame)
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
#> [36mℹ[39m Using [34m[34m','[34m[39m as decimal and [34m[34m'.'[34m[39m as grouping mark. Use [30m[47m[30m[47m`read_delim()`[47m[30m[49m[39m for more control.
#> 
#> [36m──[39m [1m[1mColumn specification[1m[22m [36m────────────────────────────────────────────────────────[39m
#> cols(
#>   data = [34mcol_date(format = "")[39m,
#>   sistema = [31mcol_character()[39m,
#>   volume_porcentagem = [32mcol_double()[39m,
#>   volume_variacao = [32mcol_double()[39m,
#>   volume_operacional = [32mcol_double()[39m,
#>   pluviometria_dia = [32mcol_double()[39m,
#>   pluviometria_mensal = [32mcol_double()[39m,
#>   pluviometria_hist = [32mcol_double()[39m
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
| 2020-10-05 | Cantareira   |                40.3 |            \-0.2 |           395.48235 |               0.0 |                  0.7 |              127.8 |
| 2020-10-05 | Alto Tietê   |                59.3 |            \-0.2 |           332.22965 |               0.0 |                  1.3 |              113.4 |
| 2020-10-05 | Guarapiranga |                45.7 |            \-0.1 |            78.25342 |               0.0 |                  5.2 |              114.9 |
| 2020-10-05 | Cotia        |                62.5 |            \-0.2 |            10.31590 |               0.0 |                  3.0 |              113.5 |
| 2020-10-05 | Rio Grande   |                77.9 |            \-0.1 |            87.36326 |               0.6 |                  6.6 |              133.2 |
| 2020-10-05 | Rio Claro    |                59.1 |            \-0.5 |             8.07333 |               0.0 |                  6.2 |              176.1 |
| 2020-10-05 | São Lourenço |                63.0 |              0.2 |            55.94841 |               0.4 |                  1.4 |              141.2 |

### Exemplos de gráficos

## Desde o início dos dados

``` r
library(ggplot2)
mananciais %>%
  ggplot() +
  geom_line(aes(x = data, y = volume_porcentagem)) +
  scale_y_continuous(breaks = c(-25, 0, 25, 50, 75, 100)) +
  facet_wrap(~ sistema, ncol = 2) +
  theme_bw() +
  labs(x = "Ano", y = "Volume armazenado (%)")
```

<img src="man/figures/README-ggplot-1.png" width="100%" />

### Apenas ano atual

``` r
mananciais %>%
  dplyr::mutate(ano = lubridate::year(data)) %>% 
  dplyr::filter(ano == 2020) %>% 
  ggplot() +
  geom_line(aes(x = data, y = volume_porcentagem)) +
  scale_y_continuous(breaks = c(-25, 0, 25, 50, 75, 100)) +
facet_wrap( ~ sistema, ncol = 2) +
  theme_bw() +
  labs(x = "Meses", y = "Volume armazenado (%)")
```

<img src="man/figures/README-ggplot2-1.png" width="100%" />
