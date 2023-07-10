
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
#> Rows: 53,531
#> Columns: 8
#> $ data                <date> 2023-07-09, 2023-07-09, 2023-07-09, 2023-07-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 82.1, 70.9, 74.1, 95.5, 98.1, 40.1, 84.6, 82.3, 70…
#> $ volume_variacao     <dbl> -0.2, 0.0, 0.0, 0.0, -0.2, -0.3, -1.0, -0.1, -0.2,…
#> $ volume_operacional  <dbl> 806.65290, 397.24036, 126.92536, 15.75849, 110.095…
#> $ pluviometria_dia    <dbl> 1.8, 2.6, 4.0, 6.6, 4.2, 2.6, 9.0, 0.0, 0.1, 0.0, …
#> $ pluviometria_mensal <dbl> 2.1, 4.4, 4.2, 7.2, 4.8, 9.2, 10.0, 0.3, 1.8, 0.2,…
#> $ pluviometria_hist   <dbl> 44.0, 49.7, 41.2, 47.5, 53.5, 89.5, 76.5, 44.0, 49…
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
| 2023-07-09 | Cantareira   |               82.1 |            -0.2 |          806.65290 |              1.8 |                 2.1 |              44.0 |
| 2023-07-09 | Alto Tietê   |               70.9 |             0.0 |          397.24036 |              2.6 |                 4.4 |              49.7 |
| 2023-07-09 | Guarapiranga |               74.1 |             0.0 |          126.92536 |              4.0 |                 4.2 |              41.2 |
| 2023-07-09 | Cotia        |               95.5 |             0.0 |           15.75849 |              6.6 |                 7.2 |              47.5 |
| 2023-07-09 | Rio Grande   |               98.1 |            -0.2 |          110.09562 |              4.2 |                 4.8 |              53.5 |
| 2023-07-09 | Rio Claro    |               40.1 |            -0.3 |            5.48463 |              2.6 |                 9.2 |              89.5 |
| 2023-07-09 | São Lourenço |               84.6 |            -1.0 |           75.09847 |              9.0 |                10.0 |              76.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
