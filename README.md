
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
#> Rows: 56,163
#> Columns: 8
#> $ data                <date> 2024-07-19, 2024-07-19, 2024-07-19, 2024-07-19, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 64.0, 61.7, 57.8, 60.8, 76.0, 33.7, 84.4, 64.2, 61…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.4, -0.4, -0.1, -0.2, -0.7, -0.2, -0…
#> $ volume_operacional  <dbl> 628.52192, 345.54260, 98.97418, 10.03318, 85.24380…
#> $ pluviometria_dia    <dbl> 0.1, 0.1, 0.0, 0.0, 0.0, 0.2, 0.2, 0.1, 0.2, 0.2, …
#> $ pluviometria_mensal <dbl> 31.2, 38.8, 39.4, 42.0, 34.2, 48.4, 55.0, 31.1, 38…
#> $ pluviometria_hist   <dbl> 43.0, 47.6, 40.9, 47.1, 52.8, 88.8, 75.5, 43.0, 47…
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

| data       | sistema      | volume_porcentagem | volume_variacao | volume_operacional | pluviometria_dia | pluviometria_mensal | pluviometria_hist |
|:-----------|:-------------|-------------------:|----------------:|-------------------:|-----------------:|--------------------:|------------------:|
| 2024-07-19 | Cantareira   |               64.0 |            -0.2 |          628.52192 |              0.1 |                31.2 |              43.0 |
| 2024-07-19 | Alto Tietê   |               61.7 |            -0.2 |          345.54260 |              0.1 |                38.8 |              47.6 |
| 2024-07-19 | Guarapiranga |               57.8 |            -0.4 |           98.97418 |              0.0 |                39.4 |              40.9 |
| 2024-07-19 | Cotia        |               60.8 |            -0.4 |           10.03318 |              0.0 |                42.0 |              47.1 |
| 2024-07-19 | Rio Grande   |               76.0 |            -0.1 |           85.24380 |              0.0 |                34.2 |              52.8 |
| 2024-07-19 | Rio Claro    |               33.7 |            -0.2 |            4.60756 |              0.2 |                48.4 |              88.8 |
| 2024-07-19 | São Lourenço |               84.4 |            -0.7 |           74.99391 |              0.2 |                55.0 |              75.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
