
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

Este pacote foi criado no âmbito da [pesquisa de doutorado de Beatriz
Milz](https://beatrizmilz.github.io/tese/).

## Instalação

Este pacote pode ser instalado através do [GitHub](https://github.com/)
utilizando o seguinte código em `R`:

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
#> Rows: 46,468
#> Columns: 8
#> $ data                <date> 2020-01-01, 2020-01-01, 2020-01-01, 2020-01-01...
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Co...
#> $ volume_porcentagem  <dbl> 40.3, 76.6, 64.0, 73.4, 82.6, 97.6, 58.8, 40.4,...
#> $ volume_variacao     <dbl> -0.1, -0.2, -0.5, -0.4, -0.3, -0.5, -0.1, 0.1, ...
#> $ volume_operacional  <dbl> 395.99619, 429.18570, 109.63346, 12.10735, 92.7...
#> $ pluviometria_dia    <dbl> 0.2, 0.0, 0.6, 0.0, 0.0, 0.0, 0.0, 16.6, 10.2, ...
#> $ pluviometria_mensal <dbl> 0.2, 0.0, 0.6, 0.0, 0.0, 0.0, 0.0, 16.8, 10.2, ...
#> $ pluviometria_hist   <dbl> 262.6, 246.1, 228.9, 224.7, 250.6, 296.6, 272.6...

dplyr::glimpse(mananciais_consolidado)
#> Rows: 44,529
#> Columns: 8
#> $ data                <date> 2000-01-01, 2000-01-01, 2000-01-01, 2000-01-01...
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Co...
#> $ volume_porcentagem  <dbl> 47.1, 50.9, 36.0, 18.8, 81.0, 73.2, 47.8, 51.4,...
#> $ volume_variacao     <dbl> 0.3, 0.1, 0.0, 0.9, 0.4, -0.2, 0.7, 0.5, 0.4, 0...
#> $ volume_operacional  <dbl> 365.50555, 196.02547, 64.80029, 2.64579, 91.694...
#> $ pluviometria_dia    <dbl> 30.9, 26.0, 47.2, 0.0, 0.0, 5.2, 29.1, 47.3, 9....
#> $ pluviometria_mensal <dbl> 30.9, 26.0, 47.2, 0.0, 0.0, 5.2, 60.0, 73.3, 56...
#> $ pluviometria_hist   <dbl> 254.8, 238.1, 225.2, 217.8, 235.4, 292.0, 254.8...
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
#> i Using ',' as decimal and '.' as grouping mark. Use `read_delim()` for more control.
#> 
#> -- Column specification ----------------------------------------------------------------------------------------------------
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
| 2020-10-20 | Cantareira   |                37.1 |            \-0.2 |           364.83160 |              14.9 |                 42.5 |              127.8 |
| 2020-10-20 | Alto Tietê   |                56.9 |            \-0.2 |           318.53951 |               0.1 |                 34.7 |              113.4 |
| 2020-10-20 | Guarapiranga |                46.0 |              0.3 |            78.69646 |               5.0 |                 41.6 |              114.9 |
| 2020-10-20 | Cotia        |                60.6 |              0.1 |            10.00515 |              18.0 |                 62.8 |              113.5 |
| 2020-10-20 | Rio Grande   |                76.7 |            \-0.2 |            86.05538 |              23.8 |                 73.0 |              133.2 |
| 2020-10-20 | Rio Claro    |                53.4 |            \-0.5 |             7.29980 |               0.6 |                 62.0 |              176.1 |
| 2020-10-20 | São Lourenço |                63.1 |              0.1 |            56.04172 |               2.6 |                 43.6 |              141.2 |
