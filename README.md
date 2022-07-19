
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Pacote Mananciais <img src="man/figures/hexlogo.png" align="right" width = "120px"/>

<!-- badges: start -->

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
[![R build
status](https://github.com/beatrizmilz/mananciais/workflows/R-CMD-check/badge.svg)](https://github.com/beatrizmilz/mananciais/actions)
[![update-data](https://github.com/beatrizmilz/mananciais/actions/workflows/2-update_data.yaml/badge.svg)](https://github.com/beatrizmilz/mananciais/actions/workflows/2-update_data.yaml)
[![Codecov test
coverage](https://codecov.io/gh/beatrizmilz/mananciais/branch/master/graph/badge.svg)](https://codecov.io/gh/beatrizmilz/mananciais?branch=master)
<!-- badges: end -->

O objetivo deste pacote é disponibilizar a base de dados sobre o volume
operacional em mananciais de abastecimento público na Região
Metropolitana de São Paulo (SP - Brasil). O pacote é atualizado
diariamente através de um workflow com [GitHub
Actions](https://github.com/beatrizmilz/mananciais/actions).

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

**Caso você não utilize R**, é possível **fazer download da base de
dados** através dos seguintes links:

  - [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
  - [Arquivo
    `.xlsx`](https://github.com/beatrizmilz/mananciais/blob/master/inst/extdata/mananciais.xlsx?raw=true)

Os arquivos foram salvos com encoding UTF-8, e separados por
ponto-e-vírgula.

## Instalação

Este pacote pode ser instalado através do [GitHub](https://github.com/)
utilizando o seguinte código em `R`:

``` r
# install.packages("devtools")
devtools::install_github("beatrizmilz/mananciais")
library(mananciais)
```

## Como usar?

Caso você tenha conexão à internet, é possível buscar a base atualizada
usando a função `dados_mananciais()`:

``` r
mananciais <- mananciais::dados_mananciais() 
```

Caso você não tenha conexão à internet, você pode utilizar a base
disponível no pacote. Porém as mesmas estarão atualizadas até a data em
que você instalou (ou atualizou) o pacote.

Abaixo segue um exemplo da base disponível:

``` r
dplyr::glimpse(mananciais)
#> Rows: 51,039
#> Columns: 8
#> $ data                <date> 2022-07-18, 2022-07-18, 2022-07-18, 2022-07-18, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 37.7, 57.0, 70.6, 76.7, 94.2, 41.5, 82.1, 37.8, 57…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.3, -0.3, -0.2, -0.8, -0.1, -0…
#> $ volume_operacional  <dbl> 370.13057, 319.13020, 120.83918, 12.64513, 105.625…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 0.8, 2.4, 0.0, 0.0, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 0.6, 2.4, 0.2, 3.2, 2.2, 8.2, 7.4, 0.6, 2.4, 0.2, …
#> $ pluviometria_hist   <dbl> 46.5, 46.9, 41.5, 51.3, 54.2, 91.3, 77.7, 46.5, 46…
```

Caso queira saber o significado de cada variável, leia a [documentação
da base de
dados](https://beatrizmilz.github.io/mananciais/reference/mananciais.html)
ou utilize a seguinte função:

``` r
?mananciais::mananciais
```

### Exemplo de tabela

``` r
library(magrittr)
mananciais %>% 
  dplyr::arrange(desc(data)) %>% 
  head(7) %>%
  knitr::kable()
```

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2022-07-18 | Cantareira   |                37.7 |            \-0.1 |           370.13057 |               0.0 |                  0.6 |               46.5 |
| 2022-07-18 | Alto Tietê   |                57.0 |            \-0.1 |           319.13020 |               0.0 |                  2.4 |               46.9 |
| 2022-07-18 | Guarapiranga |                70.6 |            \-0.3 |           120.83918 |               0.0 |                  0.2 |               41.5 |
| 2022-07-18 | Cotia        |                76.7 |            \-0.3 |            12.64513 |               0.0 |                  3.2 |               51.3 |
| 2022-07-18 | Rio Grande   |                94.2 |            \-0.3 |           105.62575 |               0.8 |                  2.2 |               54.2 |
| 2022-07-18 | Rio Claro    |                41.5 |            \-0.2 |             5.66770 |               2.4 |                  8.2 |               91.3 |
| 2022-07-18 | São Lourenço |                82.1 |            \-0.8 |            72.91625 |               0.0 |                  7.4 |               77.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
