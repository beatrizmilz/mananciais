
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
#> Rows: 52,915
#> Columns: 8
#> $ data                <date> 2023-04-12, 2023-04-12, 2023-04-12, 2023-04-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 82.6, 74.0, 85.3, 99.3, 101.7, 41.8, 96.7, 82.6, 7…
#> $ volume_variacao     <dbl> 0.0, 0.0, -0.3, 0.0, -0.2, -0.1, -0.5, 0.1, -0.1, …
#> $ volume_operacional  <dbl> 811.27084, 414.35351, 146.07533, 16.38506, 114.100…
#> $ pluviometria_dia    <dbl> 0.0, 0.3, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 21.4, 43.1, 36.2, 15.0, 25.2, 31.8, 26.6, 21.4, 42…
#> $ pluviometria_hist   <dbl> 79.8, 86.5, 71.8, 77.6, 102.6, 193.7, 109.7, 79.8,…
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
| 2023-04-12 | Cantareira   |               82.6 |             0.0 |          811.27084 |              0.0 |                21.4 |              79.8 |
| 2023-04-12 | Alto Tietê   |               74.0 |             0.0 |          414.35351 |              0.3 |                43.1 |              86.5 |
| 2023-04-12 | Guarapiranga |               85.3 |            -0.3 |          146.07533 |              0.0 |                36.2 |              71.8 |
| 2023-04-12 | Cotia        |               99.3 |             0.0 |           16.38506 |              0.0 |                15.0 |              77.6 |
| 2023-04-12 | Rio Grande   |              101.7 |            -0.2 |          114.10027 |              0.0 |                25.2 |             102.6 |
| 2023-04-12 | Rio Claro    |               41.8 |            -0.1 |            5.70899 |              0.0 |                31.8 |             193.7 |
| 2023-04-12 | São Lourenço |               96.7 |            -0.5 |           85.89738 |              0.0 |                26.6 |             109.7 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
