
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
#> Rows: 50,647
#> Columns: 8
#> $ data                <date> 2022-05-23, 2022-05-23, 2022-05-23, 2022-05-23, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 42.3, 63.0, 81.2, 85.9, 99.9, 43.9, 93.6, 42.4, 63…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.3, -0.4, -0.3, -0.1, -0.2, -0.1, -0…
#> $ volume_operacional  <dbl> 415.55342, 352.71690, 139.02976, 14.16886, 112.067…
#> $ pluviometria_dia    <dbl> 0.1, 0.2, 0.0, 0.2, 0.2, 0.2, 0.0, 0.0, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 31.6, 31.2, 8.8, 5.8, 12.2, 54.0, 34.8, 31.5, 31.0…
#> $ pluviometria_hist   <dbl> 74.8, 69.4, 59.6, 64.6, 79.9, 132.6, 88.9, 74.8, 6…
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

| data       | sistema      | volume\_porcentagem | volume\_variacao | volume\_operacional | pluviometria\_dia | pluviometria\_mensal | pluviometria\_hist |
| :--------- | :----------- | ------------------: | ---------------: | ------------------: | ----------------: | -------------------: | -----------------: |
| 2022-05-23 | Cantareira   |                42.3 |            \-0.1 |           415.55342 |               0.1 |                 31.6 |               74.8 |
| 2022-05-23 | Alto Tietê   |                63.0 |            \-0.1 |           352.71690 |               0.2 |                 31.2 |               69.4 |
| 2022-05-23 | Guarapiranga |                81.2 |            \-0.3 |           139.02976 |               0.0 |                  8.8 |               59.6 |
| 2022-05-23 | Cotia        |                85.9 |            \-0.4 |            14.16886 |               0.2 |                  5.8 |               64.6 |
| 2022-05-23 | Rio Grande   |                99.9 |            \-0.3 |           112.06787 |               0.2 |                 12.2 |               79.9 |
| 2022-05-23 | Rio Claro    |                43.9 |            \-0.1 |             5.99354 |               0.2 |                 54.0 |              132.6 |
| 2022-05-23 | São Lourenço |                93.6 |            \-0.2 |            83.13232 |               0.0 |                 34.8 |               88.9 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
