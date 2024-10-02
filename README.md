
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
#> Rows: 56,681
#> Columns: 8
#> $ data                <date> 2024-10-01, 2024-10-01, 2024-10-01, 2024-10-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 50.6, 46.3, 38.7, 38.5, 63.9, 25.2, 48.3, 50.9, 46…
#> $ volume_variacao     <dbl> -0.3, -0.2, -0.2, -0.4, -0.3, -0.2, -0.6, -0.2, -0…
#> $ volume_operacional  <dbl> 497.17865, 259.29710, 66.17795, 6.35401, 71.67916,…
#> $ pluviometria_dia    <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, …
#> $ pluviometria_mensal <dbl> 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 5.4, 5.0, 12.8,…
#> $ pluviometria_hist   <dbl> 130.3, 109.3, 114.7, 120.4, 133.1, 174.8, 144.0, 8…
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
| 2024-10-01 | Cantareira   |               50.6 |            -0.3 |          497.17865 |                0 |                   0 |             130.3 |
| 2024-10-01 | Alto Tietê   |               46.3 |            -0.2 |          259.29710 |                0 |                   0 |             109.3 |
| 2024-10-01 | Guarapiranga |               38.7 |            -0.2 |           66.17795 |                0 |                   0 |             114.7 |
| 2024-10-01 | Cotia        |               38.5 |            -0.4 |            6.35401 |                0 |                   0 |             120.4 |
| 2024-10-01 | Rio Grande   |               63.9 |            -0.3 |           71.67916 |                0 |                   0 |             133.1 |
| 2024-10-01 | Rio Claro    |               25.2 |            -0.2 |            3.43754 |                0 |                   0 |             174.8 |
| 2024-10-01 | São Lourenço |               48.3 |            -0.6 |           42.92403 |                0 |                   0 |             144.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
