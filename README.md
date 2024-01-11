
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
#> Rows: 54,826
#> Columns: 8
#> $ data                <date> 2024-01-10, 2024-01-10, 2024-01-10, 2024-01-10, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 70.2, 57.4, 51.8, 76.1, 100.5, 39.0, 60.3, 70.4, 5…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.1, -0.2, -0.4, -0.4, 0.2, -0.2, -0.…
#> $ volume_operacional  <dbl> 689.89343, 321.34352, 88.64965, 12.54924, 112.7556…
#> $ pluviometria_dia    <dbl> 3.6, 0.2, 1.4, 18.8, 0.0, 0.0, 0.0, 15.5, 10.8, 1.…
#> $ pluviometria_mensal <dbl> 42.6, 25.5, 11.6, 20.8, 38.8, 58.2, 3.4, 39.0, 25.…
#> $ pluviometria_hist   <dbl> 262.7, 234.0, 229.8, 218.5, 245.9, 293.3, 273.2, 2…
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
| 2024-01-10 | Cantareira   |               70.2 |            -0.2 |          689.89343 |              3.6 |                42.6 |             262.7 |
| 2024-01-10 | Alto Tietê   |               57.4 |            -0.2 |          321.34352 |              0.2 |                25.5 |             234.0 |
| 2024-01-10 | Guarapiranga |               51.8 |            -0.1 |           88.64965 |              1.4 |                11.6 |             229.8 |
| 2024-01-10 | Cotia        |               76.1 |            -0.2 |           12.54924 |             18.8 |                20.8 |             218.5 |
| 2024-01-10 | Rio Grande   |              100.5 |            -0.4 |          112.75560 |              0.0 |                38.8 |             245.9 |
| 2024-01-10 | Rio Claro    |               39.0 |            -0.4 |            5.33545 |              0.0 |                58.2 |             293.3 |
| 2024-01-10 | São Lourenço |               60.3 |             0.2 |           53.54012 |              0.0 |                 3.4 |             273.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
