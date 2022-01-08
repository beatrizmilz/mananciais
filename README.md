
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
#> Rows: 49,695
#> Columns: 8
#> $ data                <date> 2022-01-07, 2022-01-07, 2022-01-07, 2022-01-07, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 26.7, 42.8, 65.8, 50.0, 89.5, 56.1, 84.1, 26.1, 42…
#> $ volume_variacao     <dbl> 0.6, 0.7, 0.9, 1.0, 1.1, 10.3, 0.0, 0.4, 0.3, 1.1,…
#> $ volume_operacional  <dbl> 262.62382, 239.92936, 112.59341, 8.25240, 100.3740…
#> $ pluviometria_dia    <dbl> 22.7, 11.6, 9.6, 3.2, 19.6, 129.2, 34.0, 29.3, 3.8…
#> $ pluviometria_mensal <dbl> 95.0, 71.9, 63.0, 99.4, 142.6, 191.2, 111.6, 72.3,…
#> $ pluviometria_hist   <dbl> 263.7, 243.3, 229.9, 217.9, 248.6, 296.9, 273.1, 2…
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
| 2022-01-07 | Cantareira   |                26.7 |              0.6 |           262.62382 |              22.7 |                 95.0 |              263.7 |
| 2022-01-07 | Alto Tietê   |                42.8 |              0.7 |           239.92936 |              11.6 |                 71.9 |              243.3 |
| 2022-01-07 | Guarapiranga |                65.8 |              0.9 |           112.59341 |               9.6 |                 63.0 |              229.9 |
| 2022-01-07 | Cotia        |                50.0 |              1.0 |             8.25240 |               3.2 |                 99.4 |              217.9 |
| 2022-01-07 | Rio Grande   |                89.5 |              1.1 |           100.37407 |              19.6 |                142.6 |              248.6 |
| 2022-01-07 | Rio Claro    |                56.1 |             10.3 |             7.66649 |             129.2 |                191.2 |              296.9 |
| 2022-01-07 | São Lourenço |                84.1 |              0.0 |            74.68061 |              34.0 |                111.6 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
