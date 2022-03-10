
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
#> Rows: 50,122
#> Columns: 8
#> $ data                <date> 2022-03-09, 2022-03-09, 2022-03-09, 2022-03-09, 2…
#> $ sistema             <chr> "Cantareira", "Alto Tietê", "Guarapiranga", "Cotia…
#> $ volume_porcentagem  <dbl> 43.0, 55.6, 82.3, 80.0, 100.5, 43.8, 82.0, 43.1, 5…
#> $ volume_variacao     <dbl> -0.1, -0.1, -0.4, 0.0, -0.2, -0.3, 0.3, 0.0, 0.0, …
#> $ volume_operacional  <dbl> 422.76950, 311.78206, 140.85071, 13.19650, 112.755…
#> $ pluviometria_dia    <dbl> 0.1, 0.1, 0.0, 0.2, 0.0, 0.2, 0.2, 6.8, 0.9, 8.4, …
#> $ pluviometria_mensal <dbl> 29.6, 31.0, 72.6, 35.2, 21.0, 3.4, 8.0, 29.5, 30.9…
#> $ pluviometria_hist   <dbl> 174.1, 164.6, 154.8, 154.1, 186.7, 243.7, 195.1, 1…
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
| 2022-03-09 | Cantareira   |                43.0 |            \-0.1 |           422.76950 |               0.1 |                 29.6 |              174.1 |
| 2022-03-09 | Alto Tietê   |                55.6 |            \-0.1 |           311.78206 |               0.1 |                 31.0 |              164.6 |
| 2022-03-09 | Guarapiranga |                82.3 |            \-0.4 |           140.85071 |               0.0 |                 72.6 |              154.8 |
| 2022-03-09 | Cotia        |                80.0 |              0.0 |            13.19650 |               0.2 |                 35.2 |              154.1 |
| 2022-03-09 | Rio Grande   |               100.5 |            \-0.2 |           112.75560 |               0.0 |                 21.0 |              186.7 |
| 2022-03-09 | Rio Claro    |                43.8 |            \-0.3 |             5.98281 |               0.2 |                  3.4 |              243.7 |
| 2022-03-09 | São Lourenço |                82.0 |              0.3 |            72.81304 |               0.2 |                  8.0 |              195.1 |

## Como citar o pacote

[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.4733056.svg)](https://doi.org/10.5281/zenodo.4733056)
