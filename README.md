
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
#> Rows: 51,984
#> Columns: 8
#> $ data                <date> 2022-11-30, 2022-11-30, 2022-11-30, 2022-11-30, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 33.1, 45.6, 72.7, 41.9, 103.6, 39.5, 74.9, 32.9, 4…
#> $ volume_variacao     <dbl> 0.2, 0.1, 0.9, 1.2, -0.4, 0.2, 2.0, 0.3, 0.1, 1.4,…
#> $ volume_operacional  <dbl> 325.27467, 255.39829, 124.38091, 6.91104, 116.2332…
#> $ pluviometria_dia    <dbl> 10.0, 4.6, 11.2, 8.2, 3.0, 6.6, 10.0, 15.8, 15.4, …
#> $ pluviometria_mensal <dbl> 162.2, 85.1, 126.4, 123.2, 184.6, 211.6, 107.6, 15…
#> $ pluviometria_hist   <dbl> 149.5, 124.6, 124.0, 123.9, 137.3, 194.0, 151.2, 1…
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
| 2022-11-30 | Cantareira   |               33.1 |             0.2 |          325.27467 |             10.0 |               162.2 |             149.5 |
| 2022-11-30 | Alto Tietê   |               45.6 |             0.1 |          255.39829 |              4.6 |                85.1 |             124.6 |
| 2022-11-30 | Guarapiranga |               72.7 |             0.9 |          124.38091 |             11.2 |               126.4 |             124.0 |
| 2022-11-30 | Cotia        |               41.9 |             1.2 |            6.91104 |              8.2 |               123.2 |             123.9 |
| 2022-11-30 | Rio Grande   |              103.6 |            -0.4 |          116.23326 |              3.0 |               184.6 |             137.3 |
| 2022-11-30 | Rio Claro    |               39.5 |             0.2 |            5.39476 |              6.6 |               211.6 |             194.0 |
| 2022-11-30 | São Lourenço |               74.9 |             2.0 |           66.53584 |             10.0 |               107.6 |             151.2 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
