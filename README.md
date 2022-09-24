
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
#> Rows: 51,508
#> Columns: 8
#> $ data                <date> 2022-09-23, 2022-09-23, 2022-09-23, 2022-09-23, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 30.5, 47.3, 57.1, 52.8, 89.5, 46.0, 65.1, 30.5, 47…
#> $ volume_variacao     <dbl> 0.0, -0.1, -0.2, -0.3, -0.1, -0.3, -0.3, -0.1, -0.…
#> $ volume_operacional  <dbl> 299.13853, 264.88193, 97.78336, 8.71167, 100.37407…
#> $ pluviometria_dia    <dbl> 0.8, 0.0, 0.0, 0.0, 0.0, 0.4, 0.0, 7.8, 4.9, 3.6, …
#> $ pluviometria_mensal <dbl> 32.3, 33.5, 36.6, 33.8, 65.4, 69.2, 73.8, 31.5, 33…
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
| 2022-09-23 | Cantareira   |               30.5 |             0.0 |          299.13853 |              0.8 |                32.3 |              80.5 |
| 2022-09-23 | Alto Tietê   |               47.3 |            -0.1 |          264.88193 |              0.0 |                33.5 |              59.6 |
| 2022-09-23 | Guarapiranga |               57.1 |            -0.2 |           97.78336 |              0.0 |                36.6 |              76.7 |
| 2022-09-23 | Cotia        |               52.8 |            -0.3 |            8.71167 |              0.0 |                33.8 |              76.0 |
| 2022-09-23 | Rio Grande   |               89.5 |            -0.1 |          100.37407 |              0.0 |                65.4 |              92.8 |
| 2022-09-23 | Rio Claro    |               46.0 |            -0.3 |            6.28846 |              0.4 |                69.2 |             139.4 |
| 2022-09-23 | São Lourenço |               65.1 |            -0.3 |           57.82444 |              0.0 |                73.8 |             112.5 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
