
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
#> Rows: 49,828
#> Columns: 8
#> $ data                <date> 2022-01-26, 2022-01-26, 2022-01-26, 2022-01-26, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 30.3, 48.6, 73.1, 62.4, 95.8, 42.5, 84.6, 30.2, 48…
#> $ volume_variacao     <dbl> 0.1, -0.1, -0.3, 0.2, -0.3, -0.3, -0.9, 0.0, 0.0, …
#> $ volume_operacional  <dbl> 297.84494, 272.26274, 125.14299, 10.28743, 107.474…
#> $ pluviometria_dia    <dbl> 7.2, 0.0, 0.0, 1.6, 0.0, 0.0, 8.4, 0.3, 0.2, 0.0, …
#> $ pluviometria_mensal <dbl> 179.5, 137.7, 157.4, 213.8, 216.0, 243.2, 281.8, 1…
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
| 2022-01-26 | Cantareira   |                30.3 |              0.1 |           297.84494 |               7.2 |                179.5 |              263.7 |
| 2022-01-26 | Alto Tietê   |                48.6 |            \-0.1 |           272.26274 |               0.0 |                137.7 |              243.3 |
| 2022-01-26 | Guarapiranga |                73.1 |            \-0.3 |           125.14299 |               0.0 |                157.4 |              229.9 |
| 2022-01-26 | Cotia        |                62.4 |              0.2 |            10.28743 |               1.6 |                213.8 |              217.9 |
| 2022-01-26 | Rio Grande   |                95.8 |            \-0.3 |           107.47446 |               0.0 |                216.0 |              248.6 |
| 2022-01-26 | Rio Claro    |                42.5 |            \-0.3 |             5.80270 |               0.0 |                243.2 |              296.9 |
| 2022-01-26 | São Lourenço |                84.6 |            \-0.9 |            75.09847 |               8.4 |                281.8 |              273.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
