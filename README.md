
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
#> Rows: 56,324
#> Columns: 8
#> $ data                <date> 2024-08-11, 2024-08-11, 2024-08-11, 2024-08-11, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 60.8, 57.2, 51.1, 54.2, 73.7, 28.7, 76.8, 60.8, 57…
#> $ volume_variacao     <dbl> 0.0, -0.1, 0.3, 0.4, 0.8, 1.2, 0.9, 0.2, 0.1, 0.8,…
#> $ volume_operacional  <dbl> 597.04057, 320.67817, 87.49925, 8.94654, 82.72446,…
#> $ pluviometria_dia    <dbl> 2.8, 3.9, 1.6, 1.4, 1.2, 11.4, 0.4, 28.9, 25.3, 38…
#> $ pluviometria_mensal <dbl> 31.7, 29.7, 40.8, 33.2, 38.4, 53.2, 39.2, 28.9, 25…
#> $ pluviometria_hist   <dbl> 33.9, 29.6, 39.7, 40.0, 48.3, 100.6, 60.8, 33.9, 2…
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
| 2024-08-11 | Cantareira   |               60.8 |             0.0 |          597.04057 |              2.8 |                31.7 |              33.9 |
| 2024-08-11 | Alto Tietê   |               57.2 |            -0.1 |          320.67817 |              3.9 |                29.7 |              29.6 |
| 2024-08-11 | Guarapiranga |               51.1 |             0.3 |           87.49925 |              1.6 |                40.8 |              39.7 |
| 2024-08-11 | Cotia        |               54.2 |             0.4 |            8.94654 |              1.4 |                33.2 |              40.0 |
| 2024-08-11 | Rio Grande   |               73.7 |             0.8 |           82.72446 |              1.2 |                38.4 |              48.3 |
| 2024-08-11 | Rio Claro    |               28.7 |             1.2 |            3.92412 |             11.4 |                53.2 |             100.6 |
| 2024-08-11 | São Lourenço |               76.8 |             0.9 |           68.23361 |              0.4 |                39.2 |              60.8 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
