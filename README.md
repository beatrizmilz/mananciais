
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
#> Rows: 53,538
#> Columns: 8
#> $ data                <date> 2023-07-10, 2023-07-10, 2023-07-10, 2023-07-10, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 82.1, 70.8, 73.8, 95.5, 98.1, 39.9, 83.8, 82.1, 70…
#> $ volume_variacao     <dbl> 0.0, -0.1, -0.3, 0.0, 0.0, -0.2, -0.8, -0.2, 0.0, …
#> $ volume_operacional  <dbl> 806.11223, 396.51298, 126.41552, 15.75849, 110.095…
#> $ pluviometria_dia    <dbl> 1.6, 1.1, 0.8, 1.8, 0.2, 1.8, 0.6, 1.8, 2.6, 4.0, …
#> $ pluviometria_mensal <dbl> 3.7, 5.5, 5.0, 9.0, 5.0, 11.0, 10.6, 2.1, 4.4, 4.2…
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
| 2023-07-10 | Cantareira   |               82.1 |             0.0 |          806.11223 |              1.6 |                 3.7 |              44.0 |
| 2023-07-10 | Alto Tietê   |               70.8 |            -0.1 |          396.51298 |              1.1 |                 5.5 |              49.7 |
| 2023-07-10 | Guarapiranga |               73.8 |            -0.3 |          126.41552 |              0.8 |                 5.0 |              41.2 |
| 2023-07-10 | Cotia        |               95.5 |             0.0 |           15.75849 |              1.8 |                 9.0 |              47.5 |
| 2023-07-10 | Rio Grande   |               98.1 |             0.0 |          110.09562 |              0.2 |                 5.0 |              53.5 |
| 2023-07-10 | Rio Claro    |               39.9 |            -0.2 |            5.45455 |              1.8 |                11.0 |              89.5 |
| 2023-07-10 | São Lourenço |               83.8 |            -0.8 |           74.47207 |              0.6 |                10.6 |              76.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
