
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
#> Rows: 50,990
#> Columns: 8
#> $ data                <date> 2022-07-11, 2022-07-11, 2022-07-11, 2022-07-11, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 38.5, 58.3, 72.5, 79.2, 95.6, 43.2, 85.6, 38.6, 58…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.2, -0.2, -0.2, -0.2, -0.4, -0.1, -0…
#> $ volume_operacional  <dbl> 378.05720, 326.39341, 124.12712, 13.06553, 107.288…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.0, 0.0, 0.2, 0.2, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 0.3, 1.9, 0.2, 1.0, 0.4, 2.6, 1.0, 0.2, 1.7, 0.2, …
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
| 2022-07-11 | Cantareira   |                38.5 |            \-0.1 |           378.05720 |               0.1 |                  0.3 |               46.5 |
| 2022-07-11 | Alto Tietê   |                58.3 |            \-0.1 |           326.39341 |               0.2 |                  1.9 |               46.9 |
| 2022-07-11 | Guarapiranga |                72.5 |            \-0.2 |           124.12712 |               0.0 |                  0.2 |               41.5 |
| 2022-07-11 | Cotia        |                79.2 |            \-0.2 |            13.06553 |               0.0 |                  1.0 |               51.3 |
| 2022-07-11 | Rio Grande   |                95.6 |            \-0.2 |           107.28871 |               0.0 |                  0.4 |               54.2 |
| 2022-07-11 | Rio Claro    |                43.2 |            \-0.2 |             5.90603 |               0.2 |                  2.6 |               91.3 |
| 2022-07-11 | São Lourenço |                85.6 |            \-0.4 |            76.04250 |               0.2 |                  1.0 |               77.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
