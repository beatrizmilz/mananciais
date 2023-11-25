
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
#> Rows: 54,497
#> Columns: 8
#> $ data                <date> 2023-11-24, 2023-11-24, 2023-11-24, 2023-11-24, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 72.6, 62.4, 59.4, 87.6, 100.9, 42.0, 63.6, 72.6, 6…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.3, 0.5, 0.2, 3.4, 2.9, 0.0, -0.2, -0.…
#> $ volume_operacional  <dbl> 713.09304, 349.46354, 101.60913, 14.44422, 113.138…
#> $ pluviometria_dia    <dbl> 11.2, 1.2, 16.0, 2.0, 9.8, 24.2, 6.0, 1.2, 0.8, 0.…
#> $ pluviometria_mensal <dbl> 99.6, 56.8, 101.2, 67.0, 57.2, 124.2, 130.4, 88.4,…
#> $ pluviometria_hist   <dbl> 149.8, 122.4, 124.0, 123.9, 138.0, 194.3, 150.4, 1…
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
| 2023-11-24 | Cantareira   |               72.6 |             0.0 |          713.09304 |             11.2 |                99.6 |             149.8 |
| 2023-11-24 | Alto Tietê   |               62.4 |            -0.1 |          349.46354 |              1.2 |                56.8 |             122.4 |
| 2023-11-24 | Guarapiranga |               59.4 |             0.3 |          101.60913 |             16.0 |               101.2 |             124.0 |
| 2023-11-24 | Cotia        |               87.6 |             0.5 |           14.44422 |              2.0 |                67.0 |             123.9 |
| 2023-11-24 | Rio Grande   |              100.9 |             0.2 |          113.13879 |              9.8 |                57.2 |             138.0 |
| 2023-11-24 | Rio Claro    |               42.0 |             3.4 |            5.74010 |             24.2 |               124.2 |             194.3 |
| 2023-11-24 | São Lourenço |               63.6 |             2.9 |           56.50904 |              6.0 |               130.4 |             150.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
