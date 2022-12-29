
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
#> Rows: 52,180
#> Columns: 8
#> $ data                <date> 2022-12-28, 2022-12-28, 2022-12-28, 2022-12-28, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 39.8, 47.7, 84.4, 51.9, 101.4, 44.2, 81.7, 39.5, 4…
#> $ volume_variacao     <dbl> 0.3, 0.0, 0.1, 0.2, 0.4, -1.5, -0.2, 0.2, 0.0, 0.0…
#> $ volume_operacional  <dbl> 391.29407, 267.45000, 144.50472, 8.55704, 113.7150…
#> $ pluviometria_dia    <dbl> 29.7, 8.3, 14.4, 19.8, 16.2, 2.6, 12.2, 13.5, 0.6,…
#> $ pluviometria_mensal <dbl> 249.4, 117.1, 165.0, 169.6, 151.8, 245.4, 320.2, 2…
#> $ pluviometria_hist   <dbl> 209.9, 189.3, 173.3, 166.2, 188.0, 258.7, 211.9, 2…
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
| 2022-12-28 | Cantareira   |               39.8 |             0.3 |          391.29407 |             29.7 |               249.4 |             209.9 |
| 2022-12-28 | Alto Tietê   |               47.7 |             0.0 |          267.45000 |              8.3 |               117.1 |             189.3 |
| 2022-12-28 | Guarapiranga |               84.4 |             0.1 |          144.50472 |             14.4 |               165.0 |             173.3 |
| 2022-12-28 | Cotia        |               51.9 |             0.2 |            8.55704 |             19.8 |               169.6 |             166.2 |
| 2022-12-28 | Rio Grande   |              101.4 |             0.4 |          113.71507 |             16.2 |               151.8 |             188.0 |
| 2022-12-28 | Rio Claro    |               44.2 |            -1.5 |            6.04736 |              2.6 |               245.4 |             258.7 |
| 2022-12-28 | São Lourenço |               81.7 |            -0.2 |           72.60682 |             12.2 |               320.2 |             211.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
