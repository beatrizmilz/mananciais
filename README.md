
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
#> Rows: 53,356
#> Columns: 8
#> $ data                <date> 2023-06-14, 2023-06-14, 2023-06-14, 2023-06-14, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 84.0, 73.8, 79.5, 98.2, 100.0, 44.9, 89.2, 84.0, 7…
#> $ volume_variacao     <dbl> 0.0, 0.1, -0.3, 0.2, 0.5, 3.7, -0.1, -0.1, -0.1, -…
#> $ volume_operacional  <dbl> 824.58149, 413.25523, 136.17708, 16.19927, 112.182…
#> $ pluviometria_dia    <dbl> 7.5, 3.2, 2.8, 4.4, 1.6, 25.2, 19.4, 0.3, 0.0, 0.0…
#> $ pluviometria_mensal <dbl> 26.5, 19.6, 20.0, 27.4, 23.6, 58.2, 28.8, 19.0, 16…
#> $ pluviometria_hist   <dbl> 57.2, 54.0, 53.3, 58.1, 60.7, 97.4, 75.6, 57.2, 54…
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
| 2023-06-14 | Cantareira   |               84.0 |             0.0 |          824.58149 |              7.5 |                26.5 |              57.2 |
| 2023-06-14 | Alto Tietê   |               73.8 |             0.1 |          413.25523 |              3.2 |                19.6 |              54.0 |
| 2023-06-14 | Guarapiranga |               79.5 |            -0.3 |          136.17708 |              2.8 |                20.0 |              53.3 |
| 2023-06-14 | Cotia        |               98.2 |             0.2 |           16.19927 |              4.4 |                27.4 |              58.1 |
| 2023-06-14 | Rio Grande   |              100.0 |             0.5 |          112.18231 |              1.6 |                23.6 |              60.7 |
| 2023-06-14 | Rio Claro    |               44.9 |             3.7 |            6.13423 |             25.2 |                58.2 |              97.4 |
| 2023-06-14 | São Lourenço |               89.2 |            -0.1 |           79.22821 |             19.4 |                28.8 |              75.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
