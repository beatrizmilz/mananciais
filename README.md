
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
#> Rows: 53,552
#> Columns: 8
#> $ data                <date> 2023-07-12, 2023-07-12, 2023-07-12, 2023-07-12, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 81.9, 70.5, 73.2, 95.3, 98.0, 39.4, 82.7, 82.0, 70…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.2, 0.0, -0.2, -0.6, -0.1, -0.…
#> $ volume_operacional  <dbl> 804.01619, 394.74729, 125.39726, 15.72208, 109.907…
#> $ pluviometria_dia    <dbl> 0.0, 0.2, 0.0, 0.0, 0.2, 0.0, 0.2, 0.9, 0.1, 0.8, …
#> $ pluviometria_mensal <dbl> 4.6, 5.8, 5.8, 10.4, 6.0, 12.0, 13.4, 4.6, 5.6, 5.…
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
| 2023-07-12 | Cantareira   |               81.9 |            -0.1 |          804.01619 |              0.0 |                 4.6 |              44.0 |
| 2023-07-12 | Alto Tietê   |               70.5 |            -0.1 |          394.74729 |              0.2 |                 5.8 |              49.7 |
| 2023-07-12 | Guarapiranga |               73.2 |            -0.3 |          125.39726 |              0.0 |                 5.8 |              41.2 |
| 2023-07-12 | Cotia        |               95.3 |            -0.2 |           15.72208 |              0.0 |                10.4 |              47.5 |
| 2023-07-12 | Rio Grande   |               98.0 |             0.0 |          109.90711 |              0.2 |                 6.0 |              53.5 |
| 2023-07-12 | Rio Claro    |               39.4 |            -0.2 |            5.38484 |              0.0 |                12.0 |              89.5 |
| 2023-07-12 | São Lourenço |               82.7 |            -0.6 |           73.43325 |              0.2 |                13.4 |              76.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
