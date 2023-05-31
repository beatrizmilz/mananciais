
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
#> Rows: 53,251
#> Columns: 8
#> $ data                <date> 2023-05-30, 2023-05-30, 2023-05-30, 2023-05-30, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 84.3, 74.3, 81.1, 97.5, 99.0, 46.6, 94.8, 84.3, 74…
#> $ volume_variacao     <dbl> 0.0, 0.2, -0.3, 0.2, 0.2, -1.6, 0.5, -0.1, 0.0, -0…
#> $ volume_operacional  <dbl> 827.42998, 416.07940, 138.76997, 16.08840, 111.041…
#> $ pluviometria_dia    <dbl> 0.3, 0.2, 0.0, 1.0, 0.8, 0.4, 1.4, 0.6, 5.0, 4.0, …
#> $ pluviometria_mensal <dbl> 8.7, 33.3, 8.6, 6.8, 10.8, 130.8, 24.6, 8.4, 33.1,…
#> $ pluviometria_hist   <dbl> 75.0, 57.2, 59.1, 64.2, 79.2, 131.6, 88.6, 75.0, 5…
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
| 2023-05-30 | Cantareira   |               84.3 |             0.0 |          827.42998 |              0.3 |                 8.7 |              75.0 |
| 2023-05-30 | Alto Tietê   |               74.3 |             0.2 |          416.07940 |              0.2 |                33.3 |              57.2 |
| 2023-05-30 | Guarapiranga |               81.1 |            -0.3 |          138.76997 |              0.0 |                 8.6 |              59.1 |
| 2023-05-30 | Cotia        |               97.5 |             0.2 |           16.08840 |              1.0 |                 6.8 |              64.2 |
| 2023-05-30 | Rio Grande   |               99.0 |             0.2 |          111.04113 |              0.8 |                10.8 |              79.2 |
| 2023-05-30 | Rio Claro    |               46.6 |            -1.6 |            6.36665 |              0.4 |               130.8 |             131.6 |
| 2023-05-30 | São Lourenço |               94.8 |             0.5 |           84.23296 |              1.4 |                24.6 |              88.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
