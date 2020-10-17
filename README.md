
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

dplyr::glimpse(mananciais)
#> Rows: 46,559
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2020-10-16, 2020-10-16, 2020-10-16, 2020-10-16, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 38.0, 57.6, 46.1, 60.8, 77.1, 55.1, 63.5, 38.2, 5…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m -0.2, -0.1, 0.0, -0.2, 0.0, -0.3, -0.2, -0.2, -0.…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 372.78685, 322.78074, 78.91830, 10.03318, 86.5444…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 4.5, 3.5, 1.2, 2.6, 5.2, 6.6, 1.4, 0.0, 0.0, 3.4,…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 27.4, 33.5, 35.8, 43.2, 43.4, 53.8, 37.6, 22.9, 3…
#> $ pluviometria_hist   [3m[90m<dbl>[39m[23m 127.8, 113.4, 114.9, 113.5, 133.2, 176.1, 141.2, …

dplyr::glimpse(mananciais_consolidado)
#> Rows: 44,529
#> Columns: 8
#> $ data                [3m[90m<date>[39m[23m 2000-01-01, 2000-01-01, 2000-01-01, 2000-01-01, …
#> $ sistema             [3m[90m<chr>[39m[23m "Cantareira", "Alto Tietê", "Guarapiranga", "Coti…
#> $ volume_porcentagem  [3m[90m<dbl>[39m[23m 47.1, 50.9, 36.0, 18.8, 81.0, 73.2, 47.8, 51.4, 3…
#> $ volume_variacao     [3m[90m<dbl>[39m[23m 0.3, 0.1, 0.0, 0.9, 0.4, -0.2, 0.7, 0.5, 0.4, 0.0…
#> $ volume_operacional  [3m[90m<dbl>[39m[23m 365.50555, 196.02547, 64.80029, 2.64579, 91.69406…
#> $ pluviometria_dia    [3m[90m<dbl>[39m[23m 30.9, 26.0, 47.2, 0.0, 0.0, 5.2, 29.1, 47.3, 9.2,…
#> $ pluviometria_mensal [3m[90m<dbl>[39m[23m 30.9, 26.0, 47.2, 0.0, 0.0, 5.2, 60.0, 73.3, 56.4…
#> $ pluviometria_hist   [3m[90m<dbl>[39m[23m 254.8, 238.1, 225.2, 217.8, 235.4, 292.0, 254.8, …
```

Caso queira saber o significado de cada variável, leia a [documentação
da base de
dados](https://beatrizmilz.github.io/mananciais/reference/mananciais.html)
ou utilize a seguinte função:

``` r
?mananciais::mananciais
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
| 2020-10-16 | Cantareira   |                38.0 |            \-0.2 |           372.78685 |               4.5 |                 27.4 |              127.8 |
| 2020-10-16 | Alto Tietê   |                57.6 |            \-0.1 |           322.78074 |               3.5 |                 33.5 |              113.4 |
| 2020-10-16 | Guarapiranga |                46.1 |              0.0 |            78.91830 |               1.2 |                 35.8 |              114.9 |
| 2020-10-16 | Cotia        |                60.8 |            \-0.2 |            10.03318 |               2.6 |                 43.2 |              113.5 |
| 2020-10-16 | Rio Grande   |                77.1 |              0.0 |            86.54448 |               5.2 |                 43.4 |              133.2 |
| 2020-10-16 | Rio Claro    |                55.1 |            \-0.3 |             7.52583 |               6.6 |                 53.8 |              176.1 |
| 2020-10-16 | São Lourenço |                63.5 |            \-0.2 |            56.41547 |               1.4 |                 37.6 |              141.2 |
