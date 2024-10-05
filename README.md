
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
#> Rows: 56,702
#> Columns: 8
#> $ data                <date> 2024-10-04, 2024-10-04, 2024-10-04, 2024-10-04, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 49.9, 45.6, 38.1, 37.7, 64.4, 25.7, 46.8, 50.1, 45…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.3, 1.0, 1.1, -0.5, -0.3, -0.2…
#> $ volume_operacional  <dbl> 489.66541, 255.36413, 65.26053, 6.22408, 72.26679,…
#> $ pluviometria_dia    <dbl> 16.5, 1.2, 1.2, 0.6, 3.8, 9.0, 1.8, 1.8, 2.3, 1.2,…
#> $ pluviometria_mensal <dbl> 18.3, 3.5, 2.4, 5.4, 6.4, 12.6, 6.2, 1.8, 2.3, 1.2…
#> $ pluviometria_hist   <dbl> 130.3, 109.3, 114.7, 120.4, 133.1, 174.8, 144.0, 1…
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
| 2024-10-04 | Cantareira   |               49.9 |            -0.2 |          489.66541 |             16.5 |                18.3 |             130.3 |
| 2024-10-04 | Alto Tietê   |               45.6 |            -0.2 |          255.36413 |              1.2 |                 3.5 |             109.3 |
| 2024-10-04 | Guarapiranga |               38.1 |            -0.2 |           65.26053 |              1.2 |                 2.4 |             114.7 |
| 2024-10-04 | Cotia        |               37.7 |            -0.3 |            6.22408 |              0.6 |                 5.4 |             120.4 |
| 2024-10-04 | Rio Grande   |               64.4 |             1.0 |           72.26679 |              3.8 |                 6.4 |             133.1 |
| 2024-10-04 | Rio Claro    |               25.7 |             1.1 |            3.50938 |              9.0 |                12.6 |             174.8 |
| 2024-10-04 | São Lourenço |               46.8 |            -0.5 |           41.54334 |              1.8 |                 6.2 |             144.0 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
