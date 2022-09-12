
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

-   [Arquivo
    `.csv`](https://github.com/beatrizmilz/mananciais/raw/master/inst/extdata/mananciais.csv)
-   [Arquivo
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
#> Rows: 51,424
#> Columns: 8
#> $ data                <date> 2022-09-11, 2022-09-11, 2022-09-11, 2022-09-11, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 31.5, 48.6, 58.0, 56.3, 88.8, 45.4, 65.6, 31.7, 48…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.2, -0.4, 0.0, 0.5, -0.2, -0.1, -0.2…
#> $ volume_operacional  <dbl> 309.79667, 272.57429, 99.21287, 9.29200, 99.66236,…
#> $ pluviometria_dia    <dbl> 0.0, 0.9, 1.8, 2.6, 5.4, 8.2, 14.2, 0.0, 0.0, 0.0,…
#> $ pluviometria_mensal <dbl> 9.2, 9.4, 16.6, 16.6, 30.8, 27.6, 36.0, 9.2, 8.5, …
#> $ pluviometria_hist   <dbl> 80.5, 59.6, 76.7, 76.0, 92.8, 139.4, 112.5, 80.5, …
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
| 2022-09-11 | Cantareira   |               31.5 |            -0.2 |          309.79667 |              0.0 |                 9.2 |              80.5 |
| 2022-09-11 | Alto Tietê   |               48.6 |            -0.2 |          272.57429 |              0.9 |                 9.4 |              59.6 |
| 2022-09-11 | Guarapiranga |               58.0 |            -0.2 |           99.21287 |              1.8 |                16.6 |              76.7 |
| 2022-09-11 | Cotia        |               56.3 |            -0.4 |            9.29200 |              2.6 |                16.6 |              76.0 |
| 2022-09-11 | Rio Grande   |               88.8 |             0.0 |           99.66236 |              5.4 |                30.8 |              92.8 |
| 2022-09-11 | Rio Claro    |               45.4 |             0.5 |            6.19998 |              8.2 |                27.6 |             139.4 |
| 2022-09-11 | São Lourenço |               65.6 |            -0.2 |           58.29672 |             14.2 |                36.0 |             112.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
