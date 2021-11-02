
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
#> Rows: 49,226
#> Columns: 8
#> $ data                <date> 2021-11-01, 2021-11-01, 2021-11-01, 2021-11-01, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 28.2, 39.5, 51.2, 46.3, 82.9, 42.6, 67.6, 28.1, 39…
#> $ volume_variacao     <dbl> 0.1, 0.1, 0.1, -0.1, 0.0, 0.2, 0.7, 0.1, 0.0, 0.0,…
#> $ volume_operacional  <dbl> 277.37933, 221.05116, 87.72895, 7.63738, 93.05153,…
#> $ pluviometria_dia    <dbl> 20.5, 8.9, 7.0, 7.4, 6.6, 17.0, 5.8, 6.8, 0.0, 0.0…
#> $ pluviometria_mensal <dbl> 20.5, 8.9, 7.0, 7.4, 6.6, 17.0, 5.8, 166.0, 101.1,…
#> $ pluviometria_hist   <dbl> 149.0, 130.1, 124.0, 126.1, 140.2, 195.5, 154.6, 1…
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
| 2021-11-01 | Cantareira   |                28.2 |              0.1 |           277.37933 |              20.5 |                 20.5 |              149.0 |
| 2021-11-01 | Alto Tietê   |                39.5 |              0.1 |           221.05116 |               8.9 |                  8.9 |              130.1 |
| 2021-11-01 | Guarapiranga |                51.2 |              0.1 |            87.72895 |               7.0 |                  7.0 |              124.0 |
| 2021-11-01 | Cotia        |                46.3 |            \-0.1 |             7.63738 |               7.4 |                  7.4 |              126.1 |
| 2021-11-01 | Rio Grande   |                82.9 |              0.0 |            93.05153 |               6.6 |                  6.6 |              140.2 |
| 2021-11-01 | Rio Claro    |                42.6 |              0.2 |             5.82368 |              17.0 |                 17.0 |              195.5 |
| 2021-11-01 | São Lourenço |                67.6 |              0.7 |            60.00797 |               5.8 |                  5.8 |              154.6 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
