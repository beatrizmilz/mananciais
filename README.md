
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
#> Rows: 53,433
#> Columns: 8
#> $ data                <date> 2023-06-25, 2023-06-25, 2023-06-25, 2023-06-25, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 83.7, 72.9, 78.0, 98.0, 100.0, 39.5, 88.6, 83.9, 7…
#> $ volume_variacao     <dbl> -0.2, -0.2, -0.3, 0.0, -0.2, 0.1, 0.2, -0.1, -0.1,…
#> $ volume_operacional  <dbl> 822.27012, 408.69564, 133.59366, 16.16227, 112.182…
#> $ pluviometria_dia    <dbl> 0.0, 0.3, 0.0, 0.2, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 47.7, 29.1, 32.0, 46.8, 39.2, 67.4, 52.8, 47.7, 28…
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
| 2023-06-25 | Cantareira   |               83.7 |            -0.2 |          822.27012 |              0.0 |                47.7 |              57.2 |
| 2023-06-25 | Alto Tietê   |               72.9 |            -0.2 |          408.69564 |              0.3 |                29.1 |              54.0 |
| 2023-06-25 | Guarapiranga |               78.0 |            -0.3 |          133.59366 |              0.0 |                32.0 |              53.3 |
| 2023-06-25 | Cotia        |               98.0 |             0.0 |           16.16227 |              0.2 |                46.8 |              58.1 |
| 2023-06-25 | Rio Grande   |              100.0 |            -0.2 |          112.18231 |              0.0 |                39.2 |              60.7 |
| 2023-06-25 | Rio Claro    |               39.5 |             0.1 |            5.39476 |              0.0 |                67.4 |              97.4 |
| 2023-06-25 | São Lourenço |               88.6 |             0.2 |           78.69304 |              0.0 |                52.8 |              75.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
