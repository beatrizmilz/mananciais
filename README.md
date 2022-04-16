
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
#> Rows: 50,381
#> Columns: 8
#> $ data                <date> 2022-04-15, 2022-04-15, 2022-04-15, 2022-04-15, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 45.0, 61.3, 91.3, 94.4, 102.1, 55.3, 94.8, 45.1, 6…
#> $ volume_variacao     <dbl> -0.1, 0.1, -0.2, 0.0, 0.4, 6.8, 1.1, -0.1, 0.0, -0…
#> $ volume_operacional  <dbl> 442.29059, 343.20000, 156.34065, 15.57694, 114.486…
#> $ pluviometria_dia    <dbl> 1.5, 2.4, 0.6, 0.4, 11.2, 64.6, 10.8, 0.1, 0.9, 0.…
#> $ pluviometria_mensal <dbl> 13.3, 41.7, 13.8, 17.0, 44.4, 208.0, 51.0, 11.8, 3…
#> $ pluviometria_hist   <dbl> 83.2, 91.5, 72.3, 78.3, 103.1, 192.1, 110.7, 83.2,…
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
| 2022-04-15 | Cantareira   |                45.0 |            \-0.1 |           442.29059 |               1.5 |                 13.3 |               83.2 |
| 2022-04-15 | Alto Tietê   |                61.3 |              0.1 |           343.20000 |               2.4 |                 41.7 |               91.5 |
| 2022-04-15 | Guarapiranga |                91.3 |            \-0.2 |           156.34065 |               0.6 |                 13.8 |               72.3 |
| 2022-04-15 | Cotia        |                94.4 |              0.0 |            15.57694 |               0.4 |                 17.0 |               78.3 |
| 2022-04-15 | Rio Grande   |               102.1 |              0.4 |           114.48627 |              11.2 |                 44.4 |              103.1 |
| 2022-04-15 | Rio Claro    |                55.3 |              6.8 |             7.55126 |              64.6 |                208.0 |              192.1 |
| 2022-04-15 | São Lourenço |                94.8 |              1.1 |            84.23296 |              10.8 |                 51.0 |              110.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
