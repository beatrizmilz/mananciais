
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Mananciais

<!-- badges: start -->

[![R build
status](https://github.com/beatrizmilz/mananciais/workflows/R-CMD-check/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)
[![Render
README](https://github.com/beatrizmilz/mananciais/workflows/Render%20README/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

**PACOTE EM DESENVOLVIMENTO**

O objetivo deste pacote é disponibilizar a base de dados sobre volume
armazenado em mananciais de abastecimento público na Região
Metropolitana de São Paulo (SP - Brasil).

Os dados foram obtidos no [Portal dos
Mananciais](http://mananciais.sabesp.com.br/Situacao) da
[SABESP](http://site.sabesp.com.br/site/Default.aspx), através dos dados
disponíveis na
[API](http://mananciais.sabesp.com.br/api/Mananciais/ResumoSistemas/2020-01-01).

Existem dois arquivos disponíveis, em que a diferença é o período dos
dados. Caso você não utilize `R` e queira ter acesso aos dados em
formato `.csv`, os mesmos podem ser acessados através dos links a
seguir. Lembrete: o arquivo foi salvo em formato “separado por ponto e
vírgula”, e com encoding “UFT-8”.

  - `mananciais_consolidado` - 2000 à 2019 - [Baixar versão
    `.csv`](https://beatrizmilz.github.io/mananciais/data/mananciais_consolidado.csv)

  - `mananciais` - 2000 à 2020 (parcial) - [Baixar versão
    `.csv`](https://beatrizmilz.github.io/mananciais/data/mananciais.csv),
    atualizado em: 27/09/2020.

## Instalação

A versão em desenvolvimento deste pacote pode ser instalada através do
[GitHub](https://github.com/) utilizando:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
```

## Exemplos

Abaixo segue um exemplo das bases disponíveis:

``` r
library(mananciais)

str(mananciais)
#> tibble [46,426 × 8] (S3: tbl_df/tbl/data.frame)
#>  $ data              : Date[1:46426], format: "2020-01-01" "2020-01-01" ...
#>  $ nome              : chr [1:46426] "Cantareira" "Alto Tietê" "Guarapiranga" "Cotia" ...
#>  $ volume_porcentagem: num [1:46426] 40.3 76.6 64 73.4 82.6 97.6 58.8 40.4 76.4 63.6 ...
#>  $ volume_variacao   : num [1:46426] -0.1 -0.2 -0.5 -0.4 -0.3 -0.5 -0.1 0.1 -0.2 -0.4 ...
#>  $ volume_operacional: num [1:46426] 396 429.2 109.6 12.1 92.7 ...
#>  $ prec_dia          : num [1:46426] 0.2 0 0.6 0 0 0 0 16.6 10.2 1.6 ...
#>  $ prec_mensal       : num [1:46426] 0.2 0 0.6 0 0 0 0 16.8 10.2 2.2 ...
#>  $ prec_hist         : num [1:46426] 263 246 229 225 251 ...

str(mananciais_consolidado)
#> tibble [44,529 × 8] (S3: tbl_df/tbl/data.frame)
#>  $ data              : Date[1:44529], format: "2000-01-01" "2000-01-01" ...
#>  $ nome              : chr [1:44529] "Cantareira" "Alto Tietê" "Guarapiranga" "Cotia" ...
#>  $ volume_porcentagem: num [1:44529] 47.1 50.9 36 18.8 81 73.2 47.8 51.4 36.4 18.8 ...
#>  $ volume_variacao   : num [1:44529] 0.3 0.1 0 0.9 0.4 -0.2 0.7 0.5 0.4 0 ...
#>  $ volume_operacional: num [1:44529] 365.51 196.03 64.8 2.65 91.69 ...
#>  $ prec_dia          : num [1:44529] 30.9 26 47.2 0 0 5.2 29.1 47.3 9.2 33.2 ...
#>  $ prec_mensal       : num [1:44529] 30.9 26 47.2 0 0 5.2 60 73.3 56.4 33.2 ...
#>  $ prec_hist         : num [1:44529] 255 238 225 218 235 ...
```

### Exemplo de tabela

``` r
mananciais %>% 
  dplyr::arrange(desc(data)) %>% 
  head(7) %>%
  knitr::kable()
```

| data       | nome         | volume\_porcentagem | volume\_variacao | volume\_operacional | prec\_dia | prec\_mensal | prec\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | --------: | -----------: | ---------: |
| 2020-09-27 | Cantareira   |                42.1 |            \-0.2 |           413.23628 |         0 |         22.2 |       83.9 |
| 2020-09-27 | Alto Tietê   |                60.9 |            \-0.2 |           341.09546 |         0 |         19.1 |       80.0 |
| 2020-09-27 | Guarapiranga |                46.9 |            \-0.1 |            80.25369 |         0 |         11.0 |       77.8 |
| 2020-09-27 | Cotia        |                64.4 |            \-0.4 |            10.63207 |         0 |          6.6 |       82.5 |
| 2020-09-27 | Rio Grande   |                78.0 |            \-0.2 |            87.52755 |         0 |         25.4 |       95.0 |
| 2020-09-27 | Rio Claro    |                63.5 |            \-0.5 |             8.67788 |         0 |         89.8 |      141.6 |
| 2020-09-27 | São Lourenço |                64.4 |            \-0.5 |            57.16546 |         0 |         19.0 |      115.9 |

### Exemplos de gráficos

## Desde o início dos dados

``` r
library(ggplot2)
mananciais %>%
  ggplot() +
  geom_line(aes(x = data, y = volume_porcentagem)) +
  scale_y_continuous(breaks = c(-25, 0, 25, 50, 75, 100)) +
facet_wrap( ~ nome, ncol = 2) +
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
facet_wrap( ~ nome, ncol = 2) +
  theme_bw() +
  labs(x = "Meses", y = "Volume armazenado (%)")
```

<img src="man/figures/README-ggplot2-1.png" width="100%" />
