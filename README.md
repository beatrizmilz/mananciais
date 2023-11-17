
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
#> Rows: 54,441
#> Columns: 8
#> $ data                <date> 2023-11-16, 2023-11-16, 2023-11-16, 2023-11-16, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 73.1, 63.6, 60.1, 88.2, 101.0, 39.0, 58.8, 73.3, 6…
#> $ volume_variacao     <dbl> -0.2, -0.1, 0.3, -0.2, 0.1, 0.1, 0.1, -0.2, -0.2, …
#> $ volume_operacional  <dbl> 718.23112, 356.19148, 102.81359, 14.54829, 113.330…
#> $ pluviometria_dia    <dbl> 6.4, 11.3, 19.6, 5.8, 20.0, 23.0, 15.0, 1.0, 0.5, …
#> $ pluviometria_mensal <dbl> 59.7, 34.0, 44.4, 47.0, 36.6, 63.8, 64.6, 53.3, 22…
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
| 2023-11-16 | Cantareira   |               73.1 |            -0.2 |          718.23112 |              6.4 |                59.7 |             149.8 |
| 2023-11-16 | Alto Tietê   |               63.6 |            -0.1 |          356.19148 |             11.3 |                34.0 |             122.4 |
| 2023-11-16 | Guarapiranga |               60.1 |             0.3 |          102.81359 |             19.6 |                44.4 |             124.0 |
| 2023-11-16 | Cotia        |               88.2 |            -0.2 |           14.54829 |              5.8 |                47.0 |             123.9 |
| 2023-11-16 | Rio Grande   |              101.0 |             0.1 |          113.33068 |             20.0 |                36.6 |             138.0 |
| 2023-11-16 | Rio Claro    |               39.0 |             0.1 |            5.33545 |             23.0 |                63.8 |             194.3 |
| 2023-11-16 | São Lourenço |               58.8 |             0.1 |           52.25726 |             15.0 |                64.6 |             150.4 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
