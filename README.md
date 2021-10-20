
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
#> Rows: 49,135
#> Columns: 8
#> $ data                <date> 2021-10-19, 2021-10-19, 2021-10-19, 2021-10-19, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.3, 38.6, 47.7, 47.8, 79.9, 38.1, 57.2, 28.1, 38…
#> $ volume_variacao     <dbl> 0.2, 0.2, 0.6, 0.2, 0.8, 1.0, 1.1, -0.1, 0.1, 0.6,…
#> $ volume_operacional  <dbl> 277.54782, 216.25701, 81.59651, 7.88022, 89.67991,…
#> $ pluviometria_dia    <dbl> 9.7, 6.0, 6.8, 4.8, 7.6, 9.8, 2.6, 9.7, 11.8, 5.4,…
#> $ pluviometria_mensal <dbl> 99.3, 67.8, 65.6, 56.8, 67.2, 80.2, 104.4, 89.6, 6…
#> $ pluviometria_hist   <dbl> 122.3, 110.3, 113.9, 114.0, 133.0, 174.7, 140.5, 1…
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
| 2021-10-19 | Cantareira   |                28.3 |              0.2 |           277.54782 |               9.7 |                 99.3 |              122.3 |
| 2021-10-19 | Alto Tietê   |                38.6 |              0.2 |           216.25701 |               6.0 |                 67.8 |              110.3 |
| 2021-10-19 | Guarapiranga |                47.7 |              0.6 |            81.59651 |               6.8 |                 65.6 |              113.9 |
| 2021-10-19 | Cotia        |                47.8 |              0.2 |             7.88022 |               4.8 |                 56.8 |              114.0 |
| 2021-10-19 | Rio Grande   |                79.9 |              0.8 |            89.67991 |               7.6 |                 67.2 |              133.0 |
| 2021-10-19 | Rio Claro    |                38.1 |              1.0 |             5.20862 |               9.8 |                 80.2 |              174.7 |
| 2021-10-19 | São Lourenço |                57.2 |              1.1 |            50.80271 |               2.6 |                104.4 |              140.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
